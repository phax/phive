/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.odftoolkit.simple.table.Cell;
import org.odftoolkit.simple.table.Table;

import com.helger.commons.string.StringHelper;

@Immutable
public final class ODFHelper
{
  private ODFHelper ()
  {}

  @Nullable
  public static Cell getCell (@Nonnull final Table aSheet, final int nCol, final int nRow)
  {
    if (nRow >= aSheet.getRowCount () || nCol >= aSheet.getColumnCount ())
      return null;
    return aSheet.getRowByIndex (nRow).getCellByIndex (nCol);
  }

  public static boolean isEmpty (@Nonnull final Table aSheet, final int nCol, final int nRow)
  {
    final Cell aCell = getCell (aSheet, nCol, nRow);
    return aCell == null || aCell.getValueType () == null;
  }

  /**
   * @param aSheet
   *        Sheet to use.
   * @param nCol
   *        0-based column index
   * @param nRow
   *        0-based row index
   * @return <code>null</code> if empty
   */
  @Nullable
  public static String getText (@Nonnull final Table aSheet, final int nCol, final int nRow)
  {
    final Cell aCell = getCell (aSheet, nCol, nRow);
    if (aCell == null)
      return null;
    String sText = SimpleTextExtractor.getText (aCell);
    if (sText != null)
    {
      // Unify line ending to "\n"
      sText = StringHelper.replaceAll (sText, "\r\n", "\n");
      sText = StringHelper.replaceAll (sText, '\r', '\n');
    }
    return sText;
  }
}
