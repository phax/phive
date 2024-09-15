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
package com.helger.phive.api.validity;

import javax.annotation.Nonnull;

import com.helger.commons.error.list.IErrorList;
import com.helger.commons.lang.GenericReflection;
import com.helger.phive.api.execute.IValidationExecutor;
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
   *        the respective validation type. Never <code>null</code>.
   * @param aErrorList
   *        The error list to be evaluated. May not be <code>null</code> but
   *        empty.
   * @return Never <code>null</code>.
   */
  @Nonnull
  EExtendedValidity getValidity (@Nonnull IValidationExecutor <SOURCETYPE> aExecutor, @Nonnull IErrorList aErrorList);

  /**
   * A validity determinator that marks entries with at least one error as
   * INVALID and others as VALID. It contains no uncertainty.
   */
  IValidityDeterminator <IValidationSource> ONE_ERROR_INVALID = (ex, errList) -> errList.containsAtLeastOneError ()
                                                                                                                    ? EExtendedValidity.INVALID
                                                                                                                    : EExtendedValidity.VALID;

  /**
   * @return The default instance. It's {@link #ONE_ERROR_INVALID}.
   */
  @Nonnull
  static <ST extends IValidationSource> IValidityDeterminator <ST> getDefault ()
  {
    return GenericReflection.uncheckedCast (ONE_ERROR_INVALID);
  }
}
