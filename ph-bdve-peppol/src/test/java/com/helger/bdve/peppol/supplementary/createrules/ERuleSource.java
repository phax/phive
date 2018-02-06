/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol.supplementary.createrules;

import java.io.File;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.spec.EBIITransaction;

/**
 * Don't alter the codes of this enum manually. They are automatically created
 * by {@link Main2CreateRuleSourceEnum}.
 *
 * @author Philip Helger
 */
public enum ERuleSource
{
  T01 (EBIITransaction.T01, "V1.0", "v09", false, "v01", true),
  T02 (EBIITransaction.T02, "V1.0", "v05", false, null, false),
  T04 (EBIITransaction.T04, null, "v02", false, null, false),
  T05 (EBIITransaction.T05, null, "v02", false, null, false),
  T10 (EBIITransaction.T10, "V1.0", "v12", true, "v03", true),
  T14 (EBIITransaction.T14, "V1.0", "v09", true, "v03", true),
  T16 (EBIITransaction.T16, "V1.0", "v05", false, "v03", true),
  T17 (EBIITransaction.T17, null, "v04", true, null, false),
  T18 (EBIITransaction.T18, null, "v02", false, null, false),
  T19 (EBIITransaction.T19, "V1.0", "v05", true, "v01", true),
  T20 (EBIITransaction.T20, null, "v01", true, null, false),
  T21 (EBIITransaction.T21, null, "v01", true, null, false),
  T22 (EBIITransaction.T22, null, "v01", false, null, false),
  T23 (EBIITransaction.T23, null, "v01", false, null, false),
  T26 (EBIITransaction.T26, null, "v02", true, null, false),
  T40 (EBIITransaction.T40, "V1.0", "v06", true, null, false),
  T41 (EBIITransaction.T41, null, "v04", true, null, false),
  T42 (EBIITransaction.T42, null, "v01", false, null, false),
  T44 (EBIITransaction.T44, "V1.0", "v03", true, null, false),
  T45 (EBIITransaction.T45, null, "v02", false, null, false),
  T54 (EBIITransaction.T54, null, "v01", true, null, false),
  T55 (EBIITransaction.T55, null, "v01", false, null, false),
  T58 (EBIITransaction.T58, null, "v01", false, "v01", true),
  T59 (EBIITransaction.T59, null, "v01", false, null, false),
  T64A (EBIITransaction.T64A, null, null, false, null, false),
  T64B (EBIITransaction.T64B, null, null, false, null, false),
  T64C (EBIITransaction.T64C, null, null, false, null, false),
  T65 (EBIITransaction.T65, null, "v01", false, null, false),
  T68 (EBIITransaction.T68, null, "v02", false, null, false),
  T69 (EBIITransaction.T69, null, "v03", false, null, false),
  T71 (EBIITransaction.T71, null, "v03", true, "v01", true),
  T72 (EBIITransaction.T72, null, "v01", false, null, false),
  T73 (EBIITransaction.T73, null, "v01", false, null, false),
  T76 (EBIITransaction.T76, null, "v01", false, "v01", true),
  CODELISTS (null, null, "v04", false, "v01", false);

  private EBIITransaction m_eTransaction;
  private final String m_sBIICoreVersion;
  private final String m_sBIIVersion;
  private final boolean m_bUsesBIICodeLists;
  private final String m_sOpenPEPPOLVersion;
  private final boolean m_bUsesOpenPEPPOLCodeLists;

  private ERuleSource (@Nullable final EBIITransaction eTransaction,
                       @Nullable final String sBIICoreVersion,
                       @Nullable final String sBIIVersion,
                       final boolean bUsesBIICodeLists,
                       @Nullable final String sOpenPEPPOLVersion,
                       final boolean bUsesOpenPEPPOLCodeLists)
  {
    m_eTransaction = eTransaction;
    m_sBIICoreVersion = sBIICoreVersion;
    m_sBIIVersion = sBIIVersion;
    m_bUsesBIICodeLists = bUsesBIICodeLists;
    m_sOpenPEPPOLVersion = sOpenPEPPOLVersion;
    m_bUsesOpenPEPPOLCodeLists = bUsesOpenPEPPOLCodeLists;
  }

  @Nullable
  public EBIITransaction getTransaction ()
  {
    return m_eTransaction;
  }

  public boolean isCodeListsSpecial ()
  {
    return this == ERuleSource.CODELISTS;
  }

  public boolean hasBIICoreFile ()
  {
    return m_sBIICoreVersion != null;
  }

  @Nullable
  public File getBIICoreSchematronFile ()
  {
    return new File ("src/test/resources/rule-source/biicore/BIICORE-UBL-" +
                     m_eTransaction.getTransactionKeyShort () +
                     "-" +
                     m_sBIICoreVersion +
                     ".sch");
  }

  public boolean hasBIIRules ()
  {
    return m_sBIIVersion != null;
  }

  @Nonnull
  public File getBIIRuleFile ()
  {
    return new File ("src/test/resources/rule-source/biirules/businessrules/bii2rules-" +
                     (isCodeListsSpecial () ? "CodeLists-"
                                            : m_eTransaction.getTransactionKeyShort () + "-BusinessRules-") +
                     m_sBIIVersion +
                     ".ods");
  }

  public boolean usesBIICodeLists ()
  {
    return m_bUsesBIICodeLists;
  }

  public boolean hasOpenPEPPOLRules ()
  {
    return m_sOpenPEPPOLVersion != null;
  }

  @Nonnull
  public File getOpenPEPPOLRuleFile ()
  {
    return new File ("src/test/resources/rule-source/peppol/businessrules/OpenPEPPOL-" +
                     (isCodeListsSpecial () ? "CodeLists-"
                                            : m_eTransaction.getTransactionKeyShort () + "-BusinessRules-") +
                     m_sOpenPEPPOLVersion +
                     ".ods");
  }

  public boolean usesOpenPEPPOLCodeLists ()
  {
    return m_bUsesOpenPEPPOLCodeLists;
  }
}
