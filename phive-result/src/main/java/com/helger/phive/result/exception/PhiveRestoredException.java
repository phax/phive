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
package com.helger.phive.result.exception;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.string.StringHelper;
import com.helger.json.IJsonObject;
import com.helger.json.JsonObject;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroElement;
import com.helger.xml.microdom.util.MicroHelper;

/**
 * This is a work around to read "exceptions" from external sources (like JSON)
 * without actually having the need to create "Exception" objects. It has the
 * fields class name, exception message and stack trace.
 *
 * @author Philip Helger
 * @since 6.0.0
 */
public class PhiveRestoredException extends Exception
{
  public static final String FIELD_CLASS = "class";
  /**
   * @deprecated Use {@link #FIELD_CLASS} instead
   */
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_CLASS = FIELD_CLASS;

  public static final String FIELD_MESSAGE = "message";
  /**
   * @deprecated Use {@link #FIELD_MESSAGE} instead
   */
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_MESSAGE = FIELD_MESSAGE;

  public static final String FIELD_STACK_TRACE = "stackTrace";
  /**
   * @deprecated Use {@link #FIELD_STACK_TRACE} instead
   */
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_STACK_TRACE = FIELD_STACK_TRACE;

  private final String m_sClassName;
  private final String m_sMessage;
  private final ICommonsList <String> m_aStackTraceLines;

  public PhiveRestoredException (@Nonnull final String sClassName,
                                 @Nullable final String sMessage,
                                 @Nonnull final ICommonsList <String> aStackTraceLines)
  {
    ValueEnforcer.notNull (sClassName, "ClassName");
    ValueEnforcer.notNull (aStackTraceLines, "StackTraceLines");
    m_sClassName = sClassName;
    m_sMessage = sMessage;
    m_aStackTraceLines = aStackTraceLines.getClone ();
  }

  /**
   * @return The fully qualified name of the exception class as in
   *         "java.lang.IllegalArgumentException"
   */
  @Nonnull
  public String getClassName ()
  {
    return m_sClassName;
  }

  /**
   * @return The message that was passed to the Exception. May be
   *         <code>null</code> if the exception only contained another
   *         exception.
   */
  @Override
  @Nullable
  public String getMessage ()
  {
    return m_sMessage;
  }

  /**
   * @return A non-null list of all stack trace lines in an arbitrary format.
   *         Never <code>null</code>.
   */
  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <String> getAllStackTraceLines ()
  {
    return m_aStackTraceLines.getClone ();
  }

  @Nullable
  public static IJsonObject getAsJson (@Nonnull final String sClassName,
                                       @Nullable final String sMessage,
                                       @Nonnull final String sStackTraceLines)
  {
    return new JsonObject ().add (FIELD_CLASS, sClassName)
                            .addIfNotNull (FIELD_MESSAGE, sMessage)
                            .add (FIELD_STACK_TRACE, sStackTraceLines);
  }

  @Nullable
  public IJsonObject getAsJson ()
  {
    return getAsJson (m_sClassName, m_sMessage, StringHelper.getImploded ('\n', m_aStackTraceLines));
  }

  @Nullable
  public static IMicroElement getAsXML (@Nonnull final String sElementName,
                                        @Nonnull final String sClassName,
                                        @Nullable final String sMessage,
                                        @Nonnull final String sStackTraceLines)
  {
    final IMicroElement ret = new MicroElement (sElementName);
    ret.appendElement (FIELD_CLASS).appendText (sClassName);
    if (sMessage != null)
      ret.appendElement (FIELD_MESSAGE).appendText (sMessage);
    ret.appendElement (FIELD_STACK_TRACE).appendText (sStackTraceLines);
    return ret;
  }

  @Nullable
  public IMicroElement getAsXML (@Nonnull final String sElementName)
  {
    return getAsXML (sElementName, m_sClassName, m_sMessage, StringHelper.getImploded ('\n', m_aStackTraceLines));
  }

  @Nullable
  public static PhiveRestoredException createFromJson (@Nullable final IJsonObject aObj)
  {
    if (aObj == null)
      return null;

    final String sClassName = aObj.getAsString (FIELD_CLASS);
    final String sMessage = aObj.getAsString (FIELD_MESSAGE);
    final ICommonsList <String> aStackTraceLines = StringHelper.getExploded ('\n',
                                                                             aObj.getAsString (FIELD_STACK_TRACE));
    if (sClassName == null)
      return null;

    return new PhiveRestoredException (sClassName, sMessage, aStackTraceLines);
  }

  @Nullable
  public static PhiveRestoredException createFromXML (@Nullable final IMicroElement aObj)
  {
    if (aObj == null)
      return null;

    final String sClassName = MicroHelper.getChildTextContentTrimmed (aObj, FIELD_CLASS);
    final String sMessage = MicroHelper.getChildTextContentTrimmed (aObj, FIELD_MESSAGE);
    final ICommonsList <String> aStackTraceLines = StringHelper.getExploded ('\n',
                                                                             MicroHelper.getChildTextContentTrimmed (aObj,
                                                                                                                     FIELD_STACK_TRACE));
    if (sClassName == null)
      return null;

    return new PhiveRestoredException (sClassName, sMessage, aStackTraceLines);
  }
}
