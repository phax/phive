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
package com.helger.phive.result.exception;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.json.IJsonObject;
import com.helger.phive.result.json.PhiveJsonHelper;
import com.helger.unittest.support.TestHelper;

/**
 * Test class for class {@link PhiveRestoredException}.
 *
 * @author Philip Helger
 */
public final class PhiveRestoredExceptionTest
{
  @Test
  public void testBasic ()
  {
    final Exception ex = new IllegalArgumentException ("bla foo");

    // to Json
    final IJsonObject aObj = PhiveJsonHelper.getJsonStackTrace (ex);
    assertNotNull (aObj);

    // from Json
    final PhiveRestoredException aRSS = PhiveRestoredException.createFromJson (aObj);
    assertNotNull (aRSS);
    assertEquals ("java.lang.IllegalArgumentException", aRSS.getClassName ());
    assertEquals ("bla foo", aRSS.getMessage ());
    assertTrue (aRSS.getAllStackTraceLines ().isNotEmpty ());
    // Name of this method must occur
    assertTrue (aRSS.getAllStackTraceLines ().containsAny (x -> x.contains ("testBasic")));

    final IJsonObject aObj2 = aRSS.getAsJson ();
    assertNotNull (aObj2);

    TestHelper.testDefaultImplementationWithEqualContentObject (aObj, aObj2);
  }

  @Test
  public void testNoMessage ()
  {
    final Exception ex = new IllegalArgumentException ();

    // to Json
    final IJsonObject aObj = PhiveJsonHelper.getJsonStackTrace (ex);
    assertNotNull (aObj);

    // from Json
    final PhiveRestoredException aRSS = PhiveRestoredException.createFromJson (aObj);
    assertNotNull (aRSS);
    assertEquals ("java.lang.IllegalArgumentException", aRSS.getClassName ());
    assertNull (aRSS.getMessage ());
    assertTrue (aRSS.getAllStackTraceLines ().isNotEmpty ());
    // Name of this method must occur
    assertTrue (aRSS.getAllStackTraceLines ().containsAny (x -> x.contains ("testNoMessage")));

    final IJsonObject aObj2 = aRSS.getAsJson ();
    assertNotNull (aObj2);

    TestHelper.testDefaultImplementationWithEqualContentObject (aObj, aObj2);
  }
}
