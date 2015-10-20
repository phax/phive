package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;
import java.util.Locale;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.file.iterate.FileSystemIterator;
import com.helger.commons.regex.RegExHelper;

/**
 * Create the content of the {@link ERuleSourceThirdparty} enum. Must be run
 * AFTER {@link Main1CreateCodeLists} was run!
 *
 * @author Philip Helger
 */
public final class Main3CreateRuleSourceThirdpartyEnum
{
  /**
   * Map from transaction ID (e.g. 'T01') to the version number of the ODS file
   * (e.g. 'v09').
   *
   * @author Philip Helger
   */
  private static final class MyMap extends TreeMap <String, String>
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

  /**
   * @return Map from package name to map from transaction to version
   */
  @Nonnull
  @ReturnsMutableCopy
  private static SortedMap <String, MyMap> _getRulesVersions ()
  {
    final SortedMap <String, MyMap> ret = new TreeMap <String, MyMap> ();
    for (final File aDir : new FileSystemIterator ("src/test/resources/rule-source/thirdparty"))
      if (aDir.isDirectory () && !FilenameHelper.isSystemInternalDirectory (aDir))
      {
        final MyMap aMap = new MyMap ();
        ret.put (aDir.getName (), aMap);
        for (final File aFile : new FileSystemIterator (aDir))
          if (aFile.isFile () && aFile.getName ().endsWith (".ods"))
          {
            final String [] aMatches = RegExHelper.getAllMatchingGroupValues (aDir.getName () +
                                                                              "-(T[0-9]+)-BusinessRules-(v[0-9]+)\\.ods",
                                                                              aFile.getName ());
            if (aMatches != null)
              aMap.put (aMatches[0], aMatches[1]);
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
      for (final Map.Entry <String, String> aEntry2 : aEntry.getValue ().entrySet ())
      {
        final String sTransaction = aEntry2.getKey ();
        final String sVersion = aEntry2.getValue ();
        final String sKey = sPackageName.toUpperCase (Locale.US) + "_" + sTransaction;
        System.out.println (sKey +
                            " (\"" +
                            sPackageName +
                            "\", EBII2Transaction." +
                            sTransaction +
                            ", \"" +
                            sVersion +
                            "\"),");
      }
    }
  }
}
