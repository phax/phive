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
package com.helger.bdve.peppol.supplementary.createrules.sch;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.odftoolkit.simple.SpreadsheetDocument;
import org.odftoolkit.simple.table.Table;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.bdve.peppol.supplementary.createrules.ESyntaxBinding;
import com.helger.bdve.peppol.supplementary.createrules.RuleSourceItem;
import com.helger.bdve.peppol.supplementary.createrules.util.CreateHelper;
import com.helger.bdve.peppol.supplementary.createrules.util.ODFHelper;
import com.helger.bdve.peppol.supplementary.createrules.util.SpreadsheetCache;
import com.helger.collection.multimap.IMultiMapListBased;
import com.helger.collection.multimap.MultiHashMapArrayListBased;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.StringParser;
import com.helger.schematron.CSchematron;
import com.helger.xml.microdom.IMicroDocument;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroDocument;
import com.helger.xml.microdom.serialize.MicroWriter;

@Immutable
public final class RuleSchematronCreator
{
  private static final class PrerequesiteCache
  {
    private int m_nLastID = 0;
    // Map from String to ID
    private final ICommonsMap <String, String> m_aMap = new CommonsHashMap <> ();

    @Nonnull
    @Nonempty
    private String _createNextPrerequisiteVarName ()
    {
      return "Prerequisite" + (++m_nLastID);
    }

    @Nullable
    public String getPrerequisiteVarName (@Nullable final String sPrerequisite)
    {
      if (StringHelper.hasNoText (sPrerequisite))
        return null;

      String sID = m_aMap.get (sPrerequisite);
      if (sID == null)
      {
        sID = _createNextPrerequisiteVarName ();
        m_aMap.put (sPrerequisite, sID);
      }
      return sID;
    }

    @Nonnull
    @ReturnsMutableCopy
    public ICommonsMap <String, String> getAllSortedByID ()
    {
      return CollectionHelper.getSortedByValue (m_aMap);
    }
  }

  private static final Logger s_aLogger = LoggerFactory.getLogger (RuleSchematronCreator.class);

  private static final String NS_SCHEMATRON = CSchematron.NAMESPACE_SCHEMATRON;
  private static final boolean USE_LETS = false;

  private final PrerequesiteCache m_aPrereqCache = new PrerequesiteCache ();

  // Map from transaction to Map from context to list of assertions
  private final ICommonsMap <String, IMultiMapListBased <String, RuleAssertion>> m_aAbstractRules = new CommonsHashMap <> ();

  private RuleSchematronCreator ()
  {}

  private void _readAbstractRules (@Nonnull final SpreadsheetDocument aSpreadSheet)
  {
    final Table aFirstSheet = aSpreadSheet.getSheetByIndex (0);
    int nRow = 1;
    while (!ODFHelper.isEmpty (aFirstSheet, 0, nRow))
    {
      // Read ODF data of the current row
      final String sRuleID = ODFHelper.getText (aFirstSheet, 0, nRow);
      final String sMessage = ODFHelper.getText (aFirstSheet, 1, nRow);
      final String sContext = ODFHelper.getText (aFirstSheet, 2, nRow);
      final String sSeverity = ODFHelper.getText (aFirstSheet, 3, nRow);
      final String sTransaction = ODFHelper.getText (aFirstSheet, 4, nRow);
      final String sIsObsolete = ODFHelper.getText (aFirstSheet, 9, nRow);
      if (StringParser.parseBool (sIsObsolete))
      {
        s_aLogger.info ("Skipping obsolete rule '" + sRuleID + "'");
      }
      else
      {
        // Save in nested maps
        IMultiMapListBased <String, RuleAssertion> aTransactionRules = m_aAbstractRules.get (sTransaction);
        if (aTransactionRules == null)
        {
          aTransactionRules = new MultiHashMapArrayListBased <> ();
          m_aAbstractRules.put (sTransaction, aTransactionRules);
        }
        aTransactionRules.putSingle (sContext, new RuleAssertion (sRuleID, sMessage, sSeverity));
      }

      // Next row
      ++nRow;
    }

    if (m_aAbstractRules.isEmpty ())
      throw new IllegalStateException ("No abstract rules found!");
  }

  private void _writeAbstractRules (@Nonnull final RuleSourceBusinessRule aBusinessRule)
  {
    // Now iterate and assemble abstract Schematron
    for (final Map.Entry <String, IMultiMapListBased <String, RuleAssertion>> aRuleEntry : m_aAbstractRules.entrySet ())
    {
      final String sTransaction = aRuleEntry.getKey ();
      final File aSCHFile = aBusinessRule.getSchematronAbstractFile (sTransaction);
      CreateHelper.log ("    Writing abstract Schematron file " +
                        aSCHFile.getName () +
                        " with " +
                        aRuleEntry.getValue ().getTotalValueCount () +
                        " rule(s)");

      // Create the XML content
      final IMicroDocument aDoc = new MicroDocument ();
      aDoc.appendComment ("This file is generated automatically! Do NOT edit!");
      aDoc.appendComment ("Abstract Schematron rules for " + sTransaction);
      final IMicroElement ePattern = aDoc.appendElement (NS_SCHEMATRON, "pattern");
      ePattern.setAttribute ("abstract", "true");
      ePattern.setAttribute ("id", sTransaction);

      // For all assertions for the current transaction
      for (final Map.Entry <String, ICommonsList <RuleAssertion>> aPatternEntry : CollectionHelper.getSortedByKey (aRuleEntry.getValue ())
                                                                                                  .entrySet ())
      {
        // The element context to use
        final String sContextRef = '$' + CreateHelper.makeID (aPatternEntry.getKey ());
        final IMicroElement eRule = ePattern.appendElement (NS_SCHEMATRON, "rule");
        eRule.setAttribute ("context", sContextRef);

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

  private static boolean _containsRuleID (@Nonnull final List <RuleParam> aRuleParams, @Nullable final String sRuleID)
  {
    for (final RuleParam aRuleParam : aRuleParams)
      if (aRuleParam.getRuleID ().equals (sRuleID))
        return true;
    return false;
  }

  @Nonnull
  @Nonempty
  private IMultiMapListBased <String, RuleParam> _readBindingTests (@Nonnull final Table aSheet,
                                                                    @Nonnull final ESyntaxBinding eBinding)
  {
    CreateHelper.log ("    Handling sheet for binding '" + eBinding.getID () + "'");
    int nRow = 1;
    final IMultiMapListBased <String, RuleParam> aRules = new MultiHashMapArrayListBased <> ();
    while (!ODFHelper.isEmpty (aSheet, 0, nRow))
    {
      final String sTransaction = ODFHelper.getText (aSheet, 0, nRow);
      final String sRuleID = ODFHelper.getText (aSheet, 1, nRow);
      final String sTest = ODFHelper.getText (aSheet, 2, nRow);
      final String sPrerequisite = ODFHelper.getText (aSheet, 3, nRow);

      aRules.putSingle (sTransaction,
                        new RuleParam (sRuleID,
                                       sTest,
                                       sPrerequisite,
                                       m_aPrereqCache.getPrerequisiteVarName (sPrerequisite)));
      nRow++;
    }
    return aRules;
  }

  private void _writeBindingTests (@Nonnull final RuleSourceBusinessRule aBusinessRule,
                                   @Nonnull final ESyntaxBinding eBinding,
                                   @Nonnull final IMultiMapListBased <String, RuleParam> aBindingTests)
  {
    // Check if all required rules derived from the abstract rules are present
    for (final Map.Entry <String, IMultiMapListBased <String, RuleAssertion>> aEntryTransaction : m_aAbstractRules.entrySet ())
    {
      final String sTransaction = aEntryTransaction.getKey ();
      final ICommonsList <RuleParam> aFoundRules = aBindingTests.get (sTransaction);
      if (aFoundRules == null)
        throw new IllegalStateException ("Found no rules for transaction " +
                                         sTransaction +
                                         " and binding " +
                                         eBinding.getID ());

      for (final Map.Entry <String, ICommonsList <RuleAssertion>> aEntryContext : aEntryTransaction.getValue ()
                                                                                                   .entrySet ())
      {
        final String sContext = aEntryContext.getKey ();
        if (!_containsRuleID (aFoundRules, CreateHelper.makeID (sContext)))
        {
          // Create an invalid context
          CreateHelper.warn ("      Missing parameter for context '" + sContext + "'");
          aBindingTests.putSingle (sTransaction, new RuleParam (sContext, "//NonExistingDummyNode"));
        }
        for (final RuleAssertion aRuleAssertion : aEntryContext.getValue ())
        {
          final String sRuleID = aRuleAssertion.getRuleID ();
          if (!_containsRuleID (aFoundRules, sRuleID))
          {
            // No test needed
            CreateHelper.warn ("      Missing parameter for rule '" + sRuleID + "'");
            aBindingTests.putSingle (sTransaction, new RuleParam (sRuleID, "./false"));
          }
        }
      }
    }

    // Now iterate rules and assemble Schematron
    for (final Map.Entry <String, ICommonsList <RuleParam>> aRuleEntry : aBindingTests.entrySet ())
    {
      final String sTransaction = aRuleEntry.getKey ();
      final File aSCHFile = aBusinessRule.getSchematronBindingFile (eBinding, sTransaction);
      CreateHelper.log ("      Writing " +
                        eBinding.getID () +
                        " Schematron file " +
                        aSCHFile.getName () +
                        " for transaction " +
                        sTransaction +
                        " with " +
                        aRuleEntry.getValue ().size () +
                        " test(s)");

      final IMicroDocument aDoc = new MicroDocument ();
      aDoc.appendComment ("This file is generated automatically! Do NOT edit!");
      aDoc.appendComment ("Schematron tests for binding " + eBinding.getID () + " and transaction " + sTransaction);
      final IMicroElement ePattern = aDoc.appendElement (NS_SCHEMATRON, "pattern");
      // Assign to the global pattern
      ePattern.setAttribute ("is-a", sTransaction);
      ePattern.setAttribute ("id", eBinding.getID () + "-" + sTransaction);
      for (final RuleParam aRuleParam : aRuleEntry.getValue ())
      {
        final IMicroElement eParam = ePattern.appendElement (NS_SCHEMATRON, "param");
        eParam.setAttribute ("name", aRuleParam.getRuleID ());
        if (USE_LETS)
          eParam.setAttribute ("value", aRuleParam.getTestWithPrerequisiteParameter ());
        else
          eParam.setAttribute ("value", aRuleParam.getTestWithPrerequisiteInline ());
      }

      if (MicroWriter.writeToFile (aDoc, aSCHFile).isFailure ())
        throw new IllegalStateException ("Failed to write " + aSCHFile);
    }
  }

  private void _writeAssemblyFiles (@Nonnull final RuleSourceItem aRuleSourceItem,
                                    @Nonnull final RuleSourceBusinessRule aBusinessRule,
                                    @Nonnull final SpreadsheetDocument aSpreadSheet)
  {
    // Create assembled Schematron
    CreateHelper.log ("    Creating assembly Schematron file(s)");

    // Last sheet (artifacts)
    final Table aLastSheet = aSpreadSheet.getSheetByIndex (aSpreadSheet.getSheetCount () - 1);
    // Skip one row
    int nRow = 1;
    // cell 0 (profile) is optional!
    while (!ODFHelper.isEmpty (aLastSheet, 1, nRow))
    {
      final String sProfile = ODFHelper.getText (aLastSheet, 0, nRow);
      if (StringHelper.hasText (sProfile))
        throw new IllegalStateException ("Profile currently not supported! Found '" + sProfile + "'");
      final String sTransaction = ODFHelper.getText (aLastSheet, 1, nRow);
      final String sBindingName = ODFHelper.getText (aLastSheet, 2, nRow);
      // String sCodelistFilename= ODFHelper.getText (aLastSheet, 3, nRow);
      final String sNamespace = ODFHelper.getText (aLastSheet, 4, nRow);

      final ESyntaxBinding eBinding = ESyntaxBinding.getFromIDOrNull (sBindingName);
      if (aRuleSourceItem.matchesRequestedSyntaxBinding (eBinding))
      {
        final File aSCHFile = aBusinessRule.getSchematronAssemblyFile (eBinding, sTransaction);
        CreateHelper.log ("      Writing " + sBindingName + " Schematron assembly file " + aSCHFile.getName ());

        final String sBindingPrefix = sBindingName.toLowerCase (Locale.US);
        final String sBindingUC = sBindingName.toUpperCase (Locale.US);

        final IMicroDocument aDoc = new MicroDocument ();
        aDoc.appendComment ("This file is generated automatically! Do NOT edit!");
        aDoc.appendComment ("Schematron assembly for " +
                            aRuleSourceItem.getID () +
                            " using binding " +
                            sBindingName +
                            " and transaction " +
                            sTransaction +
                            " based on " +
                            aBusinessRule.getSourceFile ().getName ());
        final IMicroElement eSchema = aDoc.appendElement (NS_SCHEMATRON, "schema");
        eSchema.setAttribute ("queryBinding", "xslt");
        eSchema.appendElement (NS_SCHEMATRON, "title")
               .appendText (aBusinessRule.getID () + " " + sTransaction + " bound to " + sBindingName);

        // Add all syntax binding namespace mappings
        for (final Map.Entry <String, String> aEntry : eBinding.getAllNamespaces ().entrySet ())
          eSchema.appendElement (NS_SCHEMATRON, "ns")
                 .setAttribute ("prefix", aEntry.getKey ())
                 .setAttribute ("uri", aEntry.getValue ());
        eSchema.appendElement (NS_SCHEMATRON, "ns").setAttribute ("prefix", sBindingPrefix).setAttribute ("uri",
                                                                                                          sNamespace);

        if (USE_LETS)
        {
          // Print all global lets
          for (final Map.Entry <String, String> aEntry : m_aPrereqCache.getAllSortedByID ().entrySet ())
          {
            final IMicroElement eLet = eSchema.appendElement (NS_SCHEMATRON, "let");
            eLet.setAttribute ("name", aEntry.getValue ());
            eLet.setAttribute ("value", aEntry.getKey ());
          }
        }

        // Phases
        IMicroElement ePhase = eSchema.appendElement (NS_SCHEMATRON, "phase");
        ePhase.setAttribute ("id", aBusinessRule.getID () + "_" + sTransaction + "_phase");
        ePhase.appendElement (NS_SCHEMATRON, "active").setAttribute ("pattern", sBindingUC + "-" + sTransaction);
        if (aBusinessRule.hasCodeList ())
        {
          // Codelist phase
          ePhase = eSchema.appendElement (NS_SCHEMATRON, "phase");
          ePhase.setAttribute ("id", "codelist_phase");
          ePhase.appendElement (NS_SCHEMATRON, "active").setAttribute ("pattern", "Codes-" + sTransaction);
        }

        // Includes
        IMicroElement eInclude;
        eInclude = eSchema.appendElement (NS_SCHEMATRON, "include");
        eInclude.setAttribute ("href", "include/" + aBusinessRule.getSchematronAbstractFile (sTransaction).getName ());
        if (aBusinessRule.hasCodeList ())
        {
          eInclude = eSchema.appendElement (NS_SCHEMATRON, "include");
          eInclude.setAttribute ("href", "include/" + aBusinessRule.getSchematronCodeListFile (eBinding).getName ());
        }
        eInclude = eSchema.appendElement (NS_SCHEMATRON, "include");
        eInclude.setAttribute ("href",
                               "include/" + aBusinessRule.getSchematronBindingFile (eBinding, sTransaction).getName ());

        if (MicroWriter.writeToFile (aDoc, aSCHFile).isFailure ())
          throw new IllegalStateException ("Failed to write file " + aSCHFile);

        // Remember file for XSLT creation
        aBusinessRule.addResultSchematronFile (aSCHFile);
      }

      ++nRow;
    }
  }

  public static void createSchematrons (@Nonnull final List <RuleSourceItem> aRuleSourceItems) throws Exception
  {
    for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
    {
      CreateHelper.log ("Creating Schematron files for " + aRuleSourceItem.getID ());

      // Process all business rule files for this rule source item
      for (final RuleSourceBusinessRule aBusinessRule : aRuleSourceItem.getAllBusinessRules ())
      {
        // Read ODS file
        final SpreadsheetDocument aSpreadSheet = SpreadsheetCache.readSpreadsheet (aBusinessRule.getSourceFile ());

        final RuleSchematronCreator aSC = new RuleSchematronCreator ();

        // Read abstract rules before the binding specific rules are read
        aSC._readAbstractRules (aSpreadSheet);
        aSC._writeAbstractRules (aBusinessRule);

        // Read the binding files first, to fill the prerequisite cache
        // Skip the first sheet (abstract rules) and skip the last sheet
        // (transaction information)
        for (int nSheetIndex = 1; nSheetIndex < aSpreadSheet.getSheetCount () - 1; ++nSheetIndex)
        {
          final Table aSheet = aSpreadSheet.getSheetByIndex (nSheetIndex);
          final String sBindingName = aSheet.getTableName ();
          final ESyntaxBinding eBinding = ESyntaxBinding.getFromIDOrNull (sBindingName);
          if (eBinding == null)
            throw new IllegalStateException ("Unsupported syntax binding '" + sBindingName + "'");

          // Use only selected syntaxes (if requested)
          if (aRuleSourceItem.matchesRequestedSyntaxBinding (eBinding))
          {
            // Read all binding specific tests
            final IMultiMapListBased <String, RuleParam> aBindingTests = aSC._readBindingTests (aSheet, eBinding);
            aSC._writeBindingTests (aBusinessRule, eBinding, aBindingTests);
          }
        }

        // Write the assembly files
        aSC._writeAssemblyFiles (aRuleSourceItem, aBusinessRule, aSpreadSheet);
      }
    }
  }
}
