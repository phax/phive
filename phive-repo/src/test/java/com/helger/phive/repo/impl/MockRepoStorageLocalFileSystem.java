/*
 * Copyright (C) 2023 Philip Helger & ecosio
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
package com.helger.phive.repo.impl;

import java.io.File;

import javax.annotation.Nonnull;

import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.impl.RepoStorageLocalFileSystem;

public final class MockRepoStorageLocalFileSystem extends RepoStorageLocalFileSystem
{
  public static final File TEST_REPO_DIR = new File ("src/test/resources/test-repo");

  public MockRepoStorageLocalFileSystem (@Nonnull final ERepoWritable eWriteEnabled,
                                         @Nonnull final ERepoDeletable eDeleteEnabled)
  {
    super (TEST_REPO_DIR, eWriteEnabled, eDeleteEnabled);
  }
}
