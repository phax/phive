package com.helger.phive.ves.engine.load;

import java.time.OffsetDateTime;
import java.util.Iterator;
import java.util.Set;
import java.util.function.Predicate;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.iterate.ReverseListIterator;
import com.helger.commons.compare.ESortOrder;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.string.StringHelper;
import com.helger.diver.api.version.VESID;
import com.helger.diver.api.version.VESVersion;
import com.helger.diver.repo.IRepoStorageReadItem;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.RepoStorageReadableResource;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.diver.repo.toc.RepoToc;
import com.helger.phive.api.diver.IPseudoVersionResolver;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.ves.model.v1.VESStatus1Helper;
import com.helger.phive.ves.model.v1.VESStatus1Marshaller;
import com.helger.phive.ves.v10.VesStatusType;

final class VESLoaderPseudoVersionResolver implements IPseudoVersionResolver <VESID>
{
  private final IRepoStorageWithToc m_aRepo;

  public VESLoaderPseudoVersionResolver (@Nonnull final IRepoStorageWithToc aRepo)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    m_aRepo = aRepo;
  }

  @Nonnull
  private static Predicate <VESVersion> _getVersionAcceptor (@Nullable final Set <String> aVersionsToIgnore,
                                                             final boolean bIncludeSnapshots)
  {
    if (CollectionHelper.isEmpty (aVersionsToIgnore))
    {
      if (bIncludeSnapshots)
      {
        // We take all
        return x -> true;
      }

      // We take everything except static snapshot versions
      return x -> !x.isStaticSnapshotVersion ();
    }

    // We have something to ignore
    if (bIncludeSnapshots)
    {
      // We take all, except for the ignored versions
      return x -> !aVersionsToIgnore.contains (x.getAsString ());
    }

    // We take all except static snapshot versions and except for the ignored
    // versions
    return x -> !x.isStaticSnapshotVersion () && !aVersionsToIgnore.contains (x.getAsString ());
  }

  @Nullable
  private VESID _resolveByVersion (@Nullable final String sGroupID,
                                   @Nullable final String sArtifactID,
                                   @Nullable final Set <String> aVersionsToIgnore,
                                   final boolean bIncludeSnapshots,
                                   @Nonnull final ESortOrder eSortOrder,
                                   @Nullable final Predicate <VESID> aResultDecider)
  {
    if (StringHelper.hasText (sGroupID) && StringHelper.hasText (sArtifactID))
    {
      final RepoToc aToc = m_aRepo.readTocModel (sGroupID, sArtifactID);
      if (aToc != null)
      {
        // Build version acceptor
        final Predicate <VESVersion> aVersionAcceptor = _getVersionAcceptor (aVersionsToIgnore, bIncludeSnapshots);

        // Get iterator through all versions, so that the first match can be
        // used
        final ICommonsList <VESVersion> aVersions = aToc.getAllVersionsAsList ();
        final Iterator <VESVersion> it;
        if (eSortOrder.isAscending ())
          it = aVersions.iterator ();
        else
          it = new ReverseListIterator <> (aVersions);

        // Iterate version list
        while (it.hasNext ())
        {
          final VESVersion aCurVersion = it.next ();
          if (aVersionAcceptor.test (aCurVersion))
          {
            final VESID ret = new VESID (sGroupID, sArtifactID, aCurVersion.getAsString ());
            if (aResultDecider == null || aResultDecider.test (ret))
              return ret;
          }
        }
      }

    }
    return null;
  }

  @Nullable
  public VESID getOldestVersion (@Nullable final String sGroupID,
                                 @Nullable final String sArtifactID,
                                 @Nullable final Set <String> aVersionsToIgnore)
  {
    return _resolveByVersion (sGroupID, sArtifactID, aVersionsToIgnore, true, ESortOrder.ASCENDING, null);
  }

  @Nullable
  public VESID getOldestReleaseVersion (@Nullable final String sGroupID,
                                        @Nullable final String sArtifactID,
                                        @Nullable final Set <String> aVersionsToIgnore)
  {
    return _resolveByVersion (sGroupID, sArtifactID, aVersionsToIgnore, false, ESortOrder.ASCENDING, null);
  }

  @Nullable
  public VESID getLatestVersion (@Nullable final String sGroupID,
                                 @Nullable final String sArtifactID,
                                 @Nullable final Set <String> aVersionsToIgnore)
  {
    return _resolveByVersion (sGroupID, sArtifactID, aVersionsToIgnore, true, ESortOrder.DESCENDING, null);
  }

  @Nullable
  public VESID getLatestReleaseVersion (@Nullable final String sGroupID,
                                        @Nullable final String sArtifactID,
                                        @Nullable final Set <String> aVersionsToIgnore)
  {
    return _resolveByVersion (sGroupID, sArtifactID, aVersionsToIgnore, false, ESortOrder.DESCENDING, null);
  }

  private final class VESIDSelectorByStatusValidity implements Predicate <VESID>
  {
    private final OffsetDateTime m_aRealCheckDateTime;

    VESIDSelectorByStatusValidity (@Nonnull final OffsetDateTime aCheckDateTime)
    {
      // Make sure we have a non-null check date time
      m_aRealCheckDateTime = aCheckDateTime != null ? aCheckDateTime : PDTFactory.getCurrentOffsetDateTime ();
    }

    public boolean test (@Nonnull final VESID aVESID)
    {
      final RepoStorageKeyOfArtefact aRepoKeyStatus = RepoStorageKeyOfArtefact.of (aVESID, VESLoader.FILE_EXT_STATUS);
      final IRepoStorageReadItem aRepoContentStatus = m_aRepo.read (aRepoKeyStatus);
      if (aRepoContentStatus != null)
      {
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
  public VESID getLatestActiveVersion (@Nullable final String sGroupID,
                                       @Nullable final String sArtifactID,
                                       @Nullable final Set <String> aVersionsToIgnore,
                                       @Nullable final OffsetDateTime aCheckDateTime)
  {
    return _resolveByVersion (sGroupID,
                              sArtifactID,
                              aVersionsToIgnore,
                              true,
                              ESortOrder.DESCENDING,
                              new VESIDSelectorByStatusValidity (aCheckDateTime));
  }

  @Nullable
  public VESID getLatestReleaseActiveVersion (@Nullable final String sGroupID,
                                              @Nullable final String sArtifactID,
                                              @Nullable final Set <String> aVersionsToIgnore,
                                              @Nullable final OffsetDateTime aCheckDateTime)
  {
    return _resolveByVersion (sGroupID,
                              sArtifactID,
                              aVersionsToIgnore,
                              false,
                              ESortOrder.DESCENDING,
                              new VESIDSelectorByStatusValidity (aCheckDateTime));
  }
}
