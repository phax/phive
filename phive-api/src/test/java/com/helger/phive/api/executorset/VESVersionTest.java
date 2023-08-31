/*
 * Copyright (C) 2014-2023 Philip Helger (www.helger.com)
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
package com.helger.phive.api.executorset;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.commons.mock.CommonsTestHelper;

/**
 * Test class for class {@link VESVersion}.
 *
 * @author Philip Helger
 */
public final class VESVersionTest
{
  @Test
  public void testBasic ()
  {
    // Valid static
    VESVersion ver = VESVersion.parseOrNull ("1.2.3");
    assertNotNull (ver);
    assertTrue (ver.isStaticVersion ());
    assertNotNull (ver.getStaticVersion ());
    assertFalse (ver.isPseudoVersion ());
    assertNull (ver.getPseudoVersion ());
    assertEquals ("1.2.3", ver.getAsString ());

    // Valid pseudo version
    ver = VESVersion.parseOrNull ("latest");
    assertNotNull (ver);
    assertFalse (ver.isStaticVersion ());
    assertNull (ver.getStaticVersion ());
    assertTrue (ver.isPseudoVersion ());
    assertNotNull (ver.getPseudoVersion ());
    assertEquals ("latest", ver.getAsString ());

    // Invalid pseudo version
    ver = VESVersion.parseOrNull ("blafoo");
    assertNull (ver);
  }

  @Test
  public void testGetAsString ()
  {
    assertEquals ("1.2.3.bla", VESVersion.parseOrNull ("1.2.3.bla").getAsString ());
    assertEquals ("1.2.3", VESVersion.parseOrNull ("1.2.3").getAsString ());
    assertEquals ("1.2", VESVersion.parseOrNull ("1.2").getAsString ());
    assertEquals ("1", VESVersion.parseOrNull ("1").getAsString ());
    assertEquals ("0.1", VESVersion.parseOrNull ("0.1").getAsString ());
  }

  @Test
  public void testEqualsHashcode ()
  {
    final VESVersion ver = VESVersion.parseOrNull ("1.2.3");
    CommonsTestHelper.testEqualsImplementationWithEqualContentObject (ver, VESVersion.parseOrNull ("1.2.3"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (ver, VESVersion.parseOrNull ("1.2.4"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (ver, VESVersion.parseOrNull ("1.1.3"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (ver, VESVersion.parseOrNull ("2.2.3"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (ver, VESVersion.parseOrNull ("1.2"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (ver, VESVersion.parseOrNull ("1.2.3.bla"));
  }

  @Test
  public void testCompare ()
  {
    final VESVersion ver1 = VESVersion.parseOrNull ("1.2");
    final VESVersion ver2 = VESVersion.parseOrNull ("1.2.3");
    final VESVersion ver3 = VESVersion.parseOrNull ("1.2.4");
    final VESVersion ver4 = VESVersion.parseOrNull ("1.3");
    final VESVersion ver5 = VESVersion.parseOrNull ("2023.5");
    final VESVersion ver6 = VESVersion.of (EVESPseudoVersion.LATEST);

    assertEquals (0, ver1.compareTo (ver1));
    assertTrue (ver1.compareTo (ver2) < 0);
    assertTrue (ver1.compareTo (ver3) < 0);
    assertTrue (ver1.compareTo (ver4) < 0);
    assertTrue (ver1.compareTo (ver5) < 0);
    assertTrue (ver1.compareTo (ver6) < 0);

    assertTrue (ver2.compareTo (ver1) > 0);
    assertEquals (0, ver2.compareTo (ver2));
    assertTrue (ver2.compareTo (ver3) < 0);
    assertTrue (ver2.compareTo (ver4) < 0);
    assertTrue (ver2.compareTo (ver5) < 0);
    assertTrue (ver2.compareTo (ver6) < 0);

    assertTrue (ver3.compareTo (ver1) > 0);
    assertTrue (ver3.compareTo (ver2) > 0);
    assertEquals (0, ver3.compareTo (ver3));
    assertTrue (ver3.compareTo (ver4) < 0);
    assertTrue (ver3.compareTo (ver5) < 0);
    assertTrue (ver3.compareTo (ver6) < 0);

    assertTrue (ver4.compareTo (ver1) > 0);
    assertTrue (ver4.compareTo (ver2) > 0);
    assertTrue (ver4.compareTo (ver3) > 0);
    assertEquals (0, ver4.compareTo (ver4));
    assertTrue (ver4.compareTo (ver5) < 0);
    assertTrue (ver4.compareTo (ver6) < 0);

    assertTrue (ver5.compareTo (ver1) > 0);
    assertTrue (ver5.compareTo (ver2) > 0);
    assertTrue (ver5.compareTo (ver3) > 0);
    assertTrue (ver5.compareTo (ver4) > 0);
    assertEquals (0, ver5.compareTo (ver5));
    assertTrue (ver5.compareTo (ver6) < 0);

    assertTrue (ver6.compareTo (ver1) > 0);
    assertTrue (ver6.compareTo (ver2) > 0);
    assertTrue (ver6.compareTo (ver3) > 0);
    assertTrue (ver6.compareTo (ver4) > 0);
    assertTrue (ver6.compareTo (ver5) > 0);
    assertEquals (0, ver6.compareTo (ver6));
  }
}
