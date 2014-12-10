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
package com.helger.peppol.validation.test;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.IReadableResource;
import com.helger.peppol.validation.domain.CountryKey;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.ubl.EUBL21DocumentType;

/**
 * This class describes a simple test file: the path where it resides and the
 * transaction key to be used.
 *
 * @author Philip Helger
 */
@Immutable
public class TestFile
{
  private final IReadableResource m_aResource;
  private final TransactionKey m_aTransactionKey;
  private final CountryKey m_aExtendedTransactionKey;

  public TestFile (@Nonnull final IReadableResource aResource, @Nonnull final TransactionKey aTransactionKey)
  {
    this (aResource, aTransactionKey, (CountryKey) null);
  }

  public TestFile (@Nonnull final IReadableResource aResource,
                   @Nonnull final TransactionKey aTransactionKey,
                   @Nullable final CountryKey aExtendedTransactionKey)
  {
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aTransactionKey = ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
    m_aExtendedTransactionKey = aExtendedTransactionKey;
  }

  /**
   * @return The readable resource as passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public IReadableResource getResource ()
  {
    return m_aResource;
  }

  /**
   * @return The transaction key passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  /**
   * @return The UBL document type to be used.
   */
  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return m_aTransactionKey.getTransaction ().getUBLDocumentType ();
  }

  @Nullable
  public CountryKey getExtendedTransactionKey ()
  {
    return m_aExtendedTransactionKey;
  }

  /**
   * @return <code>true</code> if this validation artefact is country specific,
   *         <code>false</code> if it is generic.
   */
  public boolean isCountrySpecific ()
  {
    return m_aExtendedTransactionKey != null;
  }

  /**
   * @return The locale for which this artefact is designed for or
   *         <code>null</code> if it is country independent validation artefact.
   */
  @Nullable
  public Locale getCountryLocale ()
  {
    return m_aExtendedTransactionKey == null ? null : m_aExtendedTransactionKey.getCountryLocale ();
  }

  /**
   * @return The country code for which this artefact is designed for or
   *         <code>null</code> if it is country independent validation artefact.
   */
  @Nullable
  public String getCountryCode ()
  {
    return m_aExtendedTransactionKey == null ? null : m_aExtendedTransactionKey.getCountryCode ();
  }

  /**
   * @return <code>true</code> if this validation artefact is sector specific,
   *         <code>false</code> if it is not.
   */
  public boolean isSectorSpecific ()
  {
    return m_aExtendedTransactionKey != null && m_aExtendedTransactionKey.isSectorSpecific ();
  }
}
