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
package com.helger.phive.xml.schematron;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.base.id.IHasID;
import com.helger.base.lang.EnumHelper;

/**
 * Defines the Schematron engine to be used.
 *
 * @author Philip Helger
 * @deprecated Use the same name enumeration from ph-schematron
 */
@Deprecated (forRemoval = true, since = "11.1.1")
public enum ESchematronEngine implements IHasID <String>
{
  PURE (com.helger.schematron.ESchematronEngine.PURE.getID ()),
  ISO_SCHEMATRON (com.helger.schematron.ESchematronEngine.ISO_SCHEMATRON.getID ()),
  SCHXSLT (com.helger.schematron.ESchematronEngine.SCHXSLT1.getID ());

  private final String m_sID;

  ESchematronEngine (@NonNull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @NonNull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nullable
  public static ESchematronEngine getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (ESchematronEngine.class, sID);
  }
}
