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
package com.helger.phive.xml.schematron;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.diagnostics.error.level.EErrorLevel;

/**
 * Test class for class {@link CustomErrorDetails}.
 *
 * @author Philip Helger
 */
public class CustomErrorDetailsTest
{
  @Test
  public void testBasicWithAll ()
  {
    final CustomErrorDetails a = new CustomErrorDetails (EErrorLevel.WARN, "pre", "suff");
    assertSame (EErrorLevel.WARN, a.getErrorLevel ());
    assertTrue (a.hasErrorTextPrefix ());
    assertEquals ("pre", a.getErrorTextPrefix ());
    assertTrue (a.hasErrorTextSuffix ());
    assertEquals ("suff", a.getErrorTextSuffix ());
    assertTrue (a.hasErrorTextPrefixOrSuffix ());
    assertEquals ("preXsuff", a.getWithErrorTextPrefixAndSuffixApplied ("X"));
  }

  @Test
  public void testBasicMin ()
  {
    final CustomErrorDetails a = new CustomErrorDetails (EErrorLevel.WARN, null, null);
    assertSame (EErrorLevel.WARN, a.getErrorLevel ());
    assertFalse (a.hasErrorTextPrefix ());
    assertNull (a.getErrorTextPrefix ());
    assertFalse (a.hasErrorTextSuffix ());
    assertNull (a.getErrorTextSuffix ());
    assertFalse (a.hasErrorTextPrefixOrSuffix ());
    assertEquals ("X", a.getWithErrorTextPrefixAndSuffixApplied ("X"));
  }

  @Test
  public void testBasicSpecifics ()
  {
    CustomErrorDetails a = new CustomErrorDetails (EErrorLevel.WARN, "pre", null);
    assertTrue (a.hasErrorTextPrefixOrSuffix ());
    assertEquals ("preX", a.getWithErrorTextPrefixAndSuffixApplied ("X"));

    a = new CustomErrorDetails (EErrorLevel.WARN, null, "suff");
    assertTrue (a.hasErrorTextPrefixOrSuffix ());
    assertEquals ("Xsuff", a.getWithErrorTextPrefixAndSuffixApplied ("X"));
  }
}
