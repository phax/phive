/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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
package com.helger.phive.api.validity;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.error.list.IErrorList;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.source.IValidationSource;

/**
 * Generic interface for a decision provider for validation results.
 *
 * @author Philip Helger
 * @since 10.0.0
 * @param <SOURCETYPE>
 *        The validation source type to use.
 */
public interface IValidityDeterminator <SOURCETYPE extends IValidationSource>
{
  /**
   * Get the validity of the provided error list.
   *
   * @param aExecutor
   *        The validation executor for which the validity state should be
   *        determined. This gives access to the underlying rule resource and
   *        the respective validation type. May be <code>null</code>.
   * @param aErrorList
   *        The error list to be evaluated. May not be <code>null</code> but
   *        empty.
   * @return Never <code>null</code>.
   */
  @Nonnull
  EExtendedValidity getValidity (@Nullable IValidationExecutor <SOURCETYPE> aExecutor, @Nonnull IErrorList aErrorList);

  /**
   * @return A validity determinator that marks entries with at least one error
   *         as INVALID and others as VALID. It contains no uncertainty.
   * @see ValidityDeterminatorRegistry#getValidityOneErrorInvalid(IErrorList)
   */
  static <ST extends IValidationSource> IValidityDeterminator <ST> createCertainOneErrorInvalid ()
  {
    return (vex, errList) -> ValidityDeterminatorRegistry.getValidityOneErrorInvalid (errList);
  }

  /**
   * @return The default determinator. It's
   *         {@link #createCertainOneErrorInvalid()}
   */
  @Nonnull
  static <ST extends IValidationSource> IValidityDeterminator <ST> createDefault ()
  {
    return createCertainOneErrorInvalid ();
  }
}
