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
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;
import com.helger.unittest.support.TestHelper;

/**
 * Test class for class {@link ValidationExecutorSetAliasReadOnly}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSetAliasReadOnlyTest
{
  @Test
  public void testBasic () throws Exception
  {
    final DVRCoordinate aOrigID = DVRCoordinate.create ("group", "art", "1.0");
    final DVRCoordinate aAliasID = DVRCoordinate.create ("group", "art-alias", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    final IValidationExecutorSet <IValidationSource> aOrigVES = new ValidationExecutorSet <> (aOrigID,
                                                                                              "Original",
                                                                                              aStatus);

    final ValidationExecutorSetAliasReadOnly <IValidationSource> aAlias = new ValidationExecutorSetAliasReadOnly <> (aAliasID,
                                                                                                                     "Alias",
                                                                                                                     aOrigVES);

    assertEquals (aAliasID, aAlias.getID ());
    assertEquals ("Alias", aAlias.getDisplayName ());
    assertSame (aOrigVES, aAlias.getSourceVES ());
    assertSame (aStatus, aAlias.getStatus ());
    assertEquals (0, aAlias.getAllExecutors ().size ());
    assertNotNull (aAlias.toString ());
    assertFalse (aAlias instanceof IValidationExecutorSetMutable);
  }

  @Test
  public void testAliasOfAlias () throws Exception
  {
    final DVRCoordinate aOrigID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSet <IValidationSource> aOrigVES = new ValidationExecutorSet <> (aOrigID,
                                                                                             "Original",
                                                                                             ValidationExecutorSetStatus.createValidNow ());
    final ValidationExecutorSetAlias <IValidationSource> aAlias1 = new ValidationExecutorSetAlias <> (DVRCoordinate.create ("group",
                                                                                                                           "art-alias1",
                                                                                                                           "1.0"),
                                                                                                      "Alias1",
                                                                                                      aOrigVES);
    final ValidationExecutorSetAliasReadOnly <IValidationSource> aAlias2 = new ValidationExecutorSetAliasReadOnly <> (DVRCoordinate.create ("group",
                                                                                                                                            "art-alias2",
                                                                                                                                            "1.0"),
                                                                                                                      "Alias2",
                                                                                                                      aAlias1);
    assertSame (aAlias1, aAlias2.getSourceVES ());
    assertTrue (aAlias2.getSourceVES () instanceof IValidationExecutorSetAlias);
    assertSame (aOrigVES, ((IValidationExecutorSetAlias <IValidationSource>) aAlias2.getSourceVES ()).getSourceVES ());
  }

  @Test
  public void testEqualsAndHashCode () throws Exception
  {
    final DVRCoordinate aOrigID = DVRCoordinate.create ("group", "art", "1.0");
    final DVRCoordinate aAliasID1 = DVRCoordinate.create ("group", "art-alias1", "1.0");
    final DVRCoordinate aAliasID2 = DVRCoordinate.create ("group", "art-alias2", "1.0");
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidNow ();
    final ValidationExecutorSet <IValidationSource> aOrigVES = new ValidationExecutorSet <> (aOrigID,
                                                                                             "Original",
                                                                                             aStatus);

    final ValidationExecutorSetAliasReadOnly <IValidationSource> aAlias1 = new ValidationExecutorSetAliasReadOnly <> (aAliasID1,
                                                                                                                      "Alias",
                                                                                                                      aOrigVES);
    final ValidationExecutorSetAliasReadOnly <IValidationSource> aAlias1b = new ValidationExecutorSetAliasReadOnly <> (aAliasID1,
                                                                                                                       "Alias",
                                                                                                                       aOrigVES);
    final ValidationExecutorSetAliasReadOnly <IValidationSource> aAlias2 = new ValidationExecutorSetAliasReadOnly <> (aAliasID2,
                                                                                                                      "Alias",
                                                                                                                      aOrigVES);

    TestHelper.testDefaultImplementationWithEqualContentObject (aAlias1, aAlias1b);
    TestHelper.testDefaultImplementationWithDifferentContentObject (aAlias1, aAlias2);

    // Same content but different class
    final ValidationExecutorSetAlias <IValidationSource> aMutableAlias = new ValidationExecutorSetAlias <> (aAliasID1,
                                                                                                            "Alias",
                                                                                                            aOrigVES);
    assertFalse (aAlias1.equals (aMutableAlias));
  }
}
