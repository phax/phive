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
package com.helger.peppol.validation.artefact.peppol;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.domain.IBusinessSpecification;
import com.helger.peppol.validation.domain.ISpecificationTransaction;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.peppol.validation.domain.peppol.PeppolTransactionKey;
import com.helger.ubl21.EUBL21DocumentType;

/**
 * This enumeration contains all the default OpenPEPPOL Schematron artefacts.
 * They are ordered ascending by BIS number, second by transaction and third by
 * desired execution order.
 *
 * @author Philip Helger
 */
public enum EPeppolStandardValidationArtefact implements IValidationArtefact
{
 CATALOGUE_CORE ("Catalogue/BIICORE-UBL-T19-V1.0.sch", PeppolTransactionKey.CATALOGUE_01_T19),
 CATALOGUE_RULES ("Catalogue/BIIRULES-UBL-T19.sch", PeppolTransactionKey.CATALOGUE_01_T19),
 CATALOGUE_OPENPEPPOL ("Catalogue/OPENPEPPOL-UBL-T19.sch", PeppolTransactionKey.CATALOGUE_01_T19),

 CATALOGUE_RESPONSE_RULES ("Catalogue/BIIRULES-UBL-T58.sch", PeppolTransactionKey.CATALOGUE_01_T58),
 CATALOGUE_RESPONSE_OPENPEPPOL ("Catalogue/OPENPEPPOL-UBL-T58.sch", PeppolTransactionKey.CATALOGUE_01_T58),

 ORDER_CORE ("Order/BIICORE-UBL-T01-V1.0.sch", PeppolTransactionKey.ORDER_03_T01),
 ORDER_RULES ("Order/BIIRULES-UBL-T01.sch", PeppolTransactionKey.ORDER_03_T01),
 ORDER_OPENPEPPOL ("Order/OPENPEPPOL-UBL-T01.sch", PeppolTransactionKey.ORDER_03_T01),

 INVOICE_CORE ("Invoice/BIICORE-UBL-T10-V1.0.sch", PeppolTransactionKey.INVOICE_04_T10),
 INVOICE_RULES ("Invoice/BIIRULES-UBL-T10.sch", PeppolTransactionKey.INVOICE_04_T10),
 INVOICE_OPENPEPPOL ("Invoice/OPENPEPPOL-UBL-T10.sch", PeppolTransactionKey.INVOICE_04_T10),

 BILLING_CREDIT_NOTE_CORE ("Billing/BIICORE-UBL-T14-V1.0.sch", PeppolTransactionKey.BILLING_05_T14),
 BILLING_CREDIT_NOTE_RULES ("Billing/BIIRULES-UBL-T14.sch", PeppolTransactionKey.BILLING_05_T14),
 BILLING_CREDIT_NOTE_OPENPEPPOL ("Billing/OPENPEPPOL-UBL-T14.sch", PeppolTransactionKey.BILLING_05_T14),

 ORDERING_ORDER_CORE ("Ordering/BIICORE-UBL-T01-V1.0.sch", PeppolTransactionKey.ORDERING_28_T01),
 ORDERING_ORDER_RULES ("Ordering/BIIRULES-UBL-T01.sch", PeppolTransactionKey.ORDERING_28_T01),
 ORDERING_ORDER_OPENPEPPOL ("Ordering/OPENPEPPOL-UBL-T01.sch", PeppolTransactionKey.ORDERING_28_T01),

 ORDERING_ORDER_RESPONSE_RULES ("Ordering/BIIRULES-UBL-T76.sch", PeppolTransactionKey.ORDERING_28_T76),
 ORDERING_ORDER_RESPONSE_OPENPEPPOL ("Ordering/OPENPEPPOL-UBL-T76.sch", PeppolTransactionKey.ORDERING_28_T76),

 DESPATCH_ADVICE_CORE ("DespatchAdvice/BIICORE-UBL-T16-V1.0.sch", PeppolTransactionKey.DESPATCH_ADVICE_30_T16),
 DESPATCH_ADVICE_RULES ("DespatchAdvice/BIIRULES-UBL-T16.sch", PeppolTransactionKey.DESPATCH_ADVICE_30_T16),
 DESPATCH_ADVICE_OPENPEPPOL ("DespatchAdvice/OPENPEPPOL-UBL-T16.sch", PeppolTransactionKey.DESPATCH_ADVICE_30_T16),

 MLR_RULES ("MLR/BIIRULES-UBL-T71.sch", PeppolTransactionKey.MLR_36_T71),
 MLR_OPENPEPPOL ("MLR/OPENPEPPOL-UBL-T71.sch", PeppolTransactionKey.MLR_36_T71);

  private final ClassPathResource m_aResource;
  private final TransactionKey m_aTransactionKey;

  private EPeppolStandardValidationArtefact (@Nonnull @Nonempty final String sPath, @Nonnull final TransactionKey aTransactionKey)
  {
    m_aResource = new ClassPathResource ("/peppol-rules/" + sPath);
    m_aTransactionKey = aTransactionKey;
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
    return getTransaction ().getUBLDocumentType ();
  }

  @Nullable
  public String getPrerequisiteXPath ()
  {
    return null;
  }

  public boolean hasPrerequisiteXPath ()
  {
    return false;
  }

  public boolean isCountrySpecific ()
  {
    return false;
  }

  @Nullable
  public Locale getCountryLocale ()
  {
    return null;
  }

  @Nullable
  public String getCountryCode ()
  {
    return null;
  }

  public boolean isSectorSpecific ()
  {
    return false;
  }

  /**
   * Get all validation artefacts matching the passed transaction key in the
   * correct execution order.
   *
   * @param aTransactionKey
   *        The transaction to search. May not be <code>null</code>.
   * @return A non-<code>null</code> list with all matching artefacts in the
   *         order they were defined. This list may be empty, if no matching
   *         artefact is present.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static List <EPeppolStandardValidationArtefact> getAllMatchingValidationArtefacts (@Nonnull final TransactionKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    final List <EPeppolStandardValidationArtefact> ret = new ArrayList <EPeppolStandardValidationArtefact> ();
    for (final EPeppolStandardValidationArtefact e : values ())
      if (e.getTransactionKey ().hasSameSpecificationAndTransaction (aTransactionKey))
        ret.add (e);
    return ret;
  }

  /**
   * Check if at least one standard validation artefact contained in this
   * enumeration supports the passed transaction key.
   *
   * @param aTransactionKey
   *        The transaction key to be checked. May be <code>null</code>.
   * @return <code>true</code> if the passed transaction key is not
   *         <code>null</code> and a matching artefact is present.
   */
  public static boolean containsMatchingValidationArtefacts (@Nullable final TransactionKey aTransactionKey)
  {
    if (aTransactionKey != null)
      for (final EPeppolStandardValidationArtefact e : values ())
        if (e.getTransactionKey ().hasSameSpecificationAndTransaction (aTransactionKey))
          return true;
    return false;
  }
}
