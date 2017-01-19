package com.helger.peppol.validation.engine.peppol;

import com.helger.bdve.artefact.IValidationArtefact;

public interface IPeppolValidationArtefact extends IValidationArtefact
{
  // global prefix
  String PREFIX = "openpeppol/3.3.0/SCH/";

  String CATALOGUE = PREFIX + "peppolbis-trdm019-2.0-catalogue/";
  String CATALOGUE_RESPONSE = PREFIX + "peppolbis-trdm058-2.0-catalogue-response/";
  String ORDER = PREFIX + "peppolbis-trdm001-2.0-order/";
  String ORDER_RESPONSE = PREFIX + "peppolbis-trdm076-2.0-order-response/";
  String DESPATCH_ADVICE = PREFIX + "peppolbis-trdm016-2.0-despatch-advice/";
  String INVOICE = PREFIX + "peppolbis-trdm010-2.0-invoice/";
  String CREDIT_NOTE = PREFIX + "peppolbis-trdm014-2.0-creditnote/";
  String MLR = PREFIX + "peppolbis-trdm071-2.0-message-level-response/";

  String BII_RULES = "Schematron/BII RULES/";
  String OPENPEPPOL = "Schematron/OPENPEPPOL/";
  String OPENPEPPOL_CORE = "Schematron/OPENPEPPOL CORE/";
}
