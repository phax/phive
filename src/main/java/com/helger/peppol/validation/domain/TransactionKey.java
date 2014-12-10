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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.hash.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;
import com.helger.ubl.EUBL21DocumentType;

/**
 * An immutable pair of BIS of type {@link EBIS} and transaction of type
 * {@link ETransaction}.
 *
 * @author Philip Helger
 */
@Immutable
public class TransactionKey
{
  // Predefined transaction keys, ordered by BIS and than by transaction
  public static final TransactionKey CATALOGUE_01_T19 = new TransactionKey (EBIS.CATALOGUE_01, ETransaction.T19);
  public static final TransactionKey CATALOGUE_01_T58 = new TransactionKey (EBIS.CATALOGUE_01, ETransaction.T58);
  public static final TransactionKey ORDER_03_T01 = new TransactionKey (EBIS.ORDER_03, ETransaction.T01);
  public static final TransactionKey INVOICE_04_T10 = new TransactionKey (EBIS.INVOICE_04, ETransaction.T10);
  public static final TransactionKey BILLING_05_T14 = new TransactionKey (EBIS.BILLING_05, ETransaction.T14);
  public static final TransactionKey ORDERING_28_T01 = new TransactionKey (EBIS.ORDERING_28, ETransaction.T01);
  public static final TransactionKey ORDERING_28_T76 = new TransactionKey (EBIS.ORDERING_28, ETransaction.T76);
  public static final TransactionKey DESPATCH_ADVICE_30_T16 = new TransactionKey (EBIS.DESPATCH_ADVICE_30,
                                                                                  ETransaction.T16);
  public static final TransactionKey MLR_36_T71 = new TransactionKey (EBIS.MLR_36, ETransaction.T71);

  private final EBIS m_eBIS;
  private final ETransaction m_eTransaction;

  public TransactionKey (@Nonnull final EBIS eBIS, @Nonnull final ETransaction eTransaction)
  {
    m_eBIS = ValueEnforcer.notNull (eBIS, "BIS");
    m_eTransaction = ValueEnforcer.notNull (eTransaction, "Transaction");
  }

  @Nonnull
  public EBIS getBIS ()
  {
    return m_eBIS;
  }

  @Nonnull
  public ETransaction getTransaction ()
  {
    return m_eTransaction;
  }

  /**
   * @return The UBL document type to be used for this transaction.
   */
  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return m_eTransaction.getUBLDocumentType ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final TransactionKey rhs = (TransactionKey) o;
    return m_eBIS.equals (rhs.m_eBIS) && m_eTransaction.equals (rhs.m_eTransaction);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_eBIS).append (m_eTransaction).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("BIS", m_eBIS).append ("transaction", m_eTransaction).toString ();
  }
}
