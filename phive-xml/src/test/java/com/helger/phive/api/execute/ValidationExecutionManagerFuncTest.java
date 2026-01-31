/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.api.execute;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;
import java.util.Locale;

import org.junit.Test;

import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.io.resource.inmemory.ReadableResourceString;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSetRegistry;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.validity.IValidityDeterminator;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Test class for class {@link ValidationExecutionManager}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutionManagerFuncTest
{
  @Test
  public void testSnippet () throws DVRVersionException
  {
    // The registry for validation execution sets
    final ValidationExecutorSetRegistry <IValidationSourceXML> aVESRegistry = new ValidationExecutorSetRegistry <> ();

    final DVRCoordinate aVESID = DVRCoordinate.create ("com.helger.test", "unittest", "1.0.0");

    // Register a dummy rule
    aVESRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                              "Example VES",
                                                                              ValidationExecutorSetStatus.createValidNow (),
                                                                              ValidationExecutorXSD.create (new ReadableResourceString ("<xs:schema xmlns=\"urn:test\" \r\n" +
                                                                                                                                        "           xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" \r\n" +
                                                                                                                                        "           targetNamespace=\"urn:test\" \r\n" +
                                                                                                                                        "           elementFormDefault=\"qualified\">" +
                                                                                                                                        "  <xs:element name=\"Example\" type=\"xs:integer\" />" +
                                                                                                                                        "</xs:schema>",
                                                                                                                                        StandardCharsets.UTF_8))));

    // Resolve the VES ID
    final IValidationExecutorSet <IValidationSourceXML> aVES = aVESRegistry.getOfID (aVESID);
    assertNotNull (aVES);

    // Start with a valid one
    {
      // What XML to validate?
      final IValidationSourceXML aValidationSource = ValidationSourceXML.create (null,
                                                                                 DOMReader.readXMLDOM ("<Example xmlns='urn:test'>42</Example>"));

      // Main validation
      final ValidationResultList aValidationResult = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                                   aVES,
                                                                                                   aValidationSource);
      assertTrue (aValidationResult.containsNoError ());
    }

    // Invalid payload
    {
      // What XML to validate?
      final IValidationSourceXML aValidationSource = ValidationSourceXML.create (null,
                                                                                 DOMReader.readXMLDOM ("<Example xmlns='urn:test'>not-an-int</Example>"));

      // Main validation
      final ValidationResultList aValidationResult = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                                   aVES,
                                                                                                   aValidationSource);
      assertTrue (aValidationResult.containsAtLeastOneError ());
      final ErrorList aErrors = aValidationResult.getAllErrors ();
      assertEquals (2, aErrors.size ());

      assertTrue (aErrors.get (0).getErrorText (Locale.US).startsWith ("[SAX] cvc-datatype-valid.1.2.1:"));
      assertTrue (aErrors.get (1).getErrorText (Locale.US).startsWith ("[SAX] cvc-type.3.1.3:"));
    }
  }
}
