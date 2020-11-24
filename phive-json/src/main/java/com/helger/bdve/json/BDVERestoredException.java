/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.json;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.string.StringHelper;
import com.helger.json.IJsonObject;
import com.helger.json.JsonObject;

/**
 * This is a work around to read "exceptions" from JSON without actually having
 * the need to create "Exception" objects. It has the fields class name,
 * exception message and stack trace.
 *
 * @author Philip Helger
 * @since 6.0.0
 */
public class BDVERestoredException extends Exception
{
  private final String m_sClassName;
  private final String m_sMessage;
  private final ICommonsList <String> m_aStackTraceLines;

  public BDVERestoredException (@Nonnull final String sClassName,
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
  public IJsonObject getAsJson ()
  {
    return new JsonObject ().add (BDVEJsonHelper.JSON_CLASS, m_sClassName)
                            .addIfNotNull (BDVEJsonHelper.JSON_MESSAGE, m_sMessage)
                            .add (BDVEJsonHelper.JSON_STACK_TRACE, StringHelper.getImploded ('\n', m_aStackTraceLines));
  }

  @Nullable
  public static BDVERestoredException createFromJson (@Nullable final IJsonObject aObj)
  {
    if (aObj == null)
      return null;

    final String sClassName = aObj.getAsString (BDVEJsonHelper.JSON_CLASS);
    final String sMessage = aObj.getAsString (BDVEJsonHelper.JSON_MESSAGE);
    final ICommonsList <String> aStackTraceLines = StringHelper.getExploded ('\n', aObj.getAsString (BDVEJsonHelper.JSON_STACK_TRACE));
    if (sClassName == null)
      return null;

    return new BDVERestoredException (sClassName, sMessage, aStackTraceLines);
  }
}
