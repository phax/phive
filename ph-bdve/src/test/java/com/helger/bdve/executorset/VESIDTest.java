package com.helger.bdve.executorset;

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
    CommonsTestHelper.testDefaultSerialization (aID1);
    CommonsTestHelper.testEqualsImplementationWithEqualContentObject (aID1,
                                                                      new VESID ("com.helger",
                                                                                 "ph-bdve",
                                                                                 "3.0.0-SNAPSHOT"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1,
                                                                          new VESID ("com.holger",
                                                                                     "ph-bdve",
                                                                                     "3.0.0-SNAPSHOT"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1,
                                                                          new VESID ("com.helger",
                                                                                     "ph-bdvengine",
                                                                                     "3.0.0-SNAPSHOT"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1,
                                                                          new VESID ("com.helger", "ph-bdve", "3.0.0"));
    CommonsTestHelper.testEqualsImplementationWithDifferentContentObject (aID1,
                                                                          new VESID ("com.helger",
                                                                                     "ph-bdve",
                                                                                     "3.0.0-SNAPSHOT",
                                                                                     "src"));
  }
}
