/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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

import java.time.LocalDate;
import java.time.Month;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.version.Version;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * OpenPEPPOL validation artefacts release 3.5.0. Autumn 2017 release. Valid per
 * November 15th, 2017
 *
 * @author Philip Helger
 */
@Immutable
@Deprecated
public final class PeppolValidation350
{
  // Standard resources
  public static final Version PEPPOL_VALIDATION_ARTEFACT_VERSION = new Version (3, 5, 0);
  public static final String VERSION_STR = PEPPOL_VALIDATION_ARTEFACT_VERSION.getAsString (true);
  public static final LocalDate VALID_PER = PDTFactory.createLocalDate (2017, Month.NOVEMBER, 15);

  // Standard
  public static final VESID VID_OPENPEPPOL_T01_V2 = new VESID ("eu.peppol.bis2", "t01", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T10_V2 = new VESID ("eu.peppol.bis2", "t10", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T14_V2 = new VESID ("eu.peppol.bis2", "t14", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T16_V2 = new VESID ("eu.peppol.bis2", "t16", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T19_V2 = new VESID ("eu.peppol.bis2", "t19", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T58_V2 = new VESID ("eu.peppol.bis2", "t58", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T71_V2 = new VESID ("eu.peppol.bis2", "t71", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T76_V2 = new VESID ("eu.peppol.bis2", "t76", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T77_V1 = new VESID ("eu.peppol.bis2", "t77", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_T110_V1 = new VESID ("eu.peppol.bis2", "t110", VERSION_STR);

  private static final String PREFIX = "openpeppol/" + VERSION_STR + "/SCH/";

  private static final String ORDER = PREFIX + "peppolbis-trdm001-2.0-order/";
  private static final String INVOICE = PREFIX + "peppolbis-trdm010-2.0-invoice/";
  private static final String CREDIT_NOTE = PREFIX + "peppolbis-trdm014-2.0-creditnote/";
  private static final String DESPATCH_ADVICE = PREFIX + "peppolbis-trdm016-2.0-despatch-advice/";
  private static final String CATALOGUE = PREFIX + "peppolbis-trdm019-2.0-catalogue/";
  private static final String CATALOGUE_RESPONSE = PREFIX + "peppolbis-trdm058-2.0-catalogue-response/";
  private static final String MLR = PREFIX + "peppolbis-trdm071-2.0-message-level-response/";
  private static final String ORDER_RESPONSE = PREFIX + "peppolbis-trdm076-2.0-order-response/";
  private static final String PUNCH_OUT = PREFIX + "peppolbis-trdm077-1.0-punch-out/";
  private static final String ORDER_AGREEMENT = PREFIX + "peppolbis-trdm110-1.0-order-agreement/";

  private static final String PATH_SCHEMATRON = "Schematron/";
  private static final String BII_RULES = PATH_SCHEMATRON + "BII RULES/";
  private static final String OPENPEPPOL = PATH_SCHEMATRON + "OPENPEPPOL/";
  private static final String OPENPEPPOL_CORE = PATH_SCHEMATRON + "OPENPEPPOL CORE/";

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return PeppolValidation350.class.getClassLoader ();
  }

  private static final IReadableResource ORDER_RULES = new ClassPathResource (ORDER +
                                                                              BII_RULES +
                                                                              "BIIRULES-UBL-T01.sch",
                                                                              _getCL ());
  private static final IReadableResource ORDER_OPENPEPPOL = new ClassPathResource (ORDER +
                                                                                   OPENPEPPOL +
                                                                                   "OPENPEPPOL-UBL-T01.sch",
                                                                                   _getCL ());
  private static final IReadableResource ORDER_OPENPEPPOL_CORE = new ClassPathResource (ORDER +
                                                                                        OPENPEPPOL_CORE +
                                                                                        "OPENPEPPOLCORE-UBL-T01.sch",
                                                                                        _getCL ());

  private static final IReadableResource INVOICE_RULES = new ClassPathResource (INVOICE +
                                                                                BII_RULES +
                                                                                "BIIRULES-UBL-T10.sch",
                                                                                _getCL ());
  private static final IReadableResource INVOICE_OPENPEPPOL = new ClassPathResource (INVOICE +
                                                                                     OPENPEPPOL +
                                                                                     "OPENPEPPOL-UBL-T10.sch",
                                                                                     _getCL ());
  private static final IReadableResource INVOICE_OPENPEPPOL_CORE = new ClassPathResource (INVOICE +
                                                                                          OPENPEPPOL_CORE +
                                                                                          "OPENPEPPOLCORE-UBL-T10.sch",
                                                                                          _getCL ());

  private static final IReadableResource CREDIT_NOTE_RULES = new ClassPathResource (CREDIT_NOTE +
                                                                                    BII_RULES +
                                                                                    "BIIRULES-UBL-T14.sch",
                                                                                    _getCL ());
  private static final IReadableResource CREDIT_NOTE_OPENPEPPOL = new ClassPathResource (CREDIT_NOTE +
                                                                                         OPENPEPPOL +
                                                                                         "OPENPEPPOL-UBL-T14.sch",
                                                                                         _getCL ());
  private static final IReadableResource CREDIT_NOTE_OPENPEPPOL_CORE = new ClassPathResource (CREDIT_NOTE +
                                                                                              OPENPEPPOL_CORE +
                                                                                              "OPENPEPPOLCORE-UBL-T14.sch",
                                                                                              _getCL ());

  private static final IReadableResource DESPATCH_ADVICE_RULES = new ClassPathResource (DESPATCH_ADVICE +
                                                                                        BII_RULES +
                                                                                        "BIIRULES-UBL-T16.sch",
                                                                                        _getCL ());
  private static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL = new ClassPathResource (DESPATCH_ADVICE +
                                                                                             OPENPEPPOL +
                                                                                             "OPENPEPPOL-UBL-T16.sch",
                                                                                             _getCL ());
  private static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL_CORE = new ClassPathResource (DESPATCH_ADVICE +
                                                                                                  OPENPEPPOL_CORE +
                                                                                                  "OPENPEPPOLCORE-UBL-T16.sch",
                                                                                                  _getCL ());

  private static final IReadableResource CATALOGUE_RULES = new ClassPathResource (CATALOGUE +
                                                                                  BII_RULES +
                                                                                  "BIIRULES-UBL-T19.sch",
                                                                                  _getCL ());
  private static final IReadableResource CATALOGUE_OPENPEPPOL = new ClassPathResource (CATALOGUE +
                                                                                       OPENPEPPOL +
                                                                                       "OPENPEPPOL-UBL-T19.sch",
                                                                                       _getCL ());
  private static final IReadableResource CATALOGUE_OPENPEPPOL_CORE = new ClassPathResource (CATALOGUE +
                                                                                            OPENPEPPOL_CORE +
                                                                                            "OPENPEPPOLCORE-UBL-T19.sch",
                                                                                            _getCL ());

  private static final IReadableResource CATALOGUE_RESPONSE_RULES = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                           BII_RULES +
                                                                                           "BIIRULES-UBL-T58.sch",
                                                                                           _getCL ());
  private static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                                OPENPEPPOL +
                                                                                                "OPENPEPPOL-UBL-T58.sch",
                                                                                                _getCL ());
  private static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (CATALOGUE_RESPONSE +
                                                                                                     OPENPEPPOL_CORE +
                                                                                                     "OPENPEPPOLCORE-UBL-T58.sch",
                                                                                                     _getCL ());

  private static final IReadableResource MLR_RULES = new ClassPathResource (MLR + BII_RULES + "BIIRULES-UBL-T71.sch",
                                                                            _getCL ());
  private static final IReadableResource MLR_OPENPEPPOL = new ClassPathResource (MLR +
                                                                                 OPENPEPPOL +
                                                                                 "OPENPEPPOL-UBL-T71.sch",
                                                                                 _getCL ());
  private static final IReadableResource MLR_OPENPEPPOL_CORE = new ClassPathResource (MLR +
                                                                                      OPENPEPPOL_CORE +
                                                                                      "OPENPEPPOLCORE-UBL-T71.sch",
                                                                                      _getCL ());

  private static final IReadableResource ORDER_RESPONSE_RULES = new ClassPathResource (ORDER_RESPONSE +
                                                                                       BII_RULES +
                                                                                       "BIIRULES-UBL-T76.sch",
                                                                                       _getCL ());
  private static final IReadableResource ORDER_RESPONSE_OPENPEPPOL = new ClassPathResource (ORDER_RESPONSE +
                                                                                            OPENPEPPOL +
                                                                                            "OPENPEPPOL-UBL-T76.sch",
                                                                                            _getCL ());
  private static final IReadableResource ORDER_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (ORDER_RESPONSE +
                                                                                                 OPENPEPPOL_CORE +
                                                                                                 "OPENPEPPOLCORE-UBL-T76.sch",
                                                                                                 _getCL ());

  private static final IReadableResource PUNCH_OUT_RULES = new ClassPathResource (PUNCH_OUT +
                                                                                  BII_RULES +
                                                                                  "BIIRULES-UBL-T77.sch",
                                                                                  _getCL ());
  private static final IReadableResource PUNCH_OUT_OPENPEPPOL = new ClassPathResource (PUNCH_OUT +
                                                                                       OPENPEPPOL +
                                                                                       "OPENPEPPOL-UBL-T77.sch",
                                                                                       _getCL ());

  private static final IReadableResource ORDER_AGREEMENT_RULES = new ClassPathResource (ORDER_AGREEMENT +
                                                                                        BII_RULES +
                                                                                        "BIIRULES-UBL-T110.sch",
                                                                                        _getCL ());
  private static final IReadableResource ORDER_AGREEMENT_OPENPEPPOL = new ClassPathResource (ORDER_AGREEMENT +
                                                                                             OPENPEPPOL +
                                                                                             "OPENPEPPOL-UBL-T110.sch",
                                                                                             _getCL ());

  private PeppolValidation350 ()
  {}

  @Nonnull
  private static IValidationExecutor _createPure (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_PURE, aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  @Nonnull
  private static IValidationExecutor _createSCH (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_SCH, aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  public static void init (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final String sVersion = " (" + VERSION_STR + ")";
    final boolean bIsDeprecated = PDTFactory.getCurrentLocalDate ().compareTo (PeppolValidation360.VALID_PER) >= 0;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T01_V2,
                                                                           "OpenPEPPOL Order" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createPure (ORDER_RULES),
                                                                           _createPure (ORDER_OPENPEPPOL),
                                                                           _createPure (ORDER_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T10_V2,
                                                                           "OpenPEPPOL Invoice" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createPure (INVOICE_RULES),
                                                                           _createPure (INVOICE_OPENPEPPOL),
                                                                           _createPure (INVOICE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T14_V2,
                                                                           "OpenPEPPOL Credit Note" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createPure (CREDIT_NOTE_RULES),
                                                                           _createPure (CREDIT_NOTE_OPENPEPPOL),
                                                                           _createPure (CREDIT_NOTE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T16_V2,
                                                                           "OpenPEPPOL Despatch Advice" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.DESPATCH_ADVICE),
                                                                           _createPure (DESPATCH_ADVICE_RULES),
                                                                           _createPure (DESPATCH_ADVICE_OPENPEPPOL),
                                                                           _createPure (DESPATCH_ADVICE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T19_V2,
                                                                           "OpenPEPPOL Catalogue" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createPure (CATALOGUE_RULES),
                                                                           _createSCH (CATALOGUE_OPENPEPPOL),
                                                                           _createPure (CATALOGUE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T58_V2,
                                                                           "OpenPEPPOL Catalogue Response" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createPure (CATALOGUE_RESPONSE_RULES),
                                                                           _createPure (CATALOGUE_RESPONSE_OPENPEPPOL),
                                                                           _createPure (CATALOGUE_RESPONSE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T71_V2,
                                                                           "OpenPEPPOL MLR" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createPure (MLR_RULES),
                                                                           _createPure (MLR_OPENPEPPOL),
                                                                           _createPure (MLR_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T76_V2,
                                                                           "OpenPEPPOL Order Response" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createPure (ORDER_RESPONSE_RULES),
                                                                           _createPure (ORDER_RESPONSE_OPENPEPPOL),
                                                                           _createPure (ORDER_RESPONSE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T77_V1,
                                                                           "OpenPEPPOL Punch Out" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createPure (PUNCH_OUT_RULES),
                                                                           _createPure (PUNCH_OUT_OPENPEPPOL)));
    // Must use XSLT based conversion because of custom XSLT function!
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T110_V1,
                                                                           "OpenPEPPOL Order Agreement" + sVersion,
                                                                           bIsDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createSCH (ORDER_AGREEMENT_RULES),
                                                                           _createSCH (ORDER_AGREEMENT_OPENPEPPOL)));
  }
}
