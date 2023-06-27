/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import com.helger.commons.state.ESuccess;
import com.helger.security.messagedigest.EMessageDigestAlgorithm;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

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
  ERepoStorageType getRepoType ();

  default boolean exists(@Nonnull RepoStorageKey aKey)
  {
    return read (aKey) != null; //read != null inefficient!!
  }

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
}
