/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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
package com.helger.phive.api.diver;

import java.time.OffsetDateTime;
import java.util.Set;

import javax.annotation.Nullable;

/**
 * Generic pseudo version resolver interface
 *
 * @author Philip Helger
 * @param <RESULTTYPE>
 *        The type to which is resolved
 * @since 9.2.1
 */
public interface IPseudoVersionResolver <RESULTTYPE>
{
  /**
   * Get the validation executor set with the oldest (lowest) version number
   * (including snapshots).
   *
   * @param sGroupID
   *        VES Group ID to use. May be <code>null</code>.
   * @param sArtifactID
   *        VES Artefact ID to use. May be <code>null</code>.
   * @param aVersionsToIgnore
   *        An optional set of Version numbers not to consider. This may be used
   *        to exclude certain versions from being returned. May be
   *        <code>null</code>.
   * @return <code>null</code> if no matching version was found.
   */
  @Nullable
  RESULTTYPE getOldestVersion (@Nullable String sGroupID,
                               @Nullable String sArtifactID,
                               @Nullable Set <String> aVersionsToIgnore);

  /**
   * Get the validation executor set with the oldest (lowest) version number
   * (excluding snapshots).
   *
   * @param sGroupID
   *        VES Group ID to use. May be <code>null</code>.
   * @param sArtifactID
   *        VES Artefact ID to use. May be <code>null</code>.
   * @param aVersionsToIgnore
   *        An optional set of Version numbers not to consider. This may be used
   *        to exclude certain versions from being returned. May be
   *        <code>null</code>.
   * @return <code>null</code> if no matching version was found.
   */
  @Nullable
  RESULTTYPE getOldestReleaseVersion (@Nullable String sGroupID,
                                      @Nullable String sArtifactID,
                                      @Nullable Set <String> aVersionsToIgnore);

  /**
   * Get the validation executor set with the latest (highest) version number.
   *
   * @param sGroupID
   *        VES Group ID to use. May be <code>null</code>.
   * @param sArtifactID
   *        VES Artefact ID to use. May be <code>null</code>.
   * @param aVersionsToIgnore
   *        An optional set of Version numbers not to consider. This may be used
   *        to exclude certain versions from being returned. May be
   *        <code>null</code>.
   * @return <code>null</code> if no matching version was found.
   */
  @Nullable
  RESULTTYPE getLatestVersion (@Nullable String sGroupID,
                               @Nullable String sArtifactID,
                               @Nullable Set <String> aVersionsToIgnore);

  /**
   * Get the validation executor set with the latest (highest) version number
   * (excluding snapshots).
   *
   * @param sGroupID
   *        VES Group ID to use. May be <code>null</code>.
   * @param sArtifactID
   *        VES Artefact ID to use. May be <code>null</code>.
   * @param aVersionsToIgnore
   *        An optional set of Version numbers not to consider. This may be used
   *        to exclude certain versions from being returned. May be
   *        <code>null</code>.
   * @return <code>null</code> if no matching version was found.
   */
  @Nullable
  RESULTTYPE getLatestReleaseVersion (@Nullable String sGroupID,
                                      @Nullable String sArtifactID,
                                      @Nullable Set <String> aVersionsToIgnore);

  /**
   * Get the validation executor set with the latest (highest) version number
   * that has state "active".
   *
   * @param sGroupID
   *        VES Group ID to use. May be <code>null</code>.
   * @param sArtifactID
   *        VES Artefact ID to use. May be <code>null</code>.
   * @param aVersionsToIgnore
   *        An optional set of Version numbers not to consider. This may be used
   *        to exclude certain versions from being returned. May be
   *        <code>null</code>.
   * @param aCheckDateTime
   *        The relevant date time for which the status should be checked. May
   *        be <code>null</code>.
   * @return <code>null</code> if no matching version was found.
   */
  @Nullable
  RESULTTYPE getLatestActiveVersion (@Nullable String sGroupID,
                                     @Nullable String sArtifactID,
                                     @Nullable Set <String> aVersionsToIgnore,
                                     @Nullable OffsetDateTime aCheckDateTime);

  /**
   * Get the validation executor set with the latest (highest) version number
   * that has state "active" (excluding snapshots).
   *
   * @param sGroupID
   *        VES Group ID to use. May be <code>null</code>.
   * @param sArtifactID
   *        VES Artefact ID to use. May be <code>null</code>.
   * @param aVersionsToIgnore
   *        An optional set of Version numbers not to consider. This may be used
   *        to exclude certain versions from being returned. May be
   *        <code>null</code>.
   * @param aCheckDateTime
   *        The relevant date time for which the status should be checked. May
   *        be <code>null</code>.
   * @return <code>null</code> if no matching version was found.
   */
  @Nullable
  RESULTTYPE getLatestReleaseActiveVersion (@Nullable String sGroupID,
                                            @Nullable String sArtifactID,
                                            @Nullable Set <String> aVersionsToIgnore,
                                            @Nullable OffsetDateTime aCheckDateTime);
}
