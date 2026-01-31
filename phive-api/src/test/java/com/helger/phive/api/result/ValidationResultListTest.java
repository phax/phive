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
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;

import org.junit.Test;

import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.phive.api.EValidationBaseType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.ValidationType;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.source.ValidationSourceBinary;

/**
 * Test class for class {@link ValidationResultList}.
 *
 * @author Philip Helger
 */
public final class ValidationResultListTest
{
  private static final IValidationType VT = new ValidationType ("mock",
                                                                EValidationBaseType.PDF,
                                                                "Mock VT",
                                                                false,
                                                                false);

  @Test
  public void testEmpty ()
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

    assertEquals (0, aEL.size ());
    assertEquals (0, aEL.getCount (IError::isSuccess));
    assertEquals (0, aEL.getCount (IError::isFailure));
    assertEquals (0, aEL.getCount (IError::isError));
  }

  @Test
  public void testWithOneError ()
  {
    final ValidationSourceBinary aVS = ValidationSourceBinary.create ("dummy.txt",
                                                                      "test".getBytes (StandardCharsets.UTF_8));
    final ValidationResultList aVRL = new ValidationResultList (aVS);
    assertTrue (aVRL.hasValidationSource ());
    assertSame (aVS, aVRL.getValidationSource ());

    // Add error to validation result list
    final IValidationArtefact aVA = new ValidationArtefact (VT,
                                                            new ReadableResourceByteArray ("validation".getBytes (StandardCharsets.UTF_8)));
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ().errorText ("Something went wrong").build ());
    assertTrue (aVRL.add (new ValidationResult (aVA, aErrorList, 42)));

    assertFalse (aVRL.containsNoFailure ());
    assertFalse (aVRL.containsNoError ());
    assertTrue (aVRL.containsAtLeastOneFailure ());
    assertTrue (aVRL.containsAtLeastOneError ());

    ErrorList aEL = aVRL.getAllErrors ();
    assertNotNull (aEL);
    assertFalse (aEL.isEmpty ());
    assertEquals (1, aEL.size ());

    aEL = aVRL.getAllFailures ();
    assertNotNull (aEL);
    assertFalse (aEL.isEmpty ());
    assertEquals (1, aEL.size ());

    assertEquals (1, aEL.size ());
    assertEquals (0, aEL.getCount (IError::isSuccess));
    assertEquals (1, aEL.getCount (IError::isFailure));
    assertEquals (1, aEL.getCount (IError::isError));
  }

  @Test
  public void testWithOneWarning ()
  {
    final ValidationSourceBinary aVS = ValidationSourceBinary.create ("dummy.txt",
                                                                      "test".getBytes (StandardCharsets.UTF_8));
    final ValidationResultList aVRL = new ValidationResultList (aVS);
    assertTrue (aVRL.hasValidationSource ());
    assertSame (aVS, aVRL.getValidationSource ());

    // Add warning to validation result list
    final IValidationArtefact aVA = new ValidationArtefact (VT,
                                                            new ReadableResourceByteArray ("validation".getBytes (StandardCharsets.UTF_8)));
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderWarn ().errorText ("Something went wrong").build ());
    assertTrue (aVRL.add (new ValidationResult (aVA, aErrorList, 42)));

    assertFalse (aVRL.containsNoFailure ());
    assertTrue (aVRL.containsNoError ());
    assertTrue (aVRL.containsAtLeastOneFailure ());
    assertFalse (aVRL.containsAtLeastOneError ());

    ErrorList aEL = aVRL.getAllErrors ();
    assertNotNull (aEL);
    assertTrue (aEL.isEmpty ());

    aEL = aVRL.getAllFailures ();
    assertNotNull (aEL);
    assertFalse (aEL.isEmpty ());
    assertEquals (1, aEL.size ());

    assertEquals (1, aEL.size ());
    assertEquals (0, aEL.getCount (IError::isSuccess));
    assertEquals (1, aEL.getCount (IError::isFailure));
    assertEquals (0, aEL.getCount (IError::isError));
  }
}
