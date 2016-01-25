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
package com.helger.peppol.validation.engine.peppol;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.peppol.validation.engine.peppol.EPeppolStandardValidationSchematronArtefact;
import com.helger.schematron.pure.SchematronResourcePure;

/**
 * Test class for class {@link EPeppolStandardValidationSchematronArtefact}.
 *
 * @author Philip Helger
 */
public final class EPeppolStandardValidationSchematronArtefactTest
{
  @Test
  public void testBasic ()
  {
    for (final EPeppolStandardValidationSchematronArtefact e : EPeppolStandardValidationSchematronArtefact.values ())
    {
      assertNotNull (e.getRuleResource ());
      assertTrue (e.getRuleResource ().exists ());
      assertNotNull (e.getValidationKey ());
    }
  }

  @Test
  public void testValidSchematrons ()
  {
    for (final EPeppolStandardValidationSchematronArtefact e : EPeppolStandardValidationSchematronArtefact.values ())
    {
      // Check that the passed Schematron is valid
      assertTrue (new SchematronResourcePure (e.getRuleResource ()).isValidSchematron ());
    }
  }
}
