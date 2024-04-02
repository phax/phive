/*
 * Copyright (C) 2023-2024 Philip Helger (www.helger.com)
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

import java.time.Duration;
import java.time.OffsetDateTime;
import java.util.Locale;

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
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.error.IError;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.state.ESuccess;
import com.helger.commons.string.StringHelper;
import com.helger.commons.timing.StopWatch;
import com.helger.diver.api.version.EVESPseudoVersion;
import com.helger.diver.api.version.VESID;
import com.helger.diver.repo.IRepoStorageReadItem;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.RepoStorageReadableResource;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.ves.model.v1.EVESSyntax;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.model.v1.VESStatus1Helper;
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
  /**
   * Defines the latest version resolution modes.
   *
   * @author Philip Helger
   * @since 9.2.1
   */
  public enum ELatestResolutionMode
  {
    /**
     * Use the latest overall version available, independent if this is a
     * snapshot or a release build.
     */
    LATEST_OVERALL,
    /**
     * Use the latest release version only. Snapshot versions are ignored.
     */
    LATEST_RELEASES,
    /**
     * Do not try to resolve latest versions at all.
     */
    NOT_SUPPORTED;

    /**
     * Default: latest is the latest
     */
    public static final ELatestResolutionMode DEFAULT = LATEST_OVERALL;
  }

  /**
   * File extension for VES files
   */
  public static final String FILE_EXT_VES = ".ves";
  /**
   * File extension for status files
   */
  public static final String FILE_EXT_STATUS = ".status";

  public static final boolean DEFAULT_USE_EAGER_REQUIREMENT_LOADING = false;

  private static final Logger LOGGER = LoggerFactory.getLogger (VESLoader.class);
  private static final Duration DURATION_WARN = Duration.ofMillis (500);

  private final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  private final IRepoStorageWithToc m_aRepo;
  @GuardedBy ("m_aRWLock")
  private IVESLoaderXSD m_aLoaderXSD = new DefaultVESLoaderXSD ();
  @GuardedBy ("m_aRWLock")
  private IVESLoaderSchematron m_aLoaderSchematron = new DefaultVESLoaderSchematron ();
  @GuardedBy ("m_aRWLock")
  private IVESLoaderEdifact m_aLoaderEdifact = null;
  @GuardedBy ("m_aRWLock")
  private boolean m_bUseEagerRequirementLoading = DEFAULT_USE_EAGER_REQUIREMENT_LOADING;
  @GuardedBy ("m_aRWLock")
  private ELatestResolutionMode m_eLatestResMode = ELatestResolutionMode.DEFAULT;

  public VESLoader (@Nonnull final IRepoStorageWithToc aRepo)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    m_aRepo = aRepo;
  }

  /**
   * @return The XSD loader to be used. May be <code>null</code>.
   */
  @Nullable
  public IVESLoaderXSD getLoaderXSD ()
  {
    return m_aRWLock.readLockedGet ( () -> m_aLoaderXSD);
  }

  /**
   * Set the XSD loader to be used.
   *
   * @param aLoader
   *        The loader to be used. May be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  public VESLoader setLoaderXSD (@Nullable final IVESLoaderXSD aLoader)
  {
    m_aRWLock.writeLocked ( () -> m_aLoaderXSD = aLoader);
    return this;
  }

  /**
   * @return The Schematron loader to be used. May be <code>null</code>.
   */
  @Nullable
  public IVESLoaderSchematron getLoaderSchematron ()
  {
    return m_aRWLock.readLockedGet ( () -> m_aLoaderSchematron);
  }

  /**
   * Set the Schematron loader to be used.
   *
   * @param aLoader
   *        The loader to be used. May be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  public VESLoader setLoaderSchematron (@Nullable final IVESLoaderSchematron aLoader)
  {
    m_aRWLock.writeLocked ( () -> m_aLoaderSchematron = aLoader);
    return this;
  }

  /**
   * @return The Edifact loader to be used. May be <code>null</code>.
   */
  @Nullable
  public IVESLoaderEdifact getLoaderEdifact ()
  {
    return m_aRWLock.readLockedGet ( () -> m_aLoaderEdifact);
  }

  /**
   * Set the Edifact loader to be used.
   *
   * @param aLoader
   *        The loader to be used. May be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  public VESLoader setLoaderEdifact (@Nullable final IVESLoaderEdifact aLoader)
  {
    m_aRWLock.writeLocked ( () -> m_aLoaderEdifact = aLoader);
    return this;
  }

  /**
   * @return <code>true</code> if eager requirement loading is enabled,
   *         <code>false</code> if lazy loading is enabled.
   */
  public boolean isUseEagerRequirementLoading ()
  {
    return m_aRWLock.readLockedBoolean ( () -> m_bUseEagerRequirementLoading);
  }

  /**
   * User eager or lazy loading of dependent resources.
   *
   * @param b
   *        <code>true</code> for eager loading, <code>false</code> for lazy
   *        loading
   * @return this for chaining
   */
  @Nonnull
  public VESLoader setUseEagerRequirementLoading (final boolean b)
  {
    m_aRWLock.writeLocked ( () -> m_bUseEagerRequirementLoading = b);
    return this;
  }

  /**
   * @return The resolution mode for latest pseudo versions. Never
   *         <code>null</code>.
   * @since 9.2.1
   */
  @Nonnull
  public ELatestResolutionMode getLatestResolutionMode ()
  {
    return m_aRWLock.readLockedGet ( () -> m_eLatestResMode);
  }

  /**
   * Set the "latest version" resolution mode. The default is
   * {@link ELatestResolutionMode#DEFAULT}.
   *
   * @param e
   *        The mode to use. Must not be <code>null</code>.
   * @return this for chaining
   * @since 9.2.1
   */
  @Nonnull
  public VESLoader setLatestResolutionMode (@Nonnull final ELatestResolutionMode e)
  {
    ValueEnforcer.notNull (e, "LatestResolutionMode");

    m_aRWLock.writeLocked ( () -> m_eLatestResMode = e);
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

  @Nullable
  public LoadedVES convertToLoadedVES (@Nonnull final IValidationExecutorSetStatus aStatus,
                                       @Nonnull final VesType aSrcVes,
                                       @Nonnull final VESLoaderStatus aLoaderStatus,
                                       @Nonnull final ErrorList aLoadingErrors) throws VESLoadingException
  {
    return _convertToLoadedVES (aStatus, null, aSrcVes, aLoaderStatus, aLoadingErrors);
  }

  @Nullable
  private LoadedVES _convertToLoadedVES (@Nonnull final IValidationExecutorSetStatus aStatus,
                                         @Nullable final LoadedVES.RequiredVES aLoadingRequiredVES,
                                         @Nonnull final VesType aSrcVes,
                                         @Nonnull final VESLoaderStatus aLoaderStatus,
                                         @Nonnull final ErrorList aLoadingErrors) throws VESLoadingException
  {
    ValueEnforcer.notNull (aStatus, "Status");
    ValueEnforcer.notNull (aSrcVes, "VES");
    ValueEnforcer.notNull (aLoaderStatus, "LoaderStatus");
    ValueEnforcer.notNull (aLoadingErrors, "LoadingErrors");

    final EVESSyntax eSyntax = aSrcVes.getXsd () != null ? EVESSyntax.XSD : aSrcVes.getSchematron () != null
                                                                                                             ? EVESSyntax.SCHEMATRON
                                                                                                             : EVESSyntax.EDIFACT;

    // Extract data
    final LoadedVES.Header aHeader = new LoadedVES.Header (new VESID (aSrcVes.getGroupId (),
                                                                      aSrcVes.getArtifactId (),
                                                                      aSrcVes.getVersion ()),
                                                           aSrcVes.getName (),
                                                           aSrcVes.getReleased (),
                                                           eSyntax);
    final LoadedVES ret = new LoadedVES (aHeader, aStatus);
    if (aSrcVes.getRequires () != null)
    {
      final VesRequiresType aSrcReq = aSrcVes.getRequires ();
      final LoadedVES.RequiredVES aSrcRequiredVES = new LoadedVES.RequiredVES (new VESID (aSrcReq.getGroupId (),
                                                                                          aSrcReq.getArtifactId (),
                                                                                          aSrcReq.getVersion ()),
                                                                               _wrap (aSrcReq.getNamespaces ()),
                                                                               _wrap (aSrcReq.getOutput ()),
                                                                               aSrcReq.isStopOnError ());
      if (isUseEagerRequirementLoading ())
      {
        // Eager loading

        // Recursive load required artefact; required to have this in scope
        final LoadedVES aLoadedRequirement = _loadVESFromRepo (aSrcRequiredVES.getRequiredVESID (),
                                                               aSrcRequiredVES,
                                                               aLoaderStatus,
                                                               aLoadingErrors);
        if (aLoadedRequirement == null)
        {
          aLoadingErrors.add (SingleError.builderError ()
                                         .errorText ("Failed to load required VESID '" +
                                                     aSrcRequiredVES.getRequiredVESID ().getAsSingleID () +
                                                     "' [eager]")
                                         .build ());
          return null;
        }

        ret.setEagerRequires (aSrcRequiredVES, aLoadedRequirement);
      }
      else
      {
        // Lazy loading
        ret.setLazyRequires (aSrcRequiredVES, aLocalErrorList -> {
          // Use this deferred loader, to ensure the same surrounding VESLoader
          // instance is used
          // Recursive load required artefact; required to have this in scope
          final LoadedVES aLoadedRequirement = _loadVESFromRepo (aSrcRequiredVES.getRequiredVESID (),
                                                                 aSrcRequiredVES,
                                                                 aLoaderStatus,
                                                                 aLocalErrorList);
          if (aLoadedRequirement == null)
            throw new VESLoadingException ("Failed to load required VESID '" +
                                           aSrcRequiredVES.getRequiredVESID ().getAsSingleID () +
                                           "' [lazy]: " +
                                           StringHelper.getImplodedMapped ("\n  ",
                                                                           aLocalErrorList,
                                                                           IError::getAsStringLocaleIndepdent));
          return aLoadedRequirement;
        });
      }
    }

    final IVESAsyncLoader aAsyncLoader = (aAsyncLoadVESID, sFileExt) -> {
      // Always eager loading

      final RepoStorageKeyOfArtefact aRepoKey = RepoStorageKeyOfArtefact.of (aAsyncLoadVESID, sFileExt);
      return m_aRepo.read (aRepoKey);
    };

    if (aSrcVes.getXsd () != null)
    {
      // XSD
      final IVESLoaderXSD aLoader = getLoaderXSD ();
      if (aLoader != null)
        ret.setExecutor (aLoader.loadXSD (m_aRepo,
                                          aSrcVes.getXsd (),
                                          aLoadingRequiredVES,
                                          aLoadingErrors,
                                          aAsyncLoader));
      else
        aLoadingErrors.add (SingleError.builderError ()
                                       .errorText ("The VES contains an XSD element, but no XSD loader is present")
                                       .build ());
    }
    else
      if (aSrcVes.getSchematron () != null)
      {
        // Schematron
        final IVESLoaderSchematron aLoader = getLoaderSchematron ();
        if (aLoader != null)
          ret.setExecutor (aLoader.loadSchematron (m_aRepo,
                                                   aSrcVes.getSchematron (),
                                                   aLoadingRequiredVES,
                                                   aLoadingErrors,
                                                   aAsyncLoader));
        else
          aLoadingErrors.add (SingleError.builderError ()
                                         .errorText ("The VES contains a Schematron element, but no Schematron loader is present")
                                         .build ());
      }
      else
        if (aSrcVes.getEdifact () != null)
        {
          // EDIFACT
          final IVESLoaderEdifact aLoader = getLoaderEdifact ();
          if (aLoader != null)
            ret.setExecutor (aLoader.loadEdifact (m_aRepo,
                                                  aSrcVes.getEdifact (),
                                                  aLoadingRequiredVES,
                                                  aLoadingErrors,
                                                  aAsyncLoader));
          else
            aLoadingErrors.add (SingleError.builderError ()
                                           .errorText ("The VES contains an Edifact element, but no Edifact loader is present")
                                           .build ());
        }
        else
          throw new IllegalStateException ("Unsupported base syntax");

    if (!ret.hasExecutor ())
    {
      aLoadingErrors.add (SingleError.builderError ()
                                     .errorText ("The loaded VES contains no Validation Executor and is therefore not usable")
                                     .build ());
      return null;
    }

    return ret;
  }

  @Nullable
  public LoadedVES loadVESDirect (@Nonnull final IReadableResource aVESRes, @Nonnull final ErrorList aLoadingErrors)
  {
    return loadVESDirect (ValidationExecutorSetStatus.createValidNow (),
                          aVESRes,
                          new VESLoaderStatus (),
                          aLoadingErrors);
  }

  @Nullable
  public LoadedVES loadVESDirect (@Nonnull final IValidationExecutorSetStatus aStatus,
                                  @Nonnull final IReadableResource aVESRes,
                                  @Nonnull final VESLoaderStatus aLoaderStatus,
                                  @Nonnull final ErrorList aLoadingErrors)
  {
    ValueEnforcer.notNull (aStatus, "Status");
    ValueEnforcer.notNull (aVESRes, "VESRes");
    ValueEnforcer.notNull (aLoaderStatus, "LoaderStatus");
    ValueEnforcer.notNull (aLoadingErrors, "LoadingErrors");

    // Read VES as XML
    final VesType aVES = new VES1Marshaller ().setCollectErrors (aLoadingErrors).read (aVESRes);
    if (aVES == null)
    {
      // Error in XML
      aLoadingErrors.add (SingleError.builderError ()
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
      aLoadingErrors.add (SingleError.builderError ()
                                     .errorText ("The VESID '" +
                                                 aVESID.getAsSingleID () +
                                                 "' was already loaded. It seems like you have a circular dependency: " +
                                                 aLoaderStatus.getDepedencyChain (aVESID))
                                     .build ());
      return null;
    }

    // Convert to loaded VES
    return convertToLoadedVES (aStatus, aVES, aLoaderStatus, aLoadingErrors);
  }

  /**
   * Load a VES by the provided VESID and fill all errors into the provided
   * {@link ErrorList}.
   *
   * @param aVESID
   *        The VESID to load. May not be <code>null</code>.
   * @param aLoadingErrors
   *        The loading error list to be filled. May not be <code>null</code>.
   * @return <code>null</code> if loading failed
   */
  @Nullable
  public LoadedVES loadVESFromRepo (@Nonnull final VESID aVESID, @Nonnull final ErrorList aLoadingErrors)
  {
    return _loadVESFromRepo (aVESID, null, new VESLoaderStatus (), aLoadingErrors);
  }

  /**
   * Load a VES by the provided VESID and fill all errors into the provided
   * {@link ErrorList}.
   *
   * @param aVESID
   *        The VESID to load. May not be <code>null</code>.
   * @param aLoaderStatus
   *        The internal loader status to be used, to make sure no cycles etc.
   *        are contained
   * @param aLoadingErrors
   *        The loading error list to be filled. May not be <code>null</code>.
   * @return <code>null</code> if loading failed
   */
  @Nullable
  public LoadedVES loadVESFromRepo (@Nonnull final VESID aVESID,
                                    @Nonnull final VESLoaderStatus aLoaderStatus,
                                    @Nonnull final ErrorList aLoadingErrors)
  {
    return _loadVESFromRepo (aVESID, null, aLoaderStatus, aLoadingErrors);
  }

  /**
   * Load a VES by the provided VESID and fill all errors into the provided
   * {@link ErrorList}.
   *
   * @param aVESID
   *        The VESID to load. May be a static version or a pseudo version. May
   *        not be <code>null</code>.
   * @param aLoadingRequiredVES
   *        The required VES that is currently loaded. May be <code>null</code>.
   * @param aLoaderStatus
   *        The internal loader status to be used, to make sure no cycles etc.
   *        are contained
   * @param aLoadingErrors
   *        The loading error list to be filled. May not be <code>null</code>.
   * @return <code>null</code> if loading failed
   */
  @Nullable
  private LoadedVES _loadVESFromRepo (@Nonnull final VESID aVESID,
                                      @Nullable final LoadedVES.RequiredVES aLoadingRequiredVES,
                                      @Nonnull final VESLoaderStatus aLoaderStatus,
                                      @Nonnull final ErrorList aLoadingErrors)
  {
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aLoaderStatus, "LoaderStatus");
    ValueEnforcer.notNull (aLoadingErrors, "LoadingErrors");

    final boolean bIsRoot = aLoaderStatus.m_aLoaded.isEmpty ();

    // resolve eventual pseudo version here
    final VESID aStaticVESID;
    if (aVESID.getVersionObj ().isStaticVersion ())
      aStaticVESID = aVESID;
    else
    {
      final EVESPseudoVersion ePseudoVersion = aVESID.getVersionObj ().getPseudoVersion ();
      switch (ePseudoVersion)
      {
        case LATEST:
          // Resolve latest version
          switch (m_eLatestResMode)
          {
            case LATEST_OVERALL:
              aStaticVESID = m_aRepo.getLatestVersion (aVESID.getGroupID (), aVESID.getArtifactID ());
              break;
            case LATEST_RELEASES:
              aStaticVESID = m_aRepo.getLatestReleaseVersion (aVESID.getGroupID (), aVESID.getArtifactID ());
              break;
            case NOT_SUPPORTED:
              aStaticVESID = aVESID;
              break;
            default:
              throw new IllegalStateException ("Unsupported latest resolution mode " + m_eLatestResMode);
          }
          break;
        default:
          throw new IllegalStateException ("Unsupported pseudo version " + ePseudoVersion);
      }

      if (aStaticVESID == null)
      {
        LOGGER.error ("Failed to resolve pseudo version in '" +
                      aVESID.getAsSingleID () +
                      "' using resolution mode " +
                      m_eLatestResMode);
        return null;
      }

      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Successfully resolved pseudo version in '" +
                      aVESID.getAsSingleID () +
                      "' using resolution mode " +
                      m_eLatestResMode +
                      " to '" +
                      aStaticVESID.getAsSingleID () +
                      "'");
    }

    LOGGER.info ("Trying to read VESID " + aLoaderStatus.getDepedencyChain (aStaticVESID) + " from repository");

    LoadedVES ret = null;
    try
    {
      // Ensure the VESID is not yet in the loader chain
      if (aLoaderStatus.addVESID (aStaticVESID).isFailure ())
      {
        // This is a circular dependency
        aLoadingErrors.add (SingleError.builderError ()
                                       .errorText ("The VESID '" +
                                                   aStaticVESID.getAsSingleID () +
                                                   "' was already loaded. It seems like you have a circular dependency: " +
                                                   aLoaderStatus.getDepedencyChain (aStaticVESID))
                                       .build ());
        return null;
      }

      // Check if an explicit status is available
      final IValidationExecutorSetStatus aStatus;
      final RepoStorageKeyOfArtefact aRepoKeyStatus = RepoStorageKeyOfArtefact.of (aStaticVESID, FILE_EXT_STATUS);
      if (m_aRepo.exists (aRepoKeyStatus))
      {
        final IRepoStorageReadItem aRepoContentStatus = m_aRepo.read (aRepoKeyStatus);
        // it's okay, if it does not exist
        if (aRepoContentStatus != null)
        {
          // Read VES Status as XML
          final VesStatusType aVESStatus = new VESStatus1Marshaller ().setCollectErrors (aLoadingErrors)
                                                                      .read (new RepoStorageReadableResource (aRepoKeyStatus,
                                                                                                              aRepoContentStatus.getContent ()));
          if (aVESStatus == null)
          {
            // Error in Status XML - breaking error
            aLoadingErrors.add (SingleError.builderError ()
                                           .errorFieldName (aRepoKeyStatus.getPath ())
                                           .errorText ("Failed to read VES Status as XML.")
                                           .build ());
            return null;
          }

          // Convert JAXB data model to Java date model
          aStatus = VESStatus1Helper.convert (aVESStatus);
        }
        else
        {
          // Status is supposed to exist, but does not
          aStatus = ValidationExecutorSetStatus.createValidNow ();
        }
      }
      else
      {
        // Status does not exist
        aStatus = ValidationExecutorSetStatus.createValidNow ();
      }

      // Read VES content from repo
      final RepoStorageKeyOfArtefact aRepoKeyVES = RepoStorageKeyOfArtefact.of (aStaticVESID, FILE_EXT_VES);
      final IRepoStorageReadItem aRepoContentVES = m_aRepo.read (aRepoKeyVES);
      if (aRepoContentVES == null)
      {
        aLoadingErrors.add (SingleError.builderError ()
                                       .errorFieldName (aRepoKeyVES.getPath ())
                                       .errorText ("Failed to resolve provided VES from repository.")
                                       .build ());
        return null;
      }

      // Read VES as XML
      final VesType aVES = new VES1Marshaller ().setCollectErrors (aLoadingErrors)
                                                .read (new RepoStorageReadableResource (aRepoKeyVES,
                                                                                        aRepoContentVES.getContent ()));
      if (aVES == null)
      {
        // Error in XML
        aLoadingErrors.add (SingleError.builderError ()
                                       .errorFieldName (aRepoKeyVES.getPath ())
                                       .errorText ("Failed to read VES as XML.")
                                       .build ());
        return null;
      }

      // Now read into data model
      ret = _convertToLoadedVES (aStatus, aLoadingRequiredVES, aVES, aLoaderStatus, aLoadingErrors);
      return ret;
    }
    finally
    {
      if (bIsRoot)
        if (ret == null)
          LOGGER.error ("Failed to load VESID '" + aStaticVESID.getAsSingleID () + "' from repository");
        else
          LOGGER.info ("Successfully finished loading VESID '" + aStaticVESID.getAsSingleID () + "' from repository");
    }
  }

  @Nonnull
  static VESID createVESID (@Nonnull final VesResourceType aVRT)
  {
    // No classifier contained
    return new VESID (aVRT.getGroupId (), aVRT.getArtifactId (), aVRT.getVersion ());
  }

  @Nonnull
  static RepoStorageKeyOfArtefact createRepoStorageKey (@Nonnull final VesResourceType aVRT)
  {
    // File extension must start with a dot
    return RepoStorageKeyOfArtefact.of (createVESID (aVRT), "." + aVRT.getType ());
  }

  /**
   * Load the validation rules from an external repository, identified by a
   * VESID and apply the validation rules onto the provided data to be
   * validated. All errors occurring are stored in the provided error list.
   *
   * @param aRepo
   *        Repository to load from. Must not be <code>null</code>.
   * @param aVESID
   *        The VESID of the artefacts to load. Must not be <code>null</code>.
   * @param aValidationSource
   *        The data to be validated. Must not be <code>null</code>.
   * @param aLoadingErrors
   *        The loading error list to be filled. Contains only the loading
   *        errors - validation errors will be returned in a separate
   *        {@link ValidationResultList}. Must not be <code>null</code>.
   * @return The validation result
   * @throws VESLoadingException
   *         If anything goes wrong
   */
  @Nonnull
  public static VESValidationResult loadVESAndApplyValidation (@Nonnull final IRepoStorageWithToc aRepo,
                                                               @Nonnull final VESID aVESID,
                                                               @Nonnull final IValidationSource aValidationSource,
                                                               @Nonnull final ErrorList aLoadingErrors) throws VESLoadingException
  {
    ValueEnforcer.notNull (aRepo, "RepoChain");
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aLoadingErrors, "LoadingErrors");

    // Remember start date time
    final OffsetDateTime aStartDT = PDTFactory.getCurrentOffsetDateTime ();

    // load
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Start VES loading of '" + aVESID.getAsSingleID () + "'");

    final StopWatch aSWLoad = StopWatch.createdStarted ();
    final LoadedVES aLoadedVES = new VESLoader (aRepo).setUseEagerRequirementLoading (true)
                                                      .loadVESFromRepo (aVESID, aLoadingErrors);
    aSWLoad.stop ();
    if (aLoadedVES == null)
    {
      throw new VESLoadingException ("Failed to load VES '" +
                                     aVESID.getAsSingleID () +
                                     "': " +
                                     StringHelper.getImplodedMapped ("\n  ",
                                                                     aLoadingErrors,
                                                                     IError::getAsStringLocaleIndepdent));
    }

    final Duration aLoadDuration = aSWLoad.getDuration ();
    if (aLoadDuration.compareTo (DURATION_WARN) > 0)
      LOGGER.warn ("Finished VES loading of '" + aVESID.getAsSingleID () + "' after " + aLoadDuration);

    // validate
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Start validation of '" + aVESID.getAsSingleID () + "'");

    final ValidationResultList aValidationResultList = new ValidationResultList ();
    final Duration aValidateDuration = StopWatch.runMeasured ( () -> {
      aLoadedVES.applyValidation (aValidationSource, aValidationResultList, Locale.ENGLISH);
    });
    if (aValidateDuration.compareTo (DURATION_WARN) > 0)
      LOGGER.warn ("Finished validation of '" + aVESID.getAsSingleID () + "' after " + aValidateDuration);

    // Collect all results
    return new VESValidationResult (aVESID,
                                    aValidationSource,
                                    aStartDT,
                                    aLoadDuration,
                                    aValidateDuration,
                                    aValidationResultList);
  }
}
