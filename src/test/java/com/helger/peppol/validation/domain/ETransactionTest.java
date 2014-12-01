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
package com.helger.peppol.validation.domain;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.helger.commons.string.StringHelper;
import com.helger.commons.xml.serialize.DOMReader;
import com.helger.peppol.validation.test.CTestFiles;
import com.helger.peppol.validation.test.TestFile;
import com.helger.ubl.UBL21Marshaller;

/**
 * Test class for class {@link ETransaction}.
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public final class ETransactionTest
{
  @Test
  public void testBasic ()
  {
    // Add one for the MLR which has no transaction ID!
    assertEquals (33 + 1, ETransaction.values ().length);

    for (final ETransaction eTransaction : ETransaction.values ())
    {
      assertTrue (StringHelper.hasText (eTransaction.getID ()));
      assertTrue (StringHelper.hasText (eTransaction.getName ()));
      assertTrue (eTransaction.getNumber () > 0);
      assertTrue (eTransaction.getTransactionID ().length () > 0);
      assertNotNull (eTransaction.getUBLDocumentType ());

      assertSame (eTransaction, ETransaction.valueOf (eTransaction.name ()));
      assertSame (eTransaction, ETransaction.getFromIDOrNull (eTransaction.getID ()));
    }

    // Compare with
    // http://www.cenbii.eu/wp-content/uploads/TransactionCustomisationID.pdf
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns001:ver2.0", ETransaction.T01.getTransactionID ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns001:ver2.0", ETransaction.T01.getTransactionID ());
    assertEquals ("2.0", ETransaction.T01.getVersionNumber ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns064A:ver1.0", ETransaction.T64A.getTransactionID ());
    assertEquals ("1.0", ETransaction.T64A.getVersionNumber ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns064C:ver1.0", ETransaction.T64C.getTransactionID ());
    assertEquals ("1.0", ETransaction.T64C.getVersionNumber ());
  }

  @Test
  public void testGetUBLDocumentType () throws SAXException
  {
    for (final TestFile aTestFile : CTestFiles.getAllTestFiles ())
    {
      assertTrue (aTestFile.getResource ().exists ());

      // Read as generic XML
      final Document aDoc = DOMReader.readXMLDOM (aTestFile.getResource ());
      assertNotNull (aTestFile.getResource ().getPath (), aDoc);

      // Read as desired type
      final Object aUBLDocument = UBL21Marshaller.readUBLDocument (aDoc, aTestFile.getTransactionKey ()
                                                                                  .getTransaction ()
                                                                                  .getUBLDocumentType ()
                                                                                  .getImplementationClass ());
      assertNotNull (aTestFile.getResource ().getPath (), aUBLDocument);
    }
  }
}
