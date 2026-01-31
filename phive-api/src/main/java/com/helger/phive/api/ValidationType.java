/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.api;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonempty;
import com.helger.annotation.concurrent.Immutable;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.hashcode.HashCodeGenerator;
import com.helger.base.tostring.ToStringGenerator;

/**
 * The default implementation of custom {@link IValidationType}.
 *
 * @author Philip Helger
 * @since 7.1.0
 */
@Immutable
public class ValidationType implements IValidationType
{
  private final String m_sID;
  private final EValidationBaseType m_eBaseType;
  private final String m_sName;
  private final boolean m_bStopValidationOnError;
  private final boolean m_bContextRequired;

  public ValidationType (@NonNull @Nonempty final String sID,
                         @NonNull final EValidationBaseType eBaseType,
                         @NonNull @Nonempty final String sName,
                         final boolean bStopValidationOnError,
                         final boolean bContextRequired)
  {
    ValueEnforcer.notEmpty (sID, "ID");
    ValueEnforcer.notNull (eBaseType, "BaseType");
    ValueEnforcer.notEmpty (sName, "Name");
    m_sID = sID;
    m_eBaseType = eBaseType;
    m_sName = sName;
    m_bStopValidationOnError = bStopValidationOnError;
    m_bContextRequired = bContextRequired;
  }

  @NonNull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @NonNull
  public EValidationBaseType getBaseType ()
  {
    return m_eBaseType;
  }

  @NonNull
  @Nonempty
  public String getName ()
  {
    return m_sName;
  }

  public boolean isStopValidationOnError ()
  {
    return m_bStopValidationOnError;
  }

  public boolean isContextRequired ()
  {
    return m_bContextRequired;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationType rhs = (ValidationType) o;
    return m_sID.equals (rhs.m_sID) &&
           m_eBaseType.equals (rhs.m_eBaseType) &&
           m_sName.equals (rhs.m_sName) &&
           m_bStopValidationOnError == rhs.m_bStopValidationOnError &&
           m_bContextRequired == rhs.m_bContextRequired;
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_sID)
                                       .append (m_eBaseType)
                                       .append (m_sName)
                                       .append (m_bStopValidationOnError)
                                       .append (m_bContextRequired)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ID", m_sID)
                                       .append ("BaseType", m_eBaseType)
                                       .append ("Name", m_sName)
                                       .append ("StopValidationOnError", m_bStopValidationOnError)
                                       .append ("ContextRequired", m_bContextRequired)
                                       .getToString ();
  }
}
