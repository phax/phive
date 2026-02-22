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
package com.helger.phive.api.source;

import java.io.IOException;
import java.nio.charset.Charset;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.annotation.Nonempty;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.tostring.ToStringGenerator;

/**
 * Abstract base class for {@link IValidationSource} implementations
 *
 * @author Philip Helger
 * @since 12.0.0
 */
public abstract class AbstractValidationSource implements IValidationSource
{
  private static final Logger LOGGER = LoggerFactory.getLogger (AbstractValidationSource.class);

  private final String m_sValidationSourceTypeID;
  private final String m_sSystemID;
  private final boolean m_bPartialSource;

  protected AbstractValidationSource (@NonNull @Nonempty final String sValidationSourceTypeID,
                                      @Nullable final String sSystemID,
                                      final boolean bPartialSource)
  {
    ValueEnforcer.notEmpty (sValidationSourceTypeID, "ValidationSourceTypeID");
    m_sValidationSourceTypeID = sValidationSourceTypeID;
    m_sSystemID = sSystemID;
    m_bPartialSource = bPartialSource;
  }

  @NonNull
  @Nonempty
  public final String getValidationSourceTypeID ()
  {
    return m_sValidationSourceTypeID;
  }

  @Nullable
  public final String getSystemID ()
  {
    return m_sSystemID;
  }

  public final boolean isPartialSource ()
  {
    return m_bPartialSource;
  }

  @Nullable
  public String getContentAsString (@NonNull final Charset aCharset)
  {
    ValueEnforcer.notNull (aCharset, "Charset");
    try (final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ())
    {
      writeTo (aBAOS);
      return aBAOS.getAsString (aCharset);
    }
    catch (final IOException ex)
    {
      LOGGER.error ("Failed to serialize Validation Source to string", ex);
      return null;
    }
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("TypeID", m_sValidationSourceTypeID)
                                       .append ("SystemID", m_sSystemID)
                                       .append ("PartialSource", m_bPartialSource)
                                       .getToString ();
  }
}
