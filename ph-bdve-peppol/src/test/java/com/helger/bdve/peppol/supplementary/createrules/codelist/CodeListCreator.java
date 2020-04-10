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
package com.helger.bdve.peppol.supplementary.createrules.codelist;

import java.io.File;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;

import com.helger.bdve.peppol.supplementary.createrules.utils.Utils;
import com.helger.collection.multimap.MultiTreeMapTreeSetBased;
import com.helger.commons.io.file.FileHelper;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.string.StringHelper;
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
import com.helger.poi.excel.EExcelVersion;
import com.helger.schematron.CSchematron;
import com.helger.xml.XMLFactory;
import com.helger.xml.microdom.IMicroDocument;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroDocument;
import com.helger.xml.microdom.serialize.MicroWriter;
import com.helger.xml.serialize.write.XMLWriter;
import com.helger.xml.transform.DefaultTransformURIResolver;
import com.helger.xml.transform.TransformSourceFactory;
import com.helger.xml.transform.XMLTransformerFactory;

@Immutable
public final class CodeListCreator
{
  private static final Logger LOGGER = LoggerFactory.getLogger (CodeListCreator.class);
  private static final String NS_SCHEMATRON = CSchematron.NAMESPACE_SCHEMATRON;

  private static Templates s_aCVA2SCH;
  // From transaction to CVAData
  private final Map <String, CVAData> m_aCVAs = new TreeMap <> ();
  // From code list name to Set<Code>
  private final MultiTreeMapTreeSetBased <String, String> m_aAllCodes = new MultiTreeMapTreeSetBased <> ();

  public CodeListCreator ()
  {}

  /**
   * @param aCodeList
   *        code list information
   * @param aSpreadSheet
   *        ODS spreadsheet
   * @return A set with all required code list names, references from the CVA
   *         sheet
   */
  @Nonnull
  private Set <String> _readCVAData (@Nonnull final RuleSourceCodeList aCodeList, @Nonnull final Workbook aSpreadSheet)
  {
    final Set <String> aAllReferencedCodeListNames = new HashSet <> ();
    final Sheet aCVASheet = aSpreadSheet.getSheet ("CVA");
    if (aCVASheet == null)
      throw new IllegalStateException ("No CVA sheet found!");

    LOGGER.info ("  Reading CVA data");
    // Skip one row
    int nRowIndex = 1;
    while (true)
    {
      // Read a single excel row
      final org.apache.poi.ss.usermodel.Row aExcelRow = aCVASheet.getRow (nRowIndex++);
      if (aExcelRow == null)
        break;

      final String sTransaction = Utils.getString (aExcelRow.getCell (0));
      final String sID = Utils.getString (aExcelRow.getCell (1));
      String sItem = Utils.getString (aExcelRow.getCell (2));
      final String sScope = Utils.getString (aExcelRow.getCell (3));
      final String sCodeListName = Utils.getString (aExcelRow.getCell (4));
      final String sMessage = Utils.getString (aExcelRow.getCell (5));
      final String sSeverity = Utils.getString (aExcelRow.getCell (6));

      if (StringHelper.hasText (sScope))
        sItem = sScope + "//" + sItem;

      // Save context per transaction
      CVAData aCVAData = m_aCVAs.get (sTransaction);
      if (aCVAData == null)
      {
        aCVAData = new CVAData (sTransaction);
        m_aCVAs.put (sTransaction, aCVAData);
      }
      aCVAData.addContext (sID, sItem, sCodeListName, sSeverity, sMessage);

      // Remember that we require a codelist
      aAllReferencedCodeListNames.add (sCodeListName);

      ++nRowIndex;
    }

    // Start creating CVA files (for each transaction)
    for (final CVAData aCVAData : m_aCVAs.values ())
    {
      final File aCVAFile = aCodeList.getCVAFile (aCVAData.getTransaction ());
      LOGGER.info ("    Creating " + aCVAFile.getName ());

      final ContextValueAssociation aCVA = new ContextValueAssociation ();
      aCVA.setName (FilenameHelper.getBaseName (aCVAFile));

      // Create ValueLists
      final Map <String, ValueList> aValueListMap = new HashMap <> ();
      final ValueLists aValueLists = new ValueLists ();
      // Emit only the code lists, that are used in the contexts
      for (final String sCodeListName : aCVAData.getAllUsedCodeListNames ())
      {
        final ValueList aValueList = new ValueList ();
        aValueList.setId (sCodeListName);
        aValueList.setUri (aCodeList.getGCFile (sCodeListName).getName ());
        aValueLists.getValueList ().add (aValueList);
        aValueListMap.put (aValueList.getId (), aValueList);
      }
      aCVA.setValueLists (aValueLists);

      // Create Contexts
      final Contexts aContexts = new Contexts ();
      for (final CVAContextData aCVAContextData : aCVAData.getAllContexts ())
      {
        final Context aContext = new Context ();
        aContext.setAddress (aCVAContextData.getItem ());
        aContext.getValues ().add (aValueListMap.get (aCVAContextData.getCodeListName ()));
        aContext.setMark (aCVAContextData.getSeverity ());
        final Message aMessage = new Message ();
        aMessage.getContent ().add ("[" + aCVAContextData.getID () + "]-" + aCVAContextData.getMessage ());
        aContext.getMessage ().add (aMessage);
        aContexts.getContext ().add (aContext);
      }
      aCVA.setContexts (aContexts);

      // to XML
      final Document aXML = new CVA10Marshaller ().getAsDocument (aCVA);
      if (aXML == null)
        throw new IllegalStateException ("Failed to convert CVA to XML");

      // to File
      if (SimpleFileIO.writeFile (aCVAFile, XMLWriter.getNodeAsBytes (aXML)).isFailure ())
        throw new IllegalStateException ("Failed to write " + aCVAFile);
    }
    return aAllReferencedCodeListNames;
  }

  @Nonnull
  private void _createCVAandGC (final RuleSourceCodeList aCodeList) throws Exception
  {
    LOGGER.info ("Reading code list file " + aCodeList.getSourceFile ());
    final Workbook aSpreadSheet = EExcelVersion.XLSX.readWorkbook (FileHelper.getBufferedInputStream (aCodeList.getSourceFile ()));

    // Handle CVA sheets
    final Set <String> aAllReferencedCodeListNames = _readCVAData (aCodeList, aSpreadSheet);
    if (aAllReferencedCodeListNames.isEmpty ())
      throw new IllegalStateException ("CVA was not referencing any code list!");

    // Create only the GC files that are referenced from the CVA sheet
    LOGGER.info ("  Reading codelists");
    for (final String sCodeListName : aAllReferencedCodeListNames)
    {
      final Sheet aSheet = aSpreadSheet.getSheet (sCodeListName);
      if (aSheet == null)
        throw new IllegalStateException ("Failed to resolve sheet with name '" + sCodeListName + "'");

      final File aGCFile = aCodeList.getGCFile (sCodeListName);
      LOGGER.info ("    Creating " + aGCFile.getName ());

      final org.apache.poi.ss.usermodel.Row aFirstRow = aSheet.getRow (0);
      if (aFirstRow == null)
        throw new IllegalStateException ("The sheet with name '" + sCodeListName + "' contains no row");

      // Read data
      final String sShortname = Utils.getString (aFirstRow.getCell (0));
      final String sVersion = Utils.getString (aFirstRow.getCell (1));
      final String sAgency = Utils.getString (aFirstRow.getCell (2));
      final String sLocationURI = Utils.getString (aFirstRow.getCell (3));

      // Start creating Genericode
      final CodeListDocument aGC = new CodeListDocument ();

      // create identification
      final Identification aIdentification = new Identification ();
      aIdentification.setShortName (Genericode10Helper.createShortName (sShortname));
      aIdentification.setVersion (sVersion);
      aIdentification.setCanonicalUri (sAgency);
      aIdentification.setCanonicalVersionUri (sAgency + "-" + sVersion);
      aIdentification.getLocationUri ().add (sLocationURI);
      aGC.setIdentification (aIdentification);

      // Build column set
      final ColumnSet aColumnSet = new ColumnSet ();
      final Column aCodeColumn = Genericode10Helper.createColumn ("code",
                                                                  UseType.REQUIRED,
                                                                  "Code",
                                                                  null,
                                                                  "normalizedString");
      final Column aNameColumn = Genericode10Helper.createColumn ("name", UseType.OPTIONAL, "Name", null, "string");
      aColumnSet.getColumnChoice ().add (aCodeColumn);
      aColumnSet.getColumnChoice ().add (aNameColumn);
      aColumnSet.getKeyChoice ().add (Genericode10Helper.createKey ("codeKey", "CodeKey", null, aCodeColumn));
      aGC.setColumnSet (aColumnSet);

      // Add values
      final SimpleCodeList aSimpleCodeList = new SimpleCodeList ();
      // Skip 4 rows
      int nRowIndex = 4;
      while (true)
      {
        // Read a single excel row
        final org.apache.poi.ss.usermodel.Row aExcelRow = aSheet.getRow (nRowIndex++);
        if (aExcelRow == null)
          break;

        final String sCode = Utils.getString (aFirstRow.getCell (0));
        final String sValue = Utils.getString (aFirstRow.getCell (1));

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

        // In code list name, a code is used
        if (m_aAllCodes.putSingle (sCodeListName, sCode).isUnchanged ())
          throw new IllegalStateException ("Found duplicate value '" + sCode + "' in code list " + sCodeListName);
      }
      aGC.setSimpleCodeList (aSimpleCodeList);

      // to XML
      final Document aXML = new Genericode10CodeListMarshaller ().getAsDocument (aGC);
      if (aXML == null)
        throw new IllegalStateException ("Failed to convert CVA to XML");

      // to File
      if (SimpleFileIO.writeFile (aGCFile, XMLWriter.getNodeAsBytes (aXML)).isFailure ())
        throw new IllegalStateException ("Failed to write " + aGCFile);
    }
  }

  private void _createCodelistSchematron (final RuleSourceCodeList aCodeList)
  {
    LOGGER.info ("  Writing Schematron code lists");
    // For all transactions
    for (final Map.Entry <String, CVAData> aEntry : m_aCVAs.entrySet ())
    {
      final String sTransaction = aEntry.getKey ();
      final CVAData aCVAData = aEntry.getValue ();

      final File aSCHFile = aCodeList.getSchematronFile (sTransaction);
      LOGGER.info ("    Creating " + aSCHFile.getName ());

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
        final Set <String> aMatchingCodes = m_aAllCodes.get (aCVAContextData.getCodeListName ());
        // Previously used 007f is an invalid XML character, so we cannot use it
        // safely!
        final char cSep = '\ufffd';
        final String sTest = "contains('" +
                             cSep +
                             StringHelper.getImploded (cSep, aMatchingCodes) +
                             cSep +
                             "',concat('" +
                             cSep +
                             "',.,'" +
                             cSep +
                             "'))";
        eAssert.setAttribute ("test", sTest);
        eAssert.appendText ("[" + aCVAContextData.getID () + "]-" + aCVAContextData.getMessage ());
      }
      if (SimpleFileIO.writeFile (aSCHFile, MicroWriter.getNodeAsBytes (aDoc)).isFailure ())
        throw new IllegalStateException ("Failed to write " + aSCHFile);
    }
  }

  private void _createSchematronXSLTs (final RuleSourceCodeList aCodeList) throws TransformerException
  {
    LOGGER.info ("  Converting CVA files to Schematron XSLT");
    // Create only once (caching)
    if (s_aCVA2SCH == null)
    {
      final TransformerFactory aTF = XMLTransformerFactory.createTransformerFactory (null,
                                                                                     new DefaultTransformURIResolver ());
      s_aCVA2SCH = aTF.newTemplates (TransformSourceFactory.create (new File ("src/test/resources/rule-utils/Crane-cva2schXSLT.xsl")));
    }
    // Convert the CVA files for all transactions
    for (final String sTransaction : m_aCVAs.keySet ())
    {
      final File aCVAFile = aCodeList.getCVAFile (sTransaction);
      final File aResultXSLT = aCodeList.getXSLTFile (sTransaction);
      LOGGER.info ("    Creating " + aResultXSLT.getName ());
      final Transformer aTransformer = s_aCVA2SCH.newTransformer ();
      final Document aSCHDoc = XMLFactory.newDocument ();
      aTransformer.transform (TransformSourceFactory.create (aCVAFile), new DOMResult (aSCHDoc));
      SimpleFileIO.writeFile (aResultXSLT, XMLWriter.getNodeAsBytes (aSCHDoc));
    }
  }

  public void createCodeLists (@Nonnull final RuleSourceCodeList aCodeList) throws Exception
  {
    // Create .CVA and .GC files
    _createCVAandGC (aCodeList);

    // Create Schematron code list files
    _createCodelistSchematron (aCodeList);

    // Convert CVAs to Schematron XSLTs
    // Currently disabled because there is no real sense in it, as we're
    // creating the Schematrons manually
    if (false)
      _createSchematronXSLTs (aCodeList);
  }
}
