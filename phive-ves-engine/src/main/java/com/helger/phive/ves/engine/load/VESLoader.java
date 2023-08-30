/*
 * Copyright (C) 2023 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.impl.CommonsLinkedHashSet;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsSet;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.state.ESuccess;
import com.helger.commons.state.ETriState;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.repo.IRepoStorageBase;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageReadableResource;
import com.helger.phive.ves.engine.load.LoadedVES.EVESSyntax;
import com.helger.phive.ves.engine.load.LoadedVES.Requirement;
import com.helger.phive.ves.engine.load.LoadedVES.Status;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.model.v1.VESStatus1Marshaller;
import com.helger.phive.ves.v10.VesCustomErrorType;
import com.helger.phive.ves.v10.VesErrorLevelType;
import com.helger.phive.ves.v10.VesNamespaceListType;
import com.helger.phive.ves.v10.VesNamespaceType;
import com.helger.phive.ves.v10.VesOutputType;
import com.helger.phive.ves.v10.VesRequiresType;
import com.helger.phive.ves.v10.VesResourceType;
import com.helger.phive.ves.v10.VesStatusType;
import com.helger.phive.ves.v10.VesType;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * This class loads VES data into {@link LoadedVES} objects. It supports dynamic
 * rule creation for each syntax, using the {@link IVESLoaderXSD},
 * {@link IVESLoaderSchematron} and {@link IVESLoaderEdifact} classes. By
 * default only XSD and Schematron are support. Edifact needs to be implemented
 * manually.
 *
 * @author Philip Helger
 */
@ThreadSafe
public final class VESLoader
{
  public static final String FILE_EXT_VES = ".ves";
  public static final String FILE_EXT_STATUS = ".status";

  private static final Logger LOGGER = LoggerFactory.getLogger (VESLoader.class);

  @Nonnull
  static VESID wrapID (@Nonnull final VesResourceType aVRT)
  {
    return new VESID (aVRT.getGroupId (), aVRT.getArtifactId (), aVRT.getVersion ());
  }

  @Nonnull
  static RepoStorageKey wrapKey (@Nonnull final VesResourceType aVRT)
  {
    return RepoStorageKey.of (wrapID (aVRT), "." + aVRT.getType ());
  }

  static void wrap (@Nullable final VesNamespaceListType aNamespaces, @Nonnull final MapBasedNamespaceContext aNSCtx)
  {
    if (aNamespaces != null)
      for (final VesNamespaceType aNamespace : aNamespaces.getNamespace ())
      {
        final String sPrefix = aNamespace.getPrefix ();
        if (aNamespace.isOverwrite ())
        {
          // Simply overwrite
          aNSCtx.addMapping (sPrefix, aNamespace.getUri ());
        }
        else
        {
          // Error in case it already exists
          if (aNSCtx.getNamespaceURI (sPrefix).length () > 0)
            LOGGER.error ("The namespace prefix '" + sPrefix + "' is already mapped in the current namespace context");
          else
            aNSCtx.addMapping (sPrefix, aNamespace.getUri ());
        }
      }
  }

  @Nonnull
  private static MapBasedNamespaceContext _wrap (@Nullable final VesNamespaceListType aNamespaces)
  {
    final MapBasedNamespaceContext ret = new MapBasedNamespaceContext ();
    wrap (aNamespaces, ret);
    return ret;
  }

  @Nonnull
  private static EErrorLevel _wrap (@Nonnull final VesErrorLevelType e)
  {
    switch (e)
    {
      case INFO:
        return EErrorLevel.INFO;
      case WARN:
        return EErrorLevel.WARN;
      case ERROR:
        return EErrorLevel.ERROR;
      default:
        throw new IllegalStateException ("Unsupported error level " + e);
    }
  }

  @Nonnull
  private static LoadedVES.OutputType _wrap (@Nullable final VesOutputType aOutput)
  {
    final LoadedVES.OutputType ret = new LoadedVES.OutputType ();
    if (aOutput != null)
      for (final VesCustomErrorType aCustomError : aOutput.getCustomError ())
        ret.addCustomErrorLevel (aCustomError.getId (), _wrap (aCustomError.getLevel ()));
    return ret;
  }

  private final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  private final IRepoStorageBase m_aRepo;
  @GuardedBy ("m_aRWLock")
  private IVESLoaderXSD m_aLoaderXSD = new DefaultVESLoaderXSD ();
  @GuardedBy ("m_aRWLock")
  private IVESLoaderSchematron m_aLoaderSchematron = new DefaultVESLoaderSchematron ();
  @GuardedBy ("m_aRWLock")
  private IVESLoaderEdifact m_aLoaderEdifact = null;
  @GuardedBy ("m_aRWLock")
  private boolean m_bUseEagerRequirementLoading = false;

  public VESLoader (@Nonnull final IRepoStorageBase aRepo)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    m_aRepo = aRepo;
  }

  @Nullable
  public IVESLoaderXSD getLoaderXSD ()
  {
    return m_aRWLock.readLockedGet ( () -> m_aLoaderXSD);
  }

  @Nonnull
  public VESLoader setLoaderXSD (@Nullable final IVESLoaderXSD aLoader)
  {
    m_aRWLock.writeLocked ( () -> m_aLoaderXSD = aLoader);
    return this;
  }

  @Nullable
  public IVESLoaderSchematron getLoaderSchematron ()
  {
    return m_aRWLock.readLockedGet ( () -> m_aLoaderSchematron);
  }

  @Nonnull
  public VESLoader setLoaderSchematron (@Nullable final IVESLoaderSchematron aLoader)
  {
    m_aRWLock.writeLocked ( () -> m_aLoaderSchematron = aLoader);
    return this;
  }

  @Nullable
  public IVESLoaderEdifact getLoaderEdifact ()
  {
    return m_aRWLock.readLockedGet ( () -> m_aLoaderEdifact);
  }

  @Nonnull
  public VESLoader setLoaderEdifact (@Nullable final IVESLoaderEdifact aLoader)
  {
    m_aRWLock.writeLocked ( () -> m_aLoaderEdifact = aLoader);
    return this;
  }

  public boolean isUseEagerRequirementLoading ()
  {
    return m_aRWLock.readLockedBoolean ( () -> m_bUseEagerRequirementLoading);
  }

  @Nonnull
  public VESLoader setUseEagerRequirementLoading (final boolean b)
  {
    m_aRWLock.writeLocked ( () -> m_bUseEagerRequirementLoading = b);
    return this;
  }

  @ThreadSafe
  public static final class VESLoaderStatus
  {
    private final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
    @GuardedBy ("m_aRWLock")
    private final ICommonsSet <VESID> m_aLoaded = new CommonsLinkedHashSet <> ();

    @Nonnull
    public ESuccess addVESID (@Nonnull final VESID aVESID)
    {
      return ESuccess.valueOf (m_aRWLock.writeLockedBoolean ( () -> m_aLoaded.add (aVESID)));
    }

    @Nonnull
    @Nonempty
    public String getDepedencyChain (@Nullable final VESID aLastOne)
    {
      final ICommonsList <VESID> aList = m_aLoaded.getCopyAsList ();
      if (aLastOne != null)
        aList.add (aLastOne);
      return StringHelper.imploder ().source (aList, x -> "'" + x.getAsSingleID () + "'").separator (" -> ").build ();
    }
  }

  @Nullable
  public LoadedVES convertToLoadedVES (@Nonnull final LoadedVES.Status aStatus,
                                       @Nonnull final VesType aVES,
                                       @Nonnull final VESLoaderStatus aLoaderStatus,
                                       @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aStatus, "Status");
    ValueEnforcer.notNull (aVES, "VES");
    ValueEnforcer.notNull (aLoaderStatus, "LoaderStatus");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    final EVESSyntax eSyntax = aVES.getXsd () != null ? EVESSyntax.XSD : aVES.getSchematron () != null
                                                                                                       ? EVESSyntax.SCHEMATRON
                                                                                                       : EVESSyntax.EDIFACT;

    // Extract data
    final LoadedVES.Header aHeader = new LoadedVES.Header (new VESID (aVES.getGroupId (),
                                                                      aVES.getArtifactId (),
                                                                      aVES.getVersion ()),
                                                           aVES.getName (),
                                                           aVES.getReleased (),
                                                           eSyntax);
    final LoadedVES ret = new LoadedVES (aHeader, aStatus);
    if (aVES.getRequires () != null)
    {
      final VesRequiresType aReq = aVES.getRequires ();
      final Requirement aRequirement = new LoadedVES.Requirement (new VESID (aReq.getGroupId (),
                                                                             aReq.getArtifactId (),
                                                                             aReq.getVersion ()),
                                                                  _wrap (aReq.getNamespaces ()),
                                                                  _wrap (aReq.getOutput ()),
                                                                  aReq.isStopOnError ());
      if (isUseEagerRequirementLoading ())
      {
        // Eager loading

        // Recursive load required artefact; required to have this in scope
        final LoadedVES aLoadedRequirement = loadVESFromRepo (aRequirement.getRequiredVESID (),
                                                              aLoaderStatus,
                                                              aErrorList);
        if (aLoadedRequirement == null)
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("Failed to load required VESID '" +
                                                 aRequirement.getRequiredVESID ().getAsSingleID () +
                                                 "' [eager]")
                                     .build ());
          return null;
        }

        ret.setEagerRequires (aRequirement, aLoadedRequirement);
      }
      else
      {
        // Lazy loading
        ret.setLazyRequires (aRequirement, aLocalErrorList -> {
          // Use this deferred loader, to ensure the same surrounding VESLoader
          // instance is used
          // Recursive load required artefact; required to have this in scope
          final LoadedVES aLoadedRequirement = loadVESFromRepo (aRequirement.getRequiredVESID (),
                                                                aLoaderStatus,
                                                                aLocalErrorList);
          if (aLoadedRequirement == null)
            throw new VESLoadingException ("Failed to load required VESID '" +
                                           aRequirement.getRequiredVESID ().getAsSingleID () +
                                           "' [lazy]");
          return aLoadedRequirement;
        });
      }
    }
    if (aVES.getXsd () != null)
    {
      // XSD
      final IVESLoaderXSD aLoader = getLoaderXSD ();
      if (aLoader != null)
        ret.setExecutor (aLoader.loadXSD (m_aRepo, aVES.getXsd (), aErrorList));
      else
        aErrorList.add (SingleError.builderError ()
                                   .errorText ("The VES contains an XSD element, but no XSD loader is present")
                                   .build ());
    }
    else
      if (aVES.getSchematron () != null)
      {
        // Schematron
        final IVESLoaderSchematron aLoader = getLoaderSchematron ();
        if (aLoader != null)
          ret.setExecutor (aLoader.loadSchematron (m_aRepo, aVES.getSchematron (), aErrorList));
        else
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("The VES contains a Schematron element, but no Schematron loader is present")
                                     .build ());
      }
      else
        if (aVES.getEdifact () != null)
        {
          // EDIFACT
          final IVESLoaderEdifact aLoader = getLoaderEdifact ();
          if (aLoader != null)
            ret.setExecutor (aLoader.loadEdifact (m_aRepo, aVES.getEdifact (), aErrorList));
          else
            aErrorList.add (SingleError.builderError ()
                                       .errorText ("The VES contains an Edifact element, but no Edifact loader is present")
                                       .build ());
        }
        else
          throw new IllegalStateException ("Unsupported base syntax");

    if (!ret.hasExecutor ())
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorText ("The loaded VES contains no Validation Executor and is therefore not usable")
                                 .build ());
      return null;
    }

    return ret;
  }

  @Nullable
  public LoadedVES loadVESDirect (@Nonnull final IReadableResource aVESRes, @Nonnull final ErrorList aErrorList)
  {
    return loadVESDirect (Status.createUndefined (), aVESRes, new VESLoaderStatus (), aErrorList);
  }

  @Nullable
  public LoadedVES loadVESDirect (@Nonnull final LoadedVES.Status aStatus,
                                  @Nonnull final IReadableResource aVESRes,
                                  @Nonnull final VESLoaderStatus aLoaderStatus,
                                  @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aStatus, "Status");
    ValueEnforcer.notNull (aVESRes, "VESRes");
    ValueEnforcer.notNull (aLoaderStatus, "LoaderStatus");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    // Read VES as XML
    final VesType aVES = new VES1Marshaller ().setCollectErrors (aErrorList).read (aVESRes);
    if (aVES == null)
    {
      // Error in XML
      aErrorList.add (SingleError.builderError ()
                                 .errorFieldName (aVESRes.getPath ())
                                 .errorText ("Failed to read VES as XML.")
                                 .build ());
      return null;
    }

    // Build VESID
    final VESID aVESID = new VESID (aVES.getGroupId (), aVES.getArtifactId (), aVES.getVersion ());

    LOGGER.info ("Trying to read VESID '" + aVESID.getAsSingleID () + "' directly");

    // Ensure the VESID is not yet in the loader chain
    if (aLoaderStatus.addVESID (aVESID).isFailure ())
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorText ("The VESID '" +
                                             aVESID.getAsSingleID () +
                                             "' was already loaded. It seems like you have a circular dependency: " +
                                             aLoaderStatus.getDepedencyChain (aVESID))
                                 .build ());
      return null;
    }

    // Convert to loaded VES
    return convertToLoadedVES (aStatus, aVES, aLoaderStatus, aErrorList);
  }

  @Nullable
  public LoadedVES loadVESFromRepo (@Nonnull final VESID aVESID, @Nonnull final ErrorList aErrorList)
  {
    return loadVESFromRepo (aVESID, new VESLoaderStatus (), aErrorList);
  }

  @Nullable
  public LoadedVES loadVESFromRepo (@Nonnull final VESID aVESID,
                                    @Nonnull final VESLoaderStatus aLoaderStatus,
                                    @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aLoaderStatus, "LoaderStatus");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    LOGGER.info ("Trying to read VESID '" + aVESID.getAsSingleID () + "' from repository");

    // Ensure the VESID is not yet in the loader chain
    if (aLoaderStatus.addVESID (aVESID).isFailure ())
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorText ("The VESID '" +
                                             aVESID.getAsSingleID () +
                                             "' was already loaded. It seems like you have a circular dependency: " +
                                             aLoaderStatus.getDepedencyChain (aVESID))
                                 .build ());
      return null;
    }

    // Check if an explicit status is available
    final LoadedVES.Status aStatus;
    final RepoStorageKey aRepoKeyStatus = RepoStorageKey.of (aVESID, FILE_EXT_STATUS);
    if (m_aRepo.exists (aRepoKeyStatus))
    {
      final RepoStorageItem aRepoContentStatus = m_aRepo.read (aRepoKeyStatus);
      // it's okay, if it does not exist
      if (aRepoContentStatus != null)
      {
        // Read VES Status as XML
        final VesStatusType aVESStatus = new VESStatus1Marshaller ().setCollectErrors (aErrorList)
                                                                    .read (new RepoStorageReadableResource (aRepoKeyStatus,
                                                                                                            aRepoContentStatus));
        if (aVESStatus == null)
        {
          // Error in Status XML - breaking error
          aErrorList.add (SingleError.builderError ()
                                     .errorFieldName (aRepoKeyStatus.getPath ())
                                     .errorText ("Failed to read VES Status as XML.")
                                     .build ());
          return null;
        }

        aStatus = new LoadedVES.Status (aVESStatus.getStatusLastModified (),
                                        aVESStatus.getValidFrom (),
                                        aVESStatus.getValidTo (),
                                        ETriState.valueOf (aVESStatus.isDeprecated ()));
      }
      else
      {
        // Status is supposed to exist, but does not
        aStatus = LoadedVES.Status.createUndefined ();
      }
    }
    else
    {
      // Status does not exist
      aStatus = LoadedVES.Status.createUndefined ();
    }

    // Read VES content from repo
    final RepoStorageKey aRepoKeyVES = RepoStorageKey.of (aVESID, FILE_EXT_VES);
    final RepoStorageItem aRepoContentVES = m_aRepo.read (aRepoKeyVES);
    if (aRepoContentVES == null)
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorFieldName (aRepoKeyVES.getPath ())
                                 .errorText ("Failed to resolve VES from repository.")
                                 .build ());
      return null;
    }

    // Read VES as XML
    final VesType aVES = new VES1Marshaller ().setCollectErrors (aErrorList)
                                              .read (new RepoStorageReadableResource (aRepoKeyVES, aRepoContentVES));
    if (aVES == null)
    {
      // Error in XML
      aErrorList.add (SingleError.builderError ()
                                 .errorFieldName (aRepoKeyVES.getPath ())
                                 .errorText ("Failed to read VES as XML.")
                                 .build ());
      return null;
    }

    // Now read into data model
    return convertToLoadedVES (aStatus, aVES, aLoaderStatus, aErrorList);
  }
}
