/*
 * Copyright (C) 2026 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.repo;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonnegative;
import com.helger.base.state.EContinue;
import com.helger.base.state.ESuccess;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;

/**
 * Base interface for a VES specific top-level ToC
 *
 * @author Philip Helger
 * @since 11.2.0
 */
public interface IRepoVESTopTocService
{
  interface IIterationCallback
  {
    void onItem (@NonNull DVRCoordinate aCoord, boolean bDeprecated, @Nullable String sDisplayName);
  }

  interface IIterationCallbackBreakable
  {
    @NonNull
    EContinue onItem (@NonNull DVRCoordinate aCoord, boolean bDeprecated, @Nullable String sDisplayName);
  }

  /**
   * Only invoked by the repository that uses this VES Top ToC service. This method must be called
   * before any other method is called.
   *
   * @param aRepo
   *        The repository that uses this service.
   */
  void initForRepo (@NonNull IRepoStorageWithToc aRepo);

  /**
   * Re-initialize the content from the repository that was provided in
   * {@link #initForRepo(IRepoStorageWithToc)}
   */
  void refreshFromRepo ();

  /**
   * @return The number of items contained. Must be &ge; 0.
   */
  @Nonnegative
  int getCount ();

  /**
   * Iterate all items (in undefined order) and invoke the provided callback.
   *
   * @param aCallback
   *        The callback to be invoked. Never <code>null</code>.
   */
  void iterateAllItems (@NonNull IIterationCallback aCallback);

  /**
   * Iterate all items (in undefined order) and invoke the provided callback. Iteration can be
   * stopped by the provided callback.
   *
   * @param aCallback
   *        The callback to be invoked. Never <code>null</code>.
   */
  void iterateAllItemsBreakable (@NonNull IIterationCallbackBreakable aCallback);

  /**
   * Called to register a new or updated VES.
   *
   * @param aCoord
   *        The coordinates to use. Never <code>null</code>.
   * @return {@link ESuccess} if the data were successfully processed. It doesn't mean that they
   *         were actually added - they may have been present before.
   */
  @NonNull
  ESuccess createVES (@NonNull DVRCoordinate aCoord);

  @NonNull
  ESuccess deleteVES (@NonNull DVRCoordinate aCoord);

  @NonNull
  ESuccess changeVESStatus (@NonNull DVRCoordinate aCoord, @NonNull IValidationExecutorSetStatus aStatus);
}
