/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;

import org.odftoolkit.simple.SpreadsheetDocument;

import com.helger.commons.collection.ext.CommonsHashMap;
import com.helger.commons.collection.ext.ICommonsMap;

public final class SpreadsheetCache
{
  private static final ICommonsMap <String, SpreadsheetDocument> s_aMap = new CommonsHashMap <> ();

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
