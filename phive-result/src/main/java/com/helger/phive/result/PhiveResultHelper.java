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
package com.helger.phive.result;

import java.net.MalformedURLException;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.FileSystemResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.resource.URLResource;
import com.helger.commons.io.resource.inmemory.IMemoryReadableResource;
import com.helger.commons.io.resource.wrapped.IWrappedReadableResource;
import com.helger.commons.state.ETriState;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.source.IValidationSourceBinary;
import com.helger.phive.api.source.ValidationSourceBinary;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Contains stateless phive result helper methods.
 *
 * @author Philip Helger
 */
@Immutable
public final class PhiveResultHelper
{
  public static final String VALUE_ERRORLEVEL_SUCCESS = "SUCCESS";
  public static final String VALUE_ERRORLEVEL_WARN = "WARN";
  public static final String VALUE_ERRORLEVEL_ERROR = "ERROR";

  public static final String VALUE_TRISTATE_TRUE = "TRUE";
  public static final String VALUE_TRISTATE_FALSE = "FALSE";
  public static final String VALUE_TRISTATE_UNDEFINED = "UNDEFINED";

  private static final Logger LOGGER = LoggerFactory.getLogger (PhiveResultHelper.class);

  private PhiveResultHelper ()
  {}

  public static boolean isConsideredError (@Nonnull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.ERROR);
  }

  public static boolean isConsideredWarning (@Nonnull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.WARN);
  }

  /**
   * Get the string of the error level. One of <code>"ERROR"</code>,
   * <code>"WARN"</code> or <code>"SUCCESS"</code>.<br>
   * See {@link #VALUE_ERRORLEVEL_SUCCESS}, {@link #VALUE_ERRORLEVEL_WARN},
   * {@link #VALUE_ERRORLEVEL_ERROR}
   *
   * @param aErrorLevel
   *        The error level to convert. May not be <code>null</code>.
   * @return A non-<code>null</code> value string.
   */
  @Nonnull
  @Nonempty
  public static String getErrorLevelValue (@Nonnull final IErrorLevel aErrorLevel)
  {
    ValueEnforcer.notNull (aErrorLevel, "ErrorLevel");

    if (PhiveResultHelper.isConsideredError (aErrorLevel))
      return VALUE_ERRORLEVEL_ERROR;
    if (PhiveResultHelper.isConsideredWarning (aErrorLevel))
      return VALUE_ERRORLEVEL_WARN;
    return VALUE_ERRORLEVEL_SUCCESS;
  }

  @Nullable
  public static IErrorLevel getAsErrorLevel (@Nullable final String sErrorLevel)
  {
    if (VALUE_ERRORLEVEL_ERROR.equals (sErrorLevel))
      return EErrorLevel.ERROR;
    if (VALUE_ERRORLEVEL_WARN.equals (sErrorLevel))
      return EErrorLevel.WARN;
    if (VALUE_ERRORLEVEL_SUCCESS.equals (sErrorLevel))
      return EErrorLevel.SUCCESS;
    return null;
  }

  /**
   * Get the tri-state representation of the provided value. Either
   * {@link #VALUE_TRISTATE_TRUE} or {@link #VALUE_TRISTATE_FALSE}.
   *
   * @param b
   *        boolean value to get converted.
   * @return A non-<code>null</code> value string.
   * @see #getTriStateValue(ETriState)
   */
  @Nonnull
  @Nonempty
  public static String getTriStateValue (final boolean b)
  {
    return b ? VALUE_TRISTATE_TRUE : VALUE_TRISTATE_FALSE;
  }

  /**
   * Get the tri-state representation of the provided value. Either
   * {@link #VALUE_TRISTATE_TRUE}, {@link #VALUE_TRISTATE_FALSE} or
   * {@link #VALUE_TRISTATE_UNDEFINED}.
   *
   * @param eTriState
   *        Tri-state value to get converted. May not be <code>null</code>.
   * @return A non-<code>null</code> value string.
   * @see #getTriStateValue(boolean)
   */
  @Nonnull
  public static String getTriStateValue (@Nonnull final ETriState eTriState)
  {
    ValueEnforcer.notNull (eTriState, "TriState");

    if (eTriState.isUndefined ())
      return VALUE_TRISTATE_UNDEFINED;
    return getTriStateValue (eTriState.isTrue ());
  }

  /**
   * Convert the provided value into a tri-state value. Must be one of
   * {@link #VALUE_TRISTATE_TRUE}, {@link #VALUE_TRISTATE_FALSE} or
   * {@link #VALUE_TRISTATE_UNDEFINED}.
   *
   * @param sTriState
   *        Source value. May be <code>null</code>.
   * @return <code>null</code> if the provided value is unknown.
   */
  @Nullable
  public static ETriState getAsTriState (@Nullable final String sTriState)
  {
    if (VALUE_TRISTATE_TRUE.equals (sTriState))
      return ETriState.TRUE;
    if (VALUE_TRISTATE_FALSE.equals (sTriState))
      return ETriState.FALSE;
    if (VALUE_TRISTATE_UNDEFINED.equals (sTriState))
      return ETriState.UNDEFINED;
    return null;
  }

  @Nonnull
  @Nonempty
  public static String getArtifactPathType (@Nonnull final IReadableResource aRes)
  {
    if (aRes instanceof ClassPathResource)
      return "classpath";
    if (aRes instanceof FileSystemResource)
      return "file";
    if (aRes instanceof URLResource)
      return "url";
    if (aRes instanceof IMemoryReadableResource)
      return "in-memory";
    if (aRes instanceof IWrappedReadableResource)
      return "wrapped";
    return "unknown";
  }

  @Nullable
  public static IReadableResource getAsValidationResource (@Nullable final String sArtefactPathType,
                                                           @Nullable final String sArtefactPath)
  {
    if (StringHelper.hasNoText (sArtefactPathType))
      return null;
    if (StringHelper.hasNoText (sArtefactPath))
      return null;

    if ("file".equals (sArtefactPathType))
      return new FileSystemResource (sArtefactPath);

    if ("url".equals (sArtefactPathType))
      try
      {
        return new URLResource (sArtefactPath);
      }
      catch (final MalformedURLException ex)
      {
        return null;
      }

    // Default to class path
    return new ClassPathResource (sArtefactPath);
  }

  @Nullable
  public static IValidationSource createValidationSource (@Nullable final String sValidationSourceTypeID,
                                                          @Nullable final String sSystemID,
                                                          final boolean bIsPartialSource,
                                                          @Nullable final byte [] aPayloadBytes)
  {
    if (StringHelper.hasNoText (sValidationSourceTypeID))
      return null;
    if (aPayloadBytes == null)
      return null;

    switch (sValidationSourceTypeID)
    {
      case IValidationSourceBinary.VALIDATION_SOURCE_TYPE:
        return bIsPartialSource ? ValidationSourceBinary.createPartial (sSystemID, aPayloadBytes)
                                : ValidationSourceBinary.create (sSystemID, aPayloadBytes);
      case IValidationSourceXML.VALIDATION_SOURCE_TYPE:
        // Parse on demand only
        return new ValidationSourceXML (sSystemID, () -> DOMReader.readXMLDOM (aPayloadBytes), bIsPartialSource);
      default:
        LOGGER.warn ("Unsupported Validation Source Type ID '" + sValidationSourceTypeID + "'");
    }
    return null;
  }
}
