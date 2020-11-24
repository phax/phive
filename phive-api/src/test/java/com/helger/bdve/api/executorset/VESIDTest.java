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
package com.helger.bdve.api.executorset;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.commons.mock.CommonsTestHelper;

/**
 * Test class for class {@link VESID}.
 *
 * @author Philip Helger
 */
public final class VESIDTest
{
  @Test
  public void testIsValid ()
  {
    assertTrue (VESID.isValidPart ("com"));
    assertTrue (VESID.isValidPart ("com.helger"));
    assertTrue (VESID.isValidPart ("01234"));
    assertTrue (VESID.isValidPart ("1.2.3.4.5"));
    assertTrue (VESID.isValidPart ("ph-as4"));
    assertTrue (VESID.isValidPart ("-.___"));

    assertFalse (VESID.isValidPart (null));
    assertFalse (VESID.isValidPart (""));
    assertFalse (VESID.isValidPart ("ä"));
    assertFalse (VESID.isValidPart ("a:b"));
  }

  @Test
  public void testBasic ()
  {
    final VESID aID1 = new VESID ("com.helger", "ph-bdve", "3.0.0-SNAPSHOT");
    assertEquals ("com.helger", aID1.getGroupID ());
    assertEquals ("ph-bdve", aID1.getArtifactID ());
    assertEquals ("3.0.0-SNAPSHOT", aID1.getVersion ());
    assertNull (aID1.getClassifier ());
    CommonsTestHelper.testEqualsImplementationWithEqualContentObject (aID1, new VESID ("com.helger", "ph-bdve", "3.0.0-SNAPSHOT"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1, new VESID ("com.holger", "ph-bdve", "3.0.0-SNAPSHOT"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1, new VESID ("com.helger", "ph-bdvengine", "3.0.0-SNAPSHOT"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1, new VESID ("com.helger", "ph-bdve", "3.0.0"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1,
                                                                          new VESID ("com.helger", "ph-bdve", "3.0.0-SNAPSHOT", "src"));
  }

  @Test
  public void testParseID ()
  {
    final VESID aID1 = new VESID ("com.helger", "ph-bdve", "3.0.0-SNAPSHOT");
    final VESID aID2 = aID1.getWithClassifier ("test");

    assertEquals (aID1, VESID.parseIDOrNull (aID1.getAsSingleID ()));
    assertEquals (aID1, VESID.parseIDOrNull (aID1.getAsSingleID () + VESID.ID_SEPARATOR));
    assertEquals (aID2, VESID.parseIDOrNull (aID2.getAsSingleID ()));
    assertNull (VESID.parseIDOrNull (null));
    assertNull (VESID.parseIDOrNull ("a"));
    assertNull (VESID.parseIDOrNull ("a:b"));
    assertNull (VESID.parseIDOrNull ("a:b:c:d:e"));
    assertNull (VESID.parseIDOrNull ("a:b:c:d:e:f"));
    assertNull (VESID.parseIDOrNull ("::"));
    assertNull (VESID.parseIDOrNull (":::"));
    assertNull (VESID.parseIDOrNull ("a:b:"));
  }
}
