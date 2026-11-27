/*
 * Copyright (C) 2023-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.engine.load;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.diagnostics.error.list.ErrorList;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.source.IValidationSource;

/**
 * Resolve a <code>requires</code> or <code>partialRequires</code> of a VES that is not contained in
 * the repository to an {@link IValidationExecutorSet} supplied by the caller, e.g. a rule set that
 * is built in Java. It is only called, if the repository contains no VES for the required VESID.
 * The executors of the returned set are used as they are, except that they are cloned if the
 * requirement customises the output (custom error levels for Schematron executors) or if it stops
 * on error.
 *
 * @author Philip Helger
 * @since 12.4.0
 */
@FunctionalInterface
public interface IVESRequirementResolver
{
  /**
   * Resolve the required VES.
   *
   * @param aRequiredVES
   *        The requirement to resolve. The VESID may contain a pseudo version, that could not be
   *        resolved in the repository. Never <code>null</code>.
   * @param aErrorList
   *        The error list to add errors to. Never <code>null</code>.
   * @return The executor set to use for the requirement or <code>null</code> if the requirement
   *         cannot be resolved. All executors of a set used in a <code>partialRequires</code> must
   *         be XML based.
   */
  @Nullable
  IValidationExecutorSet <? extends IValidationSource> resolveRequirement (LoadedVES.@NonNull RequiredVES aRequiredVES,
                                                                           @NonNull ErrorList aErrorList);
}
