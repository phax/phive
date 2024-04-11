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
   * Get the validation executor set with the oldest (lowest) version number.
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

  @Nullable
  RESULTTYPE getLatestReleaseVersion (@Nullable String sGroupID,
                                      @Nullable String sArtifactID,
                                      @Nullable Set <String> aVersionsToIgnore);

  @Nullable
  RESULTTYPE getLatestActiveVersion (@Nullable String sGroupID,
                                     @Nullable String sArtifactID,
                                     @Nullable Set <String> aVersionsToIgnore,
                                     @Nullable OffsetDateTime aCheckDateTime);

  @Nullable
  RESULTTYPE getLatestReleaseActiveVersion (@Nullable String sGroupID,
                                            @Nullable String sArtifactID,
                                            @Nullable Set <String> aVersionsToIgnore,
                                            @Nullable OffsetDateTime aCheckDateTime);

}
