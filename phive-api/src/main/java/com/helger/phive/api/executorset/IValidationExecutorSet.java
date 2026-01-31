/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.api.executorset;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.annotation.style.ReturnsMutableObject;
import com.helger.base.id.IHasID;
import com.helger.base.name.IHasDisplayName;
import com.helger.collection.commons.ICommonsIterable;
import com.helger.collection.commons.ICommonsList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;

/**
 * Read-only interface for a named list of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
public interface IValidationExecutorSet <SOURCETYPE extends IValidationSource> extends
                                        IHasID <DVRCoordinate>,
                                        IHasDisplayName,
                                        ICommonsIterable <IValidationExecutor <SOURCETYPE>>
{
  /**
   * @return A list with all validation executors. Never <code>null</code> but
   *         maybe empty.
   */
  @NonNull
  @ReturnsMutableObject
  ICommonsList <IValidationExecutor <SOURCETYPE>> executors ();

  /**
   * @return A list with all validation executors. Never <code>null</code> but
   *         maybe empty.
   */
  @NonNull
  @ReturnsMutableCopy
  ICommonsList <IValidationExecutor <SOURCETYPE>> getAllExecutors ();

  /**
   * @return The VES status. Never <code>null</code>.
   */
  @NonNull
  IValidationExecutorSetStatus getStatus ();
}
