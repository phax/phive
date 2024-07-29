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
package com.helger.phive.xml.schematron;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * This class contains the details for a single custom error.
 *
 * @author Philip Helger
 */
@Immutable
public final class CustomErrorDetails
{
  private final IErrorLevel m_aErrorLevel;
  private final String m_sErrorTextPrefix;
  private final String m_sErrorTextSuffix;

  public CustomErrorDetails (@Nonnull final IErrorLevel aErrorLevel,
                             @Nullable final String sErrorTextPrefix,
                             @Nullable final String sErrorTextSuffix)
  {
    ValueEnforcer.notNull (aErrorLevel, "ErrorLevel");
    m_aErrorLevel = aErrorLevel;
    m_sErrorTextPrefix = sErrorTextPrefix;
    m_sErrorTextSuffix = sErrorTextSuffix;
  }

  @Nonnull
  public IErrorLevel getErrorLevel ()
  {
    return m_aErrorLevel;
  }

  public boolean hasErrorTextPrefix ()
  {
    return StringHelper.hasText (m_sErrorTextPrefix);
  }

  @Nullable
  public String getErrorTextPrefix ()
  {
    return m_sErrorTextPrefix;
  }

  public boolean hasErrorTextSuffix ()
  {
    return StringHelper.hasText (m_sErrorTextSuffix);
  }

  @Nullable
  public String getErrorTextSuffix ()
  {
    return m_sErrorTextSuffix;
  }

  public boolean hasErrorTextPrefixOrSuffix ()
  {
    return hasErrorTextPrefix () || hasErrorTextSuffix ();
  }

  @Nonnull
  public String getWithErrorTextPrefixAndSuffixApplied (@Nonnull final String s)
  {
    String ret;
    if (hasErrorTextPrefix ())
      ret = m_sErrorTextPrefix + s;
    else
      ret = s;
    if (hasErrorTextSuffix ())
      ret = ret + m_sErrorTextSuffix;
    return ret;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("ErrorLevel", m_aErrorLevel)
                                       .appendIfNotNull ("ErrorTextPrefix", m_sErrorTextPrefix)
                                       .appendIfNotNull ("ErrorTextSuffix", m_sErrorTextSuffix)
                                       .getToString ();
  }

  @Nonnull
  public static CustomErrorDetails of (@Nonnull final IErrorLevel aErrorLevel)
  {
    return new CustomErrorDetails (aErrorLevel, null, null);
  }
}
