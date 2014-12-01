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

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.GlobalDebug;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.Nonempty;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.collections.ContainerHelper;
import com.helger.commons.name.IHasDisplayText;

/**
 * Defines the predefined CEN BII2 profiles. Each profile consists of a set of
 * transactions ({@link ETransaction}) and belongs to a group {@link EGroup}
 * (derived from the transactions).
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public enum EProfile implements IHasDisplayText
{
  BII_MLR (EProfileName.BII_MLR, 0, ETransaction.T71),
  BII01 (EProfileName.BII01, 1, ETransaction.T19, ETransaction.T58),
  BII02 (EProfileName.BII02, 2, ETransaction.T20, ETransaction.T21, ETransaction.T59),
  BII03 (EProfileName.BII03, 3, ETransaction.T01),
  BII04 (EProfileName.BII04, 4, ETransaction.T10),
  BII05 (EProfileName.BII05, 5, ETransaction.T10, ETransaction.T14),
  BII06 (EProfileName.BII06, 6, ETransaction.T01, ETransaction.T02, ETransaction.T10, ETransaction.T14),
  BII10 (EProfileName.BII10, 10, ETransaction.T64A, ETransaction.T64B, ETransaction.T64C, ETransaction.T65),
  BII11 (EProfileName.BII11, 11, ETransaction.T41, ETransaction.T42),
  BII12 (EProfileName.BII12, 12, ETransaction.T44, ETransaction.T45),
  BII16 (EProfileName.BII16, 16, ETransaction.T22, ETransaction.T23),
  BII17 (EProfileName.BII17, 17, ETransaction.T18, ETransaction.T54, ETransaction.T55),
  BII21 (EProfileName.BII21, 21, ETransaction.T26),
  BII22 (EProfileName.BII22, 22, ETransaction.T40),
  BII27 (EProfileName.BII27, 27, ETransaction.T01, ETransaction.T02, ETransaction.T04, ETransaction.T05),
  BII28 (EProfileName.BII28, 28, ETransaction.T01, ETransaction.T76),
  BII30 (EProfileName.BII30, 30, ETransaction.T16),
  BII31 (EProfileName.BII31, 31, ETransaction.T17),
  BII32 (EProfileName.BII32, 32, ETransaction.T01, ETransaction.T02),
  BII33 (EProfileName.BII33, 33, ETransaction.T72, ETransaction.T73),
  BII34 (EProfileName.BII34, 34, ETransaction.T40, ETransaction.T69),
  BII35 (EProfileName.BII35, 35, ETransaction.T44, ETransaction.T68, ETransaction.T45);

  private final IHasDisplayText m_aName;
  private final int m_nNumber;
  private final EGroup m_eGroup;
  private final Set <ETransaction> m_aTransactions;

  private void _checkTransactionsSameGroup ()
  {
    for (final ETransaction e : m_aTransactions)
      if (e.getGroup () != m_eGroup)
        throw new IllegalStateException ("Different groups in transactions for " + toString ());
  }

  private EProfile (@Nonnull final EProfileName eName,
                    @Nonnegative final int nNumber,
                    @Nonnull @Nonempty final ETransaction... aTransactions)
  {
    m_aName = eName;
    m_nNumber = nNumber;
    m_eGroup = aTransactions[0].getGroup ();
    m_aTransactions = ContainerHelper.newOrderedSet (aTransactions);
    if (GlobalDebug.isDebugMode ())
      _checkTransactionsSameGroup ();
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

  /**
   * @return The numeric value of this profile (e.g. BII04 returns 4, BII22
   *         returns 22 etc.). Only MLR returns 0!
   */
  @Nonnegative
  public int getNumber ()
  {
    return m_nNumber;
  }

  /**
   * @return The group to which all transaction belong. Never null
   */
  @Nonnull
  public EGroup getGroup ()
  {
    return m_eGroup;
  }

  /**
   * @return A non-<code>null</code> non empty list of all transactions
   *         contained in this profile.
   */
  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  public List <ETransaction> getAllTransactions ()
  {
    return ContainerHelper.newList (m_aTransactions);
  }

  /**
   * Check if the passed transaction is contained in this profile.
   *
   * @param eTransaction
   *        The transaction to query. May be <code>null</code>.
   * @return <code>true</code> if the passed transaction is contained in this
   *         profile, <code>false</code> otherwise.
   */
  public boolean containsTransaction (@Nullable final ETransaction eTransaction)
  {
    return m_aTransactions.contains (eTransaction);
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
  public static List <EProfile> getAllProfilesWithTransaction (@Nonnull final ETransaction eTransaction)
  {
    ValueEnforcer.notNull (eTransaction, "Transaction");

    final List <EProfile> ret = new ArrayList <EProfile> ();
    for (final EProfile eProfile : values ())
      if (eProfile.containsTransaction (eTransaction))
        ret.add (eProfile);
    return ret;
  }
}
