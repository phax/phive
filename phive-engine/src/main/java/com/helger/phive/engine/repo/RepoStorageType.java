/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.id.IHasID;
import com.helger.commons.string.ToStringGenerator;

/**
 * Defines a single repository storage type.
 *
 * @author Philip Helger
 */
@Immutable
public final class RepoStorageType implements IHasID <String>
{
  public static final RepoStorageType IN_MEMORY = new RepoStorageType ("inmemory", false, false);
  public static final RepoStorageType LOCAL_FILE_SYSTEM = new RepoStorageType ("localfs", true, false);
  public static final RepoStorageType HTTP = new RepoStorageType ("http", true, true);

  private final String m_sID;
  private final boolean m_bPersistent;
  private final boolean m_bRemote;

  public RepoStorageType (@Nonnull @Nonempty final String sID, final boolean bPersistent, final boolean bRemote)
  {
    ValueEnforcer.notEmpty (sID, "ID");

    m_sID = sID;
    m_bPersistent = bPersistent;
    m_bRemote = bRemote;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  public boolean isPersistent ()
  {
    return m_bPersistent;
  }

  public boolean isRemote ()
  {
    return m_bRemote;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final RepoStorageType rhs = (RepoStorageType) o;
    return m_sID.equals (rhs.m_sID);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_sID).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ID", m_sID)
                                       .append ("Persistent", m_bPersistent)
                                       .append ("Remote", m_bRemote)
                                       .getToString ();
  }
}
