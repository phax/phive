/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import java.io.InputStream;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.impl.CommonsLinkedHashMap;
import com.helger.commons.collection.impl.ICommonsOrderedMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.io.stream.NonBlockingByteArrayInputStream;
import com.helger.commons.state.ESuccess;
import com.helger.phive.engine.repo.ERepoDeletable;
import com.helger.phive.engine.repo.ERepoWritable;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.RepoStorageType;

@ThreadSafe
public class RepoStorageInMemory extends AbstractRepoStorage <RepoStorageInMemory>
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

  public static final int DEFAULT_MAX_SIZE = 1_000;
  public static final ERepoWritable DEFAULT_CAN_WRITE = ERepoWritable.WITH_WRITE;
  public static final ERepoDeletable DEFAULT_CAN_DELETE = ERepoDeletable.WITH_DELETE;
  public static final boolean DEFAULT_ALLOW_OVERWRITE = true;
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageInMemory.class);

  private final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  private final ICommonsOrderedMap <String, byte []> m_aCache;
  private final boolean m_bAllowOverwrite;

  public RepoStorageInMemory (@Nonnegative final int nMaxSize,
                              @Nonnull final ERepoWritable eWriteEnabled,
                              @Nonnull final ERepoDeletable eDeleteEnabled,
                              final boolean bAllowOverwrite)
  {
    super (RepoStorageType.IN_MEMORY, eWriteEnabled, eDeleteEnabled);
    ValueEnforcer.isGT0 (nMaxSize, "Max size must be > 0");
    m_aCache = new MaxSizeMap (nMaxSize);
    m_bAllowOverwrite = bAllowOverwrite;
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

  public final boolean isAllowOverwrite ()
  {
    return m_bAllowOverwrite;
  }

  @Nonnull
  private ESuccess _write (@Nonnull final RepoStorageKey aKey,
                           @Nonnull final byte [] aPayload,
                           final boolean bAllowOverwrite)
  {
    final String sRealKey = aKey.getPath ();

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Writing to in-memory '" + sRealKey + "'");

    final ESuccess eSuccess;
    if (bAllowOverwrite)
    {
      // Just overwrite
      // Use the source payload
      m_aRWLock.writeLocked ( () -> m_aCache.put (sRealKey, aPayload));
      eSuccess = ESuccess.SUCCESS;
    }
    else
    {
      // Don't overwrite
      m_aRWLock.writeLock ().lock ();
      try
      {
        if (m_aCache.containsKey (sRealKey))
          eSuccess = ESuccess.FAILURE;
        else
        {
          // Use the source payload
          m_aCache.put (sRealKey, aPayload);
          eSuccess = ESuccess.SUCCESS;
        }
      }
      finally
      {
        m_aRWLock.writeLock ().unlock ();
      }
    }

    if (eSuccess.isSuccess ())
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Successfully wrote to in-memory '" + sRealKey + "'");
    }
    else
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to overwritew in-memory item '" + sRealKey + "'");
    }
    return eSuccess;
  }

  @Override
  @Nonnull
  protected ESuccess writeObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    return _write (aKey, aPayload, m_bAllowOverwrite);
  }

  /**
   * This method is intended to be used to fill a {@link RepoStorageInMemory}
   * from the outside, when it is marked as read-only.
   *
   * @param aKey
   *        The key to register.
   * @param aPayload
   *        The payload to be accessible.
   * @return this for chaining
   */
  @Nonnull
  public RepoStorageInMemory registerObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    ValueEnforcer.notNull (aKey, "Key");
    ValueEnforcer.notNull (aPayload, "Payload");

    // Never allow overwrite
    _write (aKey, aPayload, false);
    return this;
  }

  @Override
  @Nonnull
  protected ESuccess deleteObject (@Nonnull final RepoStorageKey aKey)
  {
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

  /**
   * @return A writable and deletable {@link RepoStorageInMemory} with a maximum
   *         of 1000 entries. Never <code>null</code>.
   * @see #DEFAULT_MAX_SIZE
   * @see #DEFAULT_CAN_WRITE
   * @see #DEFAULT_CAN_DELETE
   * @see #DEFAULT_ALLOW_OVERWRITE
   */
  @Nonnull
  public static RepoStorageInMemory createDefault ()
  {
    return createDefault (DEFAULT_CAN_WRITE, DEFAULT_CAN_DELETE);
  }

  /**
   * @return A writable and deletable {@link RepoStorageInMemory} with a maximum
   *         of 1000 entries. Never <code>null</code>.
   * @param eWriteEnabled
   *        Write enabled?
   * @param eDeleteEnabled
   *        Delete enabled?
   * @see #DEFAULT_MAX_SIZE
   * @see #DEFAULT_ALLOW_OVERWRITE
   */
  @Nonnull
  public static RepoStorageInMemory createDefault (@Nonnull final ERepoWritable eWriteEnabled,
                                                   @Nonnull final ERepoDeletable eDeleteEnabled)
  {
    return new RepoStorageInMemory (DEFAULT_MAX_SIZE, eWriteEnabled, eDeleteEnabled, DEFAULT_ALLOW_OVERWRITE);
  }
}
