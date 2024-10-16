/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.error.list.IErrorList;
import com.helger.commons.string.ToStringGenerator;
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

  /**
   * Constructor for non-skipped results
   *
   * @param aValidationArtefact
   *        The validation artefact that was applied. May not be
   *        <code>null</code>.
   * @param aErrorList
   *        The list of errors applying the validation artefact. May not be
   *        <code>null</code>.
   */
  public ValidationResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IErrorList aErrorList)
  {
    this (aValidationArtefact, aErrorList, false);
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
   */
  protected ValidationResult (@Nonnull final IValidationArtefact aValidationArtefact,
                              @Nonnull final IErrorList aErrorList,
                              final boolean bWasSkipped)
  {
    m_aValidationArtefact = ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");
    m_aErrorList = ValueEnforcer.notNull (aErrorList, "ErrorList");
    m_bSkipped = bWasSkipped;
  }

  /**
   * @return The validation artefact used to perform validation. Never
   *         <code>null</code>.
   */
  @Nonnull
  public final IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  /**
   * @return The errors occurred during the validation execution on this layer.
   *         Never <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableObject
  public final IErrorList getErrorList ()
  {
    return m_aErrorList;
  }

  public final boolean isSkipped ()
  {
    return m_bSkipped;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact)
                                       .append ("ErrorList", m_aErrorList)
                                       .append ("Skipped", m_bSkipped)
                                       .getToString ();
  }

  /**
   * Create an instance for an ignored result.
   *
   * @param aValidationArtefact
   *        The validation artefact that was ignored.
   * @return Never <code>null</code>.
   */
  @Nonnull
  public static ValidationResult createSkippedResult (@Nonnull final IValidationArtefact aValidationArtefact)
  {
    return new ValidationResult (aValidationArtefact, new ErrorList (), true);
  }
}
