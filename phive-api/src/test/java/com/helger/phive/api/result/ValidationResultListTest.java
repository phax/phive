/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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
package com.helger.phive.api.result;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.commons.error.IError;
import com.helger.commons.error.list.ErrorList;

/**
 * Test class for class {@link ValidationResultList}.
 *
 * @author Philip Helger
 */
public class ValidationResultListTest
{
  @Test
  public void testBasic ()
  {
    final ValidationResultList aVRL = new ValidationResultList (null);
    assertFalse (aVRL.hasValidationSource ());
    assertNull (aVRL.getValidationSource ());
    assertTrue (aVRL.containsNoFailure ());
    assertTrue (aVRL.containsNoError ());
    assertFalse (aVRL.containsAtLeastOneFailure ());
    assertFalse (aVRL.containsAtLeastOneError ());

    ErrorList aEL = aVRL.getAllErrors ();
    assertNotNull (aEL);
    assertTrue (aEL.isEmpty ());

    aEL = aVRL.getAllFailures ();
    assertNotNull (aEL);
    assertTrue (aEL.isEmpty ());

    assertEquals (0, aEL.getCount ());
    assertEquals (0, aEL.getCount (IError::isError));
  }

}
