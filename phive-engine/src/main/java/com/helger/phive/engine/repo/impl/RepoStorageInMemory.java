/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.impl.CommonsLinkedHashMap;
import com.helger.commons.collection.impl.ICommonsOrderedMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.io.stream.NonBlockingByteArrayInputStream;
import com.helger.commons.state.ESuccess;
import com.helger.phive.engine.repo.RepoStorageType;
import com.helger.phive.engine.repo.RepoStorageKey;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
public class RepoStorageInMemory extends AbstractRepoStorage
{
  public static final class MaxSizeMap extends CommonsLinkedHashMap <String, byte []>
  {
    private final int m_nMaxSize;

    public MaxSizeMap (@Nonnegative final int nMaxSize)
    {
      m_nMaxSize = nMaxSize;
    }

    @Override
    protected boolean removeEldestEntry (final java.util.Map.Entry <String, byte []> eldest)
    {
      return size () > m_nMaxSize;
    }
  }

  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageInMemory.class);

  private final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  private final ICommonsOrderedMap <String, byte []> m_aCache;

  public RepoStorageInMemory()
  {
    this (1_000);
  }

  public RepoStorageInMemory(@Nonnegative final int nMaxSize)
  {
    super (RepoStorageType.IN_MEMORY);
    ValueEnforcer.isGT0 (nMaxSize, "Max size must be > 0");
    m_aCache = new MaxSizeMap (nMaxSize);
  }

  @Override
  @Nullable
  protected InputStream getInputStream (@Nonnull final RepoStorageKey aKey)
  {
    final String sRealKey = aKey.getPath ();
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Reading from in-memory '" + sRealKey + "'");

    final byte [] aData = m_aRWLock.readLockedGet ( () -> m_aCache.get (sRealKey));
    if (aData == null)
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to read from in-memory '" + sRealKey + "'");
      return null;
    }

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Found in-memory '" + sRealKey + "'");
    return new NonBlockingByteArrayInputStream (aData);
  }

  public boolean canWrite ()
  {
    return true;
  }

  @Override
  @Nonnull
  protected ESuccess putObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    final String sRealKey = aKey.getPath ();

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Writing to in-memory '" + sRealKey + "'");

    // Use the source payload
    m_aRWLock.writeLocked ( () -> m_aCache.put (sRealKey, aPayload));

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Successfully wrote to in-memory '" + sRealKey + "'");
    return ESuccess.SUCCESS;
  }

  @Nonnull
  public ESuccess delete (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    final String sRealKey = aKey.getPath ();
    LOGGER.info ("Deleting from in-memory '" + sRealKey + "'");

    final boolean bDeleted = m_aRWLock.writeLockedBoolean ( () -> m_aCache.remove (sRealKey) != null);
    if (bDeleted)
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to delete in-memory object '" + sRealKey + "'");
      return ESuccess.FAILURE;
    }

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Successfully deleted in-memory object '" + sRealKey + "'");
    return ESuccess.SUCCESS;
  }
}
