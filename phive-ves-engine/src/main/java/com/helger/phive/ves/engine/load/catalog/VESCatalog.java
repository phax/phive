/*
 * Copyright (C) 2023-2026 Philip Helger (www.helger.com)
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

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.iface.IHasSize;
import com.helger.base.state.EChange;
import com.helger.base.string.StringHelper;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.CommonsLinkedHashMap;
import com.helger.collection.commons.ICommonsOrderedMap;

/**
 * List of {@link VESCatalogEntry} objects with sanity access methods
 *
 * @author Philip Helger
 */
@NotThreadSafe
public final class VESCatalog implements IHasSize
{
  // Maintain order
  private final ICommonsOrderedMap <String, VESCatalogEntry> m_aEntries = new CommonsLinkedHashMap <> ();

  public VESCatalog ()
  {}

  @NonNull
  public EChange addEntry (@NonNull final VESCatalogEntry aEntry)
  {
    ValueEnforcer.notNull (aEntry, "Entry");

    final String sID = aEntry.getType ().getID () + ":" + aEntry.getID ();
    if (m_aEntries.containsKey (sID))
      return EChange.UNCHANGED;

    m_aEntries.put (sID, aEntry);
    return EChange.CHANGED;
  }

  public int size ()
  {
    return m_aEntries.size ();
  }

  public boolean isEmpty ()
  {
    return m_aEntries.isEmpty ();
  }

  @Nullable
  public VESCatalogEntry findEntryByUri (@Nullable final String sNamespaceURI)
  {
    if (StringHelper.isNotEmpty (sNamespaceURI))
      for (final VESCatalogEntry aEntry : m_aEntries.values ())
        if (aEntry.getType () == EVESCatalogType.PUBLIC)
          if (sNamespaceURI.equals (aEntry.getID ()))
            return aEntry;
    return null;
  }

  @Nullable
  public VESCatalogEntry findEntryBySystemID (@Nullable final String sSystemId)
  {
    if (StringHelper.isNotEmpty (sSystemId))
      for (final VESCatalogEntry aEntry : m_aEntries.values ())
        if (aEntry.getType () == EVESCatalogType.SYSTEM)
          if (sSystemId.equals (aEntry.getID ()))
            return aEntry;
    return null;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Entries", m_aEntries).getToString ();
  }
}
