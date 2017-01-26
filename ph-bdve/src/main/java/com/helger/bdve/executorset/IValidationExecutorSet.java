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
package com.helger.bdve.executorset;

import java.io.Serializable;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutionManager;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.collection.ext.ICommonsIterable;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasDisplayName;

/**
 * Read-only interface for a named list of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 */
public interface IValidationExecutorSet extends
                                        Serializable,
                                        IHasID <VESID>,
                                        IHasDisplayName,
                                        ICommonsIterable <IValidationExecutor>
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

  @Nonnull
  default ValidationExecutionManager getExecutorManager ()
  {
    return new ValidationExecutionManager (this);
  }
}
