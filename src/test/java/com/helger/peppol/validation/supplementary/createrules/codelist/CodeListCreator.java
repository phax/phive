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
package com.helger.peppol.validation.supplementary.createrules.codelist;

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

import org.odftoolkit.simple.SpreadsheetDocument;
import org.odftoolkit.simple.table.Table;
import org.w3c.dom.Document;

import com.helger.commons.collection.multimap.IMultiMapSetBased;
import com.helger.commons.collection.multimap.MultiTreeMapTreeSetBased;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.microdom.IMicroDocument;
import com.helger.commons.microdom.IMicroElement;
import com.helger.commons.microdom.MicroDocument;
import com.helger.commons.microdom.serialize.MicroWriter;
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
import com.helger.peppol.validation.supplementary.createrules.util.CreateHelper;
import com.helger.peppol.validation.supplementary.createrules.util.ODFHelper;
import com.helger.schematron.CSchematron;

@Immutable
public final class CodeListCreator
{
  /**
   * The separator used to separate different code list values.<br>
   * Previously used 0x007f is an invalid XML character, so we cannot use it
   * safely!
   */
  public static final char CODELIST_VALUE_SEPARATOR = '\ufffd';

  private static final String NS_SCHEMATRON = CSchematron.NAMESPACE_SCHEMATRON;

  private static Templates s_aCVA2SCH;
  // From transaction to CVAData
  private final Map <String, CVAData> m_aCVAs = new TreeMap <String, CVAData> ();
  // From code list name to Set<Code>
  private final IMultiMapSetBased <String, String> m_aAllCodes = new MultiTreeMapTreeSetBased <String, String> ();

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
  private Set <String> _createCVAData (@Nonnull final RuleSourceCodeList aCodeList,
                                       @Nonnull final SpreadsheetDocument aSpreadSheet)
  {
    final Set <String> aAllReferencedCodeListNames = new HashSet <String> ();
    final Table aCVASheet = aSpreadSheet.getSheetByName ("CVA");
    if (aCVASheet == null)
      throw new IllegalStateException ("No 'CVA' sheet found!");

    CreateHelper.log ("  Reading CVA data");
    int nRow = 2;
    while (!ODFHelper.isEmpty (aCVASheet, 0, nRow))
    {
      final String sTransaction = ODFHelper.getText (aCVASheet, 0, nRow);
      final String sID = ODFHelper.getText (aCVASheet, 1, nRow);
      String sItem = ODFHelper.getText (aCVASheet, 2, nRow);
      final String sScope = ODFHelper.getText (aCVASheet, 4, nRow);
      final String sCodeListName = ODFHelper.getText (aCVASheet, 6, nRow);
      final String sMessage = ODFHelper.getText (aCVASheet, 7, nRow);
      final String sSeverity = ODFHelper.getText (aCVASheet, 8, nRow);

      if (StringHelper.hasText (sScope))
        sItem = sScope + "/" + sItem;

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

      ++nRow;
    }

    // Start creating CVA files (for each transaction)
    for (final CVAData aCVAData : m_aCVAs.values ())
    {
      final File aCVAFile = aCodeList.getCVAFile (aCVAData.getTransaction ());
      CreateHelper.log ("    Creating " + aCVAFile.getName ());

      final ContextValueAssociation aCVA = new ContextValueAssociation ();
      aCVA.setName (FilenameHelper.getBaseName (aCVAFile));

      // Create ValueLists
      final Map <String, ValueList> aValueListMap = new HashMap <String, ValueList> ();
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

      // to File
      if (new CVA10Marshaller ().write (aCVA, aCVAFile).isFailure ())
        throw new IllegalStateException ("Failed to write " + aCVAFile);
    }
    return aAllReferencedCodeListNames;
  }

  @Nonnull
  private void _createCVAandGC (final RuleSourceCodeList aCodeList) throws Exception
  {
    CreateHelper.log ("Reading code list file " + aCodeList.getSourceFile ());

    // Read ODS file
    final SpreadsheetDocument aSpreadSheet = SpreadsheetDocument.loadDocument (aCodeList.getSourceFile ());

    // Handle CVA sheets
    final Set <String> aAllReferencedCodeListNames = _createCVAData (aCodeList, aSpreadSheet);
    if (aAllReferencedCodeListNames.isEmpty ())
      throw new IllegalStateException ("CVA was not referencing any code list!");

    // Create only the GC files that are referenced from the CVA sheet
    CreateHelper.log ("  Reading codelists");
    for (final String sCodeListName : aAllReferencedCodeListNames)
    {
      final Table aSheet = aSpreadSheet.getSheetByName (sCodeListName);
      if (aSheet == null)
      {
        // E.g. for 'EvidenceTypeCode'
        CreateHelper.warn ("Failed to resolve sheet with name '" + sCodeListName + "'");
        continue;
      }

      final File aGCFile = aCodeList.getGCFile (sCodeListName);
      CreateHelper.log ("    Creating " + aGCFile.getName ());

      // Read data
      final String sShortname = ODFHelper.getText (aSheet, 0, 1);
      final String sVersion = ODFHelper.getText (aSheet, 1, 1);
      final String sAgency = ODFHelper.getText (aSheet, 2, 1);
      final String sLocationURI = ODFHelper.getText (aSheet, 3, 1);

      // Start creating Genericode
      final CodeListDocument aGC = new CodeListDocument ();

      // create identification
      final Identification aIdentification = new Identification ();
      aIdentification.setShortName (Genericode10Helper.createShortName (sShortname));
      aIdentification.setVersion (sVersion);
      aIdentification.setCanonicalUri (sAgency);
      aIdentification.setCanonicalVersionUri (StringHelper.getConcatenatedOnDemand (sAgency, '-', sVersion));
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
      int nRow = 4;
      while (!ODFHelper.isEmpty (aSheet, 0, nRow))
      {
        final String sCode = ODFHelper.getText (aSheet, 0, nRow);
        final String sValue = ODFHelper.getText (aSheet, 1, nRow);

        final Row aRow = new Row ();
        Value aValue = new Value ();
        aValue.setColumnRef (aCodeColumn);
        aValue.setSimpleValue (Genericode10Helper.createSimpleValue (sCode));
        aRow.getValue ().add (aValue);

        aValue = new Value ();
        aValue.setColumnRef (aNameColumn);
        aValue.setSimpleValue (Genericode10Helper.createSimpleValue (sValue));
        aRow.getValue ().add (aValue);

        aSimpleCodeList.getRow ().add (aRow);

        // In code list name, a code is used
        if (m_aAllCodes.putSingle (sCodeListName, sCode).isUnchanged ())
          throw new IllegalStateException ("Found duplicate value '" + sCode + "' in code list " + sCodeListName);

        ++nRow;
      }
      aGC.setSimpleCodeList (aSimpleCodeList);

      // to XML
      final Document aXML = new Genericode10CodeListMarshaller ().write (aGC);
      if (aXML == null)
        throw new IllegalStateException ("Failed to convert CVA to XML");

      // to File
      if (SimpleFileIO.writeFile (aGCFile, XMLWriter.getXMLString (aXML), XMLWriterSettings.DEFAULT_XML_CHARSET_OBJ)
                      .isFailure ())
        throw new IllegalStateException ("Failed to write " + aGCFile);
    }
  }

  private void _createCodelistSchematron (final RuleSourceCodeList aCodeList)
  {
    CreateHelper.log ("  Writing Schematron code lists");
    // For all transactions
    for (final Map.Entry <String, CVAData> aEntry : m_aCVAs.entrySet ())
    {
      final String sTransaction = aEntry.getKey ();
      final CVAData aCVAData = aEntry.getValue ();

      final File aSCHFile = aCodeList.getSchematronFile (sTransaction);
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
        final Set <String> aMatchingCodes = m_aAllCodes.get (aCVAContextData.getCodeListName ());
        final String sTest = "contains('" +
                             CODELIST_VALUE_SEPARATOR +
                             StringHelper.getImploded (CODELIST_VALUE_SEPARATOR, aMatchingCodes) +
                             CODELIST_VALUE_SEPARATOR +
                             "',concat('" +
                             CODELIST_VALUE_SEPARATOR +
                             "',.,'" +
                             CODELIST_VALUE_SEPARATOR +
                             "'))";
        eAssert.setAttribute ("test", sTest);
        eAssert.appendText ("[" + aCVAContextData.getID () + "]-" + aCVAContextData.getMessage ());
      }
      if (SimpleFileIO.writeFile (aSCHFile, MicroWriter.getXMLString (aDoc), XMLWriterSettings.DEFAULT_XML_CHARSET_OBJ)
                      .isFailure ())
        throw new IllegalStateException ("Failed to write " + aSCHFile);
    }
  }

  private void _createSchematronXSLTs (final RuleSourceCodeList aCodeList) throws TransformerException
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
    for (final String sTransaction : m_aCVAs.keySet ())
    {
      final File aCVAFile = aCodeList.getCVAFile (sTransaction);
      final File aResultXSLT = aCodeList.getXSLTFile (sTransaction);
      CreateHelper.log ("    Creating " + aResultXSLT.getName ());
      final Transformer aTransformer = s_aCVA2SCH.newTransformer ();
      final Document aSCHDoc = XMLFactory.newDocument ();
      aTransformer.transform (TransformSourceFactory.create (aCVAFile), new DOMResult (aSCHDoc));
      SimpleFileIO.writeFile (aResultXSLT, XMLWriter.getXMLString (aSCHDoc), XMLWriterSettings.DEFAULT_XML_CHARSET_OBJ);
    }
  }

  public void createCodeLists (final RuleSourceCodeList aCodeList) throws Exception
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
