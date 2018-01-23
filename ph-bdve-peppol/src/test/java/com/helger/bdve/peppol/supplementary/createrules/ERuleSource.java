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

import com.helger.bdve.spec.EBII2Transaction;

/**
 * Don't alter the codes of this enum manually. They are automatically created
 * by {@link Main2CreateRuleSourceEnum}.
 *
 * @author Philip Helger
 */
public enum ERuleSource
{
  T01 (EBII2Transaction.T01, "V1.0", "v09", false, "v01", true),
  T02 (EBII2Transaction.T02, "V1.0", "v05", false, null, false),
  T04 (EBII2Transaction.T04, null, "v02", false, null, false),
  T05 (EBII2Transaction.T05, null, "v02", false, null, false),
  T10 (EBII2Transaction.T10, "V1.0", "v12", true, "v03", true),
  T14 (EBII2Transaction.T14, "V1.0", "v09", true, "v03", true),
  T16 (EBII2Transaction.T16, "V1.0", "v05", false, "v03", true),
  T17 (EBII2Transaction.T17, null, "v04", true, null, false),
  T18 (EBII2Transaction.T18, null, "v02", false, null, false),
  T19 (EBII2Transaction.T19, "V1.0", "v05", true, "v01", true),
  T20 (EBII2Transaction.T20, null, "v01", true, null, false),
  T21 (EBII2Transaction.T21, null, "v01", true, null, false),
  T22 (EBII2Transaction.T22, null, "v01", false, null, false),
  T23 (EBII2Transaction.T23, null, "v01", false, null, false),
  T26 (EBII2Transaction.T26, null, "v02", true, null, false),
  T40 (EBII2Transaction.T40, "V1.0", "v06", true, null, false),
  T41 (EBII2Transaction.T41, null, "v04", true, null, false),
  T42 (EBII2Transaction.T42, null, "v01", false, null, false),
  T44 (EBII2Transaction.T44, "V1.0", "v03", true, null, false),
  T45 (EBII2Transaction.T45, null, "v02", false, null, false),
  T54 (EBII2Transaction.T54, null, "v01", true, null, false),
  T55 (EBII2Transaction.T55, null, "v01", false, null, false),
  T58 (EBII2Transaction.T58, null, "v01", false, "v01", true),
  T59 (EBII2Transaction.T59, null, "v01", false, null, false),
  T64A (EBII2Transaction.T64A, null, null, false, null, false),
  T64B (EBII2Transaction.T64B, null, null, false, null, false),
  T64C (EBII2Transaction.T64C, null, null, false, null, false),
  T65 (EBII2Transaction.T65, null, "v01", false, null, false),
  T68 (EBII2Transaction.T68, null, "v02", false, null, false),
  T69 (EBII2Transaction.T69, null, "v03", false, null, false),
  T71 (EBII2Transaction.T71, null, "v03", true, "v01", true),
  T72 (EBII2Transaction.T72, null, "v01", false, null, false),
  T73 (EBII2Transaction.T73, null, "v01", false, null, false),
  T76 (EBII2Transaction.T76, null, "v01", false, "v01", true),
  CODELISTS (null, null, "v04", false, "v01", false);

  private EBII2Transaction m_eTransaction;
  private final String m_sBIICoreVersion;
  private final String m_sBIIVersion;
  private final boolean m_bUsesBIICodeLists;
  private final String m_sOpenPEPPOLVersion;
  private final boolean m_bUsesOpenPEPPOLCodeLists;

  private ERuleSource (@Nullable final EBII2Transaction eTransaction,
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
  public EBII2Transaction getTransaction ()
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
