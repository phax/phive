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
package com.helger.peppol.validation;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.xml.serialize.DOMReader;
import com.helger.peppol.validation.test.CTestFiles;
import com.helger.peppol.validation.test.TestFile;

/**
 * Test class for class {@link UBLDocumentValidator}.
 *
 * @author Philip Helger
 */
public final class UBLDocumentValidatorTest
{
  @Test
  public void testReadAllTestFiles () throws SAXException
  {
    for (final TestFile aTestFile : CTestFiles.getAllTestFiles ())
    {
      assertTrue (aTestFile.getResource ().exists ());

      // Read as generic XML to verify that it is readable
      final Document aDoc = DOMReader.readXMLDOM (aTestFile.getResource ());
      assertNotNull (aTestFile.getResource ().getPath (), aDoc);
    }
  }

  @Test
  public void testApplyXSDValidationPeppol ()
  {
    for (final TestFile aTestFile : CTestFiles.getAllTestFiles ())
    {
      // Build validator
      final UBLDocumentValidator aValidator = new UBLDocumentValidator (ValidationConfiguration.createForPeppol (aTestFile.getExtendedTransactionKey ()));

      // Read as desired type
      final IResourceErrorGroup aXSDErrors = aValidator.applyXSDValidation (aTestFile.getResource ());
      if (aTestFile.isGoodCase ())
        assertTrue (aXSDErrors.toString (), aXSDErrors.isEmpty ());
      else
        assertFalse (aXSDErrors.isEmpty ());
    }
  }

  @Test
  public void testApplySchematronValidationPeppol () throws SAXException
  {
    for (final TestFile aTestFile : CTestFiles.getAllTestFiles ())
    {
      final UBLDocumentValidator aValidator = new UBLDocumentValidator (ValidationConfiguration.createForPeppol (aTestFile.getExtendedTransactionKey ()));

      // Read as desired type
      final IResourceErrorGroup aSCHErrors = aValidator.applySchematronValidation (aTestFile.getResource ());
      if (aTestFile.isGoodCase ())
        assertTrue (aSCHErrors.getAllErrors ().toString (), aSCHErrors.containsNoError ());
      else
        assertTrue (aSCHErrors.containsAtLeastOneError ());
    }
  }
}
