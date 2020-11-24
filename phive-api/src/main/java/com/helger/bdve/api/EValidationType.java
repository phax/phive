/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.api;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.lang.EnumHelper;
import com.helger.commons.name.IHasName;

/**
 * Enum with the validation artefact type. Depending on this type, different
 * implementation logic must be used!
 *
 * @author Philip Helger
 */
public enum EValidationType implements IHasID <String>, IHasName
{
  /** Validate XML syntax by parsing without assigned XSDs */
  XML ("xml", "XML Syntax"),
  /** Validate XML against the rules of an XML Schema (XSD) */
  XSD ("xsd", "XML Schema"),
  /**
   * Validate part of an XML against the rules of an XML Schema (XSD) - e.g. for
   * extension/plugins. The context object needed for this type is an
   * <code>ValidationExecutorXSDPartial.ContextData</code>.
   */
  PARTIAL_XSD ("partial-xsd", "Partial XML Schema"),
  /**
   * Pure Java implementation of Schematron - can only handle XPath 2 (was
   * originally called SCHEMATRON)
   */
  SCHEMATRON_PURE ("schematron-pure", "Schematron (XPath)"),
  /**
   * Schematron implementation that must convert the SCH to XSLT before
   * validation
   */
  SCHEMATRON_SCH ("schematron-sch", "Schematron (SCH)"),
  /**
   * Schematron validation with a pre-build XSLT file (e.g. from the Maven
   * plugin)
   */
  SCHEMATRON_XSLT ("schematron-xslt", "Schematron (XSLT)"),
  /**
   * Schematron validation with a pre-build XSLT file (e.g. from the Maven
   * plugin) with different output (for OIOUBL only)
   */
  SCHEMATRON_OIOUBL ("schematron-xslt-oioubl", "Schematron (XSLT) [OIOUBL]");

  private final String m_sID;
  private final String m_sName;

  EValidationType (@Nonnull @Nonempty final String sID, @Nonnull @Nonempty final String sName)
  {
    m_sID = sID;
    m_sName = sName;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  /**
   * This locale independent name of the validation artefact.
   */
  @Nonnull
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
    return this == XSD || this == PARTIAL_XSD;
  }

  public boolean isSchematron ()
  {
    return this == SCHEMATRON_PURE || this == SCHEMATRON_SCH || this == SCHEMATRON_XSLT || this == SCHEMATRON_OIOUBL;
  }

  /**
   * @return <code>true</code> to stop validation if an error occurs when using
   *         this validation type. This is helpful to avoid running Schematron
   *         validations when the XML/XSD validations already failed.
   */
  public boolean isStopValidationOnError ()
  {
    return isXML () || isXSD ();
  }

  /**
   * @return <code>true</code> if the application of this validation type
   *         requires additional context parameters.
   */
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
