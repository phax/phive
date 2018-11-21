/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.w3c.dom.Document;

import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.executorset.VESID;
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
  // Do this only once - it contains all the validation executor sets
  private static final ValidationExecutorSetRegistry REGISTRY = new ValidationExecutorSetRegistry ();

  static
  {
    PeppolValidation.initStandard (REGISTRY);
    PeppolValidation.initThirdParty (REGISTRY);
  }

  public void testCode (@Nullable final String sSystemID, @Nonnull final byte [] aXML)
  {
    // Example: validate against orders
    final VESID aVESID = PeppolValidation370.VID_OPENPEPPOL_T01_V2;

    // Note: Use the currently active version
    final IValidationExecutorSet aExecutors = REGISTRY.getOfID (aVESID.getWithVersion (PeppolValidation.VERSION_TO_USE));

    // Parse the XML document to be validated
    final Document aXMLDoc = DOMReader.readXMLDOM (aXML);

    // Build object to be validated (with some metadata)
    final IValidationSource aSource = ValidationSource.create (sSystemID, aXMLDoc);

    // Perform the execution
    final ValidationResultList aErrors = aExecutors.createExecutionManager ().executeValidation (aSource, Locale.US);
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
