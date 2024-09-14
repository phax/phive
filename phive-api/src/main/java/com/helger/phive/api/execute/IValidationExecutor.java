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
package com.helger.phive.api.execute;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.source.IValidationSource;

/**
 * Base interface for performing validation of a single XML document based on
 * the rules of a single validation artefact.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
@MustImplementEqualsAndHashcode
public interface IValidationExecutor <SOURCETYPE extends IValidationSource>
{
  /**
   * @return The validation artefact used to validate the XML instances. Never
   *         <code>null</code>.
   */
  @Nonnull
  IValidationArtefact getValidationArtefact ();

  /**
   * @return <code>true</code> if a negative validation stops further
   *         validations.
   * @since 5.3.1; previously on validation type level only
   */
  default boolean isStopValidationOnError ()
  {
    return getValidationArtefact ().getValidationType ().isStopValidationOnError ();
  }

  /**
   * Perform validation of the provided source.
   *
   * @param aSource
   *        Source to be validated. May not be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull final SOURCETYPE aSource)
  {
    return applyValidation (aSource, (Locale) null);
  }

  /**
   * Perform validation of the provided source.
   *
   * @param aSource
   *        Source to be validated. May not be <code>null</code>.
   * @param aLocale
   *        The locale to use for error messages if applicable. May be
   *        <code>null</code> in which case the system default locale is used.
   * @return Never <code>null</code>.
   */
  @Nonnull
  ValidationResult applyValidation (@Nonnull SOURCETYPE aSource, @Nullable Locale aLocale);
}
