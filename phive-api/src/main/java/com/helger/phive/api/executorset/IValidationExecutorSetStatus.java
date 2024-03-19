package com.helger.phive.api.executorset;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.diver.api.version.VESID;

/**
 * Defines the status of a VES.
 *
 * @author Philip Helger
 * @since 9.2.0
 */
public interface IValidationExecutorSetStatus
{
  /**
   * @return The effective status type. May not be <code>null</code>.
   */
  @Nonnull
  EValidationExecutorStatusType getType ();

  /**
   * @return <code>true</code> if the status type is deprecated,
   *         <code>false</code> if not.
   */
  default boolean isDeprecated ()
  {
    return getType ().isDeprecated ();
  }

  /**
   * @return <code>true</code> if a replacement VESID is present,
   *         <code>false</code> if not.
   */
  default boolean hasReplacementVESID ()
  {
    return getReplacementVESID () != null;
  }

  /**
   * @return The replacement VESID to be used. May be <code>null</code>.
   */
  @Nullable
  VESID getReplacementVESID ();
}
