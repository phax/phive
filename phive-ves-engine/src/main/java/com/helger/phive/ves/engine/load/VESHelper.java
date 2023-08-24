package com.helger.phive.ves.engine.load;

import java.util.Locale;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.list.ErrorList;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.repo.IRepoStorageChain;

public class VESHelper
{
  private VESHelper ()
  {}

  @Nonnull
  public static ValidationResultList loadVESAndApplyValidation (@Nonnull final IRepoStorageChain aRepoChain,
                                                                @Nonnull final VESID aVESID,
                                                                @Nonnull final IValidationSource aValidationSource,
                                                                @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aRepoChain, "RepoChain");
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    // load
    final LoadedVES aLoadedVES = new VESLoader (aRepoChain).loadVES (aVESID, aErrorList);
    if (aLoadedVES == null)
      throw new IllegalStateException ("Failed to load VES '" + aVESID.getAsSingleID () + "'");

    // validate
    final ValidationResultList aValidationResultList = new ValidationResultList ();
    aLoadedVES.applyValidation (aValidationSource, aValidationResultList, Locale.ENGLISH);
    return aValidationResultList;
  }
}
