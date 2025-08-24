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
package com.helger.phive.api.source;

import java.io.IOException;
import java.io.OutputStream;

import com.helger.annotation.Nonempty;
import com.helger.annotation.WillNotClose;
import com.helger.base.array.bytes.ByteArrayWrapper;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.tostring.ToStringGenerator;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;

/**
 * Default implementation of {@link IValidationSourceBinary}.
 *
 * @author Philip Helger
 * @since 7.1.2
 */
public class ValidationSourceBinary implements IValidationSourceBinary
{
  private final String m_sSystemID;
  private final boolean m_bPartialSource;
  private final ByteArrayWrapper m_aBAW;

  protected ValidationSourceBinary (@Nullable final String sSystemID,
                                    @Nonnull final ByteArrayWrapper aBAW,
                                    final boolean bPartialSource)
  {
    ValueEnforcer.notNull (aBAW, "BAW");
    m_sSystemID = sSystemID;
    m_aBAW = aBAW;
    m_bPartialSource = bPartialSource;
  }

  @Nonnull
  @Nonempty
  public String getValidationSourceTypeID ()
  {
    return VALIDATION_SOURCE_TYPE;
  }

  @Nullable
  public String getSystemID ()
  {
    return m_sSystemID;
  }

  public boolean isPartialSource ()
  {
    return m_bPartialSource;
  }

  @Nullable
  public ByteArrayWrapper getBytes ()
  {
    return m_aBAW;
  }

  public void writeTo (@Nonnull @WillNotClose final OutputStream aOS) throws IOException
  {
    // Just forward
    m_aBAW.writeTo (aOS);
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("SystemID", m_sSystemID)
                                       .append ("PartialSource", m_bPartialSource)
                                       .append ("ByteArrayWrapper", m_aBAW)
                                       .getToString ();
  }

  /**
   * Create a complete validation source from an existing byte array.
   *
   * @param sSystemID
   *        System ID to use. May be <code>null</code>.
   * @param aBytes
   *        The bytes to use. May not be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  public static ValidationSourceBinary create (@Nullable final String sSystemID, @Nonnull final byte [] aBytes)
  {
    ValueEnforcer.notNull (aBytes, "Bytes");
    return new ValidationSourceBinary (sSystemID, new ByteArrayWrapper (aBytes, false), false);
  }

  /**
   * Create a partial validation source from an existing byte array.
   *
   * @param sSystemID
   *        System ID to use. May be <code>null</code>.
   * @param aBytes
   *        The bytes to use. May not be <code>null</code>.
   * @return Never <code>null</code>.
   * @since 10.1.0
   */
  @Nonnull
  public static ValidationSourceBinary createPartial (@Nullable final String sSystemID, @Nonnull final byte [] aBytes)
  {
    ValueEnforcer.notNull (aBytes, "Bytes");
    return new ValidationSourceBinary (sSystemID, new ByteArrayWrapper (aBytes, false), true);
  }

}
