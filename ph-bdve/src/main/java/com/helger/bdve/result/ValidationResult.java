/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve.result;

import java.io.Serializable;

import javax.annotation.Nonnull;

import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.error.list.IErrorList;
import com.helger.commons.state.ETriState;
import com.helger.commons.state.ISuccessIndicator;
import com.helger.commons.string.ToStringGenerator;

/**
 * This class captures the validation result of a single validation layer. It
 * contains the validation artefact and the errors occurred.
 *
 * @author Philip Helger
 */
public class ValidationResult implements ISuccessIndicator, Serializable
{
  private final IValidationArtefact m_aValidationArtefact;
  private final IErrorList m_aErrorList;
  private final ETriState m_eSuccess;

  public ValidationResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IErrorList aErrorList)
  {
    this (aValidationArtefact, aErrorList, ETriState.valueOf (aErrorList.containsNoFailure ()));
  }

  ValidationResult (@Nonnull final IValidationArtefact aValidationArtefact,
                    @Nonnull final IErrorList aErrorList,
                    @Nonnull final ETriState eSuccess)
  {
    m_aValidationArtefact = ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");
    m_aErrorList = ValueEnforcer.notNull (aErrorList, "ErrorList");
    m_eSuccess = ValueEnforcer.notNull (eSuccess, "Success");
  }

  /**
   * @return The validation artefact used to perform validation. Never
   *         <code>null</code>.
   */
  @Nonnull
  public IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  /**
   * @return The errors occurred during the validation execution on this layer.
   *         Never <code>null</code> but maybe empty.
   */
  @Nonnull
  public IErrorList getErrorList ()
  {
    return m_aErrorList;
  }

  public boolean isSuccess ()
  {
    return m_eSuccess.isTrue ();
  }

  /**
   * @return <code>true</code> if there are no results on this layer, because
   *         the underlying validation artefact was not applicable. If this
   *         method returns <code>true</code> {@link #isSuccess()} and
   *         {@link #isFailure()} will both return <code>false</code>!
   */
  public boolean isIgnored ()
  {
    return m_eSuccess.isUndefined ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact)
                                       .append ("ErrorList", m_aErrorList)
                                       .append ("Success", m_eSuccess)
                                       .toString ();
  }

  @Nonnull
  public static ValidationResult createIgnoredResult (@Nonnull final IValidationArtefact aValidationArtefact)
  {
    return new ValidationResult (aValidationArtefact, new ErrorList (), ETriState.UNDEFINED);
  }
}
