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
import com.helger.phive.api.EExtendedValidity;

/**
 * Generic interface for a decision provider for validation results.
 *
 * @author Philip Helger
 * @since 9.3.0
 */
public interface IValidityDeterminator
{
  /**
   * Get the validity of the provided error list.
   *
   * @param aErrorList
   *        The error list to be evaluated. May not be <code>null</code> but
   *        empty.
   * @return Never <code>null</code>.
   */
  @Nonnull
  EExtendedValidity getValidity (@Nonnull IErrorList aErrorList);

  /**
   * A validity determinator that marks entries with at least one error as
   * INVALID and others as VALID. It contains no uncertainty.
   */
  IValidityDeterminator ONE_ERROR_INVALID = errList -> errList.containsAtLeastOneError () ? EExtendedValidity.INVALID
                                                                                          : EExtendedValidity.VALID;

  /**
   * The default instance. It's {@link #ONE_ERROR_INVALID}
   */
  IValidityDeterminator DEFAULT = ONE_ERROR_INVALID;
}
