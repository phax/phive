/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol.supplementary.createrules.utils;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.apache.poi.ss.usermodel.Cell;

import com.helger.commons.regex.RegExHelper;
import com.helger.poi.excel.ExcelReadHelper;

@Immutable
public final class Utils
{
  private Utils ()
  {}

  @Nonnull
  public static String makeID (@Nonnull final String s)
  {
    return RegExHelper.stringReplacePattern ("\\b[ \\t]+\\b", s, "_");
  }

  @Nullable
  public static String getString (@Nullable final Cell aCell)
  {
    String ret = ExcelReadHelper.getCellValueString (aCell);
    if (ret != null)
    {
      // Unify line ending to "\n"
      ret = ret.replace ("\r\n", "\n");
      ret = ret.replace ("\r", "\n");
    }
    return ret;
  }
}
