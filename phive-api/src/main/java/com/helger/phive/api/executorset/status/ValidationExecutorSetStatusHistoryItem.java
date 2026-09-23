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
import com.helger.base.builder.IBuilder;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.string.StringHelper;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.datetime.helper.PDTFactory;
import com.helger.datetime.xml.XMLOffsetDateTime;

/**
 * This class contains a single history item of a VES status
 *
 * @author Philip Helger
 * @since 9.2.0
 */
@Immutable
public class ValidationExecutorSetStatusHistoryItem
{
  private final OffsetDateTime m_aChangeDateTime;
  private final String m_sAuthor;
  private final String m_sChangeCode;
  private final String m_sText;

  public ValidationExecutorSetStatusHistoryItem (@NonNull final OffsetDateTime aChangeDateTime,
                                                 @NonNull @Nonempty final String sAuthor,
                                                 @Nullable final String sChangeCode,
                                                 @NonNull @Nonempty final String sText)
  {
    ValueEnforcer.notNull (aChangeDateTime, "ChangeDateTime");
    ValueEnforcer.notEmpty (sAuthor, "Author");
    ValueEnforcer.notEmpty (sText, "Text");
    m_aChangeDateTime = aChangeDateTime;
    m_sAuthor = sAuthor;
    m_sChangeCode = sChangeCode;
    m_sText = sText;
  }

  @NonNull
  public final OffsetDateTime getChangeDateTime ()
  {
    return m_aChangeDateTime;
  }

  @NonNull
  @Nonempty
  public String getAuthor ()
  {
    return m_sAuthor;
  }

  @Nullable
  public String getChangeCode ()
  {
    return m_sChangeCode;
  }

  @NonNull
  @Nonempty
  public String getText ()
  {
    return m_sText;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("ChangeDateTime", m_aChangeDateTime)
                                       .append ("Author", m_sAuthor)
                                       .append ("ChangeCode", m_sChangeCode)
                                       .append ("Text", m_sText)
                                       .getToString ();
  }

  /**
   * @return A new builder for {@link ValidationExecutorSetStatusHistoryItem} objects. Never
   *         <code>null</code>.
   * @since 12.1.1
   */
  @NonNull
  public static ValidationExecutorSetStatusHistoryItemBuilder builder ()
  {
    return new ValidationExecutorSetStatusHistoryItemBuilder ();
  }

  /**
   * Builder class for {@link ValidationExecutorSetStatusHistoryItem} objects.
   *
   * @author Philip Helger
   * @since 12.1.1
   */
  @NotThreadSafe
  public static class ValidationExecutorSetStatusHistoryItemBuilder implements
                                                                    IBuilder <ValidationExecutorSetStatusHistoryItem>
  {
    private OffsetDateTime m_aChangeDateTime = PDTFactory.getCurrentOffsetDateTime ();
    private String m_sAuthor;
    private String m_sChangeCode;
    private String m_sText;

    public ValidationExecutorSetStatusHistoryItemBuilder ()
    {}

    /**
     * Set the date and time when the change happened. By default this is the date and time at which
     * this builder was created.
     *
     * @param a
     *        The change date and time. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusHistoryItemBuilder changeDateTime (@Nullable final OffsetDateTime a)
    {
      m_aChangeDateTime = a;
      return this;
    }

    /**
     * Set the date and time when the change happened. By default this is the date and time at which
     * this builder was created.
     *
     * @param a
     *        The change date and time. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusHistoryItemBuilder changeDateTime (@Nullable final XMLOffsetDateTime a)
    {
      return changeDateTime (a == null ? null : a.toOffsetDateTime ());
    }

    /**
     * Set the change date and time to the current date and time.
     *
     * @return this for chaining
     * @see #changeDateTime(OffsetDateTime)
     */
    @NonNull
    public final ValidationExecutorSetStatusHistoryItemBuilder changeDateTimeNow ()
    {
      return changeDateTime (PDTFactory.getCurrentOffsetDateTime ());
    }

    /**
     * Set the author of the change. This field is required.
     *
     * @param s
     *        The author. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusHistoryItemBuilder author (@Nullable final String s)
    {
      m_sAuthor = s;
      return this;
    }

    /**
     * Set the optional machine readable change code.
     *
     * @param s
     *        The change code. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusHistoryItemBuilder changeCode (@Nullable final String s)
    {
      m_sChangeCode = s;
      return this;
    }

    /**
     * Set the human readable text of the change. This field is required.
     *
     * @param s
     *        The text. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final ValidationExecutorSetStatusHistoryItemBuilder text (@Nullable final String s)
    {
      m_sText = s;
      return this;
    }

    @NonNull
    public ValidationExecutorSetStatusHistoryItem build ()
    {
      if (m_aChangeDateTime == null)
        throw new IllegalStateException ("The change date time is required");
      if (StringHelper.isEmpty (m_sAuthor))
        throw new IllegalStateException ("The author is required");
      if (StringHelper.isEmpty (m_sText))
        throw new IllegalStateException ("The text is required");

      return new ValidationExecutorSetStatusHistoryItem (m_aChangeDateTime, m_sAuthor, m_sChangeCode, m_sText);
    }
  }
}
