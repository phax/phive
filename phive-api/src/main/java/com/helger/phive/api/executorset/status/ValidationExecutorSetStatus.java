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
import com.helger.annotation.concurrent.Immutable;
import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.annotation.style.MustImplementEqualsAndHashcode;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.annotation.style.ReturnsMutableObject;
import com.helger.base.builder.IBuilder;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.equals.EqualsHelper;
import com.helger.base.hashcode.HashCodeGenerator;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.ICommonsList;
import com.helger.datetime.helper.PDTFactory;
import com.helger.datetime.xml.XMLOffsetDateTime;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatusHistoryItem.ValidationExecutorSetStatusHistoryItemBuilder;

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

  public ValidationExecutorSetStatus (@NonNull final OffsetDateTime aStatusLastModDT,
                                      @NonNull final EValidationExecutorStatusType eType,
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

  @NonNull
  public final OffsetDateTime getStatusLastModification ()
  {
    return m_aStatusLastModDT;
  }

  @NonNull
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

  @NonNull
  @Nonempty
  @ReturnsMutableObject
  public ICommonsList <ValidationExecutorSetStatusHistoryItem> historyItems ()
  {
    return m_aHistoryItems;
  }

  @NonNull
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

  @NonNull
  public static ValidationExecutorSetStatus createValidNow ()
  {
    return builder ().statusLastModificationNow ().build ();
  }

  @NonNull
  public static ValidationExecutorSetStatus createValidAt (@NonNull final OffsetDateTime aStatusLastModDT)
  {
    return builder ().statusLastModification (aStatusLastModDT).build ();
  }

  @NonNull
  public static ValidationExecutorSetStatus createDeprecatedNow (final boolean bDeprecated)
  {
    return builder ().type (bDeprecated ? EValidationExecutorStatusType.DEPRECATED
                                        : EValidationExecutorStatusType.VALID).statusLastModificationNow ().build ();
  }

  @NonNull
  public static ValidationExecutorSetStatus createDeprecated (@NonNull final OffsetDateTime aStatusLastModDT,
                                                              final boolean bDeprecated)
  {
    return builder ().type (bDeprecated ? EValidationExecutorStatusType.DEPRECATED
                                        : EValidationExecutorStatusType.VALID)
                     .statusLastModification (aStatusLastModDT)
                     .build ();
  }

  /**
   * @return A new builder for {@link ValidationExecutorSetStatus} objects. Never <code>null</code>.
   * @since 12.1.1
   */
  @NonNull
  public static ValidationExecutorSetStatusBuilder builder ()
  {
    return new ValidationExecutorSetStatusBuilder ();
  }

  /**
   * Builder class for {@link ValidationExecutorSetStatus} objects.
   *
   * @author Philip Helger
   * @since 12.1.1
   */
  @NotThreadSafe
  public static class ValidationExecutorSetStatusBuilder implements IBuilder <ValidationExecutorSetStatus>
  {
    public static final EValidationExecutorStatusType DEFAULT_TYPE = EValidationExecutorStatusType.VALID;

    private OffsetDateTime m_aStatusLastModDT = PDTFactory.getCurrentOffsetDateTime ();
    private EValidationExecutorStatusType m_eType = DEFAULT_TYPE;
    private OffsetDateTime m_aValidFrom;
    private OffsetDateTime m_aValidTo;
    private String m_sDeprecationReason;
    private DVRCoordinate m_aReplacementVESID;
    private final ICommonsList <ValidationExecutorSetStatusHistoryItem> m_aHistoryItems = new CommonsArrayList <> ();

    public ValidationExecutorSetStatusBuilder ()
    {}

    /**
     * Set the date and time when the status was last modified. By default this is the date and time
     * at which this builder was created.
     *
     * @param a
     *        The status last modification date and time. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder statusLastModification (@Nullable final OffsetDateTime a)
    {
      m_aStatusLastModDT = a;
      return this;
    }

    /**
     * Set the date and time when the status was last modified. By default this is the date and time
     * at which this builder was created.
     *
     * @param a
     *        The status last modification date and time. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder statusLastModification (@Nullable final XMLOffsetDateTime a)
    {
      return statusLastModification (a == null ? null : a.toOffsetDateTime ());
    }

    /**
     * Set the status last modification date and time to the current date and time.
     *
     * @return this for chaining
     * @see #statusLastModification(OffsetDateTime)
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder statusLastModificationNow ()
    {
      return statusLastModification (PDTFactory.getCurrentOffsetDateTime ());
    }

    /**
     * Set the overall status type. Defaults to {@link #DEFAULT_TYPE}.
     *
     * @param e
     *        The status type to use. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder type (@Nullable final EValidationExecutorStatusType e)
    {
      m_eType = e;
      return this;
    }

    /**
     * Set the date and time from which on the VES is valid.
     *
     * @param a
     *        The valid from date and time. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder validFrom (@Nullable final OffsetDateTime a)
    {
      m_aValidFrom = a;
      return this;
    }

    /**
     * Set the date and time until which the VES is valid.
     *
     * @param a
     *        The valid to date and time. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder validTo (@Nullable final OffsetDateTime a)
    {
      m_aValidTo = a;
      return this;
    }

    /**
     * Set the human readable reason why the VES was deprecated.
     *
     * @param s
     *        The deprecation reason. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder deprecationReason (@Nullable final String s)
    {
      m_sDeprecationReason = s;
      return this;
    }

    /**
     * Set the VES ID that replaces this VES.
     *
     * @param a
     *        The replacement VES ID. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder replacementVESID (@Nullable final DVRCoordinate a)
    {
      m_aReplacementVESID = a;
      return this;
    }

    /**
     * Set all history items, overwriting all previously contained ones.
     *
     * @param a
     *        The history items to use. May be <code>null</code> to remove all existing ones.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder historyItems (@Nullable final Iterable <? extends ValidationExecutorSetStatusHistoryItem> a)
    {
      if (a == null)
        m_aHistoryItems.clear ();
      else
        m_aHistoryItems.setAll (a);
      return this;
    }

    /**
     * Add a single history item.
     *
     * @param a
     *        The history item to be added. May be <code>null</code> in which case it is ignored.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder addHistoryItem (@Nullable final ValidationExecutorSetStatusHistoryItem a)
    {
      if (a != null)
        m_aHistoryItems.add (a);
      return this;
    }

    /**
     * Add a single history item.
     *
     * @param a
     *        The history item builder to be added. May be <code>null</code> in which case it is
     *        ignored.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder addHistoryItem (@Nullable final ValidationExecutorSetStatusHistoryItemBuilder a)
    {
      return addHistoryItem (a == null ? null : a.build ());
    }

    /**
     * Add multiple history items.
     *
     * @param a
     *        The history items to be added. May be <code>null</code> in which case they are
     *        ignored.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusBuilder addHistoryItems (@Nullable final Iterable <? extends ValidationExecutorSetStatusHistoryItem> a)
    {
      if (a != null)
        m_aHistoryItems.addAll (a);
      return this;
    }

    @NonNull
    public ValidationExecutorSetStatus build ()
    {
      if (m_aStatusLastModDT == null)
        throw new IllegalStateException ("The status last modification date time is required");
      if (m_eType == null)
        throw new IllegalStateException ("The status type is required");

      return new ValidationExecutorSetStatus (m_aStatusLastModDT,
                                              m_eType,
                                              m_aValidFrom,
                                              m_aValidTo,
                                              m_sDeprecationReason,
                                              m_aReplacementVESID,
                                              m_aHistoryItems);
    }
  }
}
