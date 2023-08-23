package com.helger.phive.ves.engine.ves;

import javax.annotation.Nonnull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.v10.VesSchematronType;
import com.helger.phive.ves.v10.VesType;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;

import java.util.Locale;

public class VESHelper
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESHelper.class);

  public static ValidationResult runAndApplyVES (@Nonnull final IRepoStorageChain aRepoChain,
                                                 @Nonnull final VESID aVESID,
                                                 @Nonnull final IValidationSourceXML aValidationSource)
  {
    ValueEnforcer.notNull (aRepoChain, "RepoChain");
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");

    // Create RepoStorageKey
    final RepoStorageKey aRepoKey = RepoStorageKey.of (aVESID, ".ves");
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
    final VesType aVES = new VES1Marshaller ().read (aRepoContent.data ().getBufferedInputStream ());
    if (aVES == null)
    {
      // Error in XML
      LOGGER.warn ("Failed to read VES of '" + aRepoKey.getPath () + "' as XML.");
      return null;
    }

    ValidationResultList aValidationResultList = new ValidationResultList();

    if(aVES.getXsd () != null) {
      // Get name of xsd file
      VesXsdType aVesXsdType = aVES.getXsd ();
      String artefactId = aVesXsdType.getResource ().getArtifactId ();
      String BASE_PATH = "ves/test1/";
      String artefactFullName = artefactId + ".xsd";

      // Get ReadableResource for xsd file
      IReadableResource aReadableResXSD = new ClassPathResource (BASE_PATH + artefactFullName);

      // Create an Executor with min.xsd and validate mini.xml
      ValidationExecutorSet<IValidationSourceXML> aExecutorSet = ValidationExecutorSet.create (aVESID,
                                                                                               aVES.getName(),
                                                                                               false,
                                                                                               ValidationExecutorXSD.create (aReadableResXSD));

      // Validate
      ValidationExecutionManager.executeValidation (aExecutorSet, aValidationSource, aValidationResultList, Locale.ENGLISH);

    } else {
      // Get name of xsd file
      VesSchematronType aVESSchematron = aVES.getSchematron();
      String artefactId = aVESSchematron.getResource().getArtifactId();
      String BASE_PATH = "ves/test2/";
      String artefactFullName = artefactId + ".sch";

      // Get ReadableResource for sch file
      IReadableResource aReadableRes = new ClassPathResource(BASE_PATH + artefactFullName);

      // Create an Executor with min.sch and validate mini.xml
      ValidationExecutorSet<IValidationSourceXML> aExecutorSet =
          ValidationExecutorSet.create(aVESID, aVES.getName(), false,
                                       ValidationExecutorSchematron.createSCH(aReadableRes, null));

      // Validate
      ValidationExecutionManager.executeValidation(aExecutorSet, aValidationSource,
                                                   aValidationResultList, Locale.ENGLISH);
    }

    return aValidationResultList.get(0);
  }
}
