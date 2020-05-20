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
 * OpenPEPPOL validation artefacts release 3.6.0. Spring 2018 release. Valid per
 * May 14th, 2018
 *
 * @author Philip Helger
 */
@Immutable
@Deprecated
public final class PeppolValidation360
{
  // Standard resources
  public static final Version PEPPOL_VALIDATION_ARTEFACT_VERSION = new Version (3, 6, 0);
  public static final String VERSION_STR = PEPPOL_VALIDATION_ARTEFACT_VERSION.getAsString (true);
  public static final LocalDate VALID_PER = PDTFactory.createLocalDate (2018, Month.MAY, 14);

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

  private static final String PREFIX = "openpeppol/" + VERSION_STR + "/";
  private static final String PREFIX_SCH = PREFIX + "SCH/";
  private static final String PREFIX_XSLT = PREFIX + "XSLT/";

  private static final String SCH_ORDER = PREFIX_SCH + "peppolbis-trdm001-2.0-order/";
  private static final String SCH_INVOICE = PREFIX_SCH + "peppolbis-trdm010-2.0-invoice/";
  private static final String SCH_CREDIT_NOTE = PREFIX_SCH + "peppolbis-trdm014-2.0-creditnote/";
  private static final String SCH_DESPATCH_ADVICE = PREFIX_SCH + "peppolbis-trdm016-2.0-despatch-advice/";
  private static final String SCH_CATALOGUE = PREFIX_SCH + "peppolbis-trdm019-2.0-catalogue/";
  private static final String SCH_CATALOGUE_RESPONSE = PREFIX_SCH + "peppolbis-trdm058-2.0-catalogue-response/";
  private static final String SCH_MLR = PREFIX_SCH + "peppolbis-trdm071-2.0-message-level-response/";
  private static final String SCH_ORDER_RESPONSE = PREFIX_SCH + "peppolbis-trdm076-2.0-order-response/";
  private static final String SCH_PUNCH_OUT = PREFIX_SCH + "peppolbis-trdm077-1.0-punch-out/";
  @SuppressWarnings ("unused")
  private static final String SCH_ORDER_AGREEMENT = PREFIX_SCH + "peppolbis-trdm110-1.0-order-agreement/";

  private static final String SCH_PATH_SCHEMATRON = "Schematron/";
  private static final String SCH_BII_RULES = SCH_PATH_SCHEMATRON + "BII RULES/";
  private static final String SCH_OPENPEPPOL = SCH_PATH_SCHEMATRON + "OPENPEPPOL/";
  private static final String SCH_OPENPEPPOL_CORE = SCH_PATH_SCHEMATRON + "OPENPEPPOL CORE/";

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return PeppolValidation360.class.getClassLoader ();
  }

  private static final IReadableResource ORDER_RULES = new ClassPathResource (SCH_ORDER +
                                                                              SCH_BII_RULES +
                                                                              "BIIRULES-UBL-T01.sch",
                                                                              _getCL ());
  private static final IReadableResource ORDER_OPENPEPPOL = new ClassPathResource (SCH_ORDER +
                                                                                   SCH_OPENPEPPOL +
                                                                                   "OPENPEPPOL-UBL-T01.sch",
                                                                                   _getCL ());
  private static final IReadableResource ORDER_OPENPEPPOL_CORE = new ClassPathResource (SCH_ORDER +
                                                                                        SCH_OPENPEPPOL_CORE +
                                                                                        "OPENPEPPOLCORE-UBL-T01.sch",
                                                                                        _getCL ());

  private static final IReadableResource INVOICE_RULES = new ClassPathResource (SCH_INVOICE +
                                                                                SCH_BII_RULES +
                                                                                "BIIRULES-UBL-T10.sch",
                                                                                _getCL ());
  private static final IReadableResource INVOICE_OPENPEPPOL = new ClassPathResource (SCH_INVOICE +
                                                                                     SCH_OPENPEPPOL +
                                                                                     "OPENPEPPOL-UBL-T10.sch",
                                                                                     _getCL ());
  private static final IReadableResource INVOICE_OPENPEPPOL_CORE = new ClassPathResource (SCH_INVOICE +
                                                                                          SCH_OPENPEPPOL_CORE +
                                                                                          "OPENPEPPOLCORE-UBL-T10.sch",
                                                                                          _getCL ());

  private static final IReadableResource CREDIT_NOTE_RULES = new ClassPathResource (SCH_CREDIT_NOTE +
                                                                                    SCH_BII_RULES +
                                                                                    "BIIRULES-UBL-T14.sch",
                                                                                    _getCL ());
  private static final IReadableResource CREDIT_NOTE_OPENPEPPOL = new ClassPathResource (SCH_CREDIT_NOTE +
                                                                                         SCH_OPENPEPPOL +
                                                                                         "OPENPEPPOL-UBL-T14.sch",
                                                                                         _getCL ());
  private static final IReadableResource CREDIT_NOTE_OPENPEPPOL_CORE = new ClassPathResource (SCH_CREDIT_NOTE +
                                                                                              SCH_OPENPEPPOL_CORE +
                                                                                              "OPENPEPPOLCORE-UBL-T14.sch",
                                                                                              _getCL ());

  private static final IReadableResource DESPATCH_ADVICE_RULES = new ClassPathResource (SCH_DESPATCH_ADVICE +
                                                                                        SCH_BII_RULES +
                                                                                        "BIIRULES-UBL-T16.sch",
                                                                                        _getCL ());
  private static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL = new ClassPathResource (SCH_DESPATCH_ADVICE +
                                                                                             SCH_OPENPEPPOL +
                                                                                             "OPENPEPPOL-UBL-T16.sch",
                                                                                             _getCL ());
  private static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL_CORE = new ClassPathResource (SCH_DESPATCH_ADVICE +
                                                                                                  SCH_OPENPEPPOL_CORE +
                                                                                                  "OPENPEPPOLCORE-UBL-T16.sch",
                                                                                                  _getCL ());

  private static final IReadableResource CATALOGUE_RULES = new ClassPathResource (SCH_CATALOGUE +
                                                                                  SCH_BII_RULES +
                                                                                  "BIIRULES-UBL-T19.sch",
                                                                                  _getCL ());
  private static final IReadableResource CATALOGUE_OPENPEPPOL_XSLT = new ClassPathResource (PREFIX_XSLT +
                                                                                            "OPENPEPPOL-UBL-T19.xsl",
                                                                                            _getCL ());
  private static final IReadableResource CATALOGUE_OPENPEPPOL_CORE = new ClassPathResource (SCH_CATALOGUE +
                                                                                            SCH_OPENPEPPOL_CORE +
                                                                                            "OPENPEPPOLCORE-UBL-T19.sch",
                                                                                            _getCL ());

  private static final IReadableResource CATALOGUE_RESPONSE_RULES = new ClassPathResource (SCH_CATALOGUE_RESPONSE +
                                                                                           SCH_BII_RULES +
                                                                                           "BIIRULES-UBL-T58.sch",
                                                                                           _getCL ());
  private static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL = new ClassPathResource (SCH_CATALOGUE_RESPONSE +
                                                                                                SCH_OPENPEPPOL +
                                                                                                "OPENPEPPOL-UBL-T58.sch",
                                                                                                _getCL ());
  private static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (SCH_CATALOGUE_RESPONSE +
                                                                                                     SCH_OPENPEPPOL_CORE +
                                                                                                     "OPENPEPPOLCORE-UBL-T58.sch",
                                                                                                     _getCL ());

  private static final IReadableResource MLR_RULES = new ClassPathResource (SCH_MLR +
                                                                            SCH_BII_RULES +
                                                                            "BIIRULES-UBL-T71.sch",
                                                                            _getCL ());
  private static final IReadableResource MLR_OPENPEPPOL = new ClassPathResource (SCH_MLR +
                                                                                 SCH_OPENPEPPOL +
                                                                                 "OPENPEPPOL-UBL-T71.sch",
                                                                                 _getCL ());
  private static final IReadableResource MLR_OPENPEPPOL_CORE = new ClassPathResource (SCH_MLR +
                                                                                      SCH_OPENPEPPOL_CORE +
                                                                                      "OPENPEPPOLCORE-UBL-T71.sch",
                                                                                      _getCL ());

  private static final IReadableResource ORDER_RESPONSE_RULES = new ClassPathResource (SCH_ORDER_RESPONSE +
                                                                                       SCH_BII_RULES +
                                                                                       "BIIRULES-UBL-T76.sch",
                                                                                       _getCL ());
  private static final IReadableResource ORDER_RESPONSE_OPENPEPPOL = new ClassPathResource (SCH_ORDER_RESPONSE +
                                                                                            SCH_OPENPEPPOL +
                                                                                            "OPENPEPPOL-UBL-T76.sch",
                                                                                            _getCL ());
  private static final IReadableResource ORDER_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (SCH_ORDER_RESPONSE +
                                                                                                 SCH_OPENPEPPOL_CORE +
                                                                                                 "OPENPEPPOLCORE-UBL-T76.sch",
                                                                                                 _getCL ());

  private static final IReadableResource PUNCH_OUT_RULES = new ClassPathResource (SCH_PUNCH_OUT +
                                                                                  SCH_BII_RULES +
                                                                                  "BIIRULES-UBL-T77.sch",
                                                                                  _getCL ());
  private static final IReadableResource PUNCH_OUT_OPENPEPPOL = new ClassPathResource (SCH_PUNCH_OUT +
                                                                                       SCH_OPENPEPPOL +
                                                                                       "OPENPEPPOL-UBL-T77.sch",
                                                                                       _getCL ());

  private static final IReadableResource ORDER_AGREEMENT_RULES_XSLT = new ClassPathResource (PREFIX_XSLT +
                                                                                             "BIIRULES-UBL-T110.xsl",
                                                                                             _getCL ());
  private static final IReadableResource ORDER_AGREEMENT_OPENPEPPOL_XSLT = new ClassPathResource (PREFIX_XSLT +
                                                                                                  "OPENPEPPOL-UBL-T110.xsl",
                                                                                                  _getCL ());

  private PeppolValidation360 ()
  {}

  @Nonnull
  private static IValidationExecutor _createPure (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_PURE, aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  public static void init (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final String sVersion = " (" + VERSION_STR + ")";
    final boolean bDeprecated = true;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T01_V2,
                                                                           "OpenPEPPOL Order" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createPure (ORDER_RULES),
                                                                           _createPure (ORDER_OPENPEPPOL),
                                                                           _createPure (ORDER_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T10_V2,
                                                                           "OpenPEPPOL Invoice" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createPure (INVOICE_RULES),
                                                                           _createPure (INVOICE_OPENPEPPOL),
                                                                           _createPure (INVOICE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T14_V2,
                                                                           "OpenPEPPOL Credit Note" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createPure (CREDIT_NOTE_RULES),
                                                                           _createPure (CREDIT_NOTE_OPENPEPPOL),
                                                                           _createPure (CREDIT_NOTE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T16_V2,
                                                                           "OpenPEPPOL Despatch Advice" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.DESPATCH_ADVICE),
                                                                           _createPure (DESPATCH_ADVICE_RULES),
                                                                           _createPure (DESPATCH_ADVICE_OPENPEPPOL),
                                                                           _createPure (DESPATCH_ADVICE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T19_V2,
                                                                           "OpenPEPPOL Catalogue" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createPure (CATALOGUE_RULES),
                                                                           _createXSLT (CATALOGUE_OPENPEPPOL_XSLT),
                                                                           _createPure (CATALOGUE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T58_V2,
                                                                           "OpenPEPPOL Catalogue Response" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createPure (CATALOGUE_RESPONSE_RULES),
                                                                           _createPure (CATALOGUE_RESPONSE_OPENPEPPOL),
                                                                           _createPure (CATALOGUE_RESPONSE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T71_V2,
                                                                           "OpenPEPPOL MLR" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createPure (MLR_RULES),
                                                                           _createPure (MLR_OPENPEPPOL),
                                                                           _createPure (MLR_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T76_V2,
                                                                           "OpenPEPPOL Order Response" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createPure (ORDER_RESPONSE_RULES),
                                                                           _createPure (ORDER_RESPONSE_OPENPEPPOL),
                                                                           _createPure (ORDER_RESPONSE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T77_V1,
                                                                           "OpenPEPPOL Punch Out" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createPure (PUNCH_OUT_RULES),
                                                                           _createPure (PUNCH_OUT_OPENPEPPOL)));
    // Must use XSLT based conversion because of custom XSLT function!
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T110_V1,
                                                                           "OpenPEPPOL Order Agreement" + sVersion,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (ORDER_AGREEMENT_RULES_XSLT),
                                                                           _createXSLT (ORDER_AGREEMENT_OPENPEPPOL_XSLT)));
  }
}
