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
package com.helger.peppol.validation;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.IValidationExecutorSet;
import com.helger.bdve.execute.ValidationExecutorSetRegistry;
import com.helger.schematron.pure.SchematronResourcePure;

/**
 * Test class for class {@link CPeppolValidation}.
 *
 * @author Philip Helger
 */
public final class CPeppolValidationTest
{
  @Test
  public void testBasic ()
  {
    final ValidationExecutorSetRegistry aRegistry = new ValidationExecutorSetRegistry ();
    CPeppolValidation.init (aRegistry);
    for (final IValidationExecutorSet aVES : aRegistry.getAll ())
      for (final IValidationExecutor aVE : aVES)
      {
        final IValidationArtefact aVA = aVE.getValidationArtefact ();
        assertTrue (aVA.getRuleResource ().toString (), aVA.getRuleResource ().exists ());
        if (aVA.getValidationArtefactType () == EValidationType.SCHEMATRON)
        {
          // Check that the passed Schematron is valid
          assertTrue (aVA.getRuleResource ().toString (),
                      new SchematronResourcePure (aVA.getRuleResource ()).isValidSchematron ());
        }
      }
  }
}
