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

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.peppol.validation.EVAPeppolThirdParty;
import com.helger.schematron.pure.SchematronResourcePure;

/**
 * Test class for class {@link EVAPeppolThirdParty}.
 *
 * @author Philip Helger
 */
public final class EVAPeppolThirdPartyTest
{
  @Test
  public void testBasic ()
  {
    for (final EVAPeppolThirdParty e : EVAPeppolThirdParty.values ())
    {
      assertNotNull (e.getRuleResource ());
      assertTrue (e.getRuleResource ().exists ());
      assertNotNull (e.getValidationKey ());
    }
  }

  @Test
  public void testValidSchematrons ()
  {
    for (final EVAPeppolThirdParty e : EVAPeppolThirdParty.values ())
    {
      // Check that the passed Schematron is valid
      assertTrue (new SchematronResourcePure (e.getRuleResource ()).isValidSchematron ());
    }
  }
}
