/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.api.execute;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.api.artefact.IValidationArtefact;
import com.helger.bdve.api.result.ValidationResult;
import com.helger.bdve.api.source.IValidationSource;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;

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
   * Nested interface for validation executors that support caching.
   *
   * @author Philip Helger
   * @since 3.1.1
   */
  public interface ICacheSupport
  {
    boolean DEFAULT_CACHE = true;

    /**
     * @return <code>true</code> if caching is enabled, <code>false</code> if
     *         not.
     */
    boolean isCacheArtefact ();

    /**
     * Enable or disable caching.
     *
     * @param bCacheArtefact
     *        <code>true</code> to enable caching, <code>false</code> to disable
     *        it.
     * @return this for chaining
     */
    @Nonnull
    ICacheSupport setCacheArtefact (boolean bCacheArtefact);
  }

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
    return getValidationArtefact ().getValidationArtefactType ().isStopValidationOnError ();
  }

  /**
   * Perform validation. The class loader of the validation artefact is used.
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
   * Perform validation
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
