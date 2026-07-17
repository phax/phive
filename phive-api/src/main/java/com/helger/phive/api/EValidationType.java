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
import com.helger.annotation.misc.ContainsSoftMigration;
import com.helger.base.lang.EnumHelper;
import com.helger.schematron.ESchematronEngine;

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
  XML ("xml", EValidationBaseType.XML, "XML Syntax", null),
  /** Validate XML against the rules of an XML Schema (XSD) */
  XSD ("xsd", EValidationBaseType.XSD, "XML Schema", null),
  /**
   * Validate part of an XML against the rules of an XML Schema (XSD) - e.g. for extension/plugins.
   * The context object needed for this type is an
   * <code>ValidationExecutorXSDPartial.ContextData</code>.
   */
  PARTIAL_XSD ("partial-xsd", EValidationBaseType.XSD, "Partial XML Schema", null),

  /**
   * Pure Java implementation of Schematron - can only handle XPath 2<br>
   * enum constant was originally called <code>SCHEMATRON</code> and then
   * <code>SCHEMATRON_PURE</code><br>
   * Original ID was "schematron-pure"
   */
  SCHEMATRON_PURE_XPATH2 ("schematron-pure-xpath2",
                          EValidationBaseType.SCHEMATRON,
                          "Schematron (pure; XPath 2.0)",
                          ESchematronEngine.PURE_XPATH),

  /**
   * Pure Java implementation of Schematron to XSLT 1.0 converter.
   *
   * @since 12.1.0
   */
  SCHEMATRON_PURE_XSLT1 ("schematron-pure-xslt1",
                         EValidationBaseType.SCHEMATRON,
                         "Schematron (pure; XSLT 1.0)",
                         ESchematronEngine.PURE_XSLT),

  /**
   * Pure Java implementation of Schematron to XSLT 2.0 converter.
   *
   * @since 12.1.0
   */
  SCHEMATRON_PURE_XSLT2 ("schematron-pure-xslt2",
                         EValidationBaseType.SCHEMATRON,
                         "Schematron (pure; XSLT 2.0)",
                         ESchematronEngine.PURE_XSLT),

  /**
   * Pure Java implementation of Schematron to XSLT 3.0 converter.
   *
   * @since 12.1.0
   */
  SCHEMATRON_PURE_XSLT3 ("schematron-pure-xslt3",
                         EValidationBaseType.SCHEMATRON,
                         "Schematron (pure; XSLT 3.0)",
                         ESchematronEngine.PURE_XSLT),

  /**
   * Convert Schematron to XSLT using ISO Schematron with XSLT 1.0 output
   *
   * @since 12.0.0
   */
  SCHEMATRON_SCH_ISO_XSLT1 ("schematron-sch-xslt1",
                            EValidationBaseType.SCHEMATRON,
                            "Schematron (ISO Schematron; XSLT 1.0)",
                            ESchematronEngine.ISO_SCHEMATRON),

  /**
   * Convert Schematron to XSLT using ISO Schematron with XSLT 2.0 output.<br>
   * Original ID was "schematron-sch"
   */
  SCHEMATRON_SCH_ISO_XSLT2 ("schematron-sch-xslt2",
                            EValidationBaseType.SCHEMATRON,
                            "Schematron (ISO Schematron; XSLT 2.0)",
                            ESchematronEngine.ISO_SCHEMATRON),

  /**
   * Convert Schematron to XSLT using SchXslt1 with XSLT 1.0 output
   *
   * @since 12.0.0
   */
  SCHEMATRON_SCHXSLT1_XSLT1 ("schematron-schxslt-xslt1",
                             EValidationBaseType.SCHEMATRON,
                             "Schematron (SchXslt1; XSLT 1.0)",
                             ESchematronEngine.SCHXSLT1),

  /**
   * Convert Schematron to XSLT using SchXslt1 with XSLT 2.0 output
   *
   * @since 7.0.0
   */
  SCHEMATRON_SCHXSLT1_XSLT2 ("schematron-schxslt-xslt2",
                             EValidationBaseType.SCHEMATRON,
                             "Schematron (SchXslt1; XSLT 2.0)",
                             ESchematronEngine.SCHXSLT1),

  /**
   * Convert Schematron to XSLT using SchXslt2 with XSLT 3.0 output<br>
   * Original ID was "schematron-schxslt2"
   *
   * @since 11.1.1
   */
  SCHEMATRON_SCHXSLT2_XSLT3 ("schematron-schxslt2-xslt3",
                             EValidationBaseType.SCHEMATRON,
                             "Schematron (SchXslt2; XSLT 3.0)",
                             ESchematronEngine.SCHXSLT2),

  /**
   * Schematron validation with a pre-build XSLT v1 file (e.g. from the Maven plugin)
   *
   * @since 12.0.0
   */
  SCHEMATRON_XSLT1 ("schematron-xslt1",
                    EValidationBaseType.SCHEMATRON,
                    "Schematron (XSLT 1.0)",
                    ESchematronEngine.XSLT_PREBUILT),

  /**
   * Schematron validation with a pre-build XSLT v2 file (e.g. from the Maven plugin)<br>
   * Original ID: "schematron-xslt"
   */
  SCHEMATRON_XSLT2 ("schematron-xslt2",
                    EValidationBaseType.SCHEMATRON,
                    "Schematron (XSLT 2.0)",
                    ESchematronEngine.XSLT_PREBUILT),

  /**
   * Schematron validation with a pre-build XSLT v3 file (e.g. from the Maven plugin)
   *
   * @since 12.0.0
   */
  SCHEMATRON_XSLT3 ("schematron-xslt3",
                    EValidationBaseType.SCHEMATRON,
                    "Schematron (XSLT 3.0)",
                    ESchematronEngine.XSLT_PREBUILT),

  /**
   * Schematron validation with a pre-build XSLT file (e.g. from the Maven plugin) with different
   * output (for OIOUBL only)
   */
  SCHEMATRON_OIOUBL ("schematron-xslt-oioubl",
                     EValidationBaseType.SCHEMATRON,
                     "Schematron (OIOUBL XSLT)",
                     ESchematronEngine.XSLT_PREBUILT);

  @Deprecated (forRemoval = true, since = "12.0.0")
  public static final EValidationType SCHEMATRON_SCH = SCHEMATRON_SCH_ISO_XSLT2;
  @Deprecated (forRemoval = true, since = "12.0.0")
  public static final EValidationType SCHEMATRON_SCHXSLT = SCHEMATRON_SCHXSLT1_XSLT2;
  @Deprecated (forRemoval = true, since = "12.0.0")
  public static final EValidationType SCHEMATRON_XSLT = SCHEMATRON_XSLT2;
  @Deprecated (forRemoval = true, since = "12.0.0")
  public static final EValidationType SCHEMATRON_SCHXSLT2 = SCHEMATRON_SCHXSLT2_XSLT3;
  @Deprecated (forRemoval = true, since = "12.1.0")
  public static final EValidationType SCHEMATRON_PURE = SCHEMATRON_PURE_XPATH2;

  private final String m_sID;
  private final EValidationBaseType m_eBaseType;
  private final String m_sName;
  private final ESchematronEngine m_eSchematronEngine;

  EValidationType (@NonNull @Nonempty final String sID,
                   @NonNull final EValidationBaseType eBaseType,
                   @NonNull @Nonempty final String sName,
                   @Nullable final ESchematronEngine eSchematronEngine)
  {
    m_sID = sID;
    m_eBaseType = eBaseType;
    m_sName = sName;
    m_eSchematronEngine = eSchematronEngine;
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

  /**
   * @return The Schematron engine to be used for this validation type, if this validation type is
   *         based on Schematron. For all validation types that are not based on Schematron,
   *         <code>null</code> is returned.
   * @since 12.1.0
   */
  @Nullable
  public ESchematronEngine getSchematronEngine ()
  {
    return m_eSchematronEngine;
  }

  @Nullable
  @ContainsSoftMigration
  public static EValidationType getFromIDOrNull (@Nullable final String sID)
  {
    if ("schematron-pure".equals (sID))
      return SCHEMATRON_PURE_XPATH2;

    if ("schematron-sch".equals (sID))
      return SCHEMATRON_SCH_ISO_XSLT2;

    if ("schematron-xslt".equals (sID))
      return SCHEMATRON_XSLT2;

    if ("schematron-schxslt2".equals (sID))
      return SCHEMATRON_SCHXSLT2_XSLT3;

    return EnumHelper.getFromIDOrNull (EValidationType.class, sID);
  }
}
