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

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.state.ESuccess;
import com.helger.security.messagedigest.EMessageDigestAlgorithm;

/**
 * Defines an abstract way to read and write repository items, identified by
 * repository keys. Each storage must be readable, writable is optional.
 *
 * @author Philip Helger
 */
public interface IRepoStorage extends IHasID <String>, IRepoStorageBase
{
  EMessageDigestAlgorithm DEFAULT_MD_ALGORITHM = EMessageDigestAlgorithm.SHA_256;

  /**
   * @return The repository storage type the implementation handles. May not be
   *         <code>null</code>.
   */
  @Nonnull
  RepoStorageType getRepoType ();

  /**
   * @return The ID of the repository storage type the implementation handles.
   *         May neither be <code>null</code> nor empty.
   */
  @Nonnull
  @Nonempty
  default String getRepoTypeID ()
  {
    return getRepoType ().getID ();
  }

  /**
   * Test if the provided repo storage element is present or not.
   *
   * @param aKey
   *        The key to check for existence. May not be <code>null</code>.
   * @return <code>true</code> if it exists, <code>false</code> if not.
   */
  boolean exists (@Nonnull RepoStorageKey aKey);

  /**
   * Read the item identified with the provided key.
   *
   * @param aKey
   *        The key to read. May not be <code>null</code>.
   * @return <code>null</code> if not found
   */
  @Nullable
  RepoStorageItem read (@Nonnull RepoStorageKey aKey);

  /**
   * @return <code>true</code> if this storage can also write.
   */
  boolean canWrite ();

  /**
   * Write the provided item to the repository. This can only be called if
   * {@link #canWrite()} returned <code>true</code>.
   *
   * @param aKey
   *        The key to write. May not be <code>null</code>.
   * @param aItem
   *        The main item to write. May not be <code>null</code>.
   * @return {@link ESuccess}
   */
  @Nonnull
  ESuccess write (@Nonnull RepoStorageKey aKey, @Nonnull RepoStorageItem aItem);

  /**
   * @return <code>true</code> if this storage can also delete objects.
   */
  boolean canDelete ();

  /**
   * Delete the provided item from the repository. This can only be called if
   * {@link #canDelete()} returned <code>true</code>.
   *
   * @param aKey
   *        The key to delete. May not be <code>null</code>.
   * @return {@link ESuccess#SUCCESS} if deletion was successful,
   *         {@link ESuccess#FAILURE} if not.
   */
  @Nonnull
  ESuccess delete (@Nonnull RepoStorageKey aKey);
}
