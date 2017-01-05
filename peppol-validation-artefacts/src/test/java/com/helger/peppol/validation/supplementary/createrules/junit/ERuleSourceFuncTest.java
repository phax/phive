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
package com.helger.peppol.validation.supplementary.createrules.junit;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.peppol.validation.supplementary.createrules.ERuleSource;

/**
 * Test class for class {@link ERuleSource}.
 *
 * @author Philip Helger
 */
public final class ERuleSourceFuncTest
{
  @Test
  public void testFilesPresent ()
  {
    for (final ERuleSource e : ERuleSource.values ())
    {
      if (e.hasBIICoreFile ())
        assertTrue (e.getBIICoreSchematronFile ().exists ());
      if (e.hasBIIRules ())
        assertTrue (e.getBIIRuleFile ().exists ());
      if (e.hasOpenPEPPOLRules ())
        assertTrue (e.getOpenPEPPOLRuleFile ().exists ());
    }
  }
}
