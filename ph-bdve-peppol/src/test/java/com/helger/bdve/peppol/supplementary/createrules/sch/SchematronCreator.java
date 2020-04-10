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
package com.helger.bdve.peppol.supplementary.createrules.sch;

import java.io.File;
import java.util.Comparator;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.bdve.peppol.supplementary.createrules.RuleSourceItem;
import com.helger.bdve.peppol.supplementary.createrules.utils.Utils;
import com.helger.collection.multimap.IMultiMapListBased;
import com.helger.collection.multimap.MultiHashMapArrayListBased;
import com.helger.collection.multimap.MultiTreeMapArrayListBased;
import com.helger.commons.collection.impl.CommonsTreeMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.collection.impl.ICommonsOrderedMap;
import com.helger.commons.compare.IComparator;
import com.helger.commons.io.file.FileHelper;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.StringParser;
import com.helger.poi.excel.EExcelVersion;
import com.helger.schematron.CSchematron;
import com.helger.xml.microdom.IMicroDocument;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroDocument;
import com.helger.xml.microdom.serialize.MicroWriter;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.write.IXMLWriterSettings;
import com.helger.xml.serialize.write.XMLWriterSettings;

@Immutable
public final class SchematronCreator
{
  private static final Logger LOGGER = LoggerFactory.getLogger (SchematronCreator.class);
  private static final String NS_SCHEMATRON = CSchematron.NAMESPACE_SCHEMATRON;

  // Map from transaction to Map from context to list of assertions
  final ICommonsMap <String, IMultiMapListBased <String, RuleAssertion>> m_aAbstractRules = new CommonsTreeMap <> ();

  private SchematronCreator ()
  {}

  private void _extractAbstractRules (final RuleSourceBusinessRule aBusinessRule, @Nonnull final Workbook aSpreadSheet)
  {
    final Sheet aFirstSheet = aSpreadSheet.getSheetAt (0);
    // Skip 1 line
    int nRowIndex = 1;
    while (true)
    {
      // Read a single excel row
      final org.apache.poi.ss.usermodel.Row aExcelRow = aFirstSheet.getRow (nRowIndex++);
      if (aExcelRow == null)
        break;

      final String sRuleID = Utils.getString (aExcelRow.getCell (0));
      final String sMessage = Utils.getString (aExcelRow.getCell (1));
      final String sContext = Utils.getString (aExcelRow.getCell (2));
      final String sSeverity = Utils.getString (aExcelRow.getCell (3));
      final String sTransaction = Utils.getString (aExcelRow.getCell (4));
      final String sObsolete = Utils.getString (aExcelRow.getCell (5));

      final boolean bObsolete = StringParser.parseBool (sObsolete, false);
      if (bObsolete)
        LOGGER.info ("    Ignoring obsoleted rule '" + sRuleID + "'");
      else
      {
        // Save in nested maps
        m_aAbstractRules.computeIfAbsent (sTransaction, k -> new MultiTreeMapArrayListBased <> ())
                        .putSingle (sContext, new RuleAssertion (sRuleID, sMessage, sSeverity));
      }
    }

    if (m_aAbstractRules.isEmpty ())
      throw new IllegalStateException ("No abstract rules found!");

    // Now iterate and assemble Schematron
    for (final Map.Entry <String, IMultiMapListBased <String, RuleAssertion>> aRuleEntry : m_aAbstractRules.entrySet ())
    {
      final String sTransaction = aRuleEntry.getKey ();
      final File aSCHFile = aBusinessRule.getSchematronAbstractFile ();
      LOGGER.info ("    Writing abstract Schematron file " +
                   aSCHFile.getName () +
                   " with " +
                   aRuleEntry.getValue ().getTotalValueCount () +
                   " rule(s)");

      // Create the XML content
      final IMicroDocument aDoc = new MicroDocument ();
      aDoc.appendComment ("This file is generated automatically! Do NOT edit!\n" +
                          "Abstract Schematron rules for " +
                          sTransaction);
      final IMicroElement ePattern = aDoc.appendElement (NS_SCHEMATRON, "pattern");
      ePattern.setAttribute ("abstract", "true");
      ePattern.setAttribute ("id", sTransaction);
      for (final Map.Entry <String, ICommonsList <RuleAssertion>> aPatternEntry : aRuleEntry.getValue ().entrySet ())
      {
        final String sContext = '$' + Utils.makeID (aPatternEntry.getKey ());
        final IMicroElement eRule = ePattern.appendElement (NS_SCHEMATRON, "rule");
        eRule.setAttribute ("context", sContext);

        for (final RuleAssertion aRuleAssertion : aPatternEntry.getValue ())
        {
          final String sTestID = aRuleAssertion.getRuleID ();
          final IMicroElement eAssert = eRule.appendElement (NS_SCHEMATRON, "assert");
          eAssert.setAttribute ("flag", aRuleAssertion.getSeverity ());
          eAssert.setAttribute ("test", "$" + sTestID);
          eAssert.setAttribute ("id", sTestID);
          eAssert.appendText ("[" + sTestID + "]-" + aRuleAssertion.getMessage ());
        }
      }
      if (SimpleFileIO.writeFile (aSCHFile, MicroWriter.getNodeAsBytes (aDoc)).isFailure ())
        throw new IllegalStateException ("Failed to write " + aSCHFile);
    }
  }

  private static boolean _containsRuleID (@Nonnull final ICommonsList <RuleParam> aRuleParams,
                                          @Nullable final String sRuleID)
  {
    return aRuleParams.containsAny (x -> x.getRuleID ().equals (sRuleID));
  }

  private void _extractBindingTests (final RuleSourceBusinessRule aBusinessRule, @Nonnull final Sheet aSheet)
  {
    final String sBindingName = aSheet.getSheetName ();
    LOGGER.info ("    Handling sheet for binding '" + sBindingName + "'");
    final IMultiMapListBased <String, RuleParam> aRules = new MultiHashMapArrayListBased <> ();

    // Skip 1 line
    int nRowIndex = 1;
    while (true)
    {
      // Read a single excel row
      final org.apache.poi.ss.usermodel.Row aExcelRow = aSheet.getRow (nRowIndex++);
      if (aExcelRow == null)
        break;

      final String sTransaction = Utils.getString (aExcelRow.getCell (0));
      final String sRuleID = Utils.getString (aExcelRow.getCell (1));
      String sTest = Utils.getString (aExcelRow.getCell (2));
      final String sPrerequisite = Utils.getString (aExcelRow.getCell (3));

      if (StringHelper.hasNoText (sRuleID))
      {
        // Last line reached
        break;
      }

      if (StringHelper.hasText (sPrerequisite))
        sTest = "(" + sPrerequisite + " and " + sTest + ") or not (" + sPrerequisite + ")";

      aRules.putSingle (sTransaction, new RuleParam (sRuleID, sTest));
    }

    // Check if all required rules derived from the abstract rules are present
    for (final Map.Entry <String, IMultiMapListBased <String, RuleAssertion>> aEntryTransaction : m_aAbstractRules.entrySet ())
    {
      final String sTransaction = aEntryTransaction.getKey ();
      final ICommonsList <RuleParam> aFoundRules = aRules.get (sTransaction);
      if (aFoundRules == null)
        throw new IllegalStateException ("Found no rules for transaction " +
                                         sTransaction +
                                         " and binding " +
                                         sBindingName);
      for (final Map.Entry <String, ICommonsList <RuleAssertion>> aEntryContext : aEntryTransaction.getValue ()
                                                                                                   .entrySet ())
      {
        final String sContext = aEntryContext.getKey ();
        if (!_containsRuleID (aFoundRules, Utils.makeID (sContext)))
        {
          // Create an invalid context
          LOGGER.warn ("      Missing parameter for context '" + sContext + "'");
          aRules.putSingle (sTransaction, new RuleParam (sContext, "//NonExistingDummyNode"));
        }
        for (final RuleAssertion aRuleAssertion : aEntryContext.getValue ())
        {
          final String sRuleID = aRuleAssertion.getRuleID ();
          if (!_containsRuleID (aFoundRules, sRuleID))
          {
            // No test needed
            LOGGER.warn ("      Missing parameter for rule '" + sRuleID + "'");
            aRules.putSingle (sTransaction, new RuleParam (sRuleID, "./false"));
          }
        }
      }
    }

    // Now iterate rules and assemble Schematron
    for (final Map.Entry <String, ICommonsList <RuleParam>> aRuleEntry : aRules.entrySet ())
    {
      final String sTransaction = aRuleEntry.getKey ();
      final File aSCHFile = aBusinessRule.getSchematronBindingFile (sBindingName);
      LOGGER.info ("      Writing " +
                   sBindingName +
                   " Schematron file " +
                   aSCHFile.getName () +
                   " for transaction " +
                   sTransaction +
                   " with " +
                   aRuleEntry.getValue ().size () +
                   " test(s)");

      final IMicroDocument aDoc = new MicroDocument ();
      aDoc.appendComment ("This file is generated automatically! Do NOT edit!\n" +
                          "Schematron tests for binding " +
                          sBindingName +
                          " and transaction " +
                          sTransaction);
      final IMicroElement ePattern = aDoc.appendElement (NS_SCHEMATRON, "pattern");
      // Assign to the global pattern
      ePattern.setAttribute ("is-a", sTransaction);
      ePattern.setAttribute ("id", sBindingName.toUpperCase (Locale.US) + "-" + sTransaction);

      // Longest name must come first (ensure that in the ODS)
      final ICommonsList <RuleParam> aRuleParams = aRuleEntry.getValue ();
      if (false)
        aRuleParams.getSorted (Comparator.comparing (RuleParam::getRuleID,
                                                     IComparator.getComparatorStringLongestFirst ()));
      for (final RuleParam aRuleParam : aRuleParams)
      {
        final IMicroElement eParam = ePattern.appendElement (NS_SCHEMATRON, "param");
        eParam.setAttribute ("name", aRuleParam.getRuleID ());
        eParam.setAttribute ("value", aRuleParam.getTest ());
      }

      if (SimpleFileIO.writeFile (aSCHFile, MicroWriter.getNodeAsBytes (aDoc)).isFailure ())
        throw new IllegalStateException ("Failed to write " + aSCHFile);
    }
  }

  private static void _createAssemblyFiles (@Nonnull final RuleSourceBusinessRule aBusinessRule,
                                            @Nonnull final Workbook aSpreadSheet,
                                            @Nonnull final ICommonsOrderedMap <String, String> aDefaultNamespaces)
  {
    // Create assembled Schematron
    LOGGER.info ("    Creating assembly Schematron file(s)");
    final Sheet aLastSheet = aSpreadSheet.getSheetAt (aSpreadSheet.getNumberOfSheets () - 1);

    // Skip 1 line
    int nRowIndex = 1;
    while (true)
    {
      // Read a single excel row
      final org.apache.poi.ss.usermodel.Row aExcelRow = aLastSheet.getRow (nRowIndex++);
      if (aExcelRow == null)
        break;

      // cell 0 (profile) is optional!
      final String sProfile = Utils.getString (aExcelRow.getCell (0));
      if (StringHelper.hasText (sProfile))
        throw new IllegalStateException ("Profile currently not supported! Found '" + sProfile + "'");
      final String sTransaction = Utils.getString (aExcelRow.getCell (1));
      final String sBindingName = Utils.getString (aExcelRow.getCell (2));
      final String sNamespaceURI = Utils.getString (aExcelRow.getCell (4));
      if (StringHelper.hasNoText (sNamespaceURI))
        throw new IllegalStateException ("Missing namespace URI");

      final File aSCHFile = aBusinessRule.getSchematronAssemblyFile (sBindingName);
      LOGGER.info ("      Writing " + sBindingName + " Schematron assembly file " + aSCHFile.getName ());

      final String sBindingPrefix = sBindingName.toLowerCase (Locale.US);
      final String sBindingUC = sBindingName.toUpperCase (Locale.US);

      final ICommonsOrderedMap <String, String> aNsMap = aDefaultNamespaces.getClone ();
      aNsMap.put (sBindingPrefix, sNamespaceURI);

      final IMicroDocument aDoc = new MicroDocument ();
      aDoc.appendComment ("This file is generated automatically! Do NOT edit!\n" +
                          "Schematron assembly for " +
                          aBusinessRule.getID () +
                          " using binding " +
                          sBindingName +
                          " and transaction " +
                          sTransaction +
                          " based on " +
                          aBusinessRule.getSourceFile ().getName ());
      final IMicroElement eSchema = aDoc.appendElement (NS_SCHEMATRON, "schema");
      eSchema.setAttribute ("queryBinding", "xslt2");
      eSchema.appendElement (NS_SCHEMATRON, "title")
             .appendText (aBusinessRule.getID () + " " + sTransaction + " bound to " + sBindingName);

      for (final Map.Entry <String, String> aEntry : aNsMap.entrySet ())
        eSchema.appendElement (NS_SCHEMATRON, "ns")
               .setAttribute ("prefix", aEntry.getKey ())
               .setAttribute ("uri", aEntry.getValue ());

      // Phases
      IMicroElement ePhase = eSchema.appendElement (NS_SCHEMATRON, "phase");
      ePhase.setAttribute ("id", aBusinessRule.getID () + "_" + sTransaction + "_phase");
      ePhase.appendElement (NS_SCHEMATRON, "active").setAttribute ("pattern", sBindingUC + "-" + sTransaction);
      if (aBusinessRule.hasCodeList ())
      {
        ePhase = eSchema.appendElement (NS_SCHEMATRON, "phase");
        ePhase.setAttribute ("id", "codelist_phase");
        ePhase.appendElement (NS_SCHEMATRON, "active").setAttribute ("pattern", "Codes-" + sTransaction);
      }

      // Includes
      IMicroElement eInclude = eSchema.appendElement (NS_SCHEMATRON, "include");
      eInclude.setAttribute ("href", "include/" + aBusinessRule.getSchematronAbstractFile ().getName ());
      if (aBusinessRule.hasCodeList ())
      {
        eInclude = eSchema.appendElement (NS_SCHEMATRON, "include");
        eInclude.setAttribute ("href", "include/" + aBusinessRule.getSchematronCodeListFile ().getName ());
      }
      eInclude = eSchema.appendElement (NS_SCHEMATRON, "include");
      eInclude.setAttribute ("href",
                             "include/" +
                                     aBusinessRule.getSchematronBindingFile (sBindingName).getName ());

      final IXMLWriterSettings aXWS = new XMLWriterSettings ().setNamespaceContext (new MapBasedNamespaceContext (aNsMap));
      if (SimpleFileIO.writeFile (aSCHFile, MicroWriter.getNodeAsBytes (aDoc, aXWS)).isFailure ())
        throw new IllegalStateException ("Failed to write " + aSCHFile);

      // Remember file for XSLT creation
      aBusinessRule.addResultSchematronFile (aSCHFile, sBindingPrefix, sNamespaceURI);
    }
  }

  public static void createSchematrons (@Nonnull final ICommonsList <RuleSourceItem> aRuleSourceItems,
                                        @Nonnull final ICommonsOrderedMap <String, String> aDefaultNamespaces) throws Exception
  {
    for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
    {
      LOGGER.info ("Creating Schematron files for " + aRuleSourceItem.getID ());

      // Process all business rule files
      for (final RuleSourceBusinessRule aBusinessRule : aRuleSourceItem.getAllBusinessRules ())
      {
        // Read ODS file
        LOGGER.info ("  Reading business rule source file " + aBusinessRule.getSourceFile ());
        final Workbook aSpreadSheet = EExcelVersion.XLSX.readWorkbook (FileHelper.getBufferedInputStream (aBusinessRule.getSourceFile ()));

        final SchematronCreator aSC = new SchematronCreator ();

        // Read abstract rules
        aSC._extractAbstractRules (aBusinessRule, aSpreadSheet);

        // Skip the first sheet (abstract rules) and skip the last sheet
        // (transaction information)
        for (int nSheetIndex = 1; nSheetIndex < aSpreadSheet.getNumberOfSheets () - 1; ++nSheetIndex)
        {
          final Sheet aSheet = aSpreadSheet.getSheetAt (nSheetIndex);
          aSC._extractBindingTests (aBusinessRule, aSheet);
        }

        _createAssemblyFiles (aBusinessRule, aSpreadSheet, aDefaultNamespaces);
      }
    }
  }
}
