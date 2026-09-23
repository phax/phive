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
package com.helger.phive.api.executorset.status;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.time.OffsetDateTime;

import org.junit.Test;

import com.helger.collection.commons.CommonsArrayList;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.unittest.support.TestHelper;

/**
 * Test class for class {@link ValidationExecutorSetStatus}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSetStatusTest
{
  @Test
  public void testEmpty ()
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();

    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidAt (aNow);
    assertEquals (aNow, aStatus.getStatusLastModification ());
    assertSame (EValidationExecutorStatusType.VALID, aStatus.getType ());
    assertNull (aStatus.getValidFrom ());
    assertNull (aStatus.getValidTo ());
    assertNull (aStatus.getDeprecationReason ());
    assertNull (aStatus.getReplacementVESID ());

    TestHelper.testDefaultImplementationWithEqualContentObject (aStatus,
                                                                ValidationExecutorSetStatus.createValidAt (aNow));
    TestHelper.testDefaultImplementationWithDifferentContentObject (aStatus,
                                                                    ValidationExecutorSetStatus.createValidAt (aNow.plusMinutes (1)));
  }

  @Test
  public void testBuilderDefaults ()
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();

    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.builder ()
                                                                           .statusLastModification (aNow)
                                                                           .build ();
    assertEquals (aNow, aStatus.getStatusLastModification ());
    assertSame (EValidationExecutorStatusType.VALID, aStatus.getType ());
    assertNull (aStatus.getValidFrom ());
    assertNull (aStatus.getValidTo ());
    assertNull (aStatus.getDeprecationReason ());
    assertNull (aStatus.getReplacementVESID ());
    assertTrue (aStatus.historyItems ().isEmpty ());

    // Must be the same as the existing factory method
    assertEquals (ValidationExecutorSetStatus.createValidAt (aNow), aStatus);
  }

  @Test
  public void testBuilderAllFields () throws Exception
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();
    final DVRCoordinate aReplacementVESID = DVRCoordinate.create ("group", "art", "2.0");
    final ValidationExecutorSetStatusHistoryItem aHistoryItem = ValidationExecutorSetStatusHistoryItem.builder ()
                                                                                                      .changeDateTime (aNow)
                                                                                                      .author ("Philip")
                                                                                                      .changeCode ("changed")
                                                                                                      .text ("Any text")
                                                                                                      .build ();

    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.builder ()
                                                                           .statusLastModification (aNow)
                                                                           .type (EValidationExecutorStatusType.DEPRECATED)
                                                                           .validFrom (aNow.minusDays (1))
                                                                           .validTo (aNow.plusDays (1))
                                                                           .deprecationReason ("Too old")
                                                                           .replacementVESID (aReplacementVESID)
                                                                           .addHistoryItem (aHistoryItem)
                                                                           .build ();
    assertEquals (aNow, aStatus.getStatusLastModification ());
    assertSame (EValidationExecutorStatusType.DEPRECATED, aStatus.getType ());
    assertEquals (aNow.minusDays (1), aStatus.getValidFrom ());
    assertEquals (aNow.plusDays (1), aStatus.getValidTo ());
    assertEquals ("Too old", aStatus.getDeprecationReason ());
    assertEquals (aReplacementVESID, aStatus.getReplacementVESID ());
    assertEquals (1, aStatus.historyItems ().size ());
    assertSame (aHistoryItem, aStatus.historyItems ().getFirstOrNull ());
  }

  @Test
  public void testBuilderType ()
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();

    for (final EValidationExecutorStatusType eType : EValidationExecutorStatusType.values ())
      assertSame (eType,
                  ValidationExecutorSetStatus.builder ()
                                             .statusLastModification (aNow)
                                             .type (eType)
                                             .build ()
                                             .getType ());
  }

  @Test
  public void testBuilderHistoryItems ()
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();
    final ValidationExecutorSetStatusHistoryItem aHistoryItem1 = new ValidationExecutorSetStatusHistoryItem (aNow,
                                                                                                             "Philip",
                                                                                                             null,
                                                                                                             "Text 1");
    final ValidationExecutorSetStatusHistoryItem aHistoryItem2 = new ValidationExecutorSetStatusHistoryItem (aNow,
                                                                                                             "Philip",
                                                                                                             null,
                                                                                                             "Text 2");

    // "historyItems" overwrites all existing ones
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.builder ()
                                                                           .addHistoryItem (aHistoryItem1)
                                                                           .historyItems (new CommonsArrayList <> (aHistoryItem2))
                                                                           .build ();
    assertEquals (1, aStatus.historyItems ().size ());
    assertSame (aHistoryItem2, aStatus.historyItems ().getFirstOrNull ());
  }

  @Test (expected = IllegalStateException.class)
  public void testBuilderNoStatusLastModification ()
  {
    ValidationExecutorSetStatus.builder ().statusLastModification ((OffsetDateTime) null).build ();
  }

  @Test (expected = IllegalStateException.class)
  public void testBuilderNoType ()
  {
    ValidationExecutorSetStatus.builder ().type (null).build ();
  }
}
