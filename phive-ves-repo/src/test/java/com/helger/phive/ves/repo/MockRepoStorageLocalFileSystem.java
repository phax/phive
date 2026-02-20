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

import java.io.File;

import org.jspecify.annotations.NonNull;

import com.helger.diver.repo.ERepoDeletable;
import com.helger.diver.repo.ERepoWritable;
import com.helger.diver.repo.RepoStorageKey;
import com.helger.diver.repo.impl.RepoStorageLocalFileSystem;

public final class MockRepoStorageLocalFileSystem extends RepoStorageLocalFileSystem
{
  public static final File TEST_REPO_DIR = new File ("target/test-repo");

  public MockRepoStorageLocalFileSystem (@NonNull final ERepoWritable eWriteEnabled,
                                         @NonNull final ERepoDeletable eDeleteEnabled)
  {
    super (TEST_REPO_DIR, "unittest-fs", eWriteEnabled, eDeleteEnabled);

    // Enable a top-level table of contents on XML basis
    setAuditor (new RepoVESTopTocAuditor (new RepoVESTopTocServiceCSV (), new IRepoVESTopTocObjectTypeDeterminator ()
    {
      public boolean isVES (@NonNull final RepoStorageKey aKey)
      {
        return aKey.getPath ().endsWith (".ves");
      }

      public boolean isStatus (@NonNull final RepoStorageKey aKey)
      {
        return aKey.getPath ().endsWith (".status");
      }
    }));
  }

  @NonNull
  public IRepoVESTopTocService getVESTopTocService ()
  {
    return ((RepoVESTopTocAuditor) super.getAuditor ()).getVESTopTocService ();
  }
}
