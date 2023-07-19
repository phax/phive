package com.helger.phive.ves.engine.ves;

import javax.annotation.Nonnull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.v10.VesType;

public class VESHelper
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESHelper.class);

  public static ValidationResult runAndApplyVES (@Nonnull final IRepoStorageChain aRepoChain,
                                                 @Nonnull final VESID aVESID,
                                                 @Nonnull final IValidationSource aValidationSource)
  {
    ValueEnforcer.notNull (aRepoChain, "RepoChain");
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");

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

    // TODO do something with the VES :)

    return null;
  }
}
