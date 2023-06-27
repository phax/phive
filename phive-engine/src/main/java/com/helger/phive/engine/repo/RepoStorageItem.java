/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.io.ByteArrayWrapper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.commons.type.ObjectType;

import java.nio.charset.Charset;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

/**
 * This is an abstract representation of a file retrieved from a repository. It
 * contains the data, the MIME-Type and a hashing status. It does not contain
 * information of a folder or filename - that may be taken from
 * {@link RepoStorageKey}.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public final class RepoStorageItem
{
  public static final ObjectType OT_REPO_STORAGE_ITEM = new ObjectType ("repo.storage.item");

  private final ByteArrayWrapper m_aData;
  private final EHashState m_eHashState;

  private RepoStorageItem(@Nonnull final ByteArrayWrapper aData, @Nonnull final EHashState eHashState)
  {
    m_aData = aData;
    m_eHashState = eHashState;
  }

  @Nonnull
  @ReturnsMutableObject
  public ByteArrayWrapper data ()
  {
    return m_aData;
  }

  @Nonnull
  public String getDataAsString (@Nonnull final Charset aCharset)
  {
    return new String (m_aData.bytes (), aCharset);
  }

  @Nonnull
  public EHashState getHashState ()
  {
    return m_eHashState;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Data", m_aData).append ("HashState", m_eHashState).getToString ();
  }

  /**
   * Create a new item, that does not copy the byte array for performance
   * reasons.
   *
   * @param aData
   *        The data to be wrapped.
   * @param eHashState
   *        The hashing state. May not be <code>null</code>.
   * @return A new item and never <code>null</code>.
   */
  @Nullable
  public static RepoStorageItem of (@Nullable final byte [] aData, @Nonnull final EHashState eHashState)
  {
    ValueEnforcer.notNull (aData, "Data");
    ValueEnforcer.notNull (eHashState, "HashState");
    return new RepoStorageItem (new ByteArrayWrapper (aData, false), eHashState);
  }

  /**
   * Create a new item, that does not copy the byte array for performance
   * reasons.
   *
   * @param aData
   *        The data to be wrapped.
   * @return A new item and never <code>null</code>.
   */
  @Nullable
  public static RepoStorageItem of (@Nullable final byte [] aData)
  {
    return of (aData, EHashState.NOT_VERIFIED);
  }
}
