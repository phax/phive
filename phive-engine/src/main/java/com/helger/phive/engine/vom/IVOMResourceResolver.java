package com.helger.phive.engine.vom;

import javax.annotation.Nullable;

import com.helger.commons.io.resource.IReadableResource;

/**
 * Resolve for VOM resources that are referenced from the VOM.
 *
 * @author Philip Helger
 */
public interface IVOMResourceResolver
{
  /**
   * Find the resource with the provided ID.
   *
   * @param sID
   *        The resource ID to search. May be <code>null</code>.
   * @return The found resource or <code>null</code>.
   */
  @Nullable
  IReadableResource getResourceOfID (@Nullable String sID);
}
