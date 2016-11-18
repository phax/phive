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
package com.helger.peppol.validation.engine;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.xml.sax.SAXException;

import com.helger.bdve.result.ValidationResultList;
import com.helger.peppol.validation.engine.mock.CTestFiles;
import com.helger.peppol.validation.engine.mock.MockFile;
import com.helger.peppol.validation.engine.peppol.PeppolValidationConfiguration;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Test class for class {@link UBLDocumentValidator}.
 *
 * @author Philip Helger
 */
public final class UBLDocumentValidatorTest
{
  static
  {
    ValidationBootstraper.run ();
  }

  @Test
  public void testApplyCompleteValidationPeppol () throws SAXException
  {
    for (final MockFile aTestFile : CTestFiles.getAllTestFiles ())
    {
      final UBLDocumentValidator aValidator = new UBLDocumentValidator (PeppolValidationConfiguration.createDefault (aTestFile.getTransactionKey ()));

      // Read as desired type
      final ValidationResultList aErrors = aValidator.applyCompleteValidation (DOMReader.readXMLDOM (aTestFile.getResource ()));
      if (aTestFile.isGoodCase ())
        assertTrue (aErrors.getAllErrors ().toString (), aErrors.containsNoError ());
      else
        assertTrue (aErrors.containsAtLeastOneError ());
    }
  }
}
