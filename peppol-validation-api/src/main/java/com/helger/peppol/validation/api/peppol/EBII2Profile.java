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

import java.util.Locale;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.spec.ISpecificationProfile;
import com.helger.bdve.spec.ISpecificationTransaction;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.collection.ext.ICommonsOrderedSet;
import com.helger.commons.lang.EnumHelper;
import com.helger.commons.text.display.IHasDisplayText;

/**
 * Defines the predefined CEN BII2 profiles. Each profile consists of a set of
 * transactions ({@link EBII2Transaction}).
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public enum EBII2Profile implements ISpecificationProfile
{
  BII_MLR (EBII2ProfileName.BII_MLR, 0, EBII2Transaction.T71),
  BII01 (EBII2ProfileName.BII01, 1, EBII2Transaction.T19, EBII2Transaction.T58),
  BII02 (EBII2ProfileName.BII02, 2, EBII2Transaction.T20, EBII2Transaction.T21, EBII2Transaction.T59),
  BII03 (EBII2ProfileName.BII03, 3, EBII2Transaction.T01),
  BII04 (EBII2ProfileName.BII04, 4, EBII2Transaction.T10),
  BII05 (EBII2ProfileName.BII05, 5, EBII2Transaction.T10, EBII2Transaction.T14),
  BII06 (EBII2ProfileName.BII06,
         6,
         EBII2Transaction.T01,
         EBII2Transaction.T02,
         EBII2Transaction.T10,
         EBII2Transaction.T14),
  BII10 (EBII2ProfileName.BII10,
         10,
         EBII2Transaction.T64A,
         EBII2Transaction.T64B,
         EBII2Transaction.T64C,
         EBII2Transaction.T65),
  BII11 (EBII2ProfileName.BII11, 11, EBII2Transaction.T41, EBII2Transaction.T42),
  BII12 (EBII2ProfileName.BII12, 12, EBII2Transaction.T44, EBII2Transaction.T45),
  BII16 (EBII2ProfileName.BII16, 16, EBII2Transaction.T22, EBII2Transaction.T23),
  BII17 (EBII2ProfileName.BII17, 17, EBII2Transaction.T18, EBII2Transaction.T54, EBII2Transaction.T55),
  BII21 (EBII2ProfileName.BII21, 21, EBII2Transaction.T26),
  BII22 (EBII2ProfileName.BII22, 22, EBII2Transaction.T40),
  BII27 (EBII2ProfileName.BII27,
         27,
         EBII2Transaction.T01,
         EBII2Transaction.T02,
         EBII2Transaction.T04,
         EBII2Transaction.T05),
  BII28 (EBII2ProfileName.BII28, 28, EBII2Transaction.T01, EBII2Transaction.T76),
  BII30 (EBII2ProfileName.BII30, 30, EBII2Transaction.T16),
  BII31 (EBII2ProfileName.BII31, 31, EBII2Transaction.T17),
  BII32 (EBII2ProfileName.BII32, 32, EBII2Transaction.T01, EBII2Transaction.T02),
  BII33 (EBII2ProfileName.BII33, 33, EBII2Transaction.T72, EBII2Transaction.T73),
  BII34 (EBII2ProfileName.BII34, 34, EBII2Transaction.T40, EBII2Transaction.T69),
  BII35 (EBII2ProfileName.BII35, 35, EBII2Transaction.T44, EBII2Transaction.T68, EBII2Transaction.T45);

  private final IHasDisplayText m_aName;
  private final int m_nNumber;
  private final ICommonsOrderedSet <EBII2Transaction> m_aTransactions;

  private EBII2Profile (@Nonnull final EBII2ProfileName eName,
                        @Nonnegative final int nNumber,
                        @Nonnull @Nonempty final EBII2Transaction... aTransactions)
  {
    m_aName = eName;
    m_nNumber = nNumber;
    m_aTransactions = CollectionHelper.newOrderedSet (aTransactions);
  }

  /**
   * @return The display name of this profile in the specified locale. Currently
   *         only English is supported.
   */
  @Nullable
  public String getDisplayText (@Nonnull final Locale aContentLocale)
  {
    return m_aName.getDisplayText (aContentLocale);
  }

  @Nonnegative
  public int getNumber ()
  {
    return m_nNumber;
  }

  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  public ICommonsList <EBII2Transaction> getAllTransactions ()
  {
    return m_aTransactions.getCopyAsList ();
  }

  public boolean containsTransaction (@Nullable final ISpecificationTransaction aTransaction)
  {
    return m_aTransactions.contains (aTransaction);
  }

  /**
   * Get a list with all profiles supporting a certain transaction.
   *
   * @param eTransaction
   *        The transaction to be searched. May not be <code>null</code>.
   * @return A non-<code>null</code> non-empty list with all transactions. It
   *         may never be empty, because each transaction must occur in at least
   *         one transaction.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <EBII2Profile> getAllProfilesWithTransaction (@Nonnull final EBII2Transaction eTransaction)
  {
    ValueEnforcer.notNull (eTransaction, "Transaction");
    return EnumHelper.getAll (EBII2Profile.class, e -> e.containsTransaction (eTransaction));
  }
}
