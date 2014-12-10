/**
 * Copyright (C) 2014 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.junit.Test;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.xml.serialize.DOMReader;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.ubl.UBL21Marshaller;

@Immutable
public final class CTestFiles
{
  private static final List <TestFile> s_aTestFiles = new ArrayList <TestFile> ();

  static
  {
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Use case 1.xml",
                                                       TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Use case 2.xml",
                                                       TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Use case 3.xml",
                                                       TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Use case 4.xml",
                                                       TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Use case 5.xml",
                                                       TransactionKey.CATALOGUE_01_T19));

    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Response use case 1 TP.xml",
                                                       TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Response use case 2 TP.xml",
                                                       TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Response use case 3 TP.xml",
                                                       TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Response use case 4 TP.xml",
                                                       TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS01A/Catalogue Response use case 5 TP.xml",
                                                       TransactionKey.CATALOGUE_01_T58));

    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS03A/UC1_Order.xml", TransactionKey.ORDER_03_T01));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS03A/UC2_Order.xml", TransactionKey.ORDER_03_T01));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS03A/UC3_Order.xml", TransactionKey.ORDER_03_T01));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS03A/UC4_Order.xml", TransactionKey.ORDER_03_T01));

    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS04A/Use Case 1.a_ExampleFile_PEPPOL BIS.xml",
                                                       TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS04A/Use Case 1.b_ExampleFile_PEPPOL BIS.xml",
                                                       TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS04A/Use Case 2_ExampleFile_PEPPOL BIS.xml",
                                                       TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS04A/Use Case 3_ExampleFile_PEPPOL BIS.xml",
                                                       TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS04A/Use Case 4_ExampleFile_PEPPOL BIS.xml",
                                                       TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS04A/Use Case 5_ExampleFile_PEPPOL BIS.xml",
                                                       TransactionKey.INVOICE_04_T10));

    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS05A/Use Case 1.a_CreditNote_PEPPOL BIS.xml",
                                                       TransactionKey.BILLING_05_T14));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS05A/Use Case 1.b_CreditNote_PEPPOL BIS.xml",
                                                       TransactionKey.BILLING_05_T14));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS05A/Use Case 2_CreditNote_PEPPOL BIS.xml",
                                                       TransactionKey.BILLING_05_T14));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS05A/Use Case 3_CreditNote_PEPPOL BIS.xml",
                                                       TransactionKey.BILLING_05_T14));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS05A/Use Case 4_CreditNote_PEPPOL BIS.xml",
                                                       TransactionKey.BILLING_05_T14));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS05A/Use Case 5_CreditNote_PEPPOL BIS.xml",
                                                       TransactionKey.BILLING_05_T14));

    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC1_Order.xml", TransactionKey.ORDERING_28_T01));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC2_Order.xml", TransactionKey.ORDERING_28_T01));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC3_Order.xml", TransactionKey.ORDERING_28_T01));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC4_Order.xml", TransactionKey.ORDERING_28_T01));

    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC1_Order_response.xml", TransactionKey.ORDERING_28_T76));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC2_Order_response.xml", TransactionKey.ORDERING_28_T76));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC3_Order_response.xml", TransactionKey.ORDERING_28_T76));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS28A/UC4_Order_response.xml", TransactionKey.ORDERING_28_T76));

    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2_1BII2 openPEPPOL BIS_UseCase4.xml",
                                                       TransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2_1BII2 openPEPPOL BIS_UseCase5.xml",
                                                       TransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2.1BII2 openPEPPOL BIS_UseCase1.xml",
                                                       TransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2.1BII2 openPEPPOL BIS_UseCase2.xml",
                                                       TransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (StandardTestFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2.1BII2 openPEPPOL BIS_UseCase3.xml",
                                                       TransactionKey.DESPATCH_ADVICE_30_T16));
  }

  @Nonnull
  @ReturnsMutableCopy
  public static List <TestFile> getAllTestFiles (@Nonnull final TransactionKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    final List <TestFile> ret = new ArrayList <TestFile> ();
    for (final TestFile aTF : s_aTestFiles)
      if (aTF.getTransactionKey ().equals (aTransactionKey))
        ret.add (aTF);
    return ret;
  }

  @Test
  public void testReadAllUBLFiles () throws SAXException
  {
    for (final TestFile aTestFile : s_aTestFiles)
    {
      assertTrue (aTestFile.getResource ().exists ());

      // Read as generic XML
      final Document aDoc = DOMReader.readXMLDOM (aTestFile.getResource ());
      assertNotNull (aTestFile.getResource ().getPath (), aDoc);

      // Read as desired type
      final Object aUBLDocument = UBL21Marshaller.readUBLDocument (aDoc, aTestFile.getExtendedTransactionKey ()
                                                                                  .getUBLDocumentType ()
                                                                                  .getImplementationClass ());
      assertNotNull (aTestFile.getResource ().getPath (), aUBLDocument);
    }
  }
}
