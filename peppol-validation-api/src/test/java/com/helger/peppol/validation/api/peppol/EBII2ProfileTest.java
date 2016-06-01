/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.api.peppol;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.Locale;

import org.junit.Test;

import com.helger.commons.collection.ext.ICommonsList;

/**
 * Test class for class {@link EBII2Profile}.
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public final class EBII2ProfileTest
{
  @Test
  public void testBasic ()
  {
    for (final EBII2Profile eProfile : EBII2Profile.values ())
    {
      assertNotNull (eProfile.getGroup ());
      assertNotNull (eProfile.getDisplayText (Locale.ENGLISH));
      // MLR is 0
      assertTrue (eProfile.getNumber () >= 0);
      assertNotNull (eProfile.getAllTransactions ());
      assertFalse (eProfile.getAllTransactions ().isEmpty ());
      assertSame (eProfile, EBII2Profile.valueOf (eProfile.name ()));
    }
    assertEquals (EBII2Profile.values ().length, EBII2ProfileName.values ().length);
  }

  @Test
  public void testGetAllProfilesWithTransaction ()
  {
    for (final EBII2Transaction eTransaction : EBII2Transaction.values ())
    {
      final ICommonsList <EBII2Profile> aList = EBII2Profile.getAllProfilesWithTransaction (eTransaction);
      assertNotNull (aList);
      assertTrue (aList.isNotEmpty ());
    }

    try
    {
      EBII2Profile.getAllProfilesWithTransaction (null);
      fail ();
    }
    catch (final NullPointerException ex)
    {}
  }
}
