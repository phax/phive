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

import java.time.Month;
import java.time.OffsetDateTime;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.junit.Test;

import com.helger.base.state.EChange;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.phive.api.executorset.status.EValidationExecutorStatusType;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;

/**
 * Test class for class {@link ValidationExecutorSetRegistry}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSetRegistryTest
{
  private static final String GROUP_SRC = "group";
  private static final String ART_SRC = "art";
  private static final String GROUP_ALIAS = "alias-group";
  private static final String ART_ALIAS = "art-alias";
  private static final OffsetDateTime CHECK_DT = PDTFactory.createOffsetDateTimeUTC (2025, Month.JUNE, 15);

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

  private static void _registerWithAlias (@NonNull final ValidationExecutorSetRegistry <IValidationSource> aRegistry,
                                          @NonNull final String sSourceVersion,
                                          @NonNull final String sAliasVersion,
                                          @Nullable final OffsetDateTime aValidFrom,
                                          @Nullable final OffsetDateTime aValidTo) throws DVRVersionException
  {
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.builder ()
                                                                           .type (EValidationExecutorStatusType.VALID)
                                                                           .validFrom (aValidFrom)
                                                                           .validTo (aValidTo)
                                                                           .build ();
    final ValidationExecutorSet <IValidationSource> aVES = new ValidationExecutorSet <> (DVRCoordinate.create (GROUP_SRC,
                                                                                                               ART_SRC,
                                                                                                               sSourceVersion),
                                                                                         "Source " + sSourceVersion,
                                                                                         aStatus);
    aRegistry.registerValidationExecutorSet (aVES);
    aRegistry.registerValidationExecutorSet (new ValidationExecutorSetAlias <> (DVRCoordinate.create (GROUP_ALIAS,
                                                                                                      ART_ALIAS,
                                                                                                      sAliasVersion),
                                                                                "Alias " + sAliasVersion,
                                                                                aVES));
  }

  /**
   * Create a registry in which every VES of "group:art" is additionally registered as an alias of
   * "alias-group:art-alias" with a different version - as e.g. ZUGFeRD does it for Factur-X.
   *
   * @return The created registry
   * @throws DVRVersionException
   *         on error
   */
  @NonNull
  private static ValidationExecutorSetRegistry <IValidationSource> _createRegistryWithAliases () throws DVRVersionException
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = new ValidationExecutorSetRegistry <> ();
    // Valid until the end of 2024 only
    _registerWithAlias (aRegistry,
                        "2.0.1",
                        "1.0.3",
                        (OffsetDateTime) null,
                        PDTFactory.createOffsetDateTimeUTC (2024, Month.DECEMBER, 31));
    // Always valid
    _registerWithAlias (aRegistry, "2.1", "1.0.5", (OffsetDateTime) null, (OffsetDateTime) null);
    // Valid in the future only
    _registerWithAlias (aRegistry,
                        "2.5.2",
                        "1.0.9-2",
                        PDTFactory.createOffsetDateTimeUTC (2030, Month.JANUARY, 1),
                        (OffsetDateTime) null);
    // Always valid, but a Snapshot version
    _registerWithAlias (aRegistry, "2.6-SNAPSHOT", "1.1-SNAPSHOT", (OffsetDateTime) null, (OffsetDateTime) null);
    return aRegistry;
  }

  @NonNull
  private static IValidationExecutorSet <IValidationSource> _getAliasOfPseudoVersion (@NonNull final ValidationExecutorSetRegistry <IValidationSource> aRegistry,
                                                                                      @NonNull final String sPseudoVersion) throws DVRVersionException
  {
    final DVRCoordinate aCoord = DVRCoordinate.create (GROUP_ALIAS, ART_ALIAS, sPseudoVersion);
    final IValidationExecutorSet <IValidationSource> ret = aRegistry.getOfID (aCoord, CHECK_DT);
    assertNotNull ("Failed to resolve pseudo version '" + sPseudoVersion + "'", ret);
    // Must be the alias and not the source VES
    assertTrue (ret instanceof ValidationExecutorSetAlias);
    assertEquals (GROUP_ALIAS, ret.getID ().getGroupID ());
    assertEquals (ART_ALIAS, ret.getID ().getArtifactID ());
    return ret;
  }

  @Test
  public void testPseudoVersionOldestWithAlias () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = _createRegistryWithAliases ();
    assertEquals ("1.0.3", _getAliasOfPseudoVersion (aRegistry, "oldest").getID ().getVersionString ());
  }

  @Test
  public void testPseudoVersionLatestWithAlias () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = _createRegistryWithAliases ();
    // Snapshots are included
    assertEquals ("1.1-SNAPSHOT", _getAliasOfPseudoVersion (aRegistry, "latest").getID ().getVersionString ());
  }

  @Test
  public void testPseudoVersionLatestReleaseWithAlias () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = _createRegistryWithAliases ();
    // Snapshots are excluded
    assertEquals ("1.0.9-2", _getAliasOfPseudoVersion (aRegistry, "latest-release").getID ().getVersionString ());
  }

  @Test
  public void testPseudoVersionLatestActiveWithAlias () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = _createRegistryWithAliases ();
    // 1.1-SNAPSHOT is active per the check date time - the status is taken from the source VES
    assertEquals ("1.1-SNAPSHOT", _getAliasOfPseudoVersion (aRegistry, "latest-active").getID ().getVersionString ());
  }

  @Test
  public void testPseudoVersionLatestReleaseActiveWithAlias () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = _createRegistryWithAliases ();
    // 1.1-SNAPSHOT is a Snapshot, 1.0.9-2 is not yet valid and 1.0.3 is not valid anymore
    assertEquals ("1.0.5", _getAliasOfPseudoVersion (aRegistry, "latest-release-active").getID ().getVersionString ());
  }

  @Test
  public void testPseudoVersionWithAliasResolvesToSourceVES () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = _createRegistryWithAliases ();
    final IValidationExecutorSet <IValidationSource> aAlias = _getAliasOfPseudoVersion (aRegistry, "latest");
    final IValidationExecutorSet <IValidationSource> aSource = aRegistry.getOfID (DVRCoordinate.create (GROUP_SRC,
                                                                                                        ART_SRC,
                                                                                                        "latest"));
    assertNotNull (aSource);
    assertSame (aSource, ((ValidationExecutorSetAlias <IValidationSource>) aAlias).getSourceVES ());
    assertEquals ("Alias 1.1-SNAPSHOT", aAlias.getDisplayName ());
    assertEquals ("Source 2.6-SNAPSHOT", aSource.getDisplayName ());
  }

  @Test
  public void testPseudoVersionWithAliasDisabled () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSource> aRegistry = _createRegistryWithAliases ();
    aRegistry.setResolvePseudoVersions (false);
    assertNull (aRegistry.getOfID (DVRCoordinate.create (GROUP_ALIAS, ART_ALIAS, "latest")));
    // The static version still works
    assertNotNull (aRegistry.getOfID (DVRCoordinate.create (GROUP_ALIAS, ART_ALIAS, "1.0.5")));
  }
}
