/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.annotation.style.ReturnsMutableObject;
import com.helger.base.string.StringHelper;
import com.helger.collection.commons.ICommonsList;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diver.api.coord.DVRCoordinate;

/**
 * Defines the status of a VES.
 *
 * @author Philip Helger
 * @since 9.2.0
 */
public interface IValidationExecutorSetStatus
{
  /**
   * @return The date and time of the last modification of this status. Precision is limited to
   *         milliseconds. May never be <code>null</code>.
   */
  @NonNull
  OffsetDateTime getStatusLastModification ();

  /**
   * @return The effective status type. May not be <code>null</code>.
   */
  @NonNull
  EValidationExecutorStatusType getType ();

  /**
   * @return <code>true</code> if the status type is deprecated, <code>false</code> if not.
   */
  default boolean isDeprecated ()
  {
    return getType ().isDeprecated ();
  }

  /**
   * @return <code>true</code> if a display name is present, <code>false</code> otherwise.
   * @since 12.0.0
   */
  @Deprecated (forRemoval = true, since = "12.0.1")
  default boolean hasDisplayName ()
  {
    return StringHelper.isNotEmpty (getDisplayName ());
  }

  /**
   * @return The display name of this object. May be <code>null</code>.
   * @since 12.0.0
   */
  @Nullable
  @Deprecated (forRemoval = true, since = "12.0.1")
  default String getDisplayName ()
  {
    return null;
  }

  default boolean hasValidFrom ()
  {
    return getValidFrom () != null;
  }

  /**
   * @return The date and time from which this artefact is valid. Precision is limited to
   *         milliseconds. May be <code>null</code> to indicate "since forever".
   */
  @Nullable
  OffsetDateTime getValidFrom ();

  default boolean hasValidTo ()
  {
    return getValidTo () != null;
  }

  /**
   * @return The date and time until which this artefact is valid. Precision is limited to
   *         milliseconds. May be <code>null</code> to indicate "forever".
   */
  @Nullable
  OffsetDateTime getValidTo ();

  /**
   * Check if the current date and time is within the validity period. The deprecation state is not
   * considered. See {@link #isActivePerNow()} for that.
   *
   * @return <code>true</code> if the current date and time is within the validity period,
   *         <code>false</code> if not.
   */
  default boolean isValidPerNow ()
  {
    return isValidPer (PDTFactory.getCurrentOffsetDateTime ());
  }

  /**
   * Check if the provided date and time is within the validity period. The deprecation state is
   * not considered. See {@link #isActivePer(OffsetDateTime)} for that.
   *
   * @param aDT
   *        The date and time to check. May not be <code>null</code>.
   * @return <code>true</code> if the provided date and time is within the validity period,
   *         <code>false</code> if not.
   */
  default boolean isValidPer (@NonNull final OffsetDateTime aDT)
  {
    if (hasValidFrom () && aDT.isBefore (getValidFrom ()))
      return false;
    if (hasValidTo () && aDT.isAfter (getValidTo ()))
      return false;
    return true;
  }

  /**
   * Check if this status is active at the current date and time. Active means not deprecated and
   * within the validity period.
   *
   * @return <code>true</code> if active, <code>false</code> if not.
   * @see #isActivePer(OffsetDateTime)
   * @since 12.3.2
   */
  default boolean isActivePerNow ()
  {
    return isActivePer (PDTFactory.getCurrentOffsetDateTime ());
  }

  /**
   * Check if this status is active at the provided date and time. Active means not deprecated and
   * within the validity period.
   *
   * @param aDT
   *        The date and time to check. May not be <code>null</code>.
   * @return <code>true</code> if active, <code>false</code> if not.
   * @see #isDeprecated()
   * @see #isValidPer(OffsetDateTime)
   * @since 12.3.2
   */
  default boolean isActivePer (@NonNull final OffsetDateTime aDT)
  {
    return !isDeprecated () && isValidPer (aDT);
  }

  default boolean hasDeprecationReason ()
  {
    return StringHelper.isNotEmpty (getDeprecationReason ());
  }

  /**
   * @return If this is deprecated, this field may contain a human readable description. May be
   *         <code>null</code>.
   */
  @Nullable
  String getDeprecationReason ();

  /**
   * @return <code>true</code> if a replacement VESID is present, <code>false</code> if not.
   */
  default boolean hasReplacementVESID ()
  {
    return getReplacementVESID () != null;
  }

  /**
   * @return The replacement VESID to be used. May be <code>null</code>. If this artefact is
   *         deprecated and a later version exists, the latest version is always considered the
   *         appropriate replacement. However if group ID or artefact ID changed, it needs to be
   *         explicitly provided here as a replacement VESID.
   */
  @Nullable
  DVRCoordinate getReplacementVESID ();

  @NonNull
  @Nonempty
  @ReturnsMutableObject
  ICommonsList <ValidationExecutorSetStatusHistoryItem> historyItems ();

  @NonNull
  @Nonempty
  @ReturnsMutableCopy
  ICommonsList <ValidationExecutorSetStatusHistoryItem> getAllHistoryItems ();
}
