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
package com.helger.phive.api.mock;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;
import java.util.Collections;

import org.junit.Test;

import com.helger.collection.commons.CommonsHashSet;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.io.resource.inmemory.ReadableResourceByteArray;

/**
 * Test class for class {@link PhiveTestFile}.
 *
 * @author Philip Helger
 */
public final class PhiveTestFileTest
{
  @Test
  public void testGoodCase () throws Exception
  {
    final ReadableResourceByteArray aRes = new ReadableResourceByteArray ("test".getBytes (StandardCharsets.UTF_8));
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");
    final PhiveTestFile aTF = PhiveTestFile.createGoodCase (aRes, aVESID);

    assertSame (aRes, aTF.getResource ());
    assertSame (aVESID, aTF.getVESID ());
    assertTrue (aTF.isGoodCase ());
    assertFalse (aTF.isBadCase ());
    assertNotNull (aTF.getAllExpectedErrorIDs ());
    assertTrue (aTF.getAllExpectedErrorIDs ().isEmpty ());
  }

  @Test
  public void testBadCase () throws Exception
  {
    final ReadableResourceByteArray aRes = new ReadableResourceByteArray ("test".getBytes (StandardCharsets.UTF_8));
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");
    final PhiveTestFile aTF = new PhiveTestFile (aRes, aVESID, new CommonsHashSet <> ("ERR-001", "ERR-002"));

    assertSame (aRes, aTF.getResource ());
    assertSame (aVESID, aTF.getVESID ());
    assertFalse (aTF.isGoodCase ());
    assertTrue (aTF.isBadCase ());
    assertEquals (2, aTF.getAllExpectedErrorIDs ().size ());
  }

  @Test
  public void testBadCaseWithEmptyErrorIDs () throws Exception
  {
    final ReadableResourceByteArray aRes = new ReadableResourceByteArray ("test".getBytes (StandardCharsets.UTF_8));
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");
    final PhiveTestFile aTF = new PhiveTestFile (aRes, aVESID, Collections.emptySet ());

    assertTrue (aTF.isGoodCase ());
    assertFalse (aTF.isBadCase ());
  }
}
