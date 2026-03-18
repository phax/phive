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
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.base.state.EChange;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;

/**
 * Test class for class {@link ValidationExecutorSetRegistry}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSetRegistryTest
{
  @Test
  public void testEmpty ()
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    assertTrue (aRegistry.getAll ().isEmpty ());
    assertTrue (aRegistry.isResolvePseudoVersions ());
    assertNull (aRegistry.getOfID (null));
    assertNotNull (aRegistry.toString ());
  }

  @Test
  public void testRegisterAndGet () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    final DVRCoordinate aID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    final ValidationExecutorSet <IValidationSource> aVES = new ValidationExecutorSet <> (aID, "Test VES", aStatus);

    aRegistry.registerValidationExecutorSet (aVES);
    assertEquals (1, aRegistry.getAll ().size ());
    assertSame (aVES, aRegistry.getOfID (aID));
  }

  @Test
  public void testUnregister () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    final DVRCoordinate aID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    final ValidationExecutorSet <IValidationSource> aVES = new ValidationExecutorSet <> (aID, "Test VES", aStatus);

    aRegistry.registerValidationExecutorSet (aVES);
    assertEquals (1, aRegistry.getAll ().size ());

    assertEquals (EChange.CHANGED, aRegistry.unregisterValidationExecutorSet (aID));
    assertTrue (aRegistry.getAll ().isEmpty ());
    assertNull (aRegistry.getOfID (aID));
  }

  @Test
  public void testUnregisterNull ()
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    assertEquals (EChange.UNCHANGED, aRegistry.unregisterValidationExecutorSet ((DVRCoordinate) null));
  }

  @Test
  public void testUnregisterNonExisting () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    final DVRCoordinate aID = DVRCoordinate.create ("group", "art", "1.0");
    assertEquals (EChange.UNCHANGED, aRegistry.unregisterValidationExecutorSet (aID));
  }

  @Test (expected = IllegalStateException.class)
  public void testRegisterDuplicate () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    final DVRCoordinate aID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    final ValidationExecutorSet <IValidationSource> aVES = new ValidationExecutorSet <> (aID, "Test VES", aStatus);

    aRegistry.registerValidationExecutorSet (aVES);
    aRegistry.registerValidationExecutorSet (aVES);
  }

  @Test
  public void testRemoveAll () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    assertEquals (EChange.UNCHANGED, aRegistry.removeAll ());

    final DVRCoordinate aID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    aRegistry.registerValidationExecutorSet (new ValidationExecutorSet <> (aID, "Test VES", aStatus));

    assertEquals (EChange.CHANGED, aRegistry.removeAll ());
    assertTrue (aRegistry.getAll ().isEmpty ());
  }

  @Test
  public void testFindAll () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();

    aRegistry.registerValidationExecutorSet (new ValidationExecutorSet <> (DVRCoordinate.create ("group",
                                                                                                 "art1",
                                                                                                 "1.0"),
                                                                           "VES 1",
                                                                           aStatus));
    aRegistry.registerValidationExecutorSet (new ValidationExecutorSet <> (DVRCoordinate.create ("group",
                                                                                                 "art2",
                                                                                                 "1.0"),
                                                                           "VES 2",
                                                                           aStatus));

    assertEquals (2, aRegistry.getAll ().size ());
    assertEquals (1, aRegistry.findAll (x -> x.getDisplayName ().equals ("VES 1")).size ());
    assertEquals (0, aRegistry.findAll (x -> x.getDisplayName ().equals ("VES 3")).size ());
  }

  @Test
  public void testFindFirst () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();

    aRegistry.registerValidationExecutorSet (new ValidationExecutorSet <> (DVRCoordinate.create ("group",
                                                                                                 "art1",
                                                                                                 "1.0"),
                                                                           "VES 1",
                                                                           aStatus));

    assertNotNull (aRegistry.findFirst (x -> x.getDisplayName ().equals ("VES 1")));
    assertNull (aRegistry.findFirst (x -> x.getDisplayName ().equals ("VES 99")));
  }

  @Test
  public void testResolvePseudoVersions ()
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    assertTrue (aRegistry.isResolvePseudoVersions ());
    aRegistry.setResolvePseudoVersions (false);
    assertTrue (!aRegistry.isResolvePseudoVersions ());
    aRegistry.setResolvePseudoVersions (true);
    assertTrue (aRegistry.isResolvePseudoVersions ());
  }
}
