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
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.string.ToStringGenerator;

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

  public ValidationExecutorSetStatusHistoryItem (@Nonnull final OffsetDateTime aChangeDateTime,
                                                 @Nonnull @Nonempty final String sAuthor,
                                                 @Nullable final String sChangeCode,
                                                 @Nonnull @Nonempty final String sText)
  {
    ValueEnforcer.notNull (aChangeDateTime, "ChangeDateTime");
    ValueEnforcer.notEmpty (sAuthor, "Author");
    ValueEnforcer.notEmpty (sText, "Text");
    m_aChangeDateTime = aChangeDateTime;
    m_sAuthor = sAuthor;
    m_sChangeCode = sChangeCode;
    m_sText = sText;
  }

  @Nonnull
  public final OffsetDateTime getChangeDateTime ()
  {
    return m_aChangeDateTime;
  }

  @Nonnull
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

  @Nonnull
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
}
