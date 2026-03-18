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
package com.helger.phive.api.executorset;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.base.state.EChange;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;
import com.helger.unittest.support.TestHelper;

/**
 * Test class for class {@link ValidationExecutorSet}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSetTest
{
  @Test
  public void testBasic () throws Exception
  {
    final DVRCoordinate aID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    final ValidationExecutorSet <IValidationSource> aVES = new ValidationExecutorSet <> (aID, "Test VES", aStatus);

    assertEquals (aID, aVES.getID ());
    assertEquals ("Test VES", aVES.getDisplayName ());
    assertNotNull (aVES.getStatus ());
    assertEquals (0, aVES.executors ().size ());
    assertEquals (0, aVES.getAllExecutors ().size ());
    assertTrue (aVES.iterator ().hasNext () == false);
    assertNotNull (aVES.toString ());
  }

  @Test
  public void testRemoveAll () throws Exception
  {
    final DVRCoordinate aID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    final ValidationExecutorSet <IValidationSource> aVES = new ValidationExecutorSet <> (aID, "Test VES", aStatus);

    assertEquals (EChange.UNCHANGED, aVES.removeAllExecutors ());
  }

  @Test
  public void testEqualsAndHashCode () throws Exception
  {
    final DVRCoordinate aID1 = DVRCoordinate.create ("group", "art", "1.0");
    final DVRCoordinate aID2 = DVRCoordinate.create ("group", "art", "2.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();

    final ValidationExecutorSet <IValidationSource> aVES1 = new ValidationExecutorSet <> (aID1, "Test VES", aStatus);
    final ValidationExecutorSet <IValidationSource> aVES1b = new ValidationExecutorSet <> (aID1, "Test VES", aStatus);
    final ValidationExecutorSet <IValidationSource> aVES2 = new ValidationExecutorSet <> (aID2, "Test VES", aStatus);
    final ValidationExecutorSet <IValidationSource> aVES3 = new ValidationExecutorSet <> (aID1, "Other VES", aStatus);

    TestHelper.testDefaultImplementationWithEqualContentObject (aVES1, aVES1b);
    TestHelper.testDefaultImplementationWithDifferentContentObject (aVES1, aVES2);
    TestHelper.testDefaultImplementationWithDifferentContentObject (aVES1, aVES3);
  }
}
