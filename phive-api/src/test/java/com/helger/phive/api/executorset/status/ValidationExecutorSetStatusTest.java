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
package com.helger.phive.api.executorset.status;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.time.OffsetDateTime;

import org.junit.Test;

import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.mock.CommonsTestHelper;

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

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aStatus,
                                                                       ValidationExecutorSetStatus.createValidAt (aNow));
    CommonsTestHelper.testDefaultImplementationWithDifferentContentObject (aStatus,
                                                                           ValidationExecutorSetStatus.createValidAt (aNow.plusMinutes (1)));
  }
}
