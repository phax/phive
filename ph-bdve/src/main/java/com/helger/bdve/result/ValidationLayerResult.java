/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;

import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.commons.error.IError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.error.list.IErrorList;
import com.helger.commons.state.ETriState;

/**
 * This class captures the validation result of a single validation layer. It
 * contains the validation artefact and the errors occurred.
 *
 * @author Philip Helger
 * @deprecated Use {@link ValidationResult} instead
 */
@Deprecated
public class ValidationLayerResult extends ValidationResult
{
  @Deprecated
  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IError aError)
  {
    this (aValidationArtefact, new ErrorList (aError));
  }

  @Deprecated
  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact,
                                @Nonnull final Iterable <? extends IError> aErrors)
  {
    this (aValidationArtefact, new ErrorList (aErrors));
  }

  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact,
                                @Nonnull final IErrorList aErrorList)
  {
    this (aValidationArtefact, aErrorList, ETriState.valueOf (aErrorList.containsNoFailure ()));
  }

  private ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact,
                                 @Nonnull final IErrorList aErrorList,
                                 @Nonnull final ETriState eSuccess)
  {
    super (aValidationArtefact, aErrorList, eSuccess);
  }

  @Nonnull
  public static ValidationLayerResult createIgnoredLayer (@Nonnull final IValidationArtefact aValidationArtefact)
  {
    return new ValidationLayerResult (aValidationArtefact, new ErrorList (), ETriState.UNDEFINED);
  }
}
