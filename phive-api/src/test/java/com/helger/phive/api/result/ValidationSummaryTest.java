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
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;

import org.jspecify.annotations.NonNull;
import org.junit.Test;

import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.phive.api.EValidationBaseType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.ValidationType;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.validity.EExtendedValidity;

/**
 * Test class for class {@link ValidationSummary}.
 *
 * @author Philip Helger
 */
public final class ValidationSummaryTest
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
  public void testEmpty ()
  {
    final ValidationResultList aVRL = ValidationResultList.createNoSource ();
    final ValidationSummary aSummary = ValidationSummary.create (aVRL);
    assertNotNull (aSummary);
    assertEquals (0, aSummary.getWarningCount ());
    assertEquals (0, aSummary.getErrorCount ());
    assertFalse (aSummary.isValidationInterrupted ());
    assertEquals (EErrorLevel.LOWEST, aSummary.getMostSevereErrorLevel ());
  }

  @Test
  public void testWithErrors ()
  {
    final ValidationResultList aVRL = ValidationResultList.createNoSource ();
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ().errorText ("Error 1").build ());
    aErrorList.add (SingleError.builderError ().errorText ("Error 2").build ());
    aVRL.add (new ValidationResult (_createVA (), aErrorList, EExtendedValidity.INVALID, 10));

    final ValidationSummary aSummary = ValidationSummary.create (aVRL);
    assertEquals (0, aSummary.getWarningCount ());
    assertEquals (2, aSummary.getErrorCount ());
    assertFalse (aSummary.isValidationInterrupted ());
    assertEquals (EErrorLevel.ERROR, aSummary.getMostSevereErrorLevel ());
  }

  @Test
  public void testWithWarnings ()
  {
    final ValidationResultList aVRL = ValidationResultList.createNoSource ();
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderWarn ().errorText ("Warn 1").build ());
    aVRL.add (new ValidationResult (_createVA (), aErrorList, EExtendedValidity.VALID, 5));

    final ValidationSummary aSummary = ValidationSummary.create (aVRL);
    assertEquals (1, aSummary.getWarningCount ());
    assertEquals (0, aSummary.getErrorCount ());
    assertFalse (aSummary.isValidationInterrupted ());
    assertEquals (EErrorLevel.WARN, aSummary.getMostSevereErrorLevel ());
  }

  @Test
  public void testWithMixedErrorsAndWarnings ()
  {
    final ValidationResultList aVRL = ValidationResultList.createNoSource ();

    final ErrorList aErrorList1 = new ErrorList ();
    aErrorList1.add (SingleError.builderWarn ().errorText ("Warn").build ());
    aVRL.add (new ValidationResult (_createVA (), aErrorList1, EExtendedValidity.VALID, 5));

    final ErrorList aErrorList2 = new ErrorList ();
    aErrorList2.add (SingleError.builderError ().errorText ("Error").build ());
    aVRL.add (new ValidationResult (_createVA (), aErrorList2, EExtendedValidity.INVALID, 10));

    final ValidationSummary aSummary = ValidationSummary.create (aVRL);
    // warn is also considered a warning, but error is also >= warn so it counts as warning too
    assertEquals (1, aSummary.getWarningCount ());
    assertEquals (1, aSummary.getErrorCount ());
    assertFalse (aSummary.isValidationInterrupted ());
    assertEquals (EErrorLevel.ERROR, aSummary.getMostSevereErrorLevel ());
  }

  @Test
  public void testWithSkippedLayer ()
  {
    final ValidationResultList aVRL = ValidationResultList.createNoSource ();
    aVRL.add (ValidationResult.createSkippedResult (_createVA ()));

    final ValidationSummary aSummary = ValidationSummary.create (aVRL);
    assertEquals (0, aSummary.getWarningCount ());
    assertEquals (0, aSummary.getErrorCount ());
    assertTrue (aSummary.isValidationInterrupted ());
  }
}
