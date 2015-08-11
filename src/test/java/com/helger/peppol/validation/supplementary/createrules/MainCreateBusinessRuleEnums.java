package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.io.file.iterate.FileSystemIterator;
import com.helger.commons.regex.RegExHelper;
import com.helger.peppol.validation.domain.peppol.EBII2Transaction;

public final class MainCreateBusinessRuleEnums
{
  private static final String KEY_CODELIST = "codelist";

  @Nonnull
  @ReturnsMutableCopy
  private static Map <String, String> _getBIIRuleVersions ()
  {
    final Map <String, String> aBIIRules = new HashMap <String, String> ();
    for (final File aFile : new FileSystemIterator ("src/test/resources/rule-source/biirules/businessrules"))
      if (aFile.isFile () && aFile.getName ().endsWith (".ods"))
      {
        String [] aMatches = RegExHelper.getAllMatchingGroupValues ("bii2rules-(T[0-9]+)-BusinessRules-(v[0-9]+)\\.ods",
                                                                    aFile.getName ());
        if (aMatches != null)
          aBIIRules.put (aMatches[0], aMatches[1]);
        else
        {
          aMatches = RegExHelper.getAllMatchingGroupValues ("bii2rules-CodeLists-(v[0-9]+)\\.ods", aFile.getName ());
          if (aMatches != null)
            aBIIRules.put (KEY_CODELIST, aMatches[0]);
          else
            throw new IllegalStateException ();
        }
      }
    return aBIIRules;
  }

  @Nonnull
  @ReturnsMutableCopy
  private static Map <String, String> _getOpenPEPPOLVersions ()
  {
    final Map <String, String> aBIIRules = new HashMap <String, String> ();
    for (final File aFile : new FileSystemIterator ("src/test/resources/rule-source/peppol/businessrules"))
      if (aFile.isFile () && aFile.getName ().endsWith (".ods"))
      {
        String [] aMatches = RegExHelper.getAllMatchingGroupValues ("OpenPEPPOL-(T[0-9]+)-BusinessRules-(v[0-9]+)\\.ods",
                                                                    aFile.getName ());
        if (aMatches != null)
          aBIIRules.put (aMatches[0], aMatches[1]);
        else
        {
          aMatches = RegExHelper.getAllMatchingGroupValues ("OpenPEPPOL-CodeLists-(v[0-9]+)\\.ods", aFile.getName ());
          if (aMatches != null)
            aBIIRules.put (KEY_CODELIST, aMatches[0]);
          else
            throw new IllegalStateException ();
        }
      }
    return aBIIRules;
  }

  public static void main (final String [] args)
  {
    final Map <String, String> aBIIRules = _getBIIRuleVersions ();

    final StringBuilder aSB = new StringBuilder ();
    for (final EBII2Transaction eTransaction : EBII2Transaction.values ())
    {

    }
  }
}
