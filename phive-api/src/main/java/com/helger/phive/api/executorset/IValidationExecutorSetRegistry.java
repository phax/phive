/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.phive.api.executorset;

import java.util.function.Predicate;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.state.EChange;
import com.helger.phive.api.source.IValidationSource;

/**
 * Read-only interface for a registry of {@link IValidationExecutorSet} objects.
 *
 * @author Philip Helger
 * @since 6.0.0
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
public interface IValidationExecutorSetRegistry <SOURCETYPE extends IValidationSource>
{
  /**
   * Register a validation executor set into this registry.
   *
   * @param aVES
   *        The object to register. May not be <code>null</code>.
   * @throws IllegalStateException
   *         If another object with the same ID is already registered in this
   *         registry.
   */
  void registerValidationExecutorSet (@Nonnull IValidationExecutorSet <SOURCETYPE> aVES);

  /**
   * Unregister a validation executor set from this registry. This basically
   * removes the VES from the internal map. The removed VES are not modified in
   * any way and can theoretically be re-registered afterwards.
   *
   * @param aVES
   *        The object to unregister. May be <code>null</code>.
   * @return {@link EChange#CHANGED} if the removal was successful,
   *         {@link EChange#UNCHANGED} otherwise.
   * @since 6.0.1
   */
  @Nonnull
  default EChange unregisterValidationExecutorSet (@Nullable final IValidationExecutorSet <SOURCETYPE> aVES)
  {
    return aVES == null ? EChange.UNCHANGED : unregisterValidationExecutorSet (aVES.getID ());
  }

  /**
   * Unregister a validation executor set from this registry. This basically
   * removes the VES from the internal map. The removed VES are not modified in
   * any way and can theoretically be re-registered afterwards.
   *
   * @param aVESID
   *        The VES ID of the object to unregister. May be <code>null</code>.
   * @return {@link EChange#CHANGED} if the removal was successful,
   *         {@link EChange#UNCHANGED} otherwise.
   * @since 6.0.1
   */
  @Nonnull
  EChange unregisterValidationExecutorSet (@Nullable VESID aVESID);

  /**
   * @return A list of all contained validation executor sets in this registry.
   *         Never <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  ICommonsList <IValidationExecutorSet <SOURCETYPE>> getAll ();

  /**
   * Find all validation executor sets that match the provided filter.
   *
   * @param aFilter
   *        The filter to be used. May be <code>null</code> in which case the
   *        result is the same as {@link #getAll()}.
   * @return Never <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  ICommonsList <IValidationExecutorSet <SOURCETYPE>> findAll (@Nonnull Predicate <? super IValidationExecutorSet <SOURCETYPE>> aFilter);

  /**
   * Find the first validation executor sets that match the provided filter.
   *
   * @param aFilter
   *        The filter to be used. May be <code>null</code> in which case the
   *        result is the same as {@link #getAll()}.
   * @return <code>null</code> if no match was found.
   */
  @Nullable
  IValidationExecutorSet <SOURCETYPE> findFirst (@Nonnull Predicate <? super IValidationExecutorSet <SOURCETYPE>> aFilter);

  /**
   * Find the validation executor set with the specified ID.
   *
   * @param aID
   *        The ID to search. May be <code>null</code>.
   * @return <code>null</code> if no such validation executor set is registered.
   */
  @Nullable
  IValidationExecutorSet <SOURCETYPE> getOfID (@Nullable VESID aID);
}
