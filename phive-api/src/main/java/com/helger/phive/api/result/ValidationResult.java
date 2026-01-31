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
import com.helger.annotation.style.ReturnsMutableObject;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diagnostics.error.list.IErrorList;
import com.helger.phive.api.artefact.IValidationArtefact;

/**
 * This class captures the validation result of a single validation layer. It
 * contains the validation artefact and the errors occurred.
 *
 * @author Philip Helger
 */
@Immutable
public class ValidationResult
{
  private final IValidationArtefact m_aValidationArtefact;
  private final IErrorList m_aErrorList;
  private final boolean m_bSkipped;
  private final long m_nDurationMS;

  /**
   * Constructor for non-skipped results
   *
   * @param aValidationArtefact
   *        The validation artefact that was applied. May not be
   *        <code>null</code>.
   * @param aErrorList
   *        The list of errors applying the validation artefact. May not be
   *        <code>null</code>.
   * @param nDurationMS
   *        The number of milliseconds it took to get the validation results.
   *        Must be &ge; 0.
   */
  public ValidationResult (@NonNull final IValidationArtefact aValidationArtefact,
                           @NonNull final IErrorList aErrorList,
                           @Nonnegative final long nDurationMS)
  {
    this (aValidationArtefact, aErrorList, false, nDurationMS);
  }

  /**
   * Constructor
   *
   * @param aValidationArtefact
   *        The validation artefact that was applied. May not be
   *        <code>null</code>.
   * @param aErrorList
   *        The list of errors applying the validation artefact. May not be
   *        <code>null</code>.
   * @param bWasSkipped
   *        <code>true</code> if this validation layer was skipped.
   * @param nDurationMS
   *        The number of milliseconds it took to get the validation results.
   *        Must be &ge; 0.
   */
  protected ValidationResult (@NonNull final IValidationArtefact aValidationArtefact,
                              @NonNull final IErrorList aErrorList,
                              final boolean bWasSkipped,
                              @Nonnegative final long nDurationMS)
  {
    ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");
    ValueEnforcer.notNull (aErrorList, "ErrorList");
    ValueEnforcer.isGE0 (nDurationMS, "DurationMS");

    m_aValidationArtefact = aValidationArtefact;
    m_aErrorList = aErrorList;
    m_bSkipped = bWasSkipped;
    m_nDurationMS = nDurationMS;
  }

  /**
   * @return The validation artefact used to perform validation. Never
   *         <code>null</code>.
   */
  @NonNull
  public final IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  /**
   * @return The errors occurred during the validation execution on this layer.
   *         Never <code>null</code> but maybe empty.
   */
  @NonNull
  @ReturnsMutableObject
  public final IErrorList getErrorList ()
  {
    return m_aErrorList;
  }

  /**
   * @return <code>true</code> if this validation result is based on a skipped
   *         validation layer, <code>false</code> otherwise.
   */
  public final boolean isSkipped ()
  {
    return m_bSkipped;
  }

  /**
   * @return The duration in milliseconds it took to create this validation
   *         result. Always &ge; 0.
   * @since 10.1.0
   */
  @Nonnegative
  public final long getDurationMS ()
  {
    return m_nDurationMS;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact)
                                       .append ("ErrorList", m_aErrorList)
                                       .append ("Skipped", m_bSkipped)
                                       .append ("DurationMS", m_nDurationMS)
                                       .getToString ();
  }

  /**
   * Create an instance for an ignored result.
   *
   * @param aValidationArtefact
   *        The validation artefact that was ignored.
   * @return Never <code>null</code>.
   */
  @NonNull
  public static ValidationResult createSkippedResult (@NonNull final IValidationArtefact aValidationArtefact)
  {
    return new ValidationResult (aValidationArtefact, new ErrorList (), true, 0);
  }
}
