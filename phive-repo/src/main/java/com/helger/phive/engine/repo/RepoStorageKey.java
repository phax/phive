/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

/**
 * A key that identifies a single item to be exchanged. It is an abstract
 * interpretation of a combination of folder and filename.
 *
 * @author Philip Helger
 */
@Immutable
public final class RepoStorageKey
{
  private final String m_sPath;

  protected RepoStorageKey(@Nonnull @Nonempty final String sPath)
  {
    ValueEnforcer.notEmpty (sPath, "Path");
    ValueEnforcer.isFalse (sPath.startsWith ("/"), "Path should not start with a Slash");
    ValueEnforcer.isFalse (sPath.endsWith ("/"), "Path should not end with a Slash");
    m_sPath = sPath;
  }

  @Nonnull
  @Nonempty
  public String getPath ()
  {
    return m_sPath;
  }

  @Nonnull
  @ReturnsMutableCopy
  public RepoStorageKey getKeyHashSha256 ()
  {
    return new RepoStorageKey (m_sPath + ".sha256");
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final RepoStorageKey rhs = (RepoStorageKey) o;
    return m_sPath.equals (rhs.m_sPath);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_sPath).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Path", m_sPath).getToString ();
  }

  @Nonnull
  public static RepoStorageKey of (@Nonnull @Nonempty final String sPath)
  {
    return new RepoStorageKey (sPath);
  }
}
