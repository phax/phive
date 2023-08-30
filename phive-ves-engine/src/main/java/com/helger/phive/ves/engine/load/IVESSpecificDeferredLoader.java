package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.commons.error.list.ErrorList;

/**
 * Internal helper interface
 *
 * @author Philip Helger
 */
@FunctionalInterface
interface IVESSpecificDeferredLoader
{
  /**
   * Load a VESID asynchronously
   *
   * @param aErrorList
   *        The error list to be filled. May not be <code>null</code>.
   * @return The loaded VES object. Never <code>null</code>.
   */
  @Nonnull
  LoadedVES deferredLoad (@Nonnull ErrorList aErrorList);
}
