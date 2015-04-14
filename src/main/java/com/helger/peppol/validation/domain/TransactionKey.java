/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
import com.helger.commons.annotations.MustImplementEqualsAndHashcode;
import com.helger.commons.hash.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;
import com.helger.ubl.EUBL21DocumentType;

/**
 * An immutable pair of a business specification of type
 * {@link IBusinessSpecification} and a transaction of type
 * {@link ISpecificationTransaction}.
 *
 * @author Philip Helger
 */
@Immutable
@MustImplementEqualsAndHashcode
public class TransactionKey
{
  private final IBusinessSpecification m_aBusinessSpecification;
  private final ISpecificationTransaction m_aTransaction;

  public TransactionKey (@Nonnull final IBusinessSpecification aBusinessSpecification,
                         @Nonnull final ISpecificationTransaction aTransaction)
  {
    m_aBusinessSpecification = ValueEnforcer.notNull (aBusinessSpecification, "BusinessSpecification");
    m_aTransaction = ValueEnforcer.notNull (aTransaction, "Transaction");
  }

  /**
   * @return The business specification this transaction key refers to. This is
   *         the object passed in the constructor. Never <code>null</code>.
   */
  @Nonnull
  public IBusinessSpecification getBusinessSpecification ()
  {
    return m_aBusinessSpecification;
  }

  /**
   * @return The transaction of the specification as passed in the constructor.
   *         Never <code>null</code>.
   */
  @Nonnull
  public ISpecificationTransaction getTransaction ()
  {
    return m_aTransaction;
  }

  /**
   * @return The UBL document type to be used for this transaction.
   */
  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return m_aTransaction.getUBLDocumentType ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final TransactionKey rhs = (TransactionKey) o;
    return m_aBusinessSpecification.equals (rhs.m_aBusinessSpecification) && m_aTransaction.equals (rhs.m_aTransaction);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aBusinessSpecification).append (m_aTransaction).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("BusinessSpecification", m_aBusinessSpecification)
                                       .append ("Transaction", m_aTransaction)
                                       .toString ();
  }
}
