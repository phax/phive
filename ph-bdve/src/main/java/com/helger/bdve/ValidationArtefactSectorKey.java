/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.bdve;

import java.io.Serializable;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.MustImplementComparable;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasDisplayName;
import com.helger.commons.string.ToStringGenerator;

/**
 * A key defining a sector extension to be used in a {@link ValidationArtefactKey}. It
 * consists of an ID and a display name.
 *
 * @author Philip Helger
 */
@Immutable
@MustImplementComparable
@MustImplementEqualsAndHashcode
public class ValidationArtefactSectorKey implements
                                 IHasID <String>,
                                 IHasDisplayName,
                                 Serializable,
                                 Comparable <ValidationArtefactSectorKey>
{
  private final String m_sID;
  private final String m_sDisplayName;

  public ValidationArtefactSectorKey (@Nonnull @Nonempty final String sID, @Nonnull @Nonempty final String sDisplayName)
  {
    m_sID = ValueEnforcer.notEmpty (sID, "ID");
    m_sDisplayName = ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  @Nonempty
  public String getDisplayName ()
  {
    return m_sDisplayName;
  }

  public int compareTo (@Nonnull final ValidationArtefactSectorKey aOther)
  {
    return m_sID.compareTo (aOther.m_sID);
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationArtefactSectorKey rhs = (ValidationArtefactSectorKey) o;
    return m_sID.equals (rhs.m_sID);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_sID).getHashCode ();
  }

  @Override
  @Nonnull
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ID", m_sID).append ("DisplayName", m_sDisplayName).toString ();
  }
}
