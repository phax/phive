/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.supplementary.createrules.util;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Immutable
public final class CreateHelper
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (CreateHelper.class);

  private CreateHelper ()
  {}

  /**
   * Replace all blanks on word boundaries with underscores
   * 
   * @param s
   *        Source string
   * @return replaced string
   */
  @Nonnull
  public static String makeID (@Nonnull final String s)
  {
    return s.replaceAll ("\\b[ \\t]+\\b", "_");
  }

  public static void log (final String s)
  {
    s_aLogger.info (s);
  }

  public static void warn (final String s)
  {
    s_aLogger.warn (s);
  }
}
