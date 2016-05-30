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
package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;
import java.util.Map;
import java.util.Set;

import javax.annotation.Nonnull;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;

import org.odftoolkit.simple.SpreadsheetDocument;
import org.odftoolkit.simple.table.Table;
import org.w3c.dom.Document;

import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.CommonsHashMap;
import com.helger.commons.collection.ext.CommonsTreeMap;
import com.helger.commons.collection.ext.CommonsTreeSet;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.collection.ext.ICommonsMap;
import com.helger.commons.collection.ext.ICommonsSortedMap;
import com.helger.commons.collection.ext.ICommonsSortedSet;
import com.helger.commons.debug.GlobalDebug;
import com.helger.commons.io.file.FileOperations;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.string.StringHelper;
import com.helger.commons.xml.XMLFactory;
import com.helger.commons.xml.serialize.write.XMLWriter;
import com.helger.commons.xml.serialize.write.XMLWriterSettings;
import com.helger.commons.xml.transform.DefaultTransformURIResolver;
import com.helger.commons.xml.transform.TransformSourceFactory;
import com.helger.commons.xml.transform.XMLTransformerFactory;
import com.helger.cva.CVA10Marshaller;
import com.helger.cva.v10.Context;
import com.helger.cva.v10.ContextValueAssociation;
import com.helger.cva.v10.Contexts;
import com.helger.cva.v10.Message;
import com.helger.cva.v10.ValueList;
import com.helger.cva.v10.ValueLists;
import com.helger.genericode.Genericode10CodeListMarshaller;
import com.helger.genericode.Genericode10Helper;
import com.helger.genericode.v10.CodeListDocument;
import com.helger.genericode.v10.Column;
import com.helger.genericode.v10.ColumnSet;
import com.helger.genericode.v10.Identification;
import com.helger.genericode.v10.Row;
import com.helger.genericode.v10.SimpleCodeList;
import com.helger.genericode.v10.UseType;
import com.helger.genericode.v10.Value;
import com.helger.peppol.validation.supplementary.createrules.codelist.CVAContextData;
import com.helger.peppol.validation.supplementary.createrules.codelist.CVAData;
import com.helger.peppol.validation.supplementary.createrules.util.CreateHelper;
import com.helger.peppol.validation.supplementary.createrules.util.ODFHelper;
import com.helger.peppol.validation.supplementary.createrules.util.SpreadsheetCache;

/**
 * This tool creates all the CVA and GC files that can be extracted from the
 * code list files. The target directory for these files is
 * src/test/resources/codelist-generated
 *
 * @author Philip Helger
 */
public final class Main1CreateCodeLists
{
  // Base directory for source rules
  private static final File TARGET_DIR = new File ("src/test/resources/codelist-generated");

  private static Templates s_aCVA2SCH;

  @Nonnull
  private static File _getCVAFile (@Nonnull final String sPrefix, @Nonnull final String sTransaction)
  {
    final File ret = new File (TARGET_DIR, "cva/" + sPrefix + "-" + sTransaction + ".cva");
    FileOperations.createDirIfNotExisting (ret.getParentFile ());
    return ret;
  }

  @Nonnull
  private static File _getGCFile (@Nonnull final String sPrefix, @Nonnull final String sCodeListName)
  {
    final File ret = new File (TARGET_DIR, "gc/" + sPrefix + "-" + sCodeListName + ".gc");
    FileOperations.createDirIfNotExisting (ret.getParentFile ());
    return ret;
  }

  @Nonnull
  private static File _getXSLTFile (@Nonnull final String sPrefix, @Nonnull final String sTransaction)
  {
    final File ret = new File (TARGET_DIR, "cva-xslt/" + sPrefix + "-" + sTransaction + ".xslt");
    FileOperations.createDirIfNotExisting (ret.getParentFile ());
    return ret;
  }

  /**
   * @param aSpreadsheet
   *        ODS spreadsheet
   * @param aCVAs
   * @return A set with all required code list names, references from the CVA
   *         sheet
   */
  @Nonnull
  private static Set <String> _createCVAData (@Nonnull final String sPrefix,
                                              @Nonnull final SpreadsheetDocument aSpreadsheet,
                                              @Nonnull final Map <String, CVAData> aCVAs)
  {
    final Table aCVASheet = aSpreadsheet.getSheetByName ("CVA");
    if (aCVASheet == null)
      throw new IllegalStateException ("No 'CVA' sheet found!");

    CreateHelper.log ("  Reading CVA data");
    int nRow = 2;
    final ICommonsSortedSet <String> aAllReferencedCodeListNames = new CommonsTreeSet <> ();
    while (!ODFHelper.isEmpty (aCVASheet, 0, nRow))
    {
      final String sTransaction = ODFHelper.getText (aCVASheet, 0, nRow);
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
      CVAData aCVAData = aCVAs.get (sTransaction);
      if (aCVAData == null)
      {
        aCVAData = new CVAData (sTransaction);
        aCVAs.put (sTransaction, aCVAData);
      }
      aCVAData.addContext (sID, sItem, sCodeListName, sSeverity, sMessage);

      // Remember that we require a code list
      aAllReferencedCodeListNames.add (sCodeListName);

      ++nRow;
    }

    // Start creating CVA files (for each transaction)
    for (final CVAData aCVAData : aCVAs.values ())
    {
      final File aCVAFile = _getCVAFile (sPrefix, aCVAData.getTransaction ());
      CreateHelper.log ("    Creating " + aCVAFile.getName ());

      final ContextValueAssociation aCVA = new ContextValueAssociation ();
      aCVA.setName (FilenameHelper.getBaseName (aCVAFile));

      // Create ValueLists
      final ICommonsMap <String, ValueList> aValueListMap = new CommonsHashMap <> ();
      final ValueLists aValueLists = new ValueLists ();
      // Emit only the code lists, that are used in the contexts
      for (final String sCodeListName : aCVAData.getAllUsedCodeListNames ())
      {
        final ValueList aValueList = new ValueList ();
        aValueList.setId (sCodeListName);
        // Relative path to GC file
        aValueList.setUri ("../gc/" + _getGCFile (sPrefix, sCodeListName).getName ());
        aValueLists.addValueList (aValueList);
        aValueListMap.put (aValueList.getId (), aValueList);
      }
      aCVA.setValueLists (aValueLists);

      // Create Contexts
      final Contexts aContexts = new Contexts ();
      for (final CVAContextData aCVAContextData : aCVAData.getAllContexts ())
      {
        final Context aContext = new Context ();
        aContext.setAddress (aCVAContextData.getItem ());
        aContext.addValues (aValueListMap.get (aCVAContextData.getCodeListName ()));
        aContext.setMark (aCVAContextData.getSeverity ());
        final Message aMessage = new Message ();
        aMessage.addContent ("[" + aCVAContextData.getID () + "]-" + aCVAContextData.getMessage ());
        aContext.addMessage (aMessage);
        aContexts.addContext (aContext);
      }
      aCVA.setContexts (aContexts);

      // to File
      FileOperations.createDirIfNotExisting (aCVAFile.getParentFile ());
      if (new CVA10Marshaller ().write (aCVA, aCVAFile).isFailure ())
        throw new IllegalStateException ("Failed to write " + aCVAFile);
    }

    return aAllReferencedCodeListNames;
  }

  private static void _createCVAandGC (@Nonnull final String sPrefix,
                                       @Nonnull final SpreadsheetDocument aSpreadsheet,
                                       @Nonnull final Map <String, CVAData> aCVAs) throws Exception
  {
    // Handle CVA sheets
    final Set <String> aAllReferencedCodeListNames = _createCVAData (sPrefix, aSpreadsheet, aCVAs);
    if (aAllReferencedCodeListNames.isEmpty ())
      throw new IllegalStateException ("CVA was not referencing any code list!");

    // Jut in case of error
    final ICommonsList <String> aAvailableSheets = new CommonsArrayList <> ();
    for (int i = 0; i < aSpreadsheet.getSheetCount (); ++i)
      aAvailableSheets.add (aSpreadsheet.getSheetByIndex (i).getTableName ());

    // Create only the GC files that are referenced from the CVA sheet
    CreateHelper.log ("  Reading codelists");
    for (final String sCodeListName : aAllReferencedCodeListNames)
    {
      final Table aSheet = aSpreadsheet.getSheetByName (sCodeListName);
      if (aSheet == null)
      {
        // E.g. for 'EvidenceTypeCode'
        CreateHelper.warn ("Failed to resolve sheet with name '" + sCodeListName + "' in: " + aAvailableSheets);
        continue;
      }

      final File aGCFile = _getGCFile (sPrefix, sCodeListName);
      CreateHelper.log ("    Creating " + aGCFile.getName ());

      // Read data
      final String sShortname = ODFHelper.getText (aSheet, 1, 0);
      final String sVersion = ODFHelper.getText (aSheet, 1, 2);
      final String sLocationURI = ODFHelper.getText (aSheet, 1, 3);
      final String sAgency = ODFHelper.getText (aSheet, 1, 4);

      // Start creating Genericode
      final CodeListDocument aGC = new CodeListDocument ();

      // create identification
      final Identification aIdentification = new Identification ();
      aIdentification.setShortName (Genericode10Helper.createShortName (sShortname));
      aIdentification.setVersion (sVersion);
      aIdentification.setCanonicalUri (sAgency);
      aIdentification.setCanonicalVersionUri (StringHelper.getConcatenatedOnDemand (sAgency, '-', sVersion));
      aIdentification.addLocationUri (sLocationURI);
      aGC.setIdentification (aIdentification);

      // Build column set
      final ColumnSet aColumnSet = new ColumnSet ();
      final Column aCodeColumn = Genericode10Helper.createColumn ("code",
                                                                  UseType.REQUIRED,
                                                                  "Code",
                                                                  null,
                                                                  "normalizedString");
      final Column aNameColumn = Genericode10Helper.createColumn ("name", UseType.OPTIONAL, "Name", null, "string");
      aColumnSet.addColumnChoice (aCodeColumn);
      aColumnSet.addColumnChoice (aNameColumn);
      aColumnSet.addKeyChoice (Genericode10Helper.createKey ("codeKey", "CodeKey", null, aCodeColumn));
      aGC.setColumnSet (aColumnSet);

      // Find start row
      int nRow = 0;
      while (!ODFHelper.isEmpty (aSheet, 0, nRow))
        nRow++;
      // Now we are at the empty row - skip 2 more
      nRow += 2;

      // Add values
      final SimpleCodeList aSimpleCodeList = new SimpleCodeList ();
      while (!ODFHelper.isEmpty (aSheet, 0, nRow))
      {
        final String sCode = ODFHelper.getText (aSheet, 0, nRow);
        final String sValue = ODFHelper.getText (aSheet, 1, nRow);

        final Row aRow = new Row ();
        Value aValue = new Value ();
        aValue.setColumnRef (aCodeColumn);
        aValue.setSimpleValue (Genericode10Helper.createSimpleValue (sCode));
        aRow.addValue (aValue);

        aValue = new Value ();
        aValue.setColumnRef (aNameColumn);
        aValue.setSimpleValue (Genericode10Helper.createSimpleValue (sValue));
        aRow.addValue (aValue);

        aSimpleCodeList.addRow (aRow);

        ++nRow;
      }
      aGC.setSimpleCodeList (aSimpleCodeList);

      if (new Genericode10CodeListMarshaller ().write (aGC, aGCFile).isFailure ())
        throw new IllegalStateException ("Failed to write " + aGCFile);
    }
  }

  private static void _createSchematronXSLTs (@Nonnull final String sPrefix,
                                              @Nonnull final Map <String, CVAData> aCVAs) throws TransformerException
  {
    CreateHelper.log ("  Converting CVA files to Schematron XSLT");
    // Create only once (caching)
    if (s_aCVA2SCH == null)
    {
      final TransformerFactory aTF = XMLTransformerFactory.createTransformerFactory (null,
                                                                                     new DefaultTransformURIResolver ());
      s_aCVA2SCH = aTF.newTemplates (TransformSourceFactory.create (new File ("src/test/resources/rule-utils/Crane-cva2schXSLT.xsl")));
    }

    // Convert the CVA files for all transactions
    for (final Map.Entry <String, CVAData> aEntry : CollectionHelper.getSortedByKey (aCVAs).entrySet ())
    {
      final String sTransaction = aEntry.getKey ();
      final File aCVAFile = _getCVAFile (sPrefix, sTransaction);
      final File aResultXSLT = _getXSLTFile (sPrefix, sTransaction);

      final ICommonsList <String> aMissingCodeLists = new CommonsArrayList <> ();
      for (final String sCodeListName : aEntry.getValue ().getAllUsedCodeListNames ())
        if (!_getGCFile (sPrefix, sCodeListName).exists ())
          aMissingCodeLists.add (sCodeListName);

      if (!aMissingCodeLists.isEmpty ())
      {
        CreateHelper.warn ("    Not Creating " +
                           aResultXSLT.getName () +
                           " because certain codelists are missing: " +
                           aMissingCodeLists);
        continue;
      }

      CreateHelper.log ("    Creating " + aResultXSLT.getName ());
      final Transformer aTransformer = s_aCVA2SCH.newTransformer ();

      final Document aSCHDoc = XMLFactory.newDocument ();
      aTransformer.transform (TransformSourceFactory.create (aCVAFile), new DOMResult (aSCHDoc));

      SimpleFileIO.writeFile (aResultXSLT, XMLWriter.getXMLString (aSCHDoc), XMLWriterSettings.DEFAULT_XML_CHARSET_OBJ);
    }
  }

  public static void main (final String [] args) throws Exception
  {
    GlobalDebug.setDebugModeDirect (false);

    for (final String [] aCodeList : new String [] [] { { "BIIRULES",
                                                          "biirules/businessrules/bii2rules-CodeLists-v04.ods" },
                                                        { "OPENPEPPOL",
                                                          "peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods" } })
    {
      final String sPrefix = aCodeList[0];
      final File aCodeListFile = new File ("src/test/resources/rule-source", aCodeList[1]);

      // Read ODS file
      final SpreadsheetDocument aSpreadsheet = SpreadsheetCache.readSpreadsheet (aCodeListFile);

      /** From transaction to CVAData */
      final ICommonsSortedMap <String, CVAData> aCVAs = new CommonsTreeMap <> ();

      _createCVAandGC (sPrefix, aSpreadsheet, aCVAs);

      // Because of unresolved code lists
      _createSchematronXSLTs (sPrefix, aCVAs);
    }
  }
}
