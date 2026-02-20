/*
 * Copyright (C) 2026 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.repo;

import org.jspecify.annotations.NonNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.state.ESuccess;
import com.helger.collection.commons.CommonsConcurrentHashMap;
import com.helger.collection.commons.ICommonsMap;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.repo.IRepoStorage;
import com.helger.diver.repo.IRepoStorageAuditor;
import com.helger.diver.repo.IRepoStorageContent;
import com.helger.diver.repo.RepoStorageKey;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.phive.ves.model.v1.VESStatus1Helper;
import com.helger.phive.ves.model.v1.VESStatus1Marshaller;
import com.helger.phive.ves.v10.VesStatusType;

/**
 * A specific implementation of {@link IRepoStorageAuditor} that updates
 * {@link IRepoVESTopTocService}.
 *
 * @author Philip Helger
 * @since 11.2.0
 */
public class RepoVESTopTocAuditor implements IRepoStorageAuditor
{
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoVESTopTocAuditor.class);

  // Key is the repository ID
  private final ICommonsMap <String, Object> m_aTopTocServiceInitialized = new CommonsConcurrentHashMap <> ();
  private final IRepoVESTopTocService m_aVESTopTocService;
  private final IRepoVESTopTocObjectTypeDeterminator m_aDeterminator;

  public RepoVESTopTocAuditor (@NonNull final IRepoVESTopTocService aVESTopTocService,
                               @NonNull final IRepoVESTopTocObjectTypeDeterminator aDeterminator)
  {
    ValueEnforcer.notNull (aVESTopTocService, "VESTopTocService");
    ValueEnforcer.notNull (aDeterminator, "Determinator");
    m_aVESTopTocService = aVESTopTocService;
    m_aDeterminator = aDeterminator;
  }

  @NonNull
  public final IRepoVESTopTocService getVESTopTocService ()
  {
    return m_aVESTopTocService;
  }

  @NonNull
  public final IRepoVESTopTocObjectTypeDeterminator getVESTopTocDeterminator ()
  {
    return m_aDeterminator;
  }

  @NonNull
  private IRepoVESTopTocService _getVTT (@NonNull final IRepoStorageWithToc aRepoWithToc)
  {
    final String sRepoID = aRepoWithToc.getID ();
    if (m_aTopTocServiceInitialized.put (sRepoID, Boolean.TRUE) == null)
    {
      LOGGER.info ("Begin initializing TopToc for repo '" + sRepoID + "'");
      m_aVESTopTocService.initForRepo (aRepoWithToc);
      LOGGER.info ("Done initializing TopToc for repo '" + sRepoID + "'");
    }

    return m_aVESTopTocService;
  }

  @NonNull
  private static DVRCoordinate _getWithoutClassifier (@NonNull final DVRCoordinate a)
  {
    return a.getWithClassifier (null);
  }

  public void onWrite (@NonNull final IRepoStorage aRepo,
                       @NonNull final RepoStorageKey aKey,
                       @NonNull final IRepoStorageContent aContent,
                       @NonNull final ESuccess eSuccess)
  {
    // We only care about success
    if (eSuccess.isSuccess () &&
        aRepo instanceof final IRepoStorageWithToc aRepoWithToc &&
        aRepoWithToc.isEnableTocUpdates () &&
        aKey instanceof final RepoStorageKeyOfArtefact aArtefactKey)
    {
      // Update top-level ToC
      final DVRCoordinate aCoord = aArtefactKey.getCoordinate ();

      // Is the provided key a VES?
      if (m_aDeterminator.isVES (aKey))
        _getVTT (aRepoWithToc).createVES (_getWithoutClassifier (aCoord));
      else
        if (m_aDeterminator.isStatus (aKey))
        {
          // Try reading as VES Status V1
          final VesStatusType aStatus1 = new VESStatus1Marshaller ().read (aContent.getBufferedInputStream ());
          if (aStatus1 != null)
          {
            // Convert JAXB to generic status type
            _getVTT (aRepoWithToc).changeVESStatus (_getWithoutClassifier (aCoord),
                                                    VESStatus1Helper.convert (aStatus1));
          }
          else
            LOGGER.warn ("The provided data could not be interpreted to a valid VES status!");
        }
    }
  }

  public void onDelete (@NonNull final IRepoStorage aRepo,
                        @NonNull final RepoStorageKey aKey,
                        @NonNull final ESuccess eSuccess)
  {
    // We only care about success
    if (eSuccess.isSuccess () &&
        aRepo instanceof final IRepoStorageWithToc aRepoWithToc &&
        aRepoWithToc.isEnableTocUpdates () &&
        aKey instanceof final RepoStorageKeyOfArtefact aArtefactKey)
    {
      // Update top-level ToC
      final DVRCoordinate aCoord = aArtefactKey.getCoordinate ();

      // Is the provided key a VES?
      if (m_aDeterminator.isVES (aKey))
        _getVTT (aRepoWithToc).deleteVES (_getWithoutClassifier (aCoord));
    }
  }
}
