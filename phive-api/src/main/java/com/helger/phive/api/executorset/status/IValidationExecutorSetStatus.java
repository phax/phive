/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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
package com.helger.phive.api.executorset.status;

import java.time.OffsetDateTime;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.string.StringHelper;
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
   * @return The date and time of the last modification of this status.
   *         Precision is limited to milliseconds. May never be
   *         <code>null</code>.
   */
  @Nonnull
  OffsetDateTime getStatusLastModification ();

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

  default boolean hasValidFrom ()
  {
    return getValidFrom () != null;
  }

  /**
   * @return The date and time from which this artefact is valid. Precision is
   *         limited to milliseconds. May be <code>null</code> to indicate
   *         "since forever".
   */
  @Nullable
  OffsetDateTime getValidFrom ();

  default boolean hasValidTo ()
  {
    return getValidTo () != null;
  }

  /**
   * @return The date and time until which this artefact is valid. Precision is
   *         limited to milliseconds. May be <code>null</code> to indicate
   *         "forever".
   */
  @Nullable
  OffsetDateTime getValidTo ();

  default boolean hasDeprecationReason ()
  {
    return StringHelper.hasText (getDeprecationReason ());
  }

  /**
   * @return If this is deprecated, this field may contain a human readable
   *         description. May be <code>null</code>.
   */
  @Nullable
  String getDeprecationReason ();

  /**
   * @return <code>true</code> if a replacement VESID is present,
   *         <code>false</code> if not.
   */
  default boolean hasReplacementVESID ()
  {
    return getReplacementVESID () != null;
  }

  /**
   * @return The replacement VESID to be used. May be <code>null</code>. If this
   *         artefact is deprecated and a later version exists, the latest
   *         version is always considered the appropriate replacement. However
   *         if group ID or artefact ID changed, it needs to be explicitly
   *         provided here as a replacement VESID.
   */
  @Nullable
  VESID getReplacementVESID ();

  @Nonnull
  @Nonempty
  @ReturnsMutableObject
  ICommonsList <ValidationExecutorSetStatusHistoryItem> historyItems ();

  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  ICommonsList <ValidationExecutorSetStatusHistoryItem> getAllHistoryItems ();
}
