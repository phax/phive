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
package com.helger.phive.api.execute;

import jakarta.annotation.Nonnull;

/**
 * Interface for validation executors that support caching. Each implementation
 * of IValidationExecutor is free to also implement this interface.
 *
 * @author Philip Helger
 * @since 3.1.1
 */
public interface IValidationExecutorCacheSupport
{
  /** By default caching should be enabled. */
  boolean DEFAULT_CACHE = true;

  /**
   * @return <code>true</code> if caching is enabled, <code>false</code> if not.
   */
  boolean isCacheArtefact ();

  /**
   * Enable or disable caching.
   *
   * @param bCacheArtefact
   *        <code>true</code> to enable caching, <code>false</code> to disable
   *        it.
   * @return this for chaining
   */
  @Nonnull
  IValidationExecutorCacheSupport setCacheArtefact (boolean bCacheArtefact);

  /**
   * If caching of this artefact is enabled, ensure it is in the cache.
   *
   * @since 7.1.1
   */
  void ensureItemIsInCache ();
}
