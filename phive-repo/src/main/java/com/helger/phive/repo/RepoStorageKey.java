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
