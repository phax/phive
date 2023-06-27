/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

/**
 * Defines the possible repository storage types.
 *
 * @author Philip Helger
 */
public enum ERepoStorageType
{
  IN_MEMORY,
  LOCAL_FILE_SYSTEM,
  HTTP;

  public boolean isPersistent ()
  {
    return this == LOCAL_FILE_SYSTEM || this == HTTP;
  }

  public boolean isRemote ()
  {
    return this == HTTP;
  }
}
