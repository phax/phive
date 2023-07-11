package com.helger.phive.engine.repo;

import javax.annotation.Nonnull;

public enum ERepoWritable
{
  WITH_WRITE,
  WITHOUT_WRITE;

  public boolean isWriteEnabled ()
  {
    return this == WITH_WRITE;
  }

  public boolean isWriteDisabled ()
  {
    return this == WITHOUT_WRITE;
  }

  @Nonnull
  public static ERepoWritable valueOf (final boolean b)
  {
    return b ? WITH_WRITE : WITHOUT_WRITE;
  }
}
