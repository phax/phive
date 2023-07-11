/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.file.FileHelper;
import com.helger.commons.io.file.FileOperationManager;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.state.ESuccess;
import com.helger.phive.engine.repo.RepoStorageType;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.IRepoStorage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.InputStream;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/**
 * Base implementation of {@link IRepoStorage} for Amazon AWS S3.
 *
 * @author Philip Helger
 */
public class RepoStorageLocalFileSystem extends AbstractRepoStorage
{
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageLocalFileSystem.class);

  private final File m_aBaseDir;

  public RepoStorageLocalFileSystem(@Nonnull final File aBaseDir)
  {
    super (RepoStorageType.LOCAL_FILE_SYSTEM);
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

  public boolean canWrite ()
  {
    return true;
  }

  @Override
  @Nonnull
  protected ESuccess putObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
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

  @Nonnull
  public ESuccess delete (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");
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
