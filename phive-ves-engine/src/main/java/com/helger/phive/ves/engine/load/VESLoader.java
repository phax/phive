package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.state.ETriState;
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

@Immutable
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

  private final IRepoStorageBase m_aRepo;
  private IVESLoaderXSD m_aLoaderXSD = new DefaultVESLoaderXSD ();
  private IVESLoaderSchematron m_aLoaderSchematron = new DefaultVESLoaderSchematron ();
  private IVESLoaderEdifact m_aLoaderEdifact = null;

  public VESLoader (@Nonnull final IRepoStorageBase aRepo)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    m_aRepo = aRepo;
  }

  @Nullable
  public IVESLoaderXSD getLoaderXSD ()
  {
    return m_aLoaderXSD;
  }

  @Nonnull
  public VESLoader setLoaderXSD (@Nullable final IVESLoaderXSD aLoader)
  {
    m_aLoaderXSD = aLoader;
    return this;
  }

  @Nullable
  public IVESLoaderSchematron getLoaderSchematron ()
  {
    return m_aLoaderSchematron;
  }

  @Nonnull
  public VESLoader setLoaderSchematron (@Nullable final IVESLoaderSchematron aLoader)
  {
    m_aLoaderSchematron = aLoader;
    return this;
  }

  @Nullable
  public IVESLoaderEdifact getLoaderEdifact ()
  {
    return m_aLoaderEdifact;
  }

  @Nonnull
  public VESLoader setLoaderEdifact (@Nullable final IVESLoaderEdifact aLoader)
  {
    m_aLoaderEdifact = aLoader;
    return this;
  }

  @Nullable
  public LoadedVES convertToLoadedVES (@Nonnull final LoadedVES.Status aStatus,
                                       @Nonnull final VesType aVES,
                                       @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aStatus, "Status");
    ValueEnforcer.notNull (aVES, "VES");
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
      ret.setRequires (aRequirement, aLocalErrorList -> {
        // Use this deferred loader, to ensure the same surrounding VESLoader
        // instance is used
        // Recursive load required artefact; required to have this in scope
        final LoadedVES aLoadedRequirement = loadVESFromRepo (aRequirement.getRequiredVESID (), aLocalErrorList);
        if (aLoadedRequirement == null)
          throw new IllegalStateException ("Failed to load required VESID '" +
                                           aRequirement.getRequiredVESID ().getAsSingleID () +
                                           "'");
        return aLoadedRequirement;
      });
    }
    if (aVES.getXsd () != null)
    {
      // XSD
      if (m_aLoaderXSD != null)
        ret.setExecutor (m_aLoaderXSD.loadXSD (m_aRepo, aVES.getXsd (), aErrorList));
      else
        aErrorList.add (SingleError.builderError ()
                                   .errorText ("The VES contains an XSD element, but no XSD loader is present")
                                   .build ());
    }
    else
      if (aVES.getSchematron () != null)
      {
        // Schematron
        if (m_aLoaderSchematron != null)
          ret.setExecutor (m_aLoaderSchematron.loadSchematron (m_aRepo, aVES.getSchematron (), aErrorList));
        else
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("The VES contains a Schematron element, but no Schematron loader is present")
                                     .build ());
      }
      else
        if (aVES.getEdifact () != null)
        {
          // EDIFACT
          if (m_aLoaderEdifact != null)
            ret.setExecutor (m_aLoaderEdifact.loadEdifact (m_aRepo, aVES.getEdifact (), aErrorList));
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
    return loadVESDirect (Status.createUndefined (), aVESRes, aErrorList);
  }

  @Nullable
  public LoadedVES loadVESDirect (@Nonnull final LoadedVES.Status aStatus,
                                  @Nonnull final IReadableResource aVESRes,
                                  @Nonnull final ErrorList aErrorList)
  {
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

    // Convert to loaded VES
    return convertToLoadedVES (aStatus, aVES, aErrorList);
  }

  @Nullable
  public LoadedVES loadVESFromRepo (@Nonnull final VESID aVESID, @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    LOGGER.info ("Trying to read VESID '" + aVESID.getAsSingleID () + "' from repository");

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

        aStatus = new LoadedVES.Status (aVESStatus.getValidFrom (),
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
    return convertToLoadedVES (aStatus, aVES, aErrorList);
  }
}
