/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.api;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;

import org.junit.Test;

import com.helger.unittest.support.TestHelper;

/**
 * Test class for class {@link ValidationType}.
 *
 * @author Philip Helger
 */
public final class ValidationTypeTest
{
  @Test
  public void testBasic ()
  {
    final IValidationType aVT = new ValidationType ("mock", EValidationBaseType.PDF, "Mock VT", false, false);
    assertEquals ("mock", aVT.getID ());
    assertSame (EValidationBaseType.PDF, aVT.getBaseType ());
    assertEquals ("Mock VT", aVT.getName ());
    assertFalse (aVT.isStopValidationOnError ());
    assertFalse (aVT.isContextRequired ());

    TestHelper.testDefaultImplementationWithEqualContentObject (aVT,
                                                                new ValidationType ("mock",
                                                                                    EValidationBaseType.PDF,
                                                                                    "Mock VT",
                                                                                    false,
                                                                                    false));
    TestHelper.testDefaultImplementationWithDifferentContentObject (aVT,
                                                                    new ValidationType ("mock2",
                                                                                        EValidationBaseType.PDF,
                                                                                        "Mock VT",
                                                                                        false,
                                                                                        false));
    TestHelper.testDefaultImplementationWithDifferentContentObject (aVT,
                                                                    new ValidationType ("mock",
                                                                                        EValidationBaseType.EDIFACT,
                                                                                        "Mock VT",
                                                                                        false,
                                                                                        false));
    TestHelper.testDefaultImplementationWithDifferentContentObject (aVT,
                                                                    new ValidationType ("mock",
                                                                                        EValidationBaseType.PDF,
                                                                                        "Other Mock VT",
                                                                                        false,
                                                                                        false));
    TestHelper.testDefaultImplementationWithDifferentContentObject (aVT,
                                                                    new ValidationType ("mock",
                                                                                        EValidationBaseType.PDF,
                                                                                        "Mock VT",
                                                                                        true,
                                                                                        false));
    TestHelper.testDefaultImplementationWithDifferentContentObject (aVT,
                                                                    new ValidationType ("mock",
                                                                                        EValidationBaseType.PDF,
                                                                                        "Mock VT",
                                                                                        false,
                                                                                        true));
  }
}
