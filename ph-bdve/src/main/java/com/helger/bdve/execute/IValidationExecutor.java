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
package com.helger.bdve.execute;

import java.io.Serializable;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.result.ValidationResult;
import com.helger.bdve.source.IValidationSource;

/**
 * Base interface for performing validation of a single XML document based on
 * the rules of a single validation artefact.
 *
 * @author Philip Helger
 */
public interface IValidationExecutor extends Serializable
{
  /**
   * @return The validation artefact used to validate the XML instances. Never
   *         <code>null</code>.
   */
  @Nonnull
  IValidationArtefact getValidationArtefact ();

  /**
   * @return The type of validation performed by this executor. Never
   *         <code>null</code>.
   */
  @Nonnull
  default EValidationType getValidationType ()
  {
    return getValidationArtefact ().getValidationArtefactType ();
  }

  /**
   * Perform validation
   *
   * @param aSource
   *        Source to be validated. May not be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull final IValidationSource aSource)
  {
    return applyValidation (aSource, (ClassLoader) null);
  }

  /**
   * Perform validation
   *
   * @param aSource
   *        Source to be validated. May not be <code>null</code>.
   * @param aClassLoader
   *        Optional class loader to use. May be <code>null</code> to use the
   *        default context class loader.
   * @return Never <code>null</code>.
   */
  @Nonnull
  ValidationResult applyValidation (@Nonnull IValidationSource aSource, @Nullable ClassLoader aClassLoader);
}
