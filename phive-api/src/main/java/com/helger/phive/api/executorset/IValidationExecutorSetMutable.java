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
package com.helger.phive.api.executorset;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.misc.ChangeNextMajorRelease;
import com.helger.base.state.EChange;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.source.IValidationSource;

/**
 * Define a common interface for {@link IValidationExecutorSet} with modifying
 * methods.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 * @since 10.1.0
 */
public interface IValidationExecutorSetMutable <SOURCETYPE extends IValidationSource> extends
                                               IValidationExecutorSet <SOURCETYPE>
{
  /**
   * Add a single executor.
   *
   * @param aExecutor
   *        The executor to be added. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  IValidationExecutorSetMutable <SOURCETYPE> addExecutor (@NonNull IValidationExecutor <SOURCETYPE> aExecutor);

  /**
   * Set the cache status to all contained validation executors, that implement
   * the <code>IValidationExecutorCacheSupport</code> interface.
   *
   * @param bCache
   *        <code>true</code> to enable caching, <code>false</code> to disable
   *        it.
   */
  @ChangeNextMajorRelease ("Change return type to this type")
  void setValidationExecutorDoCache (boolean bCache);

  /**
   * As some {@link IValidationExecutor} instances may contain a hard reference
   * to a {@link ClassLoader} this methods removes all executors and allows for
   * them to be garbage collected.<br>
   * New executors may be added afterwards but this method is mainly meant for
   * safe cleanup.
   *
   * @return {@link EChange}
   */
  @NonNull
  EChange removeAllExecutors ();
}
