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
import java.io.InputStream;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.io.file.FileHelper;
import com.helger.commons.io.file.FileOperationManager;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.state.ESuccess;
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.IRepoStorage;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageType;

/**
 * Base implementation of {@link IRepoStorage} for Amazon AWS S3.
 *
 * @author Philip Helger
 */
public class RepoStorageLocalFileSystem extends AbstractRepoStorage <RepoStorageLocalFileSystem>
{
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageLocalFileSystem.class);

  private final File m_aBaseDir;

  public RepoStorageLocalFileSystem (@Nonnull final File aBaseDir,
                                     @Nonnull @Nonempty final String sID,
                                     @Nonnull final ERepoWritable eWriteEnabled,
                                     @Nonnull final ERepoDeletable eDeleteEnabled)
  {
    super (RepoStorageType.LOCAL_FILE_SYSTEM, sID, eWriteEnabled, eDeleteEnabled);
    ValueEnforcer.notNull (aBaseDir, "BaseDir");
    ValueEnforcer.isFalse (aBaseDir.isFile (), "Base Directory may not be an existing file");
    FileOperationManager.INSTANCE.createDirRecursiveIfNotExisting (aBaseDir.getAbsoluteFile ());
    m_aBaseDir = aBaseDir.getAbsoluteFile ();
  }

  /**
   * @return The base directory as provided in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public final File getBaseDirectory ()
  {
    return m_aBaseDir;
  }

  @Nonnull
  public final File getRelativeFile (@Nonnull final RepoStorageKey aKey)
  {
    return new File (m_aBaseDir, aKey.getPath ());
  }

  public boolean exists (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    final File fSrc = getRelativeFile (aKey);
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Checking for existance in local file system '" + fSrc.getAbsolutePath () + "'");

    final boolean bExists = FileHelper.existsFile (fSrc);

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Local file system object '" +
                    fSrc.getAbsolutePath () +
                    "' " +
                    (bExists ? "exists" : "does not exist"));

    return bExists;
  }

  @Override
  @Nullable
  protected InputStream getInputStream (@Nonnull final RepoStorageKey aKey)
  {
    final File fSrc = getRelativeFile (aKey);
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Reading from local file system '" + fSrc.getAbsolutePath () + "'");

    final InputStream ret = FileHelper.getBufferedInputStream (fSrc);
    if (ret == null)
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to read from local file system '" + fSrc.getAbsolutePath () + "'");
    }
    else
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Found on local file system '" + fSrc.getAbsolutePath () + "'");
    }
    return ret;
  }

  @Override
  @Nonnull
  protected ESuccess writeObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    final File fTarget = getRelativeFile (aKey);
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Writing to local file system '" + fTarget.getAbsolutePath () + "'");

    // Use the source payload
    if (SimpleFileIO.writeFile (fTarget, aPayload).isFailure ())
    {
      LOGGER.error ("Failed to put local file system object '" + fTarget.getAbsolutePath () + "'");
      return ESuccess.FAILURE;
    }

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Successfully wrote to local file system '" + fTarget.getAbsolutePath () + "'");
    return ESuccess.SUCCESS;
  }

  @Override
  @Nonnull
  protected ESuccess deleteObject (@Nonnull final RepoStorageKey aKey)
  {
    final File fTarget = getRelativeFile (aKey);
    LOGGER.info ("Deleting from local file system '" + fTarget.getAbsolutePath () + "'");

    if (FileOperationManager.INSTANCE.deleteFileIfExisting (fTarget).isFailure ())
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to delete local file system object '" + fTarget.getAbsolutePath () + "'");
      return ESuccess.FAILURE;
    }

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Successfully deleted local file system object '" + fTarget.getAbsolutePath () + "'");
    return ESuccess.SUCCESS;
  }
}
