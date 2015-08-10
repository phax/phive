package com.helger.peppol.validation.supplementary.createrules.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Nonnull;

import org.odftoolkit.simple.SpreadsheetDocument;

public final class SpreadsheetCache
{
  private static final Map <String, SpreadsheetDocument> s_aMap = new HashMap <String, SpreadsheetDocument> ();

  private SpreadsheetCache ()
  {}

  @Nonnull
  public static SpreadsheetDocument readSpreadsheet (@Nonnull final File aFile)
  {
    final String sKey = aFile.getAbsolutePath ();
    SpreadsheetDocument ret = s_aMap.get (sKey);
    if (ret == null)
    {
      CreateHelper.log ("Reading ODS file " + aFile);
      try
      {
        ret = SpreadsheetDocument.loadDocument (aFile);
        s_aMap.put (sKey, ret);
      }
      catch (final Exception ex)
      {
        throw new IllegalArgumentException ("Failed to read ODS file " + aFile, ex);
      }
    }
    return ret;
  }
}
