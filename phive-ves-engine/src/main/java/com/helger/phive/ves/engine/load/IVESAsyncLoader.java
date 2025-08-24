/*
 * Copyright (C) 2023-2025 Philip Helger (www.helger.com)
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

import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.repo.IRepoStorageReadItem;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;

/**
 * Interface for an asynchronous on-demand loader for resources.
 *
 * @author Philip Helger
 */
public interface IVESAsyncLoader
{
  /**
   * Load the resource with the provided VESID.
   *
   * @param aVESID
   *        The VESID to load. May not be <code>null</code>.
   * @param sFileExt
   *        The file extension to load. Must neither be <code>null</code> nor
   *        empty. Must start with a dot (<code>.</code>).
   * @return <code>null</code> if loading the resource behind the VESID failed
   *         (e.g. because no such resource exists).
   */
  @Nullable
  IRepoStorageReadItem loadResource (@Nonnull DVRCoordinate aVESID, @Nonnull String sFileExt);
}
