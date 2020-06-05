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

import com.helger.bdve.api.result.ValidationResultList;
import com.helger.bdve.api.source.IValidationSource;
import com.helger.commons.state.EValidity;

/**
 * Interface for an execution manager that applies a set of rules onto an object
 * to be validated (validation source).
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
public interface IValidationExecutionManager <SOURCETYPE extends IValidationSource>
{
  /**
   * Perform a validation with all the contained executors and the system
   * default locale.
   *
   * @param aSource
   *        The source artefact to be validated. May not be <code>null</code>.
   *        contained executor a result is added to the result list.
   * @return The validation result list. Never <code>null</code>. For each
   *         contained executor a result is added to the result list.
   * @see #executeValidation(IValidationSource, ValidationResultList, Locale)
   */
  @Nonnull
  default ValidationResultList executeValidation (@Nonnull final SOURCETYPE aSource)
  {
    return executeValidation (aSource, (Locale) null);
  }

  /**
   * Perform a validation with all the contained executors.
   *
   * @param aSource
   *        The source artefact to be validated. May not be <code>null</code>.
   * @param aLocale
   *        Custom locale to use e.g. for error messages. May be
   *        <code>null</code> to use the system default locale.
   * @return The validation result list. Never <code>null</code>. For each
   *         contained executor a result is added to the result list.
   * @see #executeValidation(IValidationSource, ValidationResultList, Locale)
   */
  @Nonnull
  default ValidationResultList executeValidation (@Nonnull final SOURCETYPE aSource, @Nullable final Locale aLocale)
  {
    final ValidationResultList ret = new ValidationResultList ();
    executeValidation (aSource, ret, aLocale);
    return ret;
  }

  /**
   * Perform a validation with all the contained executors.
   *
   * @param aSource
   *        The source artefact to be validated. May not be <code>null</code>.
   * @param aValidationResults
   *        The result list to be filled. May not be <code>null</code>. Note:
   *        this list is NOT altered before start. For each contained executor a
   *        result is added to the result list.
   * @param aLocale
   *        Custom locale to use e.g. for error messages. May be
   *        <code>null</code> to use the system default locale.
   * @see #executeValidation(IValidationSource, Locale)
   */
  void executeValidation (@Nonnull SOURCETYPE aSource, @Nonnull ValidationResultList aValidationResults, @Nullable Locale aLocale);

  /**
   * Perform a fast validation that stops on the first error.
   *
   * @param aSource
   *        The source artefact to be validated. May not be <code>null</code>.
   * @return {@link EValidity#VALID} if the document is valid,
   *         {@link EValidity#INVALID} if the document is invalid. Never
   *         <code>null</code>.
   */
  @Nonnull
  EValidity executeFastValidation (@Nonnull SOURCETYPE aSource);
}
