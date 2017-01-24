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

import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.key.ValidationArtefactSectorKey;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.version.Version;

/**
 * Peppol validation artefacts etc
 * 
 * @author Philip Helger
 */
@Immutable
public final class CPeppolValidationArtefact
{
  // Predefined transaction keys, ordered by BIS and than by BII2 transaction
  public static final ValidationArtefactKey VK_CATALOGUE_01_T19 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.CATALOGUE_01)
                                                                                                      .setTransaction (EBII2Transaction.T19)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_CATALOGUE_01_T58 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.CATALOGUE_01)
                                                                                                      .setTransaction (EBII2Transaction.T58)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_ORDER_03_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.ORDER_03)
                                                                                                  .setTransaction (EBII2Transaction.T01)
                                                                                                  .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.INVOICE_04)
                                                                                                    .setTransaction (EBII2Transaction.T10)
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.BILLING_05)
                                                                                                    .setTransaction (EBII2Transaction.T14)
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.ORDERING_28)
                                                                                                     .setTransaction (EBII2Transaction.T01)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T76 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.ORDERING_28)
                                                                                                     .setTransaction (EBII2Transaction.T76)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_DESPATCH_ADVICE_30_T16 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.DESPATCH_ADVICE_30)
                                                                                                            .setTransaction (EBII2Transaction.T16)
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_MLR_36_T71 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CPeppolBusinessSpec.MLR_36)
                                                                                                .setTransaction (EBII2Transaction.T71)
                                                                                                .build ();

  public static final Version PEPPOL_VALIDATION_ARTEFACT_VERSION = new Version (3, 3, 0);

  private static final String PREFIX = "openpeppol/" + PEPPOL_VALIDATION_ARTEFACT_VERSION.getAsString (true) + "/SCH/";

  private static final String CATALOGUE = PREFIX + "peppolbis-trdm019-2.0-catalogue/";
  private static final String CATALOGUE_RESPONSE = PREFIX + "peppolbis-trdm058-2.0-catalogue-response/";
  private static final String ORDER = PREFIX + "peppolbis-trdm001-2.0-order/";
  private static final String ORDER_RESPONSE = PREFIX + "peppolbis-trdm076-2.0-order-response/";
  private static final String DESPATCH_ADVICE = PREFIX + "peppolbis-trdm016-2.0-despatch-advice/";
  private static final String INVOICE = PREFIX + "peppolbis-trdm010-2.0-invoice/";
  private static final String CREDIT_NOTE = PREFIX + "peppolbis-trdm014-2.0-creditnote/";
  private static final String MLR = PREFIX + "peppolbis-trdm071-2.0-message-level-response/";

  private static final String BII_RULES = "Schematron/BII RULES/";
  private static final String OPENPEPPOL = "Schematron/OPENPEPPOL/";
  private static final String OPENPEPPOL_CORE = "Schematron/OPENPEPPOL CORE/";

  public static final IReadableResource CATALOGUE_RULES = new ClassPathResource (CATALOGUE +
                                                                                 BII_RULES +
                                                                                 "BIIRULES-UBL-T19.sch");
  public static final IReadableResource CATALOGUE_OPENPEPPOL = new ClassPathResource (CATALOGUE +
                                                                                      OPENPEPPOL +
                                                                                      "OPENPEPPOL-UBL-T19.sch");
  public static final IReadableResource CATALOGUE_OPENPEPPOL_CORE = new ClassPathResource (CATALOGUE +
                                                                                           OPENPEPPOL_CORE +
                                                                                           "OPENPEPPOLCORE-UBL-T19.sch");

  public static final IReadableResource CATALOGUE_RESPONSE_RULES = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                          BII_RULES +
                                                                                          "BIIRULES-UBL-T58.sch");
  public static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                               OPENPEPPOL +
                                                                                               "OPENPEPPOL-UBL-T58.sch");
  public static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                                    OPENPEPPOL_CORE +
                                                                                                    "OPENPEPPOLCORE-UBL-T58.sch");

  public static final IReadableResource ORDER_RULES = new ClassPathResource (ORDER +
                                                                             BII_RULES +
                                                                             "BIIRULES-UBL-T01.sch");
  public static final IReadableResource ORDER_OPENPEPPOL = new ClassPathResource (ORDER +
                                                                                  OPENPEPPOL +
                                                                                  "OPENPEPPOL-UBL-T01.sch");
  public static final IReadableResource ORDER_OPENPEPPOL_CORE = new ClassPathResource (ORDER +
                                                                                       OPENPEPPOL_CORE +
                                                                                       "OPENPEPPOLCORE-UBL-T01.sch");

  public static final IReadableResource ORDER_RESPONSE_RULES = new ClassPathResource (ORDER_RESPONSE +
                                                                                      BII_RULES +
                                                                                      "BIIRULES-UBL-T76.sch");
  public static final IReadableResource ORDER_RESPONSE_OPENPEPPOL = new ClassPathResource (ORDER_RESPONSE +
                                                                                           OPENPEPPOL +
                                                                                           "OPENPEPPOL-UBL-T76.sch");
  public static final IReadableResource ORDER_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (ORDER_RESPONSE +
                                                                                                OPENPEPPOL_CORE +
                                                                                                "OPENPEPPOLCORE-UBL-T76.sch");

  public static final IReadableResource DESPATCH_ADVICE_RULES = new ClassPathResource (DESPATCH_ADVICE +
                                                                                       BII_RULES +
                                                                                       "BIIRULES-UBL-T16.sch");
  public static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL = new ClassPathResource (DESPATCH_ADVICE +
                                                                                            OPENPEPPOL +
                                                                                            "OPENPEPPOL-UBL-T16.sch");
  public static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL_CORE = new ClassPathResource (DESPATCH_ADVICE +
                                                                                                 OPENPEPPOL_CORE +
                                                                                                 "OPENPEPPOLCORE-UBL-T16.sch");

  public static final IReadableResource INVOICE_RULES = new ClassPathResource (INVOICE +
                                                                               BII_RULES +
                                                                               "BIIRULES-UBL-T10.sch");
  public static final IReadableResource INVOICE_OPENPEPPOL = new ClassPathResource (INVOICE +
                                                                                    OPENPEPPOL +
                                                                                    "OPENPEPPOL-UBL-T10.sch");
  public static final IReadableResource INVOICE_OPENPEPPOL_CORE = new ClassPathResource (INVOICE +
                                                                                         OPENPEPPOL_CORE +
                                                                                         "OPENPEPPOLCORE-UBL-T10.sch");

  public static final IReadableResource CREDIT_NOTE_RULES = new ClassPathResource (CREDIT_NOTE +
                                                                                   BII_RULES +
                                                                                   "BIIRULES-UBL-T14.sch");
  public static final IReadableResource CREDIT_NOTE_OPENPEPPOL = new ClassPathResource (CREDIT_NOTE +
                                                                                        OPENPEPPOL +
                                                                                        "OPENPEPPOL-UBL-T14.sch");
  public static final IReadableResource CREDIT_NOTE_OPENPEPPOL_CORE = new ClassPathResource (CREDIT_NOTE +
                                                                                             OPENPEPPOL_CORE +
                                                                                             "OPENPEPPOLCORE-UBL-T14.sch");

  public static final IReadableResource MLR_RULES = new ClassPathResource (MLR + BII_RULES + "BIIRULES-UBL-T71.sch");
  public static final IReadableResource MLR_OPENPEPPOL = new ClassPathResource (MLR +
                                                                                OPENPEPPOL +
                                                                                "OPENPEPPOL-UBL-T71.sch");
  public static final IReadableResource MLR_OPENPEPPOL_CORE = new ClassPathResource (MLR +
                                                                                     OPENPEPPOL_CORE +
                                                                                     "OPENPEPPOLCORE-UBL-T71.sch");

  public static final ValidationArtefactSectorKey SECTOR_AT_GOV = new ValidationArtefactSectorKey ("ATGOV",
                                                                                                   "Austrian Government");
  public static final ValidationArtefactSectorKey SECTOR_NL_SIMPLERINVOICING = new ValidationArtefactSectorKey ("NLSI",
                                                                                                                "SimplerInvoicing");
  public static final ValidationArtefactSectorKey SECTOR_NL_SIMPLERINVOICING_STRICT = new ValidationArtefactSectorKey ("NLSIS",
                                                                                                                       "SimplerInvoicing (Strict)");

  private CPeppolValidationArtefact ()
  {}
}
