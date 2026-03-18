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
package com.helger.phive.api.result;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;

import org.jspecify.annotations.NonNull;
import org.junit.Test;

import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.phive.api.EValidationBaseType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.ValidationType;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.validity.EExtendedValidity;

/**
 * Test class for class {@link ValidationResult}.
 *
 * @author Philip Helger
 */
public final class ValidationResultTest
{
  private static final IValidationType VT = new ValidationType ("mock",
                                                                EValidationBaseType.PDF,
                                                                "Mock VT",
                                                                false,
                                                                false);

  @NonNull
  private static IValidationArtefact _createVA ()
  {
    return new ValidationArtefact (VT, new ReadableResourceByteArray ("validation".getBytes (StandardCharsets.UTF_8)));
  }

  @Test
  public void testBasic ()
  {
    final IValidationArtefact aVA = _createVA ();
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ().errorText ("Test error").build ());

    final ValidationResult aVR = new ValidationResult (aVA, aErrorList, EExtendedValidity.INVALID, 100);
    assertSame (aVA, aVR.getValidationArtefact ());
    assertSame (aErrorList, aVR.getErrorList ());
    assertSame (EExtendedValidity.INVALID, aVR.getValidity ());
    assertEquals (100, aVR.getDurationMS ());
    assertFalse (aVR.getValidity ().isSkipped ());
    assertNotNull (aVR.toString ());
  }

  @Test
  public void testValidResult ()
  {
    final IValidationArtefact aVA = _createVA ();
    final ErrorList aErrorList = new ErrorList ();

    final ValidationResult aVR = new ValidationResult (aVA, aErrorList, EExtendedValidity.VALID, 0);
    assertSame (EExtendedValidity.VALID, aVR.getValidity ());
    assertEquals (0, aVR.getDurationMS ());
    assertFalse (aVR.getValidity ().isSkipped ());
    assertTrue (aVR.getErrorList ().isEmpty ());
  }

  @Test
  public void testSkippedResult ()
  {
    final IValidationArtefact aVA = _createVA ();

    final ValidationResult aVR = ValidationResult.createSkippedResult (aVA);
    assertSame (aVA, aVR.getValidationArtefact ());
    assertSame (EExtendedValidity.SKIPPED, aVR.getValidity ());
    assertTrue (aVR.getValidity ().isSkipped ());
    assertEquals (0, aVR.getDurationMS ());
    assertTrue (aVR.getErrorList ().isEmpty ());
  }

  @Test
  public void testUnclearValidity ()
  {
    final IValidationArtefact aVA = _createVA ();
    final ErrorList aErrorList = new ErrorList ();

    final ValidationResult aVR = new ValidationResult (aVA, aErrorList, EExtendedValidity.UNCLEAR, 5);
    assertSame (EExtendedValidity.UNCLEAR, aVR.getValidity ());
    assertFalse (aVR.getValidity ().isSkipped ());
  }
}
