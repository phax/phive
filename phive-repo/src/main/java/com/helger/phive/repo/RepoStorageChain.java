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

import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;

/**
 * A chain of {@link IRepoStorage} objects for reading from multiple sources,
 * including local storage.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class RepoStorageChain implements IRepoStorageChain
{
  public static final boolean DEFAULT_CACHE_REMOTE_CONTENT = true;
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageChain.class);

  private final ICommonsList <IRepoStorage> m_aStorages;
  private final ICommonsList <IRepoStorage> m_aWritableStorages;
  private boolean m_bCacheRemoteContent = DEFAULT_CACHE_REMOTE_CONTENT;

  /**
   * Constructor. The order of storages is maintained.
   *
   * @param aStorages
   *        The storages to be considered. May neither be <code>null</code> nor
   *        empty.
   * @param aWritableStorages
   *        The list of writable storages to save remote read artifacts to. May
   *        be <code>null</code>. If this list is <code>null</code> or empty, an
   *        eventually received artefact from a remote storage is not saved
   *        locally.
   */
  public RepoStorageChain (@Nonnull final List <? extends IRepoStorage> aStorages,
                           @Nullable final List <? extends IRepoStorage> aWritableStorages)
  {
    ValueEnforcer.notEmptyNoNullValue (aStorages, "Storages");
    if (aWritableStorages != null)
    {
      ValueEnforcer.noNullValue (aWritableStorages, "WritablePersistentStorages");
      for (final IRepoStorage aStorage : aWritableStorages)
        ValueEnforcer.isTrue (aStorage.canWrite (), "Writable storage must be writable");
    }
    m_aStorages = new CommonsArrayList <> (aStorages);
    m_aWritableStorages = new CommonsArrayList <> (aWritableStorages);
  }

  @Nonnull
  @Nonempty
  public final ICommonsList <IRepoStorage> internalGetStorages ()
  {
    return m_aStorages.getClone ();
  }

  @Nonnull
  public final ICommonsList <IRepoStorage> internalGetWritableStorages ()
  {
    return m_aWritableStorages.getClone ();
  }

  /**
   * @return <code>true</code> of remote content that was read, should be
   *         written to a persistent local repository for faster access next
   *         time.
   */
  public boolean isCacheRemoteContent ()
  {
    return m_bCacheRemoteContent;
  }

  @Nonnull
  public RepoStorageChain setCacheRemoteContent (final boolean bCacheRemoteContent)
  {
    m_bCacheRemoteContent = bCacheRemoteContent;
    return this;
  }

  public boolean exists (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    LOGGER.info ("Checking for existence of '" +
                 aKey.getPath () +
                 "' in " +
                 m_aStorages.getAllMapped (x -> x.getRepoType ().getID ()));

    for (final IRepoStorage aStorage : m_aStorages)
    {
      // Try to read item
      if (aStorage.exists (aKey))
      {
        LOGGER.debug ("Found '" +
                      aKey.getPath () +
                      "' in storage " +
                      aStorage.getID () +
                      " of type " +
                      aStorage.getRepoType ().getID ());
        return true;
      }
    }

    LOGGER.debug ("Failed to find '" + aKey.getPath () + "' in any of the contained storages");
    return false;
  }

  @Nullable
  public RepoStorageItem read (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    LOGGER.info ("Trying to read '" +
                 aKey.getPath () +
                 "' from " +
                 m_aStorages.getAllMapped (x -> x.getRepoType ().getID ()));

    for (final IRepoStorage aStorage : m_aStorages)
    {
      // Try to read item
      final RepoStorageItem aItem = aStorage.read (aKey);
      if (aItem != null)
      {
        final String sMsg = "Successfully read '" +
                            aKey.getPath () +
                            "' from " +
                            aStorage.getRepoType ().getID () +
                            " with hash state '" +
                            aItem.getHashState ().getDisplayName () +
                            "'";
        if (aItem.getHashState () != ERepoHashState.VERIFIED_MATCHING)
          LOGGER.warn (sMsg);
        else
          LOGGER.info (sMsg);

        if (aStorage.getRepoType ().isRemote () && m_bCacheRemoteContent)
        {
          // Item was read from remote
          if (m_aWritableStorages.isNotEmpty ())
          {
            // Store locally
            LOGGER.info ("Storing '" +
                         aKey.getPath () +
                         "' to " +
                         m_aWritableStorages.getAllMapped (x -> x.getRepoType ().getID ()));
            for (final IRepoStorage aWritableStorage : m_aWritableStorages)
              aWritableStorage.write (aKey, aItem);
          }
        }
        return aItem;
      }
      // else try reading from next repo
    }
    // Not found in any storeage
    return null;
  }

  @Nonnull
  @ReturnsMutableObject
  public static RepoStorageChain of (@Nonnull @Nonempty final IRepoStorage... aStorages)
  {
    ValueEnforcer.notNullNoNullValue (aStorages, "Storages");

    final ICommonsList <IRepoStorage> aAll = new CommonsArrayList <> (aStorages);
    final ICommonsList <IRepoStorage> aWritableOnes = aAll.getAll (x -> x.getRepoType ().isPersistent () &&
                                                                        x.canWrite ());
    return of (aAll, aWritableOnes);
  }

  @Nonnull
  @ReturnsMutableObject
  public static RepoStorageChain of (@Nonnull @Nonempty final ICommonsList <? extends IRepoStorage> aStorages,
                                     @Nullable final ICommonsList <? extends IRepoStorage> aWritableStorages)
  {
    ValueEnforcer.notNullNoNullValue (aStorages, "Storages");

    return new RepoStorageChain (aStorages, aWritableStorages);
  }
}
