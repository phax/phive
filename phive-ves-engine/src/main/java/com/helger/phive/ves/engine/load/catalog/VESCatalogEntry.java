/*
 * Copyright (C) 2023-2025 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.engine.load.catalog;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.string.ToStringGenerator;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;

/**
 * Represent a single XML catalog entry
 *
 * @author Philip Helger
 */
@Immutable
public final class VESCatalogEntry implements IHasID <String>
{
  private final EVESCatalogType m_eType;
  private final String m_sUriOrID;
  private final RepoStorageKeyOfArtefact m_aResourceKey;

  public VESCatalogEntry (@Nonnull final EVESCatalogType eType,
                          @Nonnull @Nonempty final String sUriOrID,
                          @Nonnull final RepoStorageKeyOfArtefact aResourceKey)
  {
    ValueEnforcer.notNull (eType, "Type");
    ValueEnforcer.notEmpty (sUriOrID, "ID");
    ValueEnforcer.notNull (aResourceKey, "Key");
    m_eType = eType;
    m_sUriOrID = sUriOrID;
    m_aResourceKey = aResourceKey;
  }

  /**
   * @return The catalog entry type. Never <code>null</code>.
   */
  @Nonnull
  public EVESCatalogType getType ()
  {
    return m_eType;
  }

  /**
   * @return The catalog ID or URI. Neither <code>null</code> nor empty.
   */
  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sUriOrID;
  }

  /**
   * @return The repository key. Never <code>null</code>.
   */
  @Nonnull
  public RepoStorageKeyOfArtefact getRepoStorageKey ()
  {
    return m_aResourceKey;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Type", m_eType)
                                       .append ("UriOrID", m_sUriOrID)
                                       .append ("ResourceKey", m_aResourceKey)
                                       .getToString ();
  }
}
