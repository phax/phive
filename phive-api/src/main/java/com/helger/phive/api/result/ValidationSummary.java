/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.api.result;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.Immutable;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.level.IErrorLevel;
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

  private ValidationSummary (@Nonnegative final int nWarnings,
                             @Nonnegative final int nErrors,
                             final boolean bValidationInterrupted,
                             @NonNull final IErrorLevel aMostSevere)
  {
    m_nWarnings = nWarnings;
    m_nErrors = nErrors;
    m_bValidationInterrupted = bValidationInterrupted;
    m_aMostSevere = aMostSevere;
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
  public static ValidationSummary create (@NonNull final ValidationResultList aValidationResultList)
  {
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");

    // Calculate overalls
    int nWarnings = 0;
    int nErrors = 0;
    boolean bValidationInterrupted = false;
    IErrorLevel aMostSevere = EErrorLevel.LOWEST;

    for (final ValidationResult aVR : aValidationResultList)
    {
      final EExtendedValidity eValidity = aVR.getValidity ();
      if (eValidity.isSkipped ())
      {
        bValidationInterrupted = true;
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

    return new ValidationSummary (nWarnings, nErrors, bValidationInterrupted, aMostSevere);
  }
}
