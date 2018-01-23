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

import com.helger.bdve.spec.EBII2Transaction;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.CommonsTreeMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.file.FileSystemIterator;
import com.helger.commons.regex.RegExHelper;
import com.helger.commons.string.StringHelper;

/**
 * Create the content of the {@link ERuleSource} enum. Must be run AFTER
 * {@link Main1CreateCodeLists} was run! Must also be run if new BII Core rules
 * are added, or they are changed.
 *
 * @author Philip Helger
 */
public final class Main2CreateRuleSourceEnum
{
  private static final String KEY_CODELISTS = "CODELISTS";

  /**
   * Map from transaction ID (e.g. 'T01') to the version number of the ODS file
   * (e.g. 'v09').
   *
   * @author Philip Helger
   */
  private static final class MyMap extends CommonsTreeMap <String, String>
  {
    @Override
    public String put (@Nonnull final String sKey, @Nonnull final String sValue)
    {
      final String sOld = super.put (sKey, sValue);
      if (sOld != null)
        throw new IllegalArgumentException ("A value for the key '" + sKey + "' was already contained - duplicate!");
      return sOld;
    }
  }

  @Nonnull
  @ReturnsMutableCopy
  private static MyMap _getBIICoreVersions ()
  {
    final MyMap ret = new MyMap ();
    for (final File aFile : new FileSystemIterator ("src/test/resources/rule-source/biicore"))
      if (aFile.isFile () && aFile.getName ().endsWith (".sch"))
      {
        final String [] aMatches = RegExHelper.getAllMatchingGroupValues ("BIICORE-UBL-(T[0-9]+)-(V[0-9]+\\.[0-9]+)\\.sch",
                                                                          aFile.getName ());
        if (aMatches != null)
          ret.put (aMatches[0], aMatches[1]);
        // else e.g. a CEFACT rule
      }
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  private static MyMap _getBIIRulesVersions ()
  {
    final MyMap ret = new MyMap ();
    for (final File aFile : new FileSystemIterator ("src/test/resources/rule-source/biirules/businessrules"))
      if (aFile.isFile () && aFile.getName ().endsWith (".ods") && !StringHelper.startsWith (aFile.getName (), '~'))
      {
        String [] aMatches = RegExHelper.getAllMatchingGroupValues ("bii2rules-(T[0-9]+)-BusinessRules-(v[0-9]+)\\.ods",
                                                                    aFile.getName ());
        if (aMatches != null)
          ret.put (aMatches[0], aMatches[1]);
        else
        {
          aMatches = RegExHelper.getAllMatchingGroupValues ("bii2rules-CodeLists-(v[0-9]+)\\.ods", aFile.getName ());
          if (aMatches != null)
            ret.put (KEY_CODELISTS, aMatches[0]);
          else
            throw new IllegalStateException ();
        }
      }
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  private static MyMap _getOpenPEPPOLVersions ()
  {
    final MyMap ret = new MyMap ();
    for (final File aFile : new FileSystemIterator ("src/test/resources/rule-source/peppol/businessrules"))
      if (aFile.isFile () && aFile.getName ().endsWith (".ods") && !StringHelper.startsWith (aFile.getName (), '~'))
      {
        String [] aMatches = RegExHelper.getAllMatchingGroupValues ("OpenPEPPOL-(T[0-9]+)-BusinessRules-(v[0-9]+)\\.ods",
                                                                    aFile.getName ());
        if (aMatches != null)
          ret.put (aMatches[0], aMatches[1]);
        else
        {
          aMatches = RegExHelper.getAllMatchingGroupValues ("OpenPEPPOL-CodeLists-(v[0-9]+)\\.ods", aFile.getName ());
          if (aMatches != null)
            ret.put (KEY_CODELISTS, aMatches[0]);
          else
            throw new IllegalStateException ();
        }
      }
    return ret;
  }

  private static String _getVersion (@Nonnull final MyMap aMap, @Nonnull final String sKey)
  {
    final String sValue = aMap.get (sKey);
    return sValue == null ? "null" : '"' + sValue + '"';
  }

  private static boolean _hasCodeList (@Nonnull final String sPrefix, @Nonnull final String sTransactionKey)
  {
    return new File ("src/test/resources/codelist-generated/cva/" + sPrefix + "-" + sTransactionKey + ".cva").exists ();
  }

  public static void main (final String [] args)
  {
    final MyMap aBIICore = _getBIICoreVersions ();
    final MyMap aBIIRules = _getBIIRulesVersions ();
    final MyMap aOpenPEPPOL = _getOpenPEPPOLVersions ();

    final ICommonsList <String> aKeys = new CommonsArrayList<> ();
    for (final EBII2Transaction eTransaction : EBII2Transaction.values ())
      aKeys.add (eTransaction.getTransactionKeyShort ());
    aKeys.add (KEY_CODELISTS);

    for (final String sKey : aKeys)
    {
      String sTransaction;
      try
      {
        EBII2Transaction.valueOf (sKey);
        sTransaction = "EBII2Transaction." + sKey;
      }
      catch (final IllegalArgumentException ex)
      {
        // No such BII transaction
        sTransaction = "null";
      }
      System.out.println (sKey +
                          " (" +
                          sTransaction +
                          ", " +
                          _getVersion (aBIICore, sKey) +
                          ", " +
                          _getVersion (aBIIRules, sKey) +
                          ", " +
                          _hasCodeList ("BIIRULES", sKey) +
                          ", " +
                          _getVersion (aOpenPEPPOL, sKey) +
                          ", " +
                          _hasCodeList ("OPENPEPPOL", sKey) +
                          "),");
    }
  }
}
