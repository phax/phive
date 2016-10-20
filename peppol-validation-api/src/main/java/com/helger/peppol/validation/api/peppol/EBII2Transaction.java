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

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.spec.ISpecificationTransaction;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.lang.EnumHelper;
import com.helger.commons.string.StringHelper;
import com.helger.jaxb.builder.IJAXBDocumentType;
import com.helger.ubl21.EUBL21DocumentType;

/**
 * Represents a single CEN BII2 transaction used in several profiles.<br>
 * Sources:
 * <ul>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16558-bii-architecture/
 * </li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16559-enotification/</li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16560-etendering/</li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16561-ecatalogue/</li>
 * <li>http://www.cenbii.eu/deliverables/cen-bii-2/cwa-16562-post-award/</li>
 * </ul>
 *
 * @author Philip Helger
 */
public enum EBII2Transaction implements ISpecificationTransaction
{
  T01 ("Order", 1, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.ORDER),
  T02 ("Simple Order Response", 2, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.ORDER_RESPONSE_SIMPLE),
  T04 ("Counter Offer", 4, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.ORDER_RESPONSE),
  T05 ("Simple Counter Offer Response", 5, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.ORDER_CHANGE),
  T10 ("Invoice", 10, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.INVOICE),
  T14 ("Credit Note", 14, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.CREDIT_NOTE),
  T16 ("Dispatch Advice", 16, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.DESPATCH_ADVICE),
  T17 ("Reminder", 17, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.REMINDER),
  T18 ("Catalogue Request", 18, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.CATALOGUE_REQUEST),
  T19 ("Catalogue", 19, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.CATALOGUE),
  T20 ("Catalogue Item Update",
       20,
       null,
       "2.0",
       EBII2Group.CATALOGUE,
       EUBL21DocumentType.CATALOGUE_ITEM_SPECIFICATION_UPDATE),
  T21 ("Catalogue Price Update", 21, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.CATALOGUE_PRICING_UPDATE),
  T22 ("Catalogue Delete Request", 22, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.CATALOGUE_DELETION),
  T23 ("Catalogue Delete Confirmation", 23, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.APPLICATION_RESPONSE),
  T26 ("Statement", 26, null, "2.0", EBII2Group.POST_AWARD, EUBL21DocumentType.STATEMENT),
  T40 ("Call for Tender", 40, null, "1.0", EBII2Group.TENDERING, EUBL21DocumentType.CALL_FOR_TENDERS),
  T41 ("Qualification", 41, null, "1.0", EBII2Group.TENDERING, EUBL21DocumentType.TENDER_QUALIFICATION),
  T42 ("Qualification Reception Notification",
       42,
       null,
       "1.0",
       EBII2Group.TENDERING,
       EUBL21DocumentType.TENDER_QUALIFICATION_RESPONSE),
  T44 ("Tender", 44, null, "1.0", EBII2Group.TENDERING, EUBL21DocumentType.TENDER),
  T45 ("Tender Reception Notification", 45, null, "1.0", EBII2Group.TENDERING, EUBL21DocumentType.TENDER_RECEIPT),
  T54 ("Multi Party Catalogue", 54, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.CATALOGUE),
  T55 ("Catalogue Request Rejection", 55, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.APPLICATION_RESPONSE),
  T58 ("Catalogue Response", 58, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.APPLICATION_RESPONSE),
  T59 ("Catalogue Update Response", 59, null, "2.0", EBII2Group.CATALOGUE, EUBL21DocumentType.APPLICATION_RESPONSE),
  T64A ("Prior Information Notice",
        64,
        "A",
        "1.0",
        EBII2Group.NOTIFICATION,
        EUBL21DocumentType.PRIOR_INFORMATION_NOTICE),
  T64B ("Contract  Notice", 64, "B", "1.0", EBII2Group.NOTIFICATION, EUBL21DocumentType.CONTRACT_NOTICE),
  T64C ("Contract Award Notice", 64, "C", "1.0", EBII2Group.NOTIFICATION, EUBL21DocumentType.CONTRACT_AWARD_NOTICE),
  T65 ("Notice Publication Response",
       65,
       null,
       "1.0",
       EBII2Group.NOTIFICATION,
       EUBL21DocumentType.APPLICATION_RESPONSE),
  T68 ("Pre-award Catalogue", 68, null, "1.0", EBII2Group.TENDERING, EUBL21DocumentType.CATALOGUE),
  T69 ("Pre-award Catalogue Template", 69, null, "1.0", EBII2Group.TENDERING, EUBL21DocumentType.CATALOGUE),
  T71 ("Message Level Response", 71, null, "1.0", EBII2Group.ARCHITECTURE, EUBL21DocumentType.APPLICATION_RESPONSE),
  T72 ("Catalogue Subscription Request", 72, null, "1.0", EBII2Group.CATALOGUE, EUBL21DocumentType.CATALOGUE_REQUEST),
  T73 ("Catalogue Subscription Response",
       73,
       null,
       "1.0",
       EBII2Group.CATALOGUE,
       EUBL21DocumentType.APPLICATION_RESPONSE),
  T76 ("Order Response", 76, null, "1.0", EBII2Group.POST_AWARD, EUBL21DocumentType.ORDER_RESPONSE);

  private final String m_sID;
  private final String m_sName;
  private final int m_nNumber;
  private final String m_sSubNumber;
  private final String m_sVersion;
  private final String m_sTransactionID;
  private final EBII2Group m_eGroup;
  private final EUBL21DocumentType m_eUBLDocumentType;

  private EBII2Transaction (@Nonnull @Nonempty final String sName,
                            @Nonnegative final int nNumber,
                            @Nullable final String sSubNumber,
                            @Nonnull @Nonempty final String sVersion,
                            @Nonnull final EBII2Group eGroup,
                            @Nonnull final EUBL21DocumentType eUBLDocumentType)
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
    m_eUBLDocumentType = eUBLDocumentType;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  @Nonempty
  public String getName ()
  {
    return m_sName;
  }

  @Nonnegative
  public int getNumber ()
  {
    return m_nNumber;
  }

  @Nonnull
  public String getSubNumber ()
  {
    return m_sSubNumber;
  }

  @Nonnull
  public EBII2Group getGroup ()
  {
    return m_eGroup;
  }

  @Nonnull
  @Nonempty
  public String getTransactionID ()
  {
    return m_sTransactionID;
  }

  /**
   * @return The long transaction key containing 3 digits (like in 'T010' or
   *         'T064A')
   */
  @Nonnull
  @Nonempty
  public String getTransactionKey ()
  {
    return "T" + StringHelper.getLeadingZero (m_nNumber, 3) + m_sSubNumber;
  }

  /**
   * @return The short transaction key containing only 2 digits (like in 'T10'
   *         or 'T64A')
   */
  @Nonnull
  @Nonempty
  public String getTransactionKeyShort ()
  {
    return "T" + StringHelper.getLeadingZero (m_nNumber, 2) + m_sSubNumber;
  }

  @Nonnull
  @Nonempty
  public String getVersionNumber ()
  {
    return m_sVersion;
  }

  /**
   * @return The expected UBL 2.1 document type. Never <code>null</code>.
   */
  @Nonnull
  public IJAXBDocumentType getJAXBDocumentType ()
  {
    return m_eUBLDocumentType;
  }

  @Nullable
  public static EBII2Transaction getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (EBII2Transaction.class, sID);
  }
}
