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
package com.helger.phive.api.artefact;

import static org.junit.Assert.assertSame;

import java.nio.charset.StandardCharsets;

import org.junit.Test;

import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.commons.mock.CommonsTestHelper;
import com.helger.phive.api.EValidationBaseType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.ValidationType;

/**
 * Test class for class {@link ValidationArtefact}.
 *
 * @author Philip Helger
 */
public final class ValidationArtefactTest
{
  private static final IValidationType VT = new ValidationType ("mock",
                                                                EValidationBaseType.PDF,
                                                                "Mock VT",
                                                                false,
                                                                false);

  @Test
  public void testBasic ()
  {
    final IReadableResource aRes = new ReadableResourceByteArray ("validation".getBytes (StandardCharsets.UTF_8));
    final IValidationArtefact aVA = new ValidationArtefact (VT, aRes);
    assertSame (VT, aVA.getValidationType ());
    assertSame (aRes, aVA.getRuleResource ());

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aVA, new ValidationArtefact (VT, aRes));
    CommonsTestHelper.testDefaultImplementationWithDifferentContentObject (aVA,
                                                                           new ValidationArtefact (new ValidationType ("mock",
                                                                                                                       EValidationBaseType.PDF,
                                                                                                                       "Other Mock VT",
                                                                                                                       false,
                                                                                                                       false),
                                                                                                   aRes));
    CommonsTestHelper.testDefaultImplementationWithDifferentContentObject (aVA,
                                                                           new ValidationArtefact (VT,
                                                                                                   new ReadableResourceByteArray ("other validation".getBytes (StandardCharsets.UTF_8))));
  }
}
