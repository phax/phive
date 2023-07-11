/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import java.io.File;

import javax.annotation.Nonnull;

import com.helger.phive.engine.repo.ERepoDeletable;
import com.helger.phive.engine.repo.ERepoWritable;

public final class MockRepoStorageLocalFileSystem extends RepoStorageLocalFileSystem
{
  public static final File TEST_REPO_DIR = new File ("src/test/resources/test-repo");

  public MockRepoStorageLocalFileSystem (@Nonnull final ERepoWritable eWriteEnabled,
                                         @Nonnull final ERepoDeletable eDeleteEnabled)
  {
    super (TEST_REPO_DIR, eWriteEnabled, eDeleteEnabled);
  }
}
