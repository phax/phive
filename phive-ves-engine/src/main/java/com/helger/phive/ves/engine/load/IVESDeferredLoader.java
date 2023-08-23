package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

@FunctionalInterface
public interface IVESDeferredLoader
{
  // TODO add ErrorList
  @Nonnull
  LoadedVES deferredLoad ();
}
