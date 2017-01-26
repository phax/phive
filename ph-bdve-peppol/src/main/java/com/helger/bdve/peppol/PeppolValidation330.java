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
package com.helger.bdve.peppol;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.version.Version;

/**
 * OpenPEPPOL validation artefacts release 3.3.0
 *
 * @author Philip Helger
 */
@Immutable
public final class PeppolValidation330
{
  // Standard resources
  public static final Version PEPPOL_VALIDATION_ARTEFACT_VERSION = new Version (3, 3, 0);
  private static String VERSION_STR = PEPPOL_VALIDATION_ARTEFACT_VERSION.getAsString (true);

  // Standard
  public static final VESID VID_OPENPEPPOL_T71_V2 = new VESID ("eu.peppol.bis2", "t71", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T14_V2 = new VESID ("eu.peppol.bis2", "t14", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T10_V2 = new VESID ("eu.peppol.bis2", "t10", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T16_V2 = new VESID ("eu.peppol.bis2", "t16", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T76_V2 = new VESID ("eu.peppol.bis2", "t76", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T01_V2 = new VESID ("eu.peppol.bis2", "t01", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T58_V2 = new VESID ("eu.peppol.bis2", "t58", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T19_V2 = new VESID ("eu.peppol.bis2", "t19", VERSION_STR);

  private static final String PREFIX = "openpeppol/" + VERSION_STR + "/SCH/";

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

  private static final IReadableResource CATALOGUE_RULES = new ClassPathResource (CATALOGUE +
                                                                                  BII_RULES +
                                                                                  "BIIRULES-UBL-T19.sch");
  private static final IReadableResource CATALOGUE_OPENPEPPOL = new ClassPathResource (CATALOGUE +
                                                                                       OPENPEPPOL +
                                                                                       "OPENPEPPOL-UBL-T19.sch");
  private static final IReadableResource CATALOGUE_OPENPEPPOL_CORE = new ClassPathResource (CATALOGUE +
                                                                                            OPENPEPPOL_CORE +
                                                                                            "OPENPEPPOLCORE-UBL-T19.sch");

  private static final IReadableResource CATALOGUE_RESPONSE_RULES = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                           BII_RULES +
                                                                                           "BIIRULES-UBL-T58.sch");
  private static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                                OPENPEPPOL +
                                                                                                "OPENPEPPOL-UBL-T58.sch");
  private static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                                     OPENPEPPOL_CORE +
                                                                                                     "OPENPEPPOLCORE-UBL-T58.sch");

  private static final IReadableResource ORDER_RULES = new ClassPathResource (ORDER +
                                                                              BII_RULES +
                                                                              "BIIRULES-UBL-T01.sch");
  private static final IReadableResource ORDER_OPENPEPPOL = new ClassPathResource (ORDER +
                                                                                   OPENPEPPOL +
                                                                                   "OPENPEPPOL-UBL-T01.sch");
  private static final IReadableResource ORDER_OPENPEPPOL_CORE = new ClassPathResource (ORDER +
                                                                                        OPENPEPPOL_CORE +
                                                                                        "OPENPEPPOLCORE-UBL-T01.sch");

  private static final IReadableResource ORDER_RESPONSE_RULES = new ClassPathResource (ORDER_RESPONSE +
                                                                                       BII_RULES +
                                                                                       "BIIRULES-UBL-T76.sch");
  private static final IReadableResource ORDER_RESPONSE_OPENPEPPOL = new ClassPathResource (ORDER_RESPONSE +
                                                                                            OPENPEPPOL +
                                                                                            "OPENPEPPOL-UBL-T76.sch");
  private static final IReadableResource ORDER_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (ORDER_RESPONSE +
                                                                                                 OPENPEPPOL_CORE +
                                                                                                 "OPENPEPPOLCORE-UBL-T76.sch");

  private static final IReadableResource DESPATCH_ADVICE_RULES = new ClassPathResource (DESPATCH_ADVICE +
                                                                                        BII_RULES +
                                                                                        "BIIRULES-UBL-T16.sch");
  private static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL = new ClassPathResource (DESPATCH_ADVICE +
                                                                                             OPENPEPPOL +
                                                                                             "OPENPEPPOL-UBL-T16.sch");
  private static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL_CORE = new ClassPathResource (DESPATCH_ADVICE +
                                                                                                  OPENPEPPOL_CORE +
                                                                                                  "OPENPEPPOLCORE-UBL-T16.sch");

  private static final IReadableResource INVOICE_RULES = new ClassPathResource (INVOICE +
                                                                                BII_RULES +
                                                                                "BIIRULES-UBL-T10.sch");
  private static final IReadableResource INVOICE_OPENPEPPOL = new ClassPathResource (INVOICE +
                                                                                     OPENPEPPOL +
                                                                                     "OPENPEPPOL-UBL-T10.sch");
  private static final IReadableResource INVOICE_OPENPEPPOL_CORE = new ClassPathResource (INVOICE +
                                                                                          OPENPEPPOL_CORE +
                                                                                          "OPENPEPPOLCORE-UBL-T10.sch");

  private static final IReadableResource CREDIT_NOTE_RULES = new ClassPathResource (CREDIT_NOTE +
                                                                                    BII_RULES +
                                                                                    "BIIRULES-UBL-T14.sch");
  private static final IReadableResource CREDIT_NOTE_OPENPEPPOL = new ClassPathResource (CREDIT_NOTE +
                                                                                         OPENPEPPOL +
                                                                                         "OPENPEPPOL-UBL-T14.sch");
  private static final IReadableResource CREDIT_NOTE_OPENPEPPOL_CORE = new ClassPathResource (CREDIT_NOTE +
                                                                                              OPENPEPPOL_CORE +
                                                                                              "OPENPEPPOLCORE-UBL-T14.sch");

  private static final IReadableResource MLR_RULES = new ClassPathResource (MLR + BII_RULES + "BIIRULES-UBL-T71.sch");
  private static final IReadableResource MLR_OPENPEPPOL = new ClassPathResource (MLR +
                                                                                 OPENPEPPOL +
                                                                                 "OPENPEPPOL-UBL-T71.sch");
  private static final IReadableResource MLR_OPENPEPPOL_CORE = new ClassPathResource (MLR +
                                                                                      OPENPEPPOL_CORE +
                                                                                      "OPENPEPPOLCORE-UBL-T71.sch");

  private PeppolValidation330 ()
  {}

  public static void init (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T19_V2,
                                                                           "OpenPEPPOL Catalogue",
                                                                           CPeppolValidationArtefact.VK_CATALOGUE_01_T19,
                                                                           CATALOGUE_RULES,
                                                                           CATALOGUE_OPENPEPPOL,
                                                                           CATALOGUE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T58_V2,
                                                                           "OpenPEPPOL Catalogue Response",
                                                                           CPeppolValidationArtefact.VK_CATALOGUE_01_T58,
                                                                           CATALOGUE_RESPONSE_RULES,
                                                                           CATALOGUE_RESPONSE_OPENPEPPOL,
                                                                           CATALOGUE_RESPONSE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T01_V2,
                                                                           "OpenPEPPOL Order",
                                                                           CPeppolValidationArtefact.VK_ORDER_03_T01,
                                                                           ORDER_RULES,
                                                                           ORDER_OPENPEPPOL,
                                                                           ORDER_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T76_V2,
                                                                           "OpenPEPPOL Order Response",
                                                                           CPeppolValidationArtefact.VK_ORDERING_28_T76,
                                                                           ORDER_RESPONSE_RULES,
                                                                           ORDER_RESPONSE_OPENPEPPOL,
                                                                           ORDER_RESPONSE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T16_V2,
                                                                           "OpenPEPPOL Despatch Advice",
                                                                           CPeppolValidationArtefact.VK_DESPATCH_ADVICE_30_T16,
                                                                           DESPATCH_ADVICE_RULES,
                                                                           DESPATCH_ADVICE_OPENPEPPOL,
                                                                           DESPATCH_ADVICE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T10_V2,
                                                                           "OpenPEPPOL Invoice",
                                                                           CPeppolValidationArtefact.VK_INVOICE_04_T10,
                                                                           INVOICE_RULES,
                                                                           INVOICE_OPENPEPPOL,
                                                                           INVOICE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T14_V2,
                                                                           "OpenPEPPOL Credit Note",
                                                                           CPeppolValidationArtefact.VK_BILLING_05_T14,
                                                                           CREDIT_NOTE_RULES,
                                                                           CREDIT_NOTE_OPENPEPPOL,
                                                                           CREDIT_NOTE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T71_V2,
                                                                           "OpenPEPPOL MLR",
                                                                           CPeppolValidationArtefact.VK_MLR_36_T71,
                                                                           MLR_RULES,
                                                                           MLR_OPENPEPPOL,
                                                                           MLR_OPENPEPPOL_CORE));
  }
}
