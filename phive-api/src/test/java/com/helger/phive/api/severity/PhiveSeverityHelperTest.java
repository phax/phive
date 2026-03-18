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
package com.helger.phive.api.severity;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.diagnostics.error.level.EErrorLevel;

/**
 * Test class for class {@link PhiveSeverityHelper}.
 *
 * @author Philip Helger
 */
public final class PhiveSeverityHelperTest
{
  @Test
  public void testIsConsideredError ()
  {
    assertFalse (PhiveSeverityHelper.isConsideredError (EErrorLevel.SUCCESS));
    assertFalse (PhiveSeverityHelper.isConsideredError (EErrorLevel.INFO));
    assertFalse (PhiveSeverityHelper.isConsideredError (EErrorLevel.WARN));
    assertTrue (PhiveSeverityHelper.isConsideredError (EErrorLevel.ERROR));
    assertTrue (PhiveSeverityHelper.isConsideredError (EErrorLevel.FATAL_ERROR));
  }

  @Test
  public void testIsConsideredWarning ()
  {
    assertFalse (PhiveSeverityHelper.isConsideredWarning (EErrorLevel.SUCCESS));
    assertFalse (PhiveSeverityHelper.isConsideredWarning (EErrorLevel.INFO));
    assertTrue (PhiveSeverityHelper.isConsideredWarning (EErrorLevel.WARN));
    assertTrue (PhiveSeverityHelper.isConsideredWarning (EErrorLevel.ERROR));
    assertTrue (PhiveSeverityHelper.isConsideredWarning (EErrorLevel.FATAL_ERROR));
  }
}
