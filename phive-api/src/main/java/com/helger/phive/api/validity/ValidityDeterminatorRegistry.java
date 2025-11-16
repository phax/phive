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

import org.jspecify.annotations.NonNull;

import com.helger.annotation.concurrent.Immutable;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.diagnostics.error.list.IErrorList;

/**
 * Helper class for validity determination implementations
 *
 * @author Philip Helger
 * @since 10.1.0
 */
@Immutable
public final class ValidityDeterminatorRegistry
{
  private ValidityDeterminatorRegistry ()
  {}

  /**
   * Calculate the validity of an error list like this: if at least one entry of
   * error level "error" or more severe is contained, the overall validity is
   * invalid.
   *
   * @param aErrorList
   *        The error list to scan. May not be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @NonNull
  public static EExtendedValidity getValidityOneErrorInvalid (@NonNull final IErrorList aErrorList)
  {
    ValueEnforcer.notNull (aErrorList, "ErrorList");
    return aErrorList.containsAtLeastOneError () ? EExtendedValidity.INVALID : EExtendedValidity.VALID;
  }
}
