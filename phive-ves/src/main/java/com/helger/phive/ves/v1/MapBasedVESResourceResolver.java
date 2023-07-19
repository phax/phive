/*
 * Copyright (C) 2014-2023 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.v1;

import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.lang.ICloneable;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * A simple implementation of {@link IVESResourceResolver} based on an in-memory
 * map.
 *
 * @author Philip Helger
 */
@NotThreadSafe
@Deprecated (forRemoval = true, since = "9.0.0")
public class MapBasedVESResourceResolver implements IVESResourceResolver, ICloneable <MapBasedVESResourceResolver>
{
  private final ICommonsMap <String, IReadableResource> m_aMap = new CommonsHashMap <> ();

  /**
   * Default constructor without any mapping.
   */
  public MapBasedVESResourceResolver ()
  {}

  /**
   * Constructor using existing mappings from the provided map.
   *
   * @param aMap
   *        The map to be used as the basis. May be <code>null</code>.
   */
  public MapBasedVESResourceResolver (@Nullable final Map <String, ? extends IReadableResource> aMap)
  {
    if (aMap != null)
      m_aMap.putAll (aMap);
  }

  @Nullable
  public IReadableResource getResourceOfID (@Nullable final String sID)
  {
    if (StringHelper.hasNoText (sID))
      return null;
    return m_aMap.get (sID);
  }

  private void _addMapping (@Nonnull @Nonempty final String sID,
                            @Nonnull final IReadableResource aRes,
                            final boolean bAllowOverride)
  {
    ValueEnforcer.notEmpty (sID, "ID");
    ValueEnforcer.notNull (aRes, "Resource");
    if (bAllowOverride)
      m_aMap.put (sID, aRes);
    else
    {
      if (m_aMap.containsKey (sID))
        throw new IllegalStateException ("Another mapping for ID '" + sID + "' is already present");
      m_aMap.put (sID, aRes);
    }
  }

  @Nonnull
  public final MapBasedVESResourceResolver addMapping (@Nonnull @Nonempty final String sID,
                                                       @Nonnull final IReadableResource aRes)
  {
    _addMapping (sID, aRes, false);
    return this;
  }

  @Nonnull
  public final MapBasedVESResourceResolver setMapping (@Nonnull @Nonempty final String sID,
                                                       @Nonnull final IReadableResource aRes)
  {
    _addMapping (sID, aRes, true);
    return this;
  }

  /**
   * @return A copy of the contained map with all mappings. Never
   *         <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  public final ICommonsMap <String, IReadableResource> getAllMappings ()
  {
    return m_aMap.getClone ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final MapBasedVESResourceResolver rhs = (MapBasedVESResourceResolver) o;
    return m_aMap.equals (rhs.m_aMap);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aMap).getHashCode ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public MapBasedVESResourceResolver getClone ()
  {
    return new MapBasedVESResourceResolver (m_aMap);
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Map", m_aMap).getToString ();
  }
}
