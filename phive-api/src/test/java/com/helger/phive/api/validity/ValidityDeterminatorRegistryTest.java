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
package com.helger.phive.api.validity;

import static org.junit.Assert.assertSame;

import org.junit.Test;

import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;

/**
 * Test class for class {@link ValidityDeterminatorRegistry}.
 *
 * @author Philip Helger
 */
public final class ValidityDeterminatorRegistryTest
{
  @Test
  public void testEmptyList ()
  {
    final ErrorList aErrorList = new ErrorList ();
    assertSame (EExtendedValidity.VALID, ValidityDeterminatorRegistry.getValidityOneErrorInvalid (aErrorList));
  }

  @Test
  public void testWithWarningOnly ()
  {
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderWarn ().errorText ("Just a warning").build ());
    assertSame (EExtendedValidity.VALID, ValidityDeterminatorRegistry.getValidityOneErrorInvalid (aErrorList));
  }

  @Test
  public void testWithError ()
  {
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ().errorText ("An error").build ());
    assertSame (EExtendedValidity.INVALID, ValidityDeterminatorRegistry.getValidityOneErrorInvalid (aErrorList));
  }

  @Test
  public void testWithFatalError ()
  {
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderFatalError ().errorText ("Fatal").build ());
    assertSame (EExtendedValidity.INVALID, ValidityDeterminatorRegistry.getValidityOneErrorInvalid (aErrorList));
  }

  @Test
  public void testWithMixed ()
  {
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderWarn ().errorText ("Warning").build ());
    aErrorList.add (SingleError.builderError ().errorText ("Error").build ());
    assertSame (EExtendedValidity.INVALID, ValidityDeterminatorRegistry.getValidityOneErrorInvalid (aErrorList));
  }
}
