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
package com.helger.peppol.validation.engine;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.xml.sax.SAXException;

import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutionManager;
import com.helger.bdve.result.ValidationResultList;
import com.helger.bdve.source.IValidationSource;
import com.helger.bdve.source.ValidationSource;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.peppol.validation.engine.mock.CTestFiles;
import com.helger.peppol.validation.engine.mock.MockFile;
import com.helger.peppol.validation.engine.peppol.PeppolValidationConfiguration;

/**
 * Test class for class {@link ValidationExecutionManager}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutionManagerFuncTest
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
      final ICommonsList <IValidationExecutor> aExecutors = PeppolValidationConfiguration.createDefault (aTestFile.getTransactionKey ());
      assertTrue (aExecutors.isNotEmpty ());
      final ValidationExecutionManager aValidator = new ValidationExecutionManager (aExecutors);

      // Read as desired type
      final IValidationSource aSource = ValidationSource.createXMLSource (aTestFile.getResource ());
      final ValidationResultList aErrors = aValidator.executeValidation (aSource);
      if (aTestFile.isGoodCase ())
        assertTrue (aErrors.getAllErrors ().toString (), aErrors.containsNoError ());
      else
        assertTrue (aErrors.containsAtLeastOneError ());
    }
  }
}
