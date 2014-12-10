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

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.Nonempty;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.io.IReadableResource;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.ubl.EUBL21DocumentType;

/**
 * This enumeration contains all the extended country specific OpenPEPPOL
 * Schematron artefacts I'm aware of. They are ordered ascending country, than
 * by BIS number, by transaction and finally by desired execution order.
 *
 * @author Philip Helger
 */
public enum EExtendedValidationArtefact implements IValidationArtefact
{
  INVOICE_AT_NAT ("atnat/ATNAT-UBL-T10.sch", TransactionKey.INVOICE_04_T10, CountryKey.AT),
  INVOICE_AT_GOV ("atgov/ATGOV-UBL-T10.sch", TransactionKey.INVOICE_04_T10, CountryKey.AT_SECTOR),

  BILLING_CREDIT_NOTE_AT_NAT ("atnat/ATNAT-UBL-T14.sch", TransactionKey.BILLING_05_T14, CountryKey.AT),
  BILLING_CREDIT_NOTE_AT_GOV ("atgov/ATGOV-UBL-T14.sch", TransactionKey.BILLING_05_T14, CountryKey.AT_SECTOR);

  private final ClassPathResource m_aResource;
  private final TransactionKey m_aTransactionKey;
  private final CountryKey m_aExtendedTransactionKey;

  private EExtendedValidationArtefact (@Nonnull @Nonempty final String sPath,
                                       @Nonnull final TransactionKey aTransactionKey,
                                       @Nonnull final CountryKey aExtendedTransactionKey)
  {
    m_aResource = new ClassPathResource ("/extended/" + sPath);
    m_aTransactionKey = aTransactionKey;
    m_aExtendedTransactionKey = aExtendedTransactionKey;
  }

  @Nonnull
  public IReadableResource getSchematronResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  @Nonnull
  public EBIS getBIS ()
  {
    return m_aTransactionKey.getBIS ();
  }

  @Nonnull
  public ETransaction getTransaction ()
  {
    return m_aTransactionKey.getTransaction ();
  }

  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return getTransaction ().getUBLDocumentType ();
  }

  @Nonnull
  public CountryKey getExtendedTransactionKey ()
  {
    return m_aExtendedTransactionKey;
  }

  public boolean isCountrySpecific ()
  {
    return true;
  }

  @Nonnull
  public Locale getCountryLocale ()
  {
    return m_aExtendedTransactionKey.getCountryLocale ();
  }

  @Nonnull
  @Nonempty
  public String getCountryCode ()
  {
    return m_aExtendedTransactionKey.getCountryCode ();
  }

  public boolean isSectorSpecific ()
  {
    return m_aExtendedTransactionKey.isSectorSpecific ();
  }

  /**
   * Get all validation artefacts matching the passed transaction key in the
   * correct execution order.
   *
   * @param aTransactionKey
   *        The transaction to search. May not be <code>null</code>.
   * @param aExtendedTransactionKey
   *        The extended transaction to search. May not be <code>null</code>.
   * @return A non-<code>null</code> list with all matching artefacts in the
   *         order they were defined. This list may be empty, if no matching
   *         artefact is present.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static List <EExtendedValidationArtefact> getAllMatchingValidationArtefacts (@Nonnull final TransactionKey aTransactionKey,
                                                                                      @Nonnull final CountryKey aExtendedTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
    ValueEnforcer.notNull (aExtendedTransactionKey, "ExtendedTransactionKey");

    final List <EExtendedValidationArtefact> ret = new ArrayList <EExtendedValidationArtefact> ();
    for (final EExtendedValidationArtefact e : values ())
      if (e.getTransactionKey ().equals (aTransactionKey) &&
          e.getExtendedTransactionKey ().equals (aExtendedTransactionKey))
        ret.add (e);
    return ret;
  }

  /**
   * Check if at least one standard validation artefact contained in this
   * enumeration supports the passed transaction key.
   *
   * @param aTransactionKey
   *        The transaction key to be checked. May be <code>null</code>.
   * @param aExtendedTransactionKey
   *        The extended transaction to search. May not be <code>null</code>.
   * @return <code>true</code> if the passed transaction key is not
   *         <code>null</code> and a matching artefact is present.
   */
  public static boolean containsMatchingValidationArtefacts (@Nullable final TransactionKey aTransactionKey,
                                                             @Nonnull final CountryKey aExtendedTransactionKey)
  {
    if (aTransactionKey != null)
      for (final EExtendedValidationArtefact e : values ())
        if (e.getTransactionKey ().equals (aTransactionKey) &&
            e.getExtendedTransactionKey ().equals (aExtendedTransactionKey))
          return true;
    return false;
  }
}
