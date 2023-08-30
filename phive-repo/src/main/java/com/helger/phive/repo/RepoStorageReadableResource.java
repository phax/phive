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

import java.io.File;
import java.io.InputStream;
import java.net.URL;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.UnsupportedOperation;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;

/**
 * Implementation of {@link IReadableResource} for {@link RepoStorageKey} and
 * {@link RepoStorageItem}.,
 *
 * @author Philip Helger
 */
public class RepoStorageReadableResource implements IReadableResource
{
  private final RepoStorageKey m_aKey;
  private final RepoStorageItem m_aItem;

  public RepoStorageReadableResource (@Nonnull final RepoStorageKey aKey, @Nonnull final RepoStorageItem aItem)
  {
    ValueEnforcer.notNull (aKey, "Key");
    ValueEnforcer.notNull (aItem, "Item");
    m_aKey = aKey;
    m_aItem = aItem;
  }

  @Nonnull
  public final RepoStorageKey getRepoStorageKey ()
  {
    return m_aKey;
  }

  @Nonnull
  public final RepoStorageItem getRepoStorageItem ()
  {
    return m_aItem;
  }

  @Nonnull
  public InputStream getInputStream ()
  {
    return m_aItem.data ().getBufferedInputStream ();
  }

  public boolean isReadMultiple ()
  {
    return true;
  }

  @Nonnull
  @Nonempty
  public String getResourceID ()
  {
    return getPath ();
  }

  @Nonnull
  @Nonempty
  public String getPath ()
  {
    return m_aKey.getPath ();
  }

  public boolean exists ()
  {
    return true;
  }

  @Nullable
  public URL getAsURL ()
  {
    // Not applicable atm
    return null;
  }

  @Nullable
  public File getAsFile ()
  {
    // Not applicable atm
    return null;
  }

  @UnsupportedOperation
  public IReadableResource getReadableCloneForPath (final String sPath)
  {
    throw new UnsupportedOperationException ("Clone not supported");
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Key", m_aKey).append ("Item", m_aItem).getToString ();
  }
}
