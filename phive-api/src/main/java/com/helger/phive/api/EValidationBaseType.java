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
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.base.id.IHasID;
import com.helger.base.lang.EnumHelper;
import com.helger.base.name.IHasName;

/**
 * Enum with all predefined validation based types.
 *
 * @author Philip Helger
 */
public enum EValidationBaseType implements IHasID <String>, IHasName
{
  XML ("xml", "XML"),
  XSD ("xsd", "XML Schema"),
  SCHEMATRON ("sch", "Schematron"),
  EDIFACT ("edifact", "EDIFACT"),
  PDF ("pdf", "PDF"),
  OTHER ("other", "Other");

  private final String m_sID;
  private final String m_sName;

  EValidationBaseType (@NonNull @Nonempty final String sID, @NonNull @Nonempty final String sName)
  {
    m_sID = sID;
    m_sName = sName;
  }

  @NonNull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @NonNull
  @Nonempty
  public String getName ()
  {
    return m_sName;
  }

  public boolean isXML ()
  {
    return this == XML;
  }

  public boolean isXSD ()
  {
    return this == XSD;
  }

  public boolean isSchematron ()
  {
    return this == SCHEMATRON;
  }

  public boolean isEdifact ()
  {
    return this == EDIFACT;
  }

  @Nullable
  public static EValidationBaseType getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (EValidationBaseType.class, sID);
  }
}
