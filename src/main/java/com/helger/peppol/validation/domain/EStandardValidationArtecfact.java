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

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.Nonempty;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.io.IReadableResource;
import com.helger.commons.io.resource.ClassPathResource;

/**
 * This enum contains all the default OpenPEPPOL Schematron artefacts. They are
 * ordered ascending by BIS number, second by transaction and third by desired
 * execution order.
 *
 * @author Philip Helger
 */
public enum EStandardValidationArtecfact
{
  CATALOGUE_CORE ("BIS2.0-catalogue1a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T19-V1.0.sch", TransactionKey.CATALOGUE_01_T19),
  CATALOGUE_RULES ("BIS2.0-catalogue1a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T19.sch", TransactionKey.CATALOGUE_01_T19),
  CATALOGUE_OPENPEPPOL ("BIS2.0-catalogue1a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T19.sch", TransactionKey.CATALOGUE_01_T19),
  CATALOGUE_RESPONSE_RULES ("BIS2.0-catalogue1a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T58.sch", TransactionKey.CATALOGUE_01_T58),
  CATALOGUE_RESPONSE_OPENPEPPOL ("BIS2.0-catalogue1a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T58.sch", TransactionKey.CATALOGUE_01_T58),

  ORDER_CORE ("BIS2.0-order3a-VA_V2.2/Schematron/BII CORE/BIICORE-UBL-T01-V1.0.sch", TransactionKey.ORDER_03_T01),
  ORDER_RULES ("BIS2.0-order3a-VA_V2.2/Schematron/BII RULES/BIIRULES-UBL-T01.sch", TransactionKey.ORDER_03_T01),
  ORDER_OPENPEPPOL ("BIS2.0-order3a-VA_V2.2/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T01.sch", TransactionKey.ORDER_03_T01),

  INVOICE_CORE ("BIS2.0-invoice4a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T10-V1.0.sch", TransactionKey.INVOICE_04_T10),
  INVOICE_RULES ("BIS2.0-invoice4a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T10.sch", TransactionKey.INVOICE_04_T10),
  INVOICE_OPENPEPPOL ("BIS2.0-invoice4a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T10.sch", TransactionKey.INVOICE_04_T10),

  BILLING_CORE ("BIS2.0-billing5a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T14-V1.0.sch", TransactionKey.BILLING_05_T14),
  BILLING_RULES ("BIS2.0-billing5a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T14.sch", TransactionKey.BILLING_05_T14),
  BILLING_OPENPEPPOL ("BIS2.0-billing5a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T14.sch", TransactionKey.BILLING_05_T14),

  ORDERING_ORDER_CORE ("BIS2.0-ordering28a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T01-V1.0.sch", TransactionKey.ORDERING_28_T01),
  ORDERING_ORDER_RULES ("BIS2.0-ordering28a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T01.sch", TransactionKey.ORDERING_28_T01),
  ORDERING_ORDER_OPENPEPPOL ("BIS2.0-ordering28a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T01.sch", TransactionKey.ORDERING_28_T01),
  ORDERING_ORDER_RESPONSE_RULES ("BIS2.0-ordering28a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T76.sch", TransactionKey.ORDERING_28_T76),
  ORDERING_ORDER_RESPONSE_OPENPEPPOL ("BIS2.0-ordering28a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T76.sch", TransactionKey.ORDERING_28_T76),

  DESPATCH_ADVICE_CORE ("BIS2.0-despatchadvice30a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T16-V1.0.sch", TransactionKey.DESPATCH_ADVICE_30_T16),
  DESPATCH_ADVICE_RULES ("BIS2.0-despatchadvice30a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T16.sch", TransactionKey.DESPATCH_ADVICE_30_T16),
  DESPATCH_ADVICE_OPENPEPPOL ("BIS2.0-despatchadvice30a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T16.sch", TransactionKey.DESPATCH_ADVICE_30_T16),

  MLR_RULES ("BIS2.0-messagelevelresponse36a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T71.sch", TransactionKey.MLR_36_T71),
  MLR_OPENPEPPOL ("BIS2.0-messagelevelresponse36a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T71.sch", TransactionKey.MLR_36_T71);

  private final ClassPathResource m_aResource;
  private final TransactionKey m_aTransactionKey;

  private EStandardValidationArtecfact (@Nonnull @Nonempty final String sPath,
                                        @Nonnull final TransactionKey aTransactionKey)
  {
    m_aResource = new ClassPathResource ("/standard/" + sPath);
    m_aTransactionKey = aTransactionKey;
  }

  /**
   * @return The Schematron resource descriptor. Never <code>null</code>.
   */
  @Nonnull
  public IReadableResource getSchematronResource ()
  {
    return m_aResource;
  }

  /**
   * @return The transaction key for this standard validation artefact. Never
   *         <code>null</code>.
   */
  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  /**
   * @return The BIS to which the validation artefact belongs. Never
   *         <code>null</code>.
   */
  @Nonnull
  public EBIS getBIS ()
  {
    return m_aTransactionKey.getBIS ();
  }

  /**
   * @return The transaction to which the validation artefact belongs. Never
   *         <code>null</code>.
   */
  @Nonnull
  public ETransaction getTransaction ()
  {
    return m_aTransactionKey.getTransaction ();
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
  public static List <EStandardValidationArtecfact> getAllMatchingValidationArtefacts (@Nonnull final TransactionKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    final List <EStandardValidationArtecfact> ret = new ArrayList <EStandardValidationArtecfact> ();
    for (final EStandardValidationArtecfact e : values ())
      if (e.getTransactionKey ().equals (aTransactionKey))
        ret.add (e);
    return ret;
  }
}
