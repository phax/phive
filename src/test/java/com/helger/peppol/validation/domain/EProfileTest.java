/**
 * Copyright (C) 2014 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.domain;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;
import java.util.Locale;

import org.junit.Test;

import com.helger.peppol.validation.domain.EProfile;
import com.helger.peppol.validation.domain.EProfileName;
import com.helger.peppol.validation.domain.ETransaction;

/**
 * Test class for class {@link EProfile}.
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public final class EProfileTest
{
  @Test
  public void testBasic ()
  {
    for (final EProfile eProfile : EProfile.values ())
    {
      assertNotNull (eProfile.getGroup ());
      assertNotNull (eProfile.getDisplayText (Locale.ENGLISH));
      // MLR is 0
      assertTrue (eProfile.getNumber () >= 0);
      assertNotNull (eProfile.getAllTransactions ());
      assertFalse (eProfile.getAllTransactions ().isEmpty ());
      assertSame (eProfile, EProfile.valueOf (eProfile.name ()));
    }
    assertEquals (EProfile.values ().length, EProfileName.values ().length);
  }

  @Test
  public void testGetAllProfilesWithTransaction ()
  {
    for (final ETransaction eTransaction : ETransaction.values ())
    {
      final List <EProfile> aList = EProfile.getAllProfilesWithTransaction (eTransaction);
      assertNotNull (aList);
      assertTrue (aList.size () > 0);
    }

    try
    {
      EProfile.getAllProfilesWithTransaction (null);
      fail ();
    }
    catch (final NullPointerException ex)
    {}
  }
}
