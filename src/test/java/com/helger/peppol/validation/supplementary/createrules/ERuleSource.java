package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public enum ERuleSource
{
 T01 ("BIICORE-UBL-T01-V1.0.sch", "v09", false, "v01", true),
 T02 ("BIICORE-UBL-T02-V1.0.sch", "v05", false, null, false),
 T04 (null, "v02", false, null, false),
 T05 (null, "v02", false, null, false),
 T10 ("BIICORE-UBL-T10-V1.0.sch", "v12", true, "v03", true),
 T14 ("BIICORE-UBL-T14-V1.0.sch", "v09", true, "v03", true),
 T16 ("BIICORE-UBL-T16-V1.0.sch", "v05", false, "v01", true),
 T17 (null, "v04", true, null, false),
 T18 (null, "v02", false, null, false),
 T19 ("BIICORE-UBL-T19-V1.0.sch", "v05", true, "v01", true),
 T20 (null, "v01", true, null, false),
 T21 (null, "v01", true, null, false),
 T22 (null, "v01", false, null, false),
 T23 (null, "v01", false, null, false),
 T26 (null, "v02", true, null, false),
 T40 ("BIICORE-UBL-T40-V1.0.sch", "v06", true, null, false),
 T41 (null, "v04", true, null, false),
 T42 (null, "v01", false, null, false),
 T44 ("BIICORE-UBL-T44-V1.0.sch", "v03", true, null, false),
 T45 (null, "v02", false, null, false),
 T54 (null, "v01", true, null, false),
 T55 (null, "v01", false, null, false),
 T58 (null, "v01", false, "v01", true),
 T59 (null, "v01", false, null, false),
 T64A (null, null, false, null, false),
 T64B (null, null, false, null, false),
 T64C (null, null, false, null, false),
 T65 (null, "v01", false, null, false),
 T68 (null, "v02", false, null, false),
 T69 (null, "v03", false, null, false),
 T71 (null, "v03", true, "v01", true),
 T72 (null, "v01", false, null, false),
 T73 (null, "v01", false, null, false),
 T76 (null, "v01", false, "v01", true),
 CODELISTS (null, "v04", false, "v01", false);

  private final File m_aBIICoreFile;
  private final String m_sBIIVersion;
  private final boolean m_bUsesBIICodeLists;
  private final String m_sOpenPEPPOLVersion;
  private final boolean m_bUsesOpenPEPPOLCodeLists;

  private ERuleSource (@Nullable final String sBIICorePath,
                       @Nullable final String sBIIVersion,
                       final boolean bUsesBIICodeLists,
                       @Nullable final String sOpenPEPPOLVersion,
                       final boolean bUsesOpenPEPPOLCodeLists)
  {
    m_aBIICoreFile = sBIICorePath == null ? null : new File ("src/test/resources/rule-source/biicore", sBIICorePath);
    m_sBIIVersion = sBIIVersion;
    m_bUsesBIICodeLists = bUsesBIICodeLists;
    m_sOpenPEPPOLVersion = sOpenPEPPOLVersion;
    m_bUsesOpenPEPPOLCodeLists = bUsesOpenPEPPOLCodeLists;
  }

  public boolean isCodeListsSpecial ()
  {
    return this == ERuleSource.CODELISTS;
  }

  @Nullable
  public File getBIICoreFile ()
  {
    return m_aBIICoreFile;
  }

  public boolean hasBIIRules ()
  {
    return m_sBIIVersion != null;
  }

  @Nonnull
  public File getBIIRuleFile ()
  {
    return new File ("src/test/resources/rule-source/biirules/businessrules/bii2rules-" +
                     (isCodeListsSpecial () ? "CodeLists-" : name () + "-BusinessRules-") +
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
                     (isCodeListsSpecial () ? "CodeLists-" : name () + "-BusinessRules-") +
                     m_sOpenPEPPOLVersion +
                     ".ods");
  }

  public boolean usesOpenPEPPOLCodeLists ()
  {
    return m_bUsesOpenPEPPOLCodeLists;
  }
}
