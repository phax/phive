/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;
import com.helger.diver.api.coord.DVRCoordinate;

/**
 * Defines the status of a VES.
 *
 * @author Philip Helger
 * @since 9.2.0
 */
@Immutable
@MustImplementEqualsAndHashcode
public class ValidationExecutorSetStatus implements IValidationExecutorSetStatus
{
  private final OffsetDateTime m_aStatusLastModDT;
  private final EValidationExecutorStatusType m_eType;
  private final OffsetDateTime m_aValidFrom;
  private final OffsetDateTime m_aValidTo;
  private final String m_sDeprecationReason;
  private final DVRCoordinate m_aReplacementVESID;
  private final ICommonsList <ValidationExecutorSetStatusHistoryItem> m_aHistoryItems;

  public ValidationExecutorSetStatus (@Nonnull final OffsetDateTime aStatusLastModDT,
                                      @Nonnull final EValidationExecutorStatusType eType,
                                      @Nullable final OffsetDateTime aValidFrom,
                                      @Nullable final OffsetDateTime aValidTo,
                                      @Nullable final String sDeprecationReason,
                                      @Nullable final DVRCoordinate aReplacementVESID,
                                      @Nullable final ICommonsList <ValidationExecutorSetStatusHistoryItem> aHistoryItems)
  {
    ValueEnforcer.notNull (aStatusLastModDT, "StatusLastModDT");
    ValueEnforcer.notNull (eType, "Type");

    m_aStatusLastModDT = PDTFactory.getWithMillisOnly (aStatusLastModDT);
    m_eType = eType;
    m_aValidFrom = PDTFactory.getWithMillisOnly (aValidFrom);
    m_aValidTo = PDTFactory.getWithMillisOnly (aValidTo);
    m_sDeprecationReason = sDeprecationReason;
    m_aReplacementVESID = aReplacementVESID;
    m_aHistoryItems = new CommonsArrayList <> (aHistoryItems);
  }

  @Nonnull
  public final OffsetDateTime getStatusLastModification ()
  {
    return m_aStatusLastModDT;
  }

  @Nonnull
  public final EValidationExecutorStatusType getType ()
  {
    return m_eType;
  }

  @Nullable
  public final OffsetDateTime getValidFrom ()
  {
    return m_aValidFrom;
  }

  @Nullable
  public final OffsetDateTime getValidTo ()
  {
    return m_aValidTo;
  }

  @Nullable
  public final String getDeprecationReason ()
  {
    return m_sDeprecationReason;
  }

  @Nullable
  public DVRCoordinate getReplacementVESID ()
  {
    return m_aReplacementVESID;
  }

  @Nonnull
  @Nonempty
  @ReturnsMutableObject
  public ICommonsList <ValidationExecutorSetStatusHistoryItem> historyItems ()
  {
    return m_aHistoryItems;
  }

  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  public ICommonsList <ValidationExecutorSetStatusHistoryItem> getAllHistoryItems ()
  {
    return m_aHistoryItems.getClone ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;

    // History items are not contained on purpose
    final ValidationExecutorSetStatus rhs = (ValidationExecutorSetStatus) o;
    return m_aStatusLastModDT.equals (rhs.m_aStatusLastModDT) &&
           m_eType.equals (rhs.m_eType) &&
           EqualsHelper.equals (m_aValidFrom, rhs.m_aValidFrom) &&
           EqualsHelper.equals (m_aValidTo, rhs.m_aValidTo) &&
           EqualsHelper.equals (m_sDeprecationReason, rhs.m_sDeprecationReason) &&
           EqualsHelper.equals (m_aReplacementVESID, rhs.m_aReplacementVESID);
  }

  @Override
  public int hashCode ()
  {
    // History items are not contained on purpose
    return new HashCodeGenerator (this).append (m_aStatusLastModDT)
                                       .append (m_eType)
                                       .append (m_aValidFrom)
                                       .append (m_aValidTo)
                                       .append (m_sDeprecationReason)
                                       .append (m_aReplacementVESID)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("StatusLastModDT", m_aStatusLastModDT)
                                       .append ("Type", m_eType)
                                       .append ("ValidFrom", m_aValidFrom)
                                       .append ("ValidTo", m_aValidTo)
                                       .append ("DeprecationReason", m_sDeprecationReason)
                                       .append ("ReplacementVESID", m_aReplacementVESID)
                                       .append ("HistoryItems", m_aHistoryItems)
                                       .getToString ();
  }

  @Nonnull
  public static ValidationExecutorSetStatus createValidNow ()
  {
    return createDeprecatedNow (false);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createValidAt (@Nonnull final OffsetDateTime aStatusLastModDT)
  {
    return createDeprecated (aStatusLastModDT, false);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createDeprecatedNow (final boolean bDeprecated)
  {
    return createDeprecated (PDTFactory.getCurrentOffsetDateTime (), bDeprecated);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createDeprecated (@Nonnull final OffsetDateTime aStatusLastModDT,
                                                              final boolean bDeprecated)
  {
    return new ValidationExecutorSetStatus (aStatusLastModDT,
                                            bDeprecated ? EValidationExecutorStatusType.DEPRECATED
                                                        : EValidationExecutorStatusType.VALID,
                                            (OffsetDateTime) null,
                                            (OffsetDateTime) null,
                                            (String) null,
                                            (DVRCoordinate) null,
                                            (ICommonsList <ValidationExecutorSetStatusHistoryItem>) null);
  }
}
