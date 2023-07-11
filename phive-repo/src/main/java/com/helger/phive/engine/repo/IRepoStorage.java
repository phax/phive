/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.state.ESuccess;
import com.helger.security.messagedigest.EMessageDigestAlgorithm;

/**
 * Defines an abstract way to read and write repository items, identified by
 * repository keys. Each storage must be readable, writable is optional.
 *
 * @author Philip Helger
 */
public interface IRepoStorage
{
  EMessageDigestAlgorithm DEFAULT_MD_ALGORITHM = EMessageDigestAlgorithm.SHA_256;

  /**
   * @return The repository storage type the implementation handles. May not be
   *         <code>null</code>.
   */
  @Nonnull
  RepoStorageType getRepoType ();

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
