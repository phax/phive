package com.helger.phive.repo;

import javax.annotation.Nonnull;

public enum ERepoDeletable
{
  WITH_DELETE,
  WITHOUT_DELETE;

  public boolean isDeleteEnabled ()
  {
    return this == WITH_DELETE;
  }

  public boolean isDeleteDisabled ()
  {
    return this == WITHOUT_DELETE;
  }

  @Nonnull
  public static ERepoDeletable valueOf (final boolean b)
  {
    return b ? WITH_DELETE : WITHOUT_DELETE;
  }
}
