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
package com.helger.bdve.peppol;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.result.ValidationResultList;
import com.helger.bdve.source.IValidationSource;
import com.helger.bdve.source.ValidationSource;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Demo code for validating against order rules
 *
 * @author Philip Helger
 */
public final class ValidationExecutionDemo
{
  public void testCode (final byte [] aXML) throws SAXException
  {
    final ValidationExecutorSetRegistry aRegistry = new ValidationExecutorSetRegistry ();
    PeppolValidation.initStandard (aRegistry);
    PeppolValidation.initThirdParty (aRegistry);

    // Validate against orders
    final IValidationExecutorSet aExecutors = aRegistry.getOfID (PeppolValidation340.VID_OPENPEPPOL_T01_V2);

    final Document aXMLDoc = DOMReader.readXMLDOM (aXML);
    final IValidationSource aSource = ValidationSource.create (null, aXMLDoc);
    final ValidationResultList aErrors = aExecutors.createExecutionManager ().executeValidation (aSource);
    if (aErrors.containsNoError ())
    {
      // TODO success
    }
    else
    {
      // TODO interpret errors
    }
  }
}
