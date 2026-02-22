package com.helger.phive.result.summary;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.Immutable;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.level.IErrorLevel;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.severity.PhiveSeverityHelper;
import com.helger.phive.api.validity.EExtendedValidity;

/**
 * Helper class to create the summary from a {@link ValidationResultList}.
 *
 * @author Philip Helger
 * @since 12.0.0
 */
@Immutable
public final class ValidationSummary
{
  private final int m_nWarnings;
  private final int m_nErrors;
  private final boolean m_bValidationInterrupted;
  private final IErrorLevel m_aMostSevere;
  private final EExtendedValidity m_eWorstValidity;

  private ValidationSummary (@Nonnegative final int nWarnings,
                             @Nonnegative final int nErrors,
                             final boolean bValidationInterrupted,
                             @NonNull final IErrorLevel aMostSevere,
                             @NonNull final EExtendedValidity eWorstValidity)
  {
    m_nWarnings = nWarnings;
    m_nErrors = nErrors;
    m_bValidationInterrupted = bValidationInterrupted;
    m_aMostSevere = aMostSevere;
    m_eWorstValidity = eWorstValidity;
  }

  @Nonnegative
  public int getWarningCount ()
  {
    return m_nWarnings;
  }

  @Nonnegative
  public int getErrorCount ()
  {
    return m_nErrors;
  }

  public boolean isValidationInterrupted ()
  {
    return m_bValidationInterrupted;
  }

  @NonNull
  public IErrorLevel getMostSevereErrorLevel ()
  {
    return m_aMostSevere;
  }

  @NonNull
  public EExtendedValidity getWorstValidity ()
  {
    return m_eWorstValidity;
  }

  @NonNull
  public static ValidationSummary create (@NonNull final ValidationResultList aValidationResultList)
  {
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");

    // Calculate overalls
    int nWarnings = 0;
    int nErrors = 0;
    boolean bValidationInterrupted = false;
    IErrorLevel aMostSevere = EErrorLevel.LOWEST;
    EExtendedValidity eWorstValidity = EExtendedValidity.VALID;

    for (final ValidationResult aVR : aValidationResultList)
    {
      final EExtendedValidity eValidity = aVR.getValidity ();
      if (eValidity.isSkipped ())
      {
        bValidationInterrupted = true;
      }
      else
      {
        // Backwards compatible decision
        if (eValidity.isInvalid ())
          eWorstValidity = eValidity;
      }

      for (final IError aError : aVR.getErrorList ())
      {
        if (aError.getErrorLevel ().isGT (aMostSevere))
          aMostSevere = aError.getErrorLevel ();

        if (PhiveSeverityHelper.isConsideredError (aError.getErrorLevel ()))
          nErrors++;
        else
          if (PhiveSeverityHelper.isConsideredWarning (aError.getErrorLevel ()))
            nWarnings++;
      }
    }

    return new ValidationSummary (nWarnings, nErrors, bValidationInterrupted, aMostSevere, eWorstValidity);
  }
}
