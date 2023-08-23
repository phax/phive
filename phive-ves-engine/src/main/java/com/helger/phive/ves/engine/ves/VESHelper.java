package com.helger.phive.ves.engine.ves;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageReadableResource;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.v10.VesResourceType;
import com.helger.phive.ves.v10.VesSchematronType;
import com.helger.phive.ves.v10.VesType;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.schematron.ESchematronEngine;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;

@Immutable
public final class VESHelper
{
  public static final String FILE_EXT_VES = ".ves";

  private static final Logger LOGGER = LoggerFactory.getLogger (VESHelper.class);

  private VESHelper ()
  {}

  @Nonnull
  private static VESID _wrapID (@Nonnull final VesResourceType aVRT)
  {
    return new VESID (aVRT.getGroupId (), aVRT.getArtifactId (), aVRT.getVersion ());
  }

  @Nonnull
  private static RepoStorageKey _wrapKey (@Nonnull final VesResourceType aVRT)
  {
    return RepoStorageKey.of (_wrapID (aVRT), aVRT.getType ());
  }

  private static boolean _isDTValid (@Nonnull final VesType aVES)
  {
    if (aVES.getValidFrom () != null)
    {
      // Already valid?
      if (PDTFactory.getCurrentXMLOffsetDateTime ().isBefore (aVES.getValidFrom ()))
        return false;
    }
    if (aVES.getValidTo () != null)
    {
      // Not yet valid?
      if (PDTFactory.getCurrentXMLOffsetDateTime ().isAfter (aVES.getValidTo ()))
        return false;
    }
    return true;
  }

  @Nonnull
  private static ValidationExecutorSet <IValidationSourceXML> _getExecutorSetXSD (@Nonnull final IRepoStorageChain aRepoChain,
                                                                                  @Nonnull final VesType aVES)
  {
    final VesXsdType aXSD = aVES.getXsd ();

    final VESID aXSDVESID = _wrapID (aXSD.getResource ());
    final String sResourceType = aXSD.getResource ().getType ();
    final RepoStorageKey aXSDKey = RepoStorageKey.of (aXSDVESID, "." + sResourceType);

    // Read referenced Item
    final RepoStorageItem aXSDItem = aRepoChain.read (aXSDKey);
    if (aXSDItem == null)
    {
      LOGGER.warn ("Failed to resolve XSD artifact '" + aXSDKey.getPath () + "'");
      return null;
    }

    final IReadableResource aRepoRes = new RepoStorageReadableResource (aXSDKey, aXSDItem);

    final ValidationExecutorXSD aExecutorXSD;
    switch (sResourceType)
    {
      case "xsd":
      {
        // Indicate a potential error
        if (StringHelper.hasText (aXSD.getMain ()))
          LOGGER.error ("XSD resource type '" + sResourceType + "' does not use the 'main' element");

        // Load "as is"
        aExecutorXSD = ValidationExecutorXSD.create (aRepoRes);
        break;
      }
      case "zip":
      {
        final String sMain = aXSD.getMain ();
        if (StringHelper.hasNoText (sMain))
        {
          LOGGER.error ("XSD resource type '" + sResourceType + "' requires the 'main' element to be provided!");
          return null;
        }

        // TODO Load and unpack ZIP and create executor
        LOGGER.warn ("XSD resource type '" + sResourceType + "' not yet implemented");
        aExecutorXSD = null;
        break;
      }
      default:
      {
        LOGGER.error ("Unsupported XSD resource type '" + sResourceType + "' found");
        return null;
      }
    }
    LOGGER.info ("Loaded XSD ValidationExecutorXSD using resource type '" +
                 sResourceType +
                 "' and path '" +
                 aXSDKey.getPath () +
                 "'");

    final boolean bIsDeprecated = !_isDTValid (aVES);

    // Create an Executor with min.xsd and validate mini.xml
    return ValidationExecutorSet.create (aXSDVESID, aVES.getName (), bIsDeprecated, aExecutorXSD);
  }

  @Nonnull
  private static ValidationExecutorSet <IValidationSourceXML> _getExecutorSetSCH (@Nonnull final IRepoStorageChain aRepoChain,
                                                                                  @Nonnull final VesType aVES)
  {
    final VesSchematronType aSCH = aVES.getSchematron ();

    final VESID aSCHVESID = _wrapID (aSCH.getResource ());
    final String sResourceType = aSCH.getResource ().getType ();
    final RepoStorageKey aSCHKey = RepoStorageKey.of (aSCHVESID, "." + sResourceType);

    // Read referenced Item
    final RepoStorageItem aSCHItem = aRepoChain.read (aSCHKey);
    if (aSCHItem == null)
    {
      LOGGER.warn ("Failed to resolve Schematron artifact '" + aSCHKey.getPath () + "'");
      return null;
    }

    final IReadableResource aRepoRes = new RepoStorageReadableResource (aSCHKey, aSCHItem);

    final String sEngine = aSCH.getEngine ();
    final ESchematronEngine eEngine = ESchematronEngine.getFromIDOrNull (sEngine);
    if (eEngine == null)
    {
      LOGGER.error ("Schematron engine '" +
                    sEngine +
                    "' is unknown. Valid IDs are: " +
                    StringHelper.imploder ()
                                .source (ESchematronEngine.values (), x -> "'" + x.getID () + "'")
                                .separator (", ")
                                .build ());
      return null;
    }

    final ValidationExecutorSchematron aExecutorSCH;
    switch (sResourceType)
    {
      case "sch":
      {
        switch (eEngine)
        {
          case PURE:
            // aExecutorSCH = new SchematronResourcePure (aRepoRes);
            break;
        }
        // TODO
        aExecutorSCH = null;
        break;
      }
      case "xslt":
      {
        // TODO
        aExecutorSCH = null;
        break;
      }
      default:
      {
        LOGGER.error ("Unsupported Schematron resource type '" + sResourceType + "' found");
        return null;
      }
    }

    final boolean bIsDeprecated = !_isDTValid (aVES);

    // Create an Executor with min.xsd and validate mini.xml
    return ValidationExecutorSet.create (aSCHVESID, aVES.getName (), bIsDeprecated, aExecutorSCH);
  }

  @Nonnull
  public static ValidationResultList runAndApplyVES (@Nonnull final IRepoStorageChain aRepoChain,
                                                     @Nonnull final VESID aVESID,
                                                     @Nonnull final IValidationSource aValidationSource)
  {
    ValueEnforcer.notNull (aRepoChain, "RepoChain");
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");

    // Create RepoStorageKey
    final RepoStorageKey aRepoKey = RepoStorageKey.of (aVESID, FILE_EXT_VES);
    LOGGER.info ("Trying to read VESID '" +
                 aVESID.getAsSingleID () +
                 "' from Repo in path '" +
                 aRepoKey.getPath () +
                 "'");

    // Read from repo
    final RepoStorageItem aRepoContent = aRepoChain.read (aRepoKey);
    if (aRepoContent == null)
    {
      LOGGER.warn ("Failed to resolve '" + aRepoKey.getPath () + "' from repository");
      return null;
    }

    // Read VES as XML
    final RepoStorageReadableResource aRes = new RepoStorageReadableResource (aRepoKey, aRepoContent);
    final VesType aVES = new VES1Marshaller ().read (aRes);
    if (aVES == null)
    {
      // Error in XML
      LOGGER.warn ("Failed to read VES of '" + aRes.getPath () + "' as XML.");
      return null;
    }

    final ValidationResultList aValidationResultList = new ValidationResultList ();

    if (aVES.getXsd () != null)
    {
      if (!(aValidationSource instanceof IValidationSourceXML))
        throw new IllegalStateException ("The validation source must be of type ValidationSourceXML");

      final ValidationExecutorSet <IValidationSourceXML> aExecutorSet = _getExecutorSetXSD (aRepoChain, aVES);

      // Validate
      ValidationExecutionManager.executeValidation (aExecutorSet,
                                                    (IValidationSourceXML) aValidationSource,
                                                    aValidationResultList,
                                                    Locale.ENGLISH);
    }
    else
      if (aVES.getSchematron () != null)
      {
        if (!(aValidationSource instanceof IValidationSourceXML))
          throw new IllegalStateException ("The validation source must be of type ValidationSourceXML");
        // TODO

        final ValidationExecutorSet <IValidationSourceXML> aExecutorSet = _getExecutorSetSCH (aRepoChain, aVES);

        // Validate
        ValidationExecutionManager.executeValidation (aExecutorSet,
                                                      (IValidationSourceXML) aValidationSource,
                                                      aValidationResultList,
                                                      Locale.ENGLISH);
      }
      else
        throw new IllegalStateException ("Failed to handle " + aVES);

    return aValidationResultList;
  }
}
