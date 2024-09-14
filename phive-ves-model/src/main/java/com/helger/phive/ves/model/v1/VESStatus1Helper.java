/*
 * Copyright (C) 2023-2024 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.model.v1;

import java.time.OffsetDateTime;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.datetime.XMLOffsetDateTime;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.phive.api.executorset.status.EValidationExecutorStatusType;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatusHistoryItem;
import com.helger.phive.ves.v10.VesStatusType;

/**
 * Utility class for VES Status v1
 *
 * @author Philip Helger
 */
public final class VESStatus1Helper
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESStatus1Helper.class);

  private VESStatus1Helper ()
  {}

  @Nullable
  private static OffsetDateTime _toODT (@Nullable final XMLOffsetDateTime a)
  {
    return a == null ? null : a.toOffsetDateTime ();
  }

  @Nonnull
  public static IValidationExecutorSetStatus convert (@Nonnull final VesStatusType aVESStatus)
  {
    // Determine the status type
    final OffsetDateTime aCheckDT = PDTFactory.getCurrentOffsetDateTime ();
    final OffsetDateTime aValidFrom = _toODT (aVESStatus.getValidFrom ());
    final OffsetDateTime aValidTo = _toODT (aVESStatus.getValidTo ());
    final EValidationExecutorStatusType eType;
    // Already valid?
    if (aValidFrom != null && aCheckDT.isBefore (aValidFrom))
      eType = EValidationExecutorStatusType.NOT_YET_ACTIVE;
    else
      // Still valid?
      if (aValidTo != null && aCheckDT.isAfter (aValidTo))
        eType = EValidationExecutorStatusType.EXPIRED;
      else
        // Deprecated?
        if (aVESStatus.isDeprecated () != null && aVESStatus.isDeprecated ().booleanValue ())
          eType = EValidationExecutorStatusType.DEPRECATED;
        else
          eType = EValidationExecutorStatusType.VALID;

    // Is a replacement ID present?
    DVRCoordinate aReplacementVESID = null;
    if (aVESStatus.getReplacement () != null)
    {
      try
      {
        aReplacementVESID = DVRCoordinate.create (aVESStatus.getReplacement ().getGroupId (),
                                                  aVESStatus.getReplacement ().getArtifactId (),
                                                  aVESStatus.getReplacement ().getVersion ());
      }
      catch (final DVRVersionException ex)
      {
        LOGGER.error ("DVR version error", ex);
      }
    }

    // Read history items
    final ICommonsList <ValidationExecutorSetStatusHistoryItem> aHistoryItems = new CommonsArrayList <> ();
    for (final var aHI : aVESStatus.getHistory ().getHistoryItem ())
    {
      aHistoryItems.add (new ValidationExecutorSetStatusHistoryItem (aHI.getChangeDateTime ().toOffsetDateTime (),
                                                                     aHI.getAuthor (),
                                                                     aHI.getChangeCode (),
                                                                     aHI.getValue ()));
    }

    return new ValidationExecutorSetStatus (_toODT (aVESStatus.getStatusLastModified ()),
                                            eType,
                                            aValidFrom,
                                            aValidTo,
                                            aVESStatus.getDeprecationReason (),
                                            aReplacementVESID,
                                            aHistoryItems);
  }
}
