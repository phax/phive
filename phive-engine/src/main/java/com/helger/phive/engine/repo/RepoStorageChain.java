/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

/**
 * A chain of {@link IRepoStorage} objects for reading from multiple sources,
 * including local storage.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class RepoStorageChain
{
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageChain.class);
  private final ICommonsList <IRepoStorage> m_aStorages;
  private final ICommonsList <IRepoStorage> m_aWritableStorages;

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
  public RepoStorageChain(@Nonnull final List <? extends IRepoStorage> aStorages,
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
   * Read the provided key from any of the provided repository storages.
   *
   * @param aKey
   *        The key to read. May not be <code>null</code>.
   * @return <code>null</code> if the provided key does not exist.
   */
  @Nullable
  public RepoStorageItem read (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    LOGGER.info ("Trying to read '" + aKey.getPath () + "' from " + m_aStorages.getAllMapped (x -> x.getRepoType ().name ()));

    for (final IRepoStorage aStorage : m_aStorages)
    {
      final RepoStorageItem aItem = aStorage.read (aKey);
      if (aItem != null)
      {
        final String sMsg = "Successfully read '" +
                            aKey.getPath () +
                            "' from " +
                            aStorage.getRepoType ().name () +
                            " with hash state " +
                            aItem.getHashState ().name ();
        if (aItem.getHashState () != EHashState.VERIFIED_MATCHING)
          LOGGER.warn (sMsg);
        else
          LOGGER.info (sMsg);

        if (aStorage.getRepoType ().isRemote ())
        {
          // Item was read from remote
          if (m_aWritableStorages.isNotEmpty ())
          {
            // Store locally
            LOGGER.info ("Storing '" + aKey.getPath () + "' to " + m_aWritableStorages.getAllMapped (x -> x.getRepoType ().name ()));
            for (final IRepoStorage aWritableStorage : m_aWritableStorages)
              aWritableStorage.write (aKey, aItem);
          }
        }
        return aItem;
      }
    }
    return null;
  }

  @Nonnull
  @ReturnsMutableObject
  public static RepoStorageChain of (@Nonnull @Nonempty final IRepoStorage... aStorages)
  {
    final ICommonsList <IRepoStorage> aList = new CommonsArrayList <> (aStorages);
    final IRepoStorage aFirstWritablePersistentStorage = aList.findFirst (x -> x.getRepoType ().isPersistent () && x.canWrite ());
    return of (aList, aFirstWritablePersistentStorage == null ? null : new CommonsArrayList <> (aFirstWritablePersistentStorage));
  }

  @Nonnull
  @ReturnsMutableObject
  public static RepoStorageChain of (@Nonnull @Nonempty final ICommonsList <? extends IRepoStorage> aStorages,
                                     @Nullable final ICommonsList <? extends IRepoStorage> aWritableStorages)
  {
    return new RepoStorageChain (aStorages, aWritableStorages);
  }
}
