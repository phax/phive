/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.cii;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.cii.mock.CTestFiles;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.xslt.SchematronResourceSCH;
import com.helger.schematron.xslt.SchematronResourceXSLT;

/**
 * Test class for class {@link CIIValidation}.
 *
 * @author Philip Helger
 */
public final class CIIValidationTest
{
  @Test
  public void testFilesExist ()
  {
    for (final IValidationExecutorSet aVES : CTestFiles.VES_REGISTRY.getAll ())
      for (final IValidationExecutor aVE : aVES)
      {
        final IReadableResource aRes = aVE.getValidationArtefact ().getRuleResource ();
        assertTrue (aRes.toString (), aRes.exists ());
      }
  }

  @Test
  public void testSchematronsValid ()
  {
    for (final IValidationExecutorSet aVES : CTestFiles.VES_REGISTRY.getAll ())
      for (final IValidationExecutor aVE : aVES)
      {
        final IValidationArtefact aVA = aVE.getValidationArtefact ();
        final IReadableResource aRes = aVA.getRuleResource ();

        // Check that the passed Schematron is valid
        switch (aVA.getValidationArtefactType ())
        {
          case SCHEMATRON_PURE:
            assertTrue (aRes.toString (), new SchematronResourcePure (aRes).isValidSchematron ());
            break;
          case SCHEMATRON_SCH:
            assertTrue (aRes.toString (), new SchematronResourceSCH (aRes).isValidSchematron ());
            break;
          case SCHEMATRON_XSLT:
            assertTrue (aRes.toString (), new SchematronResourceXSLT (aRes).isValidSchematron ());
            break;
        }
      }
  }
}
