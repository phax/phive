/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
