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
import java.util.Locale;
import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.peppol.supplementary.createrules.util.ODFHelper;
import com.helger.bdve.peppol.supplementary.createrules.util.SpreadsheetCache;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsTreeMap;
import com.helger.commons.collection.impl.ICommonsSortedMap;
import com.helger.commons.io.file.FileSystemIterator;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.regex.RegExHelper;
import com.helger.commons.string.StringHelper;

/**
 * Create the content of the {@link ERuleSourceThirdparty} enum. Must be run
 * AFTER {@link Main1CreateCodeLists} was run!
 *
 * @author Philip Helger
 */
public final class Main3CreateRuleSourceThirdpartyEnum
{
  private static final class Value
  {
    private final String m_sVersion;
    private final String m_sGlobalPrerequisite;

    public Value (final String sVersion, final String sGlobalPrerequisite)
    {
      m_sVersion = sVersion;
      m_sGlobalPrerequisite = StringHelper.getNotNull (sGlobalPrerequisite);
    }
  }

  /**
   * Map from transaction ID (e.g. 'T01') to the version number of the ODS file
   * (e.g. 'v09').
   *
   * @author Philip Helger
   */
  private static final class MyMap extends CommonsTreeMap <String, Value>
  {
    public Value put (@Nonnull final String sKey,
                      @Nonnull final String sVersion,
                      @Nullable final String sGlobalPrerequisite)
    {
      final Value sOld = super.put (sKey, new Value (sVersion, sGlobalPrerequisite));
      if (sOld != null)
        throw new IllegalArgumentException ("A value for the key '" + sKey + "' was already contained - duplicate!");
      return sOld;
    }
  }

  /**
   * @return Map from package name to map from transaction to version
   */
  @Nonnull
  @ReturnsMutableCopy
  private static ICommonsSortedMap <String, MyMap> _getRulesVersions ()
  {
    final ICommonsSortedMap <String, MyMap> ret = new CommonsTreeMap<> ();
    for (final File aDir : new FileSystemIterator ("src/test/resources/rule-source/thirdparty"))
      if (aDir.isDirectory () && !FilenameHelper.isSystemInternalDirectory (aDir))
      {
        final MyMap aMap = new MyMap ();
        ret.put (aDir.getName (), aMap);
        for (final File aFile : new FileSystemIterator (aDir))
          if (aFile.isFile () && aFile.getName ().endsWith (".ods") && !StringHelper.startsWith (aFile.getName (), '~'))
          {
            // Read artifacts:F2
            final String sGlobalPrerequisite = ODFHelper.getText (SpreadsheetCache.readSpreadsheet (aFile)
                                                                                  .getTableByName ("artifacts"),
                                                                  5,
                                                                  1);
            final String [] aMatches = RegExHelper.getAllMatchingGroupValues (aDir.getName () +
                                                                              "-(T[0-9]+)-BusinessRules-(v[0-9]+)\\.ods",
                                                                              aFile.getName ());
            if (aMatches != null)
              aMap.put (aMatches[0], aMatches[1], sGlobalPrerequisite);
            else
              throw new IllegalStateException (aFile.getAbsolutePath ());
          }
      }
    return ret;
  }

  public static void main (final String [] args)
  {
    final Map <String, MyMap> aRules = _getRulesVersions ();
    for (final Map.Entry <String, MyMap> aEntry : aRules.entrySet ())
    {
      final String sPackageName = aEntry.getKey ();
      for (final Map.Entry <String, Value> aEntry2 : aEntry.getValue ().entrySet ())
      {
        final String sTransaction = aEntry2.getKey ();
        final Value aValue = aEntry2.getValue ();
        final String sKey = sPackageName.toUpperCase (Locale.US) + "_" + sTransaction;
        System.out.println (sKey +
                            " (\"" +
                            sPackageName +
                            "\", EBII2Transaction." +
                            sTransaction +
                            ", \"" +
                            aValue.m_sVersion +
                            "\", \"" +
                            aValue.m_sGlobalPrerequisite +
                            "\"),");
      }
    }
  }
}
