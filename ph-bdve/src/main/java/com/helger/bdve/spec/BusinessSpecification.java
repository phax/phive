/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve.spec;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;

/**
 * Standalone implementation of {@link IBusinessSpecification}.
 *
 * @author Philip Helger
 */
@Immutable
public class BusinessSpecification implements IBusinessSpecification
{
  private final String m_sGroupID;
  private final String m_sSpecID;
  private final String m_sID;
  private final String m_sDisplayName;

  public BusinessSpecification (@Nonnull @Nonempty final String sGroupID,
                                @Nonnull @Nonempty final String sSpecID,
                                @Nonnull @Nonempty final String sDisplayName)
  {
    ValueEnforcer.notEmpty (sGroupID, "GroupID");
    ValueEnforcer.notEmpty (sSpecID, "SpecID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    m_sGroupID = sGroupID;
    m_sSpecID = sSpecID;
    m_sID = sGroupID + ":" + sSpecID;
    m_sDisplayName = sDisplayName;
  }

  @Nonnull
  @Nonempty
  public String getGroupID ()
  {
    return m_sGroupID;
  }

  @Nonnull
  @Nonempty
  public String getSpecID ()
  {
    return m_sSpecID;
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

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final BusinessSpecification rhs = (BusinessSpecification) o;
    return m_sID.equals (rhs.m_sID) && m_sDisplayName.equals (rhs.m_sDisplayName);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_sID).append (m_sDisplayName).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("GroupID", m_sGroupID)
                                       .append ("SpecID", m_sSpecID)
                                       .append ("ID", m_sID)
                                       .append ("DisplayName", m_sDisplayName)
                                       .toString ();
  }
}
