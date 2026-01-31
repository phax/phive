/*
 * Copyright (C) 2023-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.engine.load;

import java.time.OffsetDateTime;
import java.util.Iterator;
import java.util.Set;
import java.util.function.Predicate;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.base.compare.ESortOrder;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.string.StringHelper;
import com.helger.collection.commons.ICommonsList;
import com.helger.collection.iterator.ReverseListIterator;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRPseudoVersionRegistry;
import com.helger.diver.api.version.DVRVersion;
import com.helger.diver.api.version.IDVRPseudoVersion;
import com.helger.diver.repo.IRepoStorageReadItem;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.RepoStorageReadableResource;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.diver.repo.toc.RepoToc;
import com.helger.phive.api.config.PhivePseudoVersionRegistrarSPIImpl;
import com.helger.phive.api.diver.IPseudoVersionResolver;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.ves.model.v1.VESStatus1Helper;
import com.helger.phive.ves.model.v1.VESStatus1Marshaller;
import com.helger.phive.ves.v10.VesStatusType;

/**
 * Helper class used by {@link VESLoader} to resolve the pseudo versions based on a repository table
 * of contents and the status objects.
 *
 * @author Philip Helger
 */
public final class VESLoaderPseudoVersionResolver implements IPseudoVersionResolver <DVRCoordinate>
{
  private final IRepoStorageWithToc m_aRepo;

  public VESLoaderPseudoVersionResolver (@NonNull final IRepoStorageWithToc aRepo)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    m_aRepo = aRepo;
  }

  @Nullable
  private DVRCoordinate _findFirstMatchingByVersion (@Nullable final String sGroupID,
                                                     @Nullable final String sArtifactID,
                                                     @Nullable final Set <String> aVersionsToIgnore,
                                                     final boolean bIncludeSnapshots,
                                                     @NonNull final ESortOrder eSortOrder,
                                                     @Nullable final Predicate <DVRCoordinate> aResultDecider)
  {
    if (StringHelper.isNotEmpty (sGroupID) && StringHelper.isNotEmpty (sArtifactID))
    {
      // Get all versions of group and artifact
      final RepoToc aToc = m_aRepo.readTocModel (sGroupID, sArtifactID);
      if (aToc != null)
      {
        // Build version acceptor
        final Predicate <DVRVersion> aVersionAcceptor = DVRVersion.getStaticVersionAcceptor (aVersionsToIgnore,
                                                                                             bIncludeSnapshots);

        // Get iterator through all versions, so that the first match can be
        // used
        final ICommonsList <DVRVersion> aVersions = aToc.getAllVersionsAsList ();
        final Iterator <DVRVersion> it;
        if (eSortOrder.isAscending ())
          it = aVersions.iterator ();
        else
          it = new ReverseListIterator <> (aVersions);

        // Iterate version list
        while (it.hasNext ())
        {
          final DVRVersion aCurVersion = it.next ();
          if (aVersionAcceptor.test (aCurVersion))
          {
            // Matches the version requirement
            final DVRCoordinate ret = new DVRCoordinate (sGroupID, sArtifactID, aCurVersion);
            if (aResultDecider == null || aResultDecider.test (ret))
              return ret;
          }
        }
      }

    }
    return null;
  }

  @Nullable
  public DVRCoordinate getOldestVersion (@Nullable final String sGroupID,
                                         @Nullable final String sArtifactID,
                                         @Nullable final Set <String> aVersionsToIgnore)
  {
    // Oldest version on top
    return _findFirstMatchingByVersion (sGroupID, sArtifactID, aVersionsToIgnore, true, ESortOrder.ASCENDING, null);
  }

  @Nullable
  public DVRCoordinate getOldestReleaseVersion (@Nullable final String sGroupID,
                                                @Nullable final String sArtifactID,
                                                @Nullable final Set <String> aVersionsToIgnore)
  {
    // Oldest version on top
    return _findFirstMatchingByVersion (sGroupID, sArtifactID, aVersionsToIgnore, false, ESortOrder.ASCENDING, null);
  }

  @Nullable
  public DVRCoordinate getLatestVersion (@Nullable final String sGroupID,
                                         @Nullable final String sArtifactID,
                                         @Nullable final Set <String> aVersionsToIgnore)
  {
    // Newest version on top
    return _findFirstMatchingByVersion (sGroupID, sArtifactID, aVersionsToIgnore, true, ESortOrder.DESCENDING, null);
  }

  @Nullable
  public DVRCoordinate getLatestReleaseVersion (@Nullable final String sGroupID,
                                                @Nullable final String sArtifactID,
                                                @Nullable final Set <String> aVersionsToIgnore)
  {
    // Newest version on top
    return _findFirstMatchingByVersion (sGroupID, sArtifactID, aVersionsToIgnore, false, ESortOrder.DESCENDING, null);
  }

  /**
   * This helper class does the real status loading and interpretation.
   *
   * @author Philip Helger
   */
  private final class VESIDSelectorByStatusValidity implements Predicate <DVRCoordinate>
  {
    private final OffsetDateTime m_aRealCheckDateTime;

    VESIDSelectorByStatusValidity (@NonNull final OffsetDateTime aCheckDateTime)
    {
      // Make sure we have a non-null check date time
      m_aRealCheckDateTime = aCheckDateTime != null ? aCheckDateTime : PDTFactory.getCurrentOffsetDateTime ();
    }

    public boolean test (@NonNull final DVRCoordinate aVESID)
    {
      // Check if there is a "status" object available in the repo
      final RepoStorageKeyOfArtefact aRepoKeyStatus = RepoStorageKeyOfArtefact.of (aVESID, VESLoader.FILE_EXT_STATUS);
      final IRepoStorageReadItem aRepoContentStatus = m_aRepo.read (aRepoKeyStatus);
      if (aRepoContentStatus != null)
      {
        // We found a status - interpret it
        final VesStatusType aVESStatus = new VESStatus1Marshaller ().read (new RepoStorageReadableResource (aRepoKeyStatus,
                                                                                                            aRepoContentStatus.getContent ()));
        if (aVESStatus != null)
        {
          // Convert JAXB data model to Java date model
          final IValidationExecutorSetStatus aStatus = VESStatus1Helper.convert (aVESStatus);
          return aStatus.isValidPer (m_aRealCheckDateTime);
        }
      }
      // Accept if no status is present etc.
      return true;
    }
  }

  @Nullable
  public DVRCoordinate getLatestActiveVersion (@Nullable final String sGroupID,
                                               @Nullable final String sArtifactID,
                                               @Nullable final Set <String> aVersionsToIgnore,
                                               @Nullable final OffsetDateTime aCheckDateTime)
  {
    // Newest version on top
    return _findFirstMatchingByVersion (sGroupID,
                                        sArtifactID,
                                        aVersionsToIgnore,
                                        true,
                                        ESortOrder.DESCENDING,
                                        new VESIDSelectorByStatusValidity (aCheckDateTime));
  }

  @Nullable
  public DVRCoordinate getLatestReleaseActiveVersion (@Nullable final String sGroupID,
                                                      @Nullable final String sArtifactID,
                                                      @Nullable final Set <String> aVersionsToIgnore,
                                                      @Nullable final OffsetDateTime aCheckDateTime)
  {
    // Newest version on top
    return _findFirstMatchingByVersion (sGroupID,
                                        sArtifactID,
                                        aVersionsToIgnore,
                                        false,
                                        ESortOrder.DESCENDING,
                                        new VESIDSelectorByStatusValidity (aCheckDateTime));
  }

  /**
   * Resolve the provided VESID with a pseudo version to a static version.
   *
   * @param aRepo
   *        The repository that contains the effective versions to be resolved. May not be
   *        <code>null</code>.
   * @param aVESID
   *        The VESID with the pseudo version. May not be <code>null</code>.
   * @param aVersionsToIgnore
   *        An optional set of static versions that should be ignored and not returned. May be
   *        <code>null</code>.
   * @param aCheckDateTime
   *        The date and time for which the resolution should be performed. If <code>null</code> the
   *        current date and time will be used.
   * @return <code>null</code> if the pseudo version could not be resolved.
   * @since 9.2.1
   */
  @Nullable
  public static DVRCoordinate resolvePseudoVersion (@NonNull final IRepoStorageWithToc aRepo,
                                                    @NonNull final DVRCoordinate aVESID,
                                                    @Nullable final Set <String> aVersionsToIgnore,
                                                    @Nullable final OffsetDateTime aCheckDateTime)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.isTrue ( () -> aVESID.getVersionObj ().isPseudoVersion (), "VESID Version must be a pseudo version");

    final IDVRPseudoVersion aPseudoVersion = aVESID.getVersionObj ().getPseudoVersion ();
    final VESLoaderPseudoVersionResolver aResolver = new VESLoaderPseudoVersionResolver (aRepo);

    if (aPseudoVersion.equals (DVRPseudoVersionRegistry.OLDEST))
      return aResolver.getOldestVersion (aVESID.getGroupID (), aVESID.getArtifactID (), aVersionsToIgnore);

    if (aPseudoVersion.equals (DVRPseudoVersionRegistry.LATEST_RELEASE))
      return aResolver.getLatestReleaseVersion (aVESID.getGroupID (), aVESID.getArtifactID (), aVersionsToIgnore);

    if (aPseudoVersion.equals (DVRPseudoVersionRegistry.LATEST))
      return aResolver.getLatestVersion (aVESID.getGroupID (), aVESID.getArtifactID (), aVersionsToIgnore);

    if (aPseudoVersion.equals (PhivePseudoVersionRegistrarSPIImpl.LATEST_ACTIVE))
      return aResolver.getLatestActiveVersion (aVESID.getGroupID (),
                                               aVESID.getArtifactID (),
                                               aVersionsToIgnore,
                                               aCheckDateTime);

    if (aPseudoVersion.equals (PhivePseudoVersionRegistrarSPIImpl.LATEST_RELEASE_ACTIVE))
      return aResolver.getLatestReleaseActiveVersion (aVESID.getGroupID (),
                                                      aVESID.getArtifactID (),
                                                      aVersionsToIgnore,
                                                      aCheckDateTime);

    throw new IllegalStateException ("Unsupported pseudo version " + aPseudoVersion);
  }
}
