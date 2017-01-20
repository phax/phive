/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation;

/**
 * Dummy interface that only defines the internal paths for the PEPPOL
 * validation artefacts
 *
 * @author Philip Helger
 */
interface IPeppolValidationArtefact
{
  // global prefix
  String PREFIX = "openpeppol/" + CPeppolValidation.PEPPOL_VALIDATION_ARTEFACT_VERSION.getAsString (true) + "/SCH/";

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
