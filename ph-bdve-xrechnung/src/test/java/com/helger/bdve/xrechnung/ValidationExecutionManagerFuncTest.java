/**
 * Copyright (C) 2014-2019 Philip Helger (www.helger.com)
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
package com.helger.bdve.xrechnung;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Locale;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.helger.bdve.execute.ValidationExecutionManager;
import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.result.ValidationResultList;
import com.helger.bdve.source.IValidationSource;
import com.helger.bdve.source.ValidationSource;
import com.helger.bdve.xrechnung.mock.CTestFiles;
import com.helger.commons.error.list.IErrorList;
import com.helger.xml.XMLHelper;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Test class for class {@link ValidationExecutionManager}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutionManagerFuncTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (ValidationExecutionManagerFuncTest.class);

  @Test
  public void testApplyCompleteValidation ()
  {
    for (final MockFile aTestFile : CTestFiles.getAllTestFiles ())
    {
      final IValidationExecutorSet aExecutors = CTestFiles.VES_REGISTRY.getOfID (aTestFile.getVESID ());
      assertNotNull (aExecutors);
      final ValidationExecutionManager aValidator = aExecutors.createExecutionManager ();

      LOGGER.info ("Validating " +
                   aTestFile.getResource ().getPath () +
                   " against " +
                   aExecutors.getExecutorCount () +
                   " validation layers using " +
                   aTestFile.getVESID ().getAsSingleID ());

      final Node aNode = DOMReader.readXMLDOM (aTestFile.getResource ());
      assertNotNull (aNode);

      final Element eRoot = (Element) aNode.getFirstChild ();

      if ("http://difi.no/xsd/vefa/validator/1.0".equals (eRoot.getNamespaceURI ()))
      {
        // Testset

        // assert
        final Element eAssert = XMLHelper.getFirstChildElementOfName (eRoot, "assert");
        final String sDescription = XMLHelper.getFirstChildElementOfName (eAssert, "description").getTextContent ();
        final String sScope = XMLHelper.getFirstChildElementOfName (eAssert, "scope").getTextContent ();

        // tests
        for (final Element eTest : XMLHelper.getChildElementIterator (eRoot, "test"))
        {
          final Element eTestAssert = XMLHelper.getFirstChildElementOfName (eTest, "assert");
          final Element eSuccess = XMLHelper.getFirstChildElementOfName (eTestAssert, "success");
          final Element eError = XMLHelper.getFirstChildElementOfName (eTestAssert, "error");
          final boolean bExpectSuccess;
          final String sRuleID;
          if (eSuccess != null)
          {
            bExpectSuccess = true;
            sRuleID = eSuccess.getTextContent ();
          }
          else
          {
            bExpectSuccess = false;
            sRuleID = eError.getTextContent ();
          }
          assertNotNull (sRuleID);

          Node aPayload = eTestAssert.getNextSibling ();
          while (aPayload != null && !(aPayload instanceof Element))
            aPayload = aPayload.getNextSibling ();
          assertNotNull (aPayload);
          assertTrue (aPayload instanceof Element);

          final IValidationSource aSource = ValidationSource.createPartial (aTestFile.getResource ().getPath (),
                                                                            aPayload);
          final ValidationResultList aErrors = aValidator.executeValidation (aSource, Locale.US);
          // Flatten result
          final IErrorList aErrorList = aErrors.getAllErrors ();
          if (bExpectSuccess)
            assertTrue (aErrorList.toString (), aErrorList.containsNone (x -> sRuleID.equals (x.getErrorID ())));
          else
            assertTrue (aErrorList.toString (), aErrorList.containsAny (x -> sRuleID.equals (x.getErrorID ())));
        }
      }
      else
      {
        // Read as desired type
        final IValidationSource aSource = ValidationSource.create (aTestFile.getResource ().getPath (), aNode);
        final ValidationResultList aErrors = aValidator.executeValidation (aSource, Locale.US);
        if (aTestFile.isGoodCase ())
          assertTrue (aErrors.getAllErrors ().toString (), aErrors.containsNoError ());
        else
          assertTrue (aErrors.containsAtLeastOneError ());
      }
    }
  }
}
