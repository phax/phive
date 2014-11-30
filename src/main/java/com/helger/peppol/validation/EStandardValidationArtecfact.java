package com.helger.peppol.validation;

import javax.annotation.Nonnull;

import com.helger.commons.annotations.Nonempty;

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

  private EStandardValidationArtecfact (@Nonnull @Nonempty final String sPath,
                                        @Nonnull final EBIS eBIS,
                                        @Nonnull final ETransaction eTransaction)
  {}
}
