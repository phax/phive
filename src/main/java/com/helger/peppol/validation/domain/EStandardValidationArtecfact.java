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

import com.helger.commons.annotations.Nonempty;
import com.helger.commons.io.IReadableResource;
import com.helger.commons.io.resource.ClassPathResource;

public enum EStandardValidationArtecfact
{
  BILLING_CORE ("BIS2.0-billing5a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T14-V1.0.sch", EBIS.BILLING, ETransaction.T14),
  BILLING_RULES ("BIS2.0-billing5a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T14.sch", EBIS.BILLING, ETransaction.T14),
  BILLING_OPENPEPPOL ("BIS2.0-billing5a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T14.sch", EBIS.BILLING, ETransaction.T14),
  CATALOGUE_CORE ("BIS2.0-catalogue1a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T19-V1.0.sch", EBIS.CATALOGUE, ETransaction.T19),
  CATALOGUE_RULES ("BIS2.0-catalogue1a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T19.sch", EBIS.CATALOGUE, ETransaction.T19),
  CATALOGUE_OPENPEPPOL ("BIS2.0-catalogue1a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T19.sch", EBIS.CATALOGUE, ETransaction.T19),
  CATALOGUE_RESPONSE_RULES ("BIS2.0-catalogue1a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T58.sch", EBIS.CATALOGUE, ETransaction.T58),
  CATALOGUE_RESPONSE_OPENPEPPOL ("BIS2.0-catalogue1a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T58.sch", EBIS.CATALOGUE, ETransaction.T58),
  DESPATCH_ADVICE_CORE ("BIS2.0-despatchadvice30a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T16-V1.0.sch", EBIS.DESPATCH_ADVICE, ETransaction.T16),
  DESPATCH_ADVICE_RULES ("BIS2.0-despatchadvice30a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T16.sch", EBIS.DESPATCH_ADVICE, ETransaction.T16),
  DESPATCH_ADVICE_OPENPEPPOL ("BIS2.0-despatchadvice30a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T16.sch", EBIS.DESPATCH_ADVICE, ETransaction.T16),
  INVOICE_CORE ("BIS2.0-invoice4a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T10-V1.0.sch", EBIS.INVOICE, ETransaction.T10),
  INVOICE_RULES ("BIS2.0-invoice4a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T10.sch", EBIS.INVOICE, ETransaction.T10),
  INVOICE_OPENPEPPOL ("BIS2.0-invoice4a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T10.sch", EBIS.INVOICE, ETransaction.T10),
  MLR_RULES ("BIS2.0-messagelevelresponse36a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T71.sch", EBIS.MLR, ETransaction.T71),
  MLR_OPENPEPPOL ("BIS2.0-messagelevelresponse36a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T71.sch", EBIS.MLR, ETransaction.T71),
  ORDER_CORE ("BIS2.0-order3a-VA_V2.2/Schematron/BII CORE/BIICORE-UBL-T01-V1.0.sch", EBIS.ORDER, ETransaction.T01),
  ORDER_RULES ("BIS2.0-order3a-VA_V2.2/Schematron/BII RULES/BIIRULES-UBL-T01.sch", EBIS.ORDER, ETransaction.T01),
  ORDER_OPENPEPPOL ("BIS2.0-order3a-VA_V2.2/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T01.sch", EBIS.ORDER, ETransaction.T01),
  ORDERING_ORDER_CORE ("BIS2.0-ordering28a-VA_V2.1/Schematron/BII CORE/BIICORE-UBL-T01-V1.0.sch", EBIS.ORDERING, ETransaction.T01),
  ORDERING_ORDER_RULES ("BIS2.0-ordering28a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T01.sch", EBIS.ORDERING, ETransaction.T01),
  ORDERING_ORDER_OPENPEPPOL ("BIS2.0-ordering28a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T01.sch", EBIS.ORDERING, ETransaction.T01),
  ORDERING_ORDER_RESPONSE_RULES ("BIS2.0-ordering28a-VA_V2.1/Schematron/BII RULES/BIIRULES-UBL-T76.sch", EBIS.ORDERING, ETransaction.T76),
  ORDERING_ORDER_RESPONSE_OPENPEPPOL ("BIS2.0-ordering28a-VA_V2.1/Schematron/OPENPEPPOL/OPENPEPPOL-UBL-T76.sch", EBIS.ORDERING, ETransaction.T76);

  private final ClassPathResource m_aResource;
  private final EBIS m_eBIS;
  private final ETransaction m_eTransaction;

  private EStandardValidationArtecfact (@Nonnull @Nonempty final String sPath,
                                        @Nonnull final EBIS eBIS,
                                        @Nonnull final ETransaction eTransaction)
  {
    m_aResource = new ClassPathResource ("/standard/" + sPath);
    m_eBIS = eBIS;
    m_eTransaction = eTransaction;
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
   * @return The BIS to which the validation artefact belongs. Never
   *         <code>null</code>.
   */
  @Nonnull
  public EBIS getBIS ()
  {
    return m_eBIS;
  }

  /**
   * @return The transaction to which the validation artefact belongs. Never
   *         <code>null</code>.
   */
  @Nonnull
  public ETransaction getTransaction ()
  {
    return m_eTransaction;
  }
}
