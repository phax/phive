package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.commons.error.list.ErrorList;

@FunctionalInterface
public interface IVESSpecificDeferredLoader
{
  @Nonnull
  LoadedVES deferredLoad (@Nonnull ErrorList aErrorList);
}
