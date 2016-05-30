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
package com.helger.peppol.validation.supplementary.createrules.codelist;

import java.io.File;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.odftoolkit.simple.SpreadsheetDocument;
import org.odftoolkit.simple.table.Table;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.ext.CommonsTreeSet;
import com.helger.commons.collection.ext.ICommonsSortedSet;
import com.helger.commons.collection.multimap.MultiTreeMapTreeSetBased;
import com.helger.commons.microdom.IMicroDocument;
import com.helger.commons.microdom.IMicroElement;
import com.helger.commons.microdom.MicroDocument;
import com.helger.commons.microdom.serialize.MicroWriter;
import com.helger.commons.string.StringHelper;
import com.helger.peppol.validation.supplementary.createrules.util.CreateHelper;
import com.helger.peppol.validation.supplementary.createrules.util.ODFHelper;
import com.helger.peppol.validation.supplementary.createrules.util.SpreadsheetCache;
import com.helger.schematron.CSchematron;

@Immutable
public final class RuleCodeListCreator
{
  /**
   * The separator used to separate different code list values.<br>
   * Previously used 0x007f is an invalid XML character, so we cannot use it
   * safely!
   */
  public static final char CODELIST_VALUE_SEPARATOR = '\ufffd';

  private static final String NS_SCHEMATRON = CSchematron.NAMESPACE_SCHEMATRON;

  private static final Logger s_aLogger = LoggerFactory.getLogger (RuleCodeListCreator.class);

  /** From transaction to CVAData */
  private final Map <String, CVAData> m_aCVAs = new TreeMap <> ();
  /** From code list name to set of codes */
  private final MultiTreeMapTreeSetBased <String, String> m_aAllCodes = new MultiTreeMapTreeSetBased <> ();

  public RuleCodeListCreator ()
  {}

  private void _readCVAandValues (@Nonnull final SpreadsheetDocument aSpreadsheet,
                                  @Nonnull final String sRequiredTransaction) throws Exception
  {
    // Handle CVA sheets
    final Table aCVASheet = aSpreadsheet.getSheetByName ("CVA");
    if (aCVASheet == null)
      throw new IllegalStateException ("No 'CVA' sheet found!");

    CreateHelper.log ("  Reading CVA data");
    int nRow = 2;
    final ICommonsSortedSet <String> aAllReferencedCodeListNames = new CommonsTreeSet <> ();
    while (!ODFHelper.isEmpty (aCVASheet, 0, nRow))
    {
      final String sTransaction = ODFHelper.getText (aCVASheet, 0, nRow);

      // Only take the data from the required transaction
      if (sRequiredTransaction.equals (sTransaction))
      {
        final String sID = ODFHelper.getText (aCVASheet, 1, nRow);
        // column 2 is UBL, column 3 is CII
        String sItem = ODFHelper.getText (aCVASheet, 2, nRow);
        // column 4 is UBL, column 5 is CII
        final String sScope = ODFHelper.getText (aCVASheet, 4, nRow);
        final String sCodeListName = ODFHelper.getText (aCVASheet, 6, nRow);
        final String sMessage = ODFHelper.getText (aCVASheet, 7, nRow);
        final String sSeverity = ODFHelper.getText (aCVASheet, 8, nRow);

        // Prepend scope (if any)
        sItem = StringHelper.getConcatenatedOnDemand (sScope, '/', sItem);

        // Save context per transaction
        CVAData aCVAData = m_aCVAs.get (sTransaction);
        if (aCVAData == null)
        {
          aCVAData = new CVAData (sTransaction);
          m_aCVAs.put (sTransaction, aCVAData);
        }
        aCVAData.addContext (sID, sItem, sCodeListName, sSeverity, sMessage);

        // Remember that we require a code list
        aAllReferencedCodeListNames.add (sCodeListName);
      }

      ++nRow;
    }

    if (aAllReferencedCodeListNames.isEmpty ())
      throw new IllegalStateException ("CVA was not referencing any code list!");

    // Create only the GC files that are referenced from the CVA sheet
    CreateHelper.log ("  Reading codelists");
    for (final String sCodeListName : aAllReferencedCodeListNames)
    {
      final Table aSheet = aSpreadsheet.getSheetByName (sCodeListName);
      if (aSheet == null)
      {
        // E.g. for 'EvidenceTypeCode'
        CreateHelper.warn ("Failed to resolve sheet with name '" + sCodeListName + "'");
        continue;
      }

      CreateHelper.log ("    Reading " + sCodeListName);

      // Find start row
      nRow = 0;
      while (!ODFHelper.isEmpty (aSheet, 0, nRow))
        nRow++;
      // Now we are at the empty row - skip 2 more
      nRow += 2;

      // Add values
      while (!ODFHelper.isEmpty (aSheet, 0, nRow))
      {
        final String sCode = ODFHelper.getText (aSheet, 0, nRow);

        // In code list name, a code is used
        if (m_aAllCodes.putSingle (sCodeListName, sCode).isUnchanged ())
          s_aLogger.warn ("Found duplicate value '" + sCode + "' in code list " + sCodeListName);

        ++nRow;
      }
    }
  }

  private void _createCodelistSchematron (@Nonnull final RuleSourceCodeList aCodeList)
  {
    CreateHelper.log ("  Writing Schematron code lists");
    if (m_aCVAs.size () > 1)
      throw new IllegalStateException ("Having data for too many transactions!");

    // For all transactions (exactly one!)
    for (final CVAData aCVAData : m_aCVAs.values ())
    {
      final String sTransaction = aCodeList.getTransactionKey ();

      final File aSCHFile = aCodeList.getSchematronFile ();
      CreateHelper.log ("    Creating " + aSCHFile.getName ());

      // Create the XML document
      final IMicroDocument aDoc = new MicroDocument ();
      aDoc.appendComment ("This file is generated automatically! Do NOT edit!");
      aDoc.appendComment ("Code list Schematron rules for " + sTransaction);
      final IMicroElement ePattern = aDoc.appendElement (NS_SCHEMATRON, "pattern");
      ePattern.setAttribute ("id", "Codes-" + sTransaction);

      for (final CVAContextData aCVAContextData : aCVAData.getAllContexts ())
      {
        final IMicroElement eRule = ePattern.appendElement (NS_SCHEMATRON, "rule");
        eRule.setAttribute ("context", aCVAContextData.getItem ());

        final IMicroElement eAssert = eRule.appendElement (NS_SCHEMATRON, "assert");
        eAssert.setAttribute ("flag", aCVAContextData.getSeverity ());
        eAssert.setAttribute ("id", aCVAContextData.getID ());

        final Set <String> aMatchingCodes = m_aAllCodes.get (aCVAContextData.getCodeListName ());
        if (CollectionHelper.isEmpty (aMatchingCodes))
          s_aLogger.warn ("No code list value found for '" +
                          aCVAContextData.getCodeListName () +
                          "' - Schematron rule will be bogus!");

        final String sTest = "contains('" +
                             CODELIST_VALUE_SEPARATOR +
                             StringHelper.getImploded (CODELIST_VALUE_SEPARATOR, aMatchingCodes) +
                             CODELIST_VALUE_SEPARATOR +
                             "',concat('" +
                             CODELIST_VALUE_SEPARATOR +
                             "',normalize-space(.),'" +
                             CODELIST_VALUE_SEPARATOR +
                             "'))";
        eAssert.setAttribute ("test", sTest);
        eAssert.appendText ("[" + aCVAContextData.getID () + "]-" + aCVAContextData.getMessage ());
      }

      if (MicroWriter.writeToFile (aDoc, aSCHFile).isFailure ())
        throw new IllegalStateException ("Failed to write " + aSCHFile);
    }
  }

  public void createCodeLists (@Nonnull final RuleSourceCodeList aCodeList) throws Exception
  {
    // Read ODS file
    final SpreadsheetDocument aSpreadsheet = SpreadsheetCache.readSpreadsheet (aCodeList.getSourceFile ());

    // Create .CVA and .GC files
    _readCVAandValues (aSpreadsheet, aCodeList.getTransactionKey ());

    // Create Schematron code list files
    _createCodelistSchematron (aCodeList);
  }
}
