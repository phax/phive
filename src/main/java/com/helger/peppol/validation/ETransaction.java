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
package com.helger.peppol.validation;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotations.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.lang.EnumHelper;
import com.helger.commons.name.IHasName;
import com.helger.commons.string.StringHelper;

/**
 * Represents a single CEN BII2 transaction used in several profiles.<br>
 * Sources:
 * <ul>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16558-bii-architecture/</li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16559-enotification/</li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16560-etendering/</li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16561-ecatalogue/</li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16562-post-award/</li>
 * </ul>
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public enum ETransaction implements IHasID <String>, IHasName
{
  T01 ("Order", 1, null, "2.0", EGroup.POST_AWARD),
  T02 ("Simple Order Response", 2, null, "2.0", EGroup.POST_AWARD),
  T04 ("Counter Offer", 4, null, "2.0", EGroup.POST_AWARD),
  T05 ("Simple Counter Offer Response", 5, null, "2.0", EGroup.POST_AWARD),
  T10 ("Invoice", 10, null, "2.0", EGroup.POST_AWARD),
  T14 ("Credit Note", 14, null, "2.0", EGroup.POST_AWARD),
  T16 ("Dispatch Advice", 16, null, "2.0", EGroup.POST_AWARD),
  T17 ("Reminder", 17, null, "2.0", EGroup.POST_AWARD),
  T18 ("Catalogue Request", 18, null, "2.0", EGroup.CATALOGUE),
  T19 ("Catalogue", 19, null, "2.0", EGroup.CATALOGUE),
  T20 ("Catalogue Item Update", 20, null, "2.0", EGroup.CATALOGUE),
  T21 ("Catalogue Price Update", 21, null, "2.0", EGroup.CATALOGUE),
  T22 ("Catalogue Delete Request", 22, null, "2.0", EGroup.CATALOGUE),
  T23 ("Catalogue Delete Confirmation", 23, null, "2.0", EGroup.CATALOGUE),
  T26 ("Statement", 26, null, "2.0", EGroup.POST_AWARD),
  T40 ("Call for Tender", 40, null, "1.0", EGroup.TENDERING),
  T41 ("Qualification", 41, null, "1.0", EGroup.TENDERING),
  T42 ("Qualification Reception Notification", 42, null, "1.0", EGroup.TENDERING),
  T44 ("Tender", 44, null, "1.0", EGroup.TENDERING),
  T45 ("Tender Reception Notification", 45, null, "1.0", EGroup.TENDERING),
  T54 ("Multi Party Catalogue", 54, null, "2.0", EGroup.CATALOGUE),
  T55 ("Catalogue Request Rejection", 55, null, "2.0", EGroup.CATALOGUE),
  T58 ("Catalogue Response", 58, null, "2.0", EGroup.CATALOGUE),
  T59 ("Catalogue Update Response", 59, null, "2.0", EGroup.CATALOGUE),
  T64A ("Prior Information Notice", 64, "A", "1.0", EGroup.NOTIFICATION),
  T64B ("Contract  Notice", 64, "B", "1.0", EGroup.NOTIFICATION),
  T64C ("Contract Award Notice", 64, "C", "1.0", EGroup.NOTIFICATION),
  T65 ("Notice Publication Response", 65, null, "1.0", EGroup.NOTIFICATION),
  T68 ("Pre-award Catalogue", 68, null, "1.0", EGroup.TENDERING),
  T69 ("Pre-award Catalogue Template", 69, null, "1.0", EGroup.TENDERING),
  T71 ("Message Level Response", 71, null, "1.0", EGroup.ARCHITECTURE),
  T72 ("Catalogue Subscription Request", 72, null, "1.0", EGroup.CATALOGUE),
  T73 ("Catalogue Subscription Response", 73, null, "1.0", EGroup.CATALOGUE),
  T76 ("Order Response", 76, null, "1.0", EGroup.POST_AWARD);

  private final String m_sID;
  private final String m_sName;
  private final int m_nNumber;
  private final String m_sSubNumber;
  private final String m_sVersion;
  private final String m_sTransactionID;
  private final EGroup m_eGroup;

  private ETransaction (@Nonnull @Nonempty final String sName,
                        @Nonnegative final int nNumber,
                        @Nullable final String sSubNumber,
                        @Nonnull @Nonempty final String sVersion,
                        @Nonnull final EGroup eGroup)
  {
    m_sID = name ();
    m_sName = sName;
    m_nNumber = nNumber;
    m_sSubNumber = StringHelper.getNotNull (sSubNumber, "");
    m_sVersion = sVersion;
    m_sTransactionID = "urn:www.cenbii.eu:transaction:biitrns" +
                       StringHelper.getLeadingZero (nNumber, 3) +
                       m_sSubNumber +
                       ":ver" +
                       sVersion;
    m_eGroup = eGroup;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  /**
   * @return The pseudo name of this transaction. Does not require translation.
   */
  @Nonnull
  @Nonempty
  public String getName ()
  {
    return m_sName;
  }

  /**
   * @return The number of this transaction. This is only unique in combination
   *         with the "sub number", since the number 64 is used 3 times but with
   *         the sub numbers A, B and C!
   */
  @Nonnegative
  public int getNumber ()
  {
    return m_nNumber;
  }

  /**
   * @return The sub number. This is only relevant for transaction 64 which is
   *         split into A, B, and C. For all others this methods returns an
   *         empty string.
   */
  @Nonnull
  public String getSubNumber ()
  {
    return m_sSubNumber;
  }

  /**
   * @return The underlying group to which this transaction belongs.
   */
  @Nonnull
  public EGroup getGroup ()
  {
    return m_eGroup;
  }

  /**
   * @return The complete transaction ID. E.g.
   *         <code>urn:www.cenbii.eu:transaction:biitrns040:ver1.0</code>
   */
  @Nonnull
  @Nonempty
  public String getTransactionID ()
  {
    return m_sTransactionID;
  }

  /**
   * @return The version of the transaction. Either "1.0" or "2.0".
   */
  @Nonnull
  @Nonempty
  public String getVersionNumber ()
  {
    return m_sVersion;
  }

  @Nullable
  public static ETransaction getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (ETransaction.class, sID);
  }
}
