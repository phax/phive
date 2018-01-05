/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.executorset;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutionManager;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.ICommonsIterable;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasDisplayName;

/**
 * Read-only interface for a named list of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 */
public interface IValidationExecutorSet extends IHasID <VESID>, IHasDisplayName, ICommonsIterable <IValidationExecutor>
{
  /**
   * @return The main validation artefact key assigned to this VES
   */
  @Nonnull
  ValidationArtefactKey getValidationArtefactKey ();

  /**
   * @return The number of contained validation executors. Always &ge; 0.
   */
  @Nonnegative
  int getExecutorCount ();

  /**
   * @return A list with all validation executors. Never <code>null</code> but
   *         maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  ICommonsList <IValidationExecutor> getAllExecutors ();

  /**
   * @return A new {@link ValidationExecutionManager} for this validation
   *         executor set.
   */
  @Nonnull
  default ValidationExecutionManager createExecutionManager ()
  {
    return new ValidationExecutionManager (this);
  }

  /**
   * @return <code>true</code> if this document is deprecated (phased-out or end
   *         of life)?
   */
  boolean isDeprecated ();
}
