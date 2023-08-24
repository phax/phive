/*
 * Copyright (C) 2023 Philip Helger & ecosio
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
package com.helger.phive.repo;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/**
 * Defines an abstract way to read from a chain of repositories.
 *
 * @author Philip Helger
 */
public interface IRepoStorageBase
{
  /**
   * Test if the provided repo storage element is present or not.
   *
   * @param aKey
   *        The key to check for existence. May not be <code>null</code>.
   * @return <code>true</code> if it exists, <code>false</code> if not.
   */
  boolean exists (@Nonnull RepoStorageKey aKey);

  /**
   * Read the provided key from any of the provided repository storages.
   *
   * @param aKey
   *        The key to read. May not be <code>null</code>.
   * @return <code>null</code> if the provided key does not exist.
   */
  @Nullable
  RepoStorageItem read (@Nonnull RepoStorageKey aKey);
}
