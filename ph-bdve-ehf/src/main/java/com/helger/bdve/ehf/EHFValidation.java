/**
 * Copyright (C) 2018-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.ehf;

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
import com.helger.bdve.peppol.PeppolValidation370;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * Generic EHF validation configuration
 *
 * @author Philip Helger
 */
@Immutable
@SuppressWarnings ("deprecation")
public final class EHFValidation
{
  // 2018-11
  public static final VESID VID_EHF_CATALOGUE_1_0_13 = new VESID ("no.ehf", "catalogue", "1.0.13");
  public static final VESID VID_EHF_CATALOGUE_RESPONSE_1_0_13 = new VESID ("no.ehf", "catalogue-response", "1.0.13");
  public static final VESID VID_EHF_CREDITNOTE_2_0_15 = new VESID ("no.ehf", "creditnote", "2.0.15");
  public static final VESID VID_EHF_DESPATCH_ADVICE_1_0_10 = new VESID ("no.ehf", "despatch-advice", "1.0.10");
  public static final VESID VID_EHF_INVOICE_2_0_15 = new VESID ("no.ehf", "invoice", "2.0.15");
  public static final VESID VID_EHF_ORDER_1_0_11 = new VESID ("no.ehf", "order", "1.0.11");
  public static final VESID VID_EHF_ORDER_AGREEMENT_1_0_2 = new VESID ("no.ehf", "order-agreement", "1.0.2");
  public static final VESID VID_EHF_ORDER_RESPONSE_1_0_11 = new VESID ("no.ehf", "order-response", "1.0.11");
  public static final VESID VID_EHF_PUNCH_OUT_1_0_1 = new VESID ("no.ehf", "punch-out", "1.0.1");
  public static final VESID VID_EHF_REMINDER_1_1_0 = new VESID ("no.ehf", "reminder", "1.1.0");

  // 2019-06
  public static final VESID VID_EHF_CATALOGUE_1_0_14 = new VESID ("no.ehf", "catalogue", "1.0.14");
  public static final VESID VID_EHF_CATALOGUE_RESPONSE_1_0_14 = new VESID ("no.ehf", "catalogue-response", "1.0.14");
  public static final VESID VID_EHF_CREDITNOTE_2_0_16 = new VESID ("no.ehf", "creditnote", "2.0.16");
  public static final VESID VID_EHF_DESPATCH_ADVICE_1_0_11 = new VESID ("no.ehf", "despatch-advice", "1.0.11");
  public static final VESID VID_EHF_INVOICE_2_0_16 = new VESID ("no.ehf", "invoice", "2.0.16");
  public static final VESID VID_EHF_ORDER_1_0_12 = new VESID ("no.ehf", "order", "1.0.12");
  public static final VESID VID_EHF_ORDER_AGREEMENT_1_0_3 = new VESID ("no.ehf", "order-agreement", "1.0.3");
  public static final VESID VID_EHF_ORDER_RESPONSE_1_0_12 = new VESID ("no.ehf", "order-response", "1.0.12");
  public static final VESID VID_EHF_PUNCH_OUT_1_0_2 = new VESID ("no.ehf", "punch-out", "1.0.2");
  // Reminder is unchanged 1.1.0

  // 2019-12
  public static final VESID VID_EHF_CATALOGUE_1_0_15 = new VESID ("no.ehf", "catalogue", "1.0.15");
  public static final VESID VID_EHF_CATALOGUE_RESPONSE_1_0_15 = new VESID ("no.ehf", "catalogue-response", "1.0.15");
  public static final VESID VID_EHF_CREDITNOTE_2_0_17 = new VESID ("no.ehf", "creditnote", "2.0.17");
  public static final VESID VID_EHF_DESPATCH_ADVICE_1_0_12 = new VESID ("no.ehf", "despatch-advice", "1.0.12");
  public static final VESID VID_EHF_INVOICE_2_0_17 = new VESID ("no.ehf", "invoice", "2.0.17");
  public static final VESID VID_EHF_ORDER_1_0_13 = new VESID ("no.ehf", "order", "1.0.13");
  public static final VESID VID_EHF_ORDER_AGREEMENT_1_0_4 = new VESID ("no.ehf", "order-agreement", "1.0.4");
  public static final VESID VID_EHF_ORDER_RESPONSE_1_0_13 = new VESID ("no.ehf", "order-response", "1.0.13");
  public static final VESID VID_EHF_PUNCH_OUT_1_0_3 = new VESID ("no.ehf", "punch-out", "1.0.3");
  // Reminder is unchanged 1.1.0

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return EHFValidation.class.getClassLoader ();
  }

  // 2018-11
  private static final IReadableResource EHF_COMMON_V1_0_4 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-COMMON.xslt",
                                                                                    _getCL ());
  private static final IReadableResource EHF_CATALOGUE_V1_0_13 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T19.xslt",
                                                                                        _getCL ());
  private static final IReadableResource EHF_CATALOGUE_RESPONSE_V1_0_13 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T58.xslt",
                                                                                                 _getCL ());
  private static final IReadableResource EHF_CREDITNOTE_V2_0_15 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T14.xslt",
                                                                                         _getCL ());
  private static final IReadableResource EHF_DESPATCH_ADVICE_V1_0_10 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T16.xslt",
                                                                                              _getCL ());
  private static final IReadableResource EHF_INVOICE_V2_0_15 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T10.xslt",
                                                                                      _getCL ());
  private static final IReadableResource EHF_ORDER_V1_0_11 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T01.xslt",
                                                                                    _getCL ());
  private static final IReadableResource EHF_ORDER_AGREEMENT_V1_0_2 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T110.xslt",
                                                                                             _getCL ());
  private static final IReadableResource EHF_ORDER_RESPONSE_V1_0_11 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T76.xslt",
                                                                                             _getCL ());
  private static final IReadableResource EHF_PUNCH_OUT_V1_0_1 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T77.xslt",
                                                                                       _getCL ());
  private static final IReadableResource EHF_REMINDER_V1_1_0 = new ClassPathResource ("/ehf/2018-11/xslt/EHF-UBL-T17.xslt",
                                                                                      _getCL ());

  // 2019-06
  // Has the same version but is different
  private static final IReadableResource EHF_COMMON_V1_0_4B = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-COMMON.xslt",
                                                                                     _getCL ());
  private static final IReadableResource EHF_CATALOGUE_V1_0_14 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T19.xslt",
                                                                                        _getCL ());
  private static final IReadableResource EHF_CATALOGUE_RESPONSE_V1_0_14 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T58.xslt",
                                                                                                 _getCL ());
  private static final IReadableResource EHF_CREDITNOTE_V2_0_16 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T14.xslt",
                                                                                         _getCL ());
  private static final IReadableResource EHF_DESPATCH_ADVICE_V1_0_11 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T16.xslt",
                                                                                              _getCL ());
  private static final IReadableResource EHF_INVOICE_V2_0_16 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T10.xslt",
                                                                                      _getCL ());
  private static final IReadableResource EHF_ORDER_V1_0_12 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T01.xslt",
                                                                                    _getCL ());
  private static final IReadableResource EHF_ORDER_AGREEMENT_V1_0_3 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T110.xslt",
                                                                                             _getCL ());
  private static final IReadableResource EHF_ORDER_RESPONSE_V1_0_12 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T76.xslt",
                                                                                             _getCL ());
  private static final IReadableResource EHF_PUNCH_OUT_V1_0_2 = new ClassPathResource ("/ehf/2019-06/xslt/EHF-UBL-T77.xslt",
                                                                                       _getCL ());

  // 2019-12
  private static final IReadableResource EHF_COMMON_V1_0_4C = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-COMMON.xslt",
                                                                                     _getCL ());
  private static final IReadableResource EHF_CATALOGUE_V1_0_15 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T19.xslt",
                                                                                        _getCL ());
  private static final IReadableResource EHF_CATALOGUE_RESPONSE_V1_0_15 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T58.xslt",
                                                                                                 _getCL ());
  private static final IReadableResource EHF_CREDITNOTE_V2_0_17 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T14.xslt",
                                                                                         _getCL ());
  private static final IReadableResource EHF_DESPATCH_ADVICE_V1_0_12 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T16.xslt",
                                                                                              _getCL ());
  private static final IReadableResource EHF_INVOICE_V2_0_17 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T10.xslt",
                                                                                      _getCL ());
  private static final IReadableResource EHF_ORDER_V1_0_13 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T01.xslt",
                                                                                    _getCL ());
  private static final IReadableResource EHF_ORDER_AGREEMENT_V1_0_4 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T110.xslt",
                                                                                             _getCL ());
  private static final IReadableResource EHF_ORDER_RESPONSE_V1_0_13 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T76.xslt",
                                                                                             _getCL ());
  private static final IReadableResource EHF_PUNCH_OUT_V1_0_3 = new ClassPathResource ("/ehf/2019-12/xslt/EHF-UBL-T77.xslt",
                                                                                       _getCL ());

  private EHFValidation ()
  {}

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  /**
   * Register all standard EHF validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initEHF (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    final boolean bDeprecated = true;
    final boolean bNotDeprecated = false;

    // 2018-11
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CATALOGUE_1_0_13,
                                                                           "EHF Catalogue " +
                                                                                                     VID_EHF_CATALOGUE_1_0_13.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (PeppolValidation370.CATALOGUE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_CATALOGUE_V1_0_13)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CATALOGUE_RESPONSE_1_0_13,
                                                                           "EHF Catalogue Response " +
                                                                                                              VID_EHF_CATALOGUE_RESPONSE_1_0_13.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.CATALOGUE_RESPONSE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_CATALOGUE_RESPONSE_V1_0_13)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CREDITNOTE_2_0_15,
                                                                           "EHF Creditnote " +
                                                                                                      VID_EHF_CREDITNOTE_2_0_15.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (PeppolValidation370.CREDIT_NOTE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_CREDITNOTE_V2_0_15)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_DESPATCH_ADVICE_1_0_10,
                                                                           "EHF Despatch Advice " +
                                                                                                           VID_EHF_DESPATCH_ADVICE_1_0_10.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.DESPATCH_ADVICE),
                                                                           _createXSLT (PeppolValidation370.DESPATCH_ADVICE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_DESPATCH_ADVICE_V1_0_10)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_INVOICE_2_0_15,
                                                                           "EHF Invoice " +
                                                                                                   VID_EHF_INVOICE_2_0_15.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (PeppolValidation370.INVOICE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_INVOICE_V2_0_15)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_1_0_11,
                                                                           "EHF Ordering " +
                                                                                                 VID_EHF_ORDER_1_0_11.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createXSLT (PeppolValidation370.ORDER_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_ORDER_V1_0_11)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_AGREEMENT_1_0_2,
                                                                           "EHF Order Agreement " +
                                                                                                          VID_EHF_ORDER_AGREEMENT_1_0_2.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.ORDER_AGREEMENT_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_ORDER_AGREEMENT_V1_0_2)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_RESPONSE_1_0_11,
                                                                           "EHF Order Response " +
                                                                                                          VID_EHF_ORDER_RESPONSE_1_0_11.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.ORDER_RESPONSE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_ORDER_RESPONSE_V1_0_11)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_PUNCH_OUT_1_0_1,
                                                                           "EHF Punch Out " +
                                                                                                    VID_EHF_PUNCH_OUT_1_0_1.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (PeppolValidation370.PUNCH_OUT_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_PUNCH_OUT_V1_0_1)));

    // Reminder is NOT in PEPPOL
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_REMINDER_1_1_0,
                                                                           "EHF Reminder " +
                                                                                                   VID_EHF_REMINDER_1_1_0.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.REMINDER),
                                                                           _createXSLT (EHF_COMMON_V1_0_4),
                                                                           _createXSLT (EHF_REMINDER_V1_1_0)));

    // 2019-06
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CATALOGUE_1_0_14,
                                                                           "EHF Catalogue " +
                                                                                                     VID_EHF_CATALOGUE_1_0_14.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (PeppolValidation370.CATALOGUE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_CATALOGUE_V1_0_14)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CATALOGUE_RESPONSE_1_0_14,
                                                                           "EHF Catalogue Response " +
                                                                                                              VID_EHF_CATALOGUE_RESPONSE_1_0_14.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.CATALOGUE_RESPONSE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_CATALOGUE_RESPONSE_V1_0_14)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CREDITNOTE_2_0_16,
                                                                           "EHF Creditnote " +
                                                                                                      VID_EHF_CREDITNOTE_2_0_16.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (PeppolValidation370.CREDIT_NOTE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_CREDITNOTE_V2_0_16)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_DESPATCH_ADVICE_1_0_11,
                                                                           "EHF Despatch Advice " +
                                                                                                           VID_EHF_DESPATCH_ADVICE_1_0_11.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.DESPATCH_ADVICE),
                                                                           _createXSLT (PeppolValidation370.DESPATCH_ADVICE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_DESPATCH_ADVICE_V1_0_11)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_INVOICE_2_0_16,
                                                                           "EHF Invoice " +
                                                                                                   VID_EHF_INVOICE_2_0_16.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (PeppolValidation370.INVOICE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_INVOICE_V2_0_16)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_1_0_12,
                                                                           "EHF Ordering " +
                                                                                                 VID_EHF_ORDER_1_0_12.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createXSLT (PeppolValidation370.ORDER_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_ORDER_V1_0_12)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_AGREEMENT_1_0_3,
                                                                           "EHF Order Agreement " +
                                                                                                          VID_EHF_ORDER_AGREEMENT_1_0_3.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.ORDER_AGREEMENT_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_ORDER_AGREEMENT_V1_0_3)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_RESPONSE_1_0_12,
                                                                           "EHF Order Response " +
                                                                                                          VID_EHF_ORDER_RESPONSE_1_0_12.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.ORDER_RESPONSE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_ORDER_RESPONSE_V1_0_12)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_PUNCH_OUT_1_0_2,
                                                                           "EHF Punch Out " +
                                                                                                    VID_EHF_PUNCH_OUT_1_0_2.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (PeppolValidation370.PUNCH_OUT_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4B),
                                                                           _createXSLT (EHF_PUNCH_OUT_V1_0_2)));
    // Reminder is from 2018-11

    // 2019-12
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CATALOGUE_1_0_15,
                                                                           "EHF Catalogue " +
                                                                                                     VID_EHF_CATALOGUE_1_0_15.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (PeppolValidation370.CATALOGUE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_CATALOGUE_V1_0_15)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CATALOGUE_RESPONSE_1_0_15,
                                                                           "EHF Catalogue Response " +
                                                                                                              VID_EHF_CATALOGUE_RESPONSE_1_0_15.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.CATALOGUE_RESPONSE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_CATALOGUE_RESPONSE_V1_0_15)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CREDITNOTE_2_0_17,
                                                                           "EHF Creditnote " +
                                                                                                      VID_EHF_CREDITNOTE_2_0_17.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (PeppolValidation370.CREDIT_NOTE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_CREDITNOTE_V2_0_17)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_DESPATCH_ADVICE_1_0_12,
                                                                           "EHF Despatch Advice " +
                                                                                                           VID_EHF_DESPATCH_ADVICE_1_0_12.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.DESPATCH_ADVICE),
                                                                           _createXSLT (PeppolValidation370.DESPATCH_ADVICE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_DESPATCH_ADVICE_V1_0_12)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_INVOICE_2_0_17,
                                                                           "EHF Invoice " +
                                                                                                   VID_EHF_INVOICE_2_0_17.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (PeppolValidation370.INVOICE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_INVOICE_V2_0_17)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_1_0_13,
                                                                           "EHF Ordering " +
                                                                                                 VID_EHF_ORDER_1_0_13.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createXSLT (PeppolValidation370.ORDER_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_ORDER_V1_0_13)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_AGREEMENT_1_0_4,
                                                                           "EHF Order Agreement " +
                                                                                                          VID_EHF_ORDER_AGREEMENT_1_0_4.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.ORDER_AGREEMENT_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_ORDER_AGREEMENT_V1_0_4)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_RESPONSE_1_0_13,
                                                                           "EHF Order Response " +
                                                                                                          VID_EHF_ORDER_RESPONSE_1_0_13.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createXSLT (PeppolValidation370.ORDER_RESPONSE_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_ORDER_RESPONSE_V1_0_13)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_PUNCH_OUT_1_0_3,
                                                                           "EHF Punch Out " +
                                                                                                    VID_EHF_PUNCH_OUT_1_0_3.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createXSLT (PeppolValidation370.PUNCH_OUT_RULES),
                                                                           _createXSLT (EHF_COMMON_V1_0_4C),
                                                                           _createXSLT (EHF_PUNCH_OUT_V1_0_3)));
    // Reminder is from 2018-11
  }
}
