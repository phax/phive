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
import com.helger.base.lang.EnumHelper;

/**
 * Enum with all predefined validation types. Depending on this type, different implementation logic
 * must be used!
 *
 * @author Philip Helger
 */
public enum EValidationType implements IValidationType
{
  /**
   * Validate XML syntax by parsing without assigned XSDs. This is the wellformedness check.
   */
  XML ("xml", EValidationBaseType.XML, "XML Syntax"),
  /** Validate XML against the rules of an XML Schema (XSD) */
  XSD ("xsd", EValidationBaseType.XSD, "XML Schema"),
  /**
   * Validate part of an XML against the rules of an XML Schema (XSD) - e.g. for extension/plugins.
   * The context object needed for this type is an
   * <code>ValidationExecutorXSDPartial.ContextData</code>.
   */
  PARTIAL_XSD ("partial-xsd", EValidationBaseType.XSD, "Partial XML Schema"),
  /**
   * Pure Java implementation of Schematron - can only handle XPath 2 (was originally called
   * SCHEMATRON)
   */
  SCHEMATRON_PURE ("schematron-pure", EValidationBaseType.SCHEMATRON, "Schematron (pure; XPath-only)"),
  /**
   * Schematron implementation that must convert the SCH to XSLT before validation
   */
  SCHEMATRON_SCH ("schematron-sch", EValidationBaseType.SCHEMATRON, "Schematron (SCH; ISO XSLT2)"),
  /**
   * Schematron validation to convert SCH to XSLT with SchXslt v1
   *
   * @since 7.0.0
   */
  SCHEMATRON_SCHXSLT ("schematron-schxslt-xslt2", EValidationBaseType.SCHEMATRON, "Schematron (SchXslt XSLT2)"),
  /**
   * Schematron validation to convert SCH to XSLT with SchXslt v2
   *
   * @since 11.1.1
   */
  SCHEMATRON_SCHXSLT2 ("schematron-schxslt2", EValidationBaseType.SCHEMATRON, "Schematron (SchXslt2)"),
  /**
   * Schematron validation with a pre-build XSLT file (e.g. from the Maven plugin)
   */
  SCHEMATRON_XSLT ("schematron-xslt", EValidationBaseType.SCHEMATRON, "Schematron (ISO XSLT2)"),
  /**
   * Schematron validation with a pre-build XSLT file (e.g. from the Maven plugin) with different
   * output (for OIOUBL only)
   */
  SCHEMATRON_OIOUBL ("schematron-xslt-oioubl", EValidationBaseType.SCHEMATRON, "Schematron (OIOUBL XSLT)");

  private final String m_sID;
  private final EValidationBaseType m_eBaseType;
  private final String m_sName;

  EValidationType (@NonNull @Nonempty final String sID,
                   @NonNull final EValidationBaseType eBaseType,
                   @NonNull @Nonempty final String sName)
  {
    m_sID = sID;
    m_eBaseType = eBaseType;
    m_sName = sName;
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
    return m_eBaseType.isXML () || m_eBaseType.isXSD ();
  }

  public boolean isContextRequired ()
  {
    return this == PARTIAL_XSD;
  }

  @Nullable
  public static EValidationType getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (EValidationType.class, sID);
  }
}
