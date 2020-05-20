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
 * OpenPEPPOL validation artefacts release 3.7.0. Fall 2018 release. Valid per
 * November 15th, 2018
 *
 * @author Philip Helger
 */
@Immutable
@Deprecated
public final class PeppolValidation370
{
  // Standard resources
  public static final Version PEPPOL_VALIDATION_ARTEFACT_VERSION = new Version (3, 7, 0);
  public static final String VERSION_STR = PEPPOL_VALIDATION_ARTEFACT_VERSION.getAsString (true);
  public static final LocalDate VALID_PER = PDTFactory.createLocalDate (2018, Month.NOVEMBER, 15);

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
  public static final VESID VID_OPENPEPPOL_T111_V1 = new VESID ("eu.peppol.bis2", "t111", VERSION_STR);
  public static final VESID VID_OPENPEPPOL_BIS3_UBL_INVOICE = new VESID ("eu.peppol.bis3.ubl", "invoice", "1");
  public static final VESID VID_OPENPEPPOL_BIS3_UBL_CREDIT_NOTE = new VESID ("eu.peppol.bis3.ubl", "creditnote", "1");

  private static final String PREFIX = "openpeppol/" + VERSION_STR + "/";
  private static final String PREFIX_XSLT = PREFIX + "XSLT/";
  private static final String PREFIX_XSLTCORE = PREFIX + "XSLTCore/";

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return PeppolValidation370.class.getClassLoader ();
  }

  public static final IReadableResource ORDER_RULES = new ClassPathResource (PREFIX_XSLT + "BIIRULES-UBL-T01.xsl",
                                                                             _getCL ());
  public static final IReadableResource ORDER_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                  "OPENPEPPOL-UBL-T01.xsl",
                                                                                  _getCL ());
  public static final IReadableResource ORDER_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                       "OPENPEPPOLCORE-UBL-T01.xsl",
                                                                                       _getCL ());

  public static final IReadableResource INVOICE_RULES = new ClassPathResource (PREFIX_XSLT + "BIIRULES-UBL-T10.xsl",
                                                                               _getCL ());
  public static final IReadableResource INVOICE_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                    "OPENPEPPOL-UBL-T10.xsl",
                                                                                    _getCL ());
  public static final IReadableResource INVOICE_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                         "OPENPEPPOLCORE-UBL-T10.xsl",
                                                                                         _getCL ());

  public static final IReadableResource CREDIT_NOTE_RULES = new ClassPathResource (PREFIX_XSLT + "BIIRULES-UBL-T14.xsl",
                                                                                   _getCL ());
  public static final IReadableResource CREDIT_NOTE_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                        "OPENPEPPOL-UBL-T14.xsl",
                                                                                        _getCL ());
  public static final IReadableResource CREDIT_NOTE_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                             "OPENPEPPOLCORE-UBL-T14.xsl",
                                                                                             _getCL ());

  public static final IReadableResource DESPATCH_ADVICE_RULES = new ClassPathResource (PREFIX_XSLT +
                                                                                       "BIIRULES-UBL-T16.xsl",
                                                                                       _getCL ());
  public static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                            "OPENPEPPOL-UBL-T16.xsl",
                                                                                            _getCL ());
  public static final IReadableResource DESPATCH_ADVICE_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                                 "OPENPEPPOLCORE-UBL-T16.xsl",
                                                                                                 _getCL ());

  public static final IReadableResource CATALOGUE_RULES = new ClassPathResource (PREFIX_XSLT + "BIIRULES-UBL-T19.xsl",
                                                                                 _getCL ());
  public static final IReadableResource CATALOGUE_OPENPEPPOL_XSLT = new ClassPathResource (PREFIX_XSLT +
                                                                                           "OPENPEPPOL-UBL-T19.xsl",
                                                                                           _getCL ());
  public static final IReadableResource CATALOGUE_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                           "OPENPEPPOLCORE-UBL-T19.xsl",
                                                                                           _getCL ());

  public static final IReadableResource CATALOGUE_RESPONSE_RULES = new ClassPathResource (PREFIX_XSLT +
                                                                                          "BIIRULES-UBL-T58.xsl",
                                                                                          _getCL ());
  public static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                               "OPENPEPPOL-UBL-T58.xsl",
                                                                                               _getCL ());
  public static final IReadableResource CATALOGUE_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                                    "OPENPEPPOLCORE-UBL-T58.xsl",
                                                                                                    _getCL ());

  public static final IReadableResource MLR_RULES = new ClassPathResource (PREFIX_XSLT + "BIIRULES-UBL-T71.xsl",
                                                                           _getCL ());
  public static final IReadableResource MLR_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT + "OPENPEPPOL-UBL-T71.xsl",
                                                                                _getCL ());
  public static final IReadableResource MLR_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                     "OPENPEPPOLCORE-UBL-T71.xsl",
                                                                                     _getCL ());

  public static final IReadableResource ORDER_RESPONSE_RULES = new ClassPathResource (PREFIX_XSLT +
                                                                                      "BIIRULES-UBL-T76.xsl",
                                                                                      _getCL ());
  public static final IReadableResource ORDER_RESPONSE_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                           "OPENPEPPOL-UBL-T76.xsl",
                                                                                           _getCL ());
  public static final IReadableResource ORDER_RESPONSE_OPENPEPPOL_CORE = new ClassPathResource (PREFIX_XSLTCORE +
                                                                                                "OPENPEPPOLCORE-UBL-T76.xsl",
                                                                                                _getCL ());

  public static final IReadableResource PUNCH_OUT_RULES = new ClassPathResource (PREFIX_XSLT + "BIIRULES-UBL-T77.xsl",
                                                                                 _getCL ());
  public static final IReadableResource PUNCH_OUT_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                      "OPENPEPPOL-UBL-T77.xsl",
                                                                                      _getCL ());

  public static final IReadableResource ORDER_AGREEMENT_RULES = new ClassPathResource (PREFIX_XSLT +
                                                                                       "BIIRULES-UBL-T110.xsl",
                                                                                       _getCL ());
  public static final IReadableResource ORDER_AGREEMENT_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                            "OPENPEPPOL-UBL-T110.xsl",
                                                                                            _getCL ());

  public static final IReadableResource INVOICE_MESSAGE_RESPONSE_RULES = new ClassPathResource (PREFIX_XSLT +
                                                                                                "BIIRULES-UBL-T111.xsl",
                                                                                                _getCL ());
  public static final IReadableResource INVOICE_MESSAGE_RESPONSE_OPENPEPPOL = new ClassPathResource (PREFIX_XSLT +
                                                                                                     "OPENPEPPOL-UBL-T111.xsl",
                                                                                                     _getCL ());

  public static final IReadableResource BIS3_BILLING_CEN = new ClassPathResource ("/openpeppol/billingbis3/xslt/CEN-EN16931-UBL.xslt",
                                                                                  _getCL ());
  public static final IReadableResource BIS3_BILLING_PEPPOL = new ClassPathResource ("/openpeppol/billingbis3/xslt/PEPPOL-EN16931-UBL.xslt",
                                                                                     _getCL ());

  private PeppolValidation370 ()
  {}

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
    final String sAkaBIS2 = " (aka BIS 2)";
    final boolean bDeprecated = true;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T01_V2,
                                                                           "OpenPEPPOL Order" + sVersion + sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createXSLT (ORDER_RULES),
                                                                           _createXSLT (ORDER_OPENPEPPOL),
                                                                           _createXSLT (ORDER_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T10_V2,
                                                                           "OpenPEPPOL Invoice" + sVersion + sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (INVOICE_RULES),
                                                                           _createXSLT (INVOICE_OPENPEPPOL),
                                                                           _createXSLT (INVOICE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T14_V2,
                                                                           "OpenPEPPOL Credit Note" +
                                                                                                  sVersion +
                                                                                                  sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (CREDIT_NOTE_RULES),
                                                                           _createXSLT (CREDIT_NOTE_OPENPEPPOL),
                                                                           _createXSLT (CREDIT_NOTE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T16_V2,
                                                                           "OpenPEPPOL Despatch Advice" +
                                                                                                  sVersion +
                                                                                                  sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.DESPATCH_ADVICE),
                                                                           _createXSLT (DESPATCH_ADVICE_RULES),
                                                                           _createXSLT (DESPATCH_ADVICE_OPENPEPPOL),
                                                                           _createXSLT (DESPATCH_ADVICE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T19_V2,
                                                                           "OpenPEPPOL Catalogue" + sVersion + sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (CATALOGUE_RULES),
                                                                           _createXSLT (CATALOGUE_OPENPEPPOL_XSLT),
                                                                           _createXSLT (CATALOGUE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T58_V2,
                                                                           "OpenPEPPOL Catalogue Response" +
                                                                                                  sVersion +
                                                                                                  sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createXSLT (CATALOGUE_RESPONSE_RULES),
                                                                           _createXSLT (CATALOGUE_RESPONSE_OPENPEPPOL),
                                                                           _createXSLT (CATALOGUE_RESPONSE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T71_V2,
                                                                           "OpenPEPPOL MLR" + sVersion + sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createXSLT (MLR_RULES),
                                                                           _createXSLT (MLR_OPENPEPPOL),
                                                                           _createXSLT (MLR_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T76_V2,
                                                                           "OpenPEPPOL Order Response" +
                                                                                                  sVersion +
                                                                                                  sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (ORDER_RESPONSE_RULES),
                                                                           _createXSLT (ORDER_RESPONSE_OPENPEPPOL),
                                                                           _createXSLT (ORDER_RESPONSE_OPENPEPPOL_CORE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T77_V1,
                                                                           "OpenPEPPOL Punch Out" + sVersion + sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (PUNCH_OUT_RULES),
                                                                           _createXSLT (PUNCH_OUT_OPENPEPPOL)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T110_V1,
                                                                           "OpenPEPPOL Order Agreement" +
                                                                                                   sVersion +
                                                                                                   sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (ORDER_AGREEMENT_RULES),
                                                                           _createXSLT (ORDER_AGREEMENT_OPENPEPPOL)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T111_V1,
                                                                           "OpenPEPPOL Invoice Message Response" +
                                                                                                   sVersion +
                                                                                                   sAkaBIS2,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createXSLT (INVOICE_MESSAGE_RESPONSE_RULES),
                                                                           _createXSLT (INVOICE_MESSAGE_RESPONSE_OPENPEPPOL)));

    // Billing BIS 3
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_UBL_INVOICE,
                                                                           "OpenPEPPOL Invoice BIS3 (UBL)",
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (BIS3_BILLING_CEN),
                                                                           _createXSLT (BIS3_BILLING_PEPPOL)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_UBL_CREDIT_NOTE,
                                                                           "OpenPEPPOL CreditNote BIS3 (UBL)",
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (BIS3_BILLING_CEN),
                                                                           _createXSLT (BIS3_BILLING_PEPPOL)));
  }
}
