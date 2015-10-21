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

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;
import com.helger.ubl21.EUBL21DocumentType;

/**
 * A combination of {@link TransactionKey} and {@link ThirdPartyKey}. So this is
 * a combination of:
 * <ul>
 * <li>PEPPOL BIS</li>
 * <li>BII transaction</li>
 * <li>Optional country code</li>
 * <li>Flag whether it is sector specific or not</li>
 * </ul>
 *
 * @author Philip Helger
 */
public class ExtendedTransactionKey
{
  private final TransactionKey m_aTransactionKey;
  private final ThirdPartyKey m_aThirdpartyKey;

  public ExtendedTransactionKey (@Nonnull final TransactionKey aTransactionKey)
  {
    this (aTransactionKey, (ThirdPartyKey) null);
  }

  public ExtendedTransactionKey (@Nonnull final TransactionKey aTransactionKey, @Nullable final ThirdPartyKey aThirdpartyKey)
  {
    m_aTransactionKey = ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
    m_aThirdpartyKey = aThirdpartyKey;
  }

  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  @Nonnull
  public IBusinessSpecification getBusinessSpecification ()
  {
    return m_aTransactionKey.getBusinessSpecification ();
  }

  @Nonnull
  public ISpecificationTransaction getTransaction ()
  {
    return m_aTransactionKey.getTransaction ();
  }

  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return m_aTransactionKey.getUBLDocumentType ();
  }

  @Nullable
  public ThirdPartyKey getThirdpartyKey ()
  {
    return m_aThirdpartyKey;
  }

  public boolean isCountrySpecific ()
  {
    return m_aThirdpartyKey != null;
  }

  @Nullable
  public Locale getCountryLocale ()
  {
    return m_aThirdpartyKey == null ? null : m_aThirdpartyKey.getCountryLocale ();
  }

  @Nullable
  public String getCountryCode ()
  {
    return m_aThirdpartyKey == null ? null : m_aThirdpartyKey.getCountryCode ();
  }

  public boolean isSectorSpecific ()
  {
    return m_aThirdpartyKey != null && m_aThirdpartyKey.isSectorSpecific ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ExtendedTransactionKey rhs = (ExtendedTransactionKey) o;
    return m_aTransactionKey.equals (rhs.m_aTransactionKey) && EqualsHelper.equals (m_aThirdpartyKey, rhs.m_aThirdpartyKey);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aTransactionKey).append (m_aThirdpartyKey).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("TransactionKey", m_aTransactionKey).appendIfNotNull ("ThirdPartyKey", m_aThirdpartyKey).toString ();
  }
}
