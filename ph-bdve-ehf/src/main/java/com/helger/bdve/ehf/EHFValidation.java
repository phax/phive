/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
import com.helger.bdve.executorset.TypedValidationResource;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Generic EHF validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class EHFValidation
{
  public static final VESID VID_EHF_CATALOGUTE_1_0_10 = new VESID ("no.ehf", "catalogue", "1.0.10");
  public static final VESID VID_EHF_CREDITNOTE_2_0_12 = new VESID ("no.ehf", "creditnote", "2.0.12");
  public static final VESID VID_EHF_DESPATCH_ADVICE_1_0_8 = new VESID ("no.ehf", "despatch-advice", "1.0.8");
  public static final VESID VID_EHF_INVOICE_2_0_12 = new VESID ("no.ehf", "invoice", "2.0.12");
  public static final VESID VID_EHF_ORDER_AGREEMENT_1_0_0 = new VESID ("no.ehf", "order-agreement", "1.0.0");

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return EHFValidation.class.getClassLoader ();
  }

  private static final IReadableResource EHF_COMMON = new ClassPathResource ("/ehf/ehf-common-1.0/sch/EHF-UBL-COMMON.sch",
                                                                             _getCL ());

  private static final IReadableResource CATALOGUE_EHFCORE = new ClassPathResource ("/ehf/ehf-catalogue-1.0/sch/EHFCORE-UBL-T19.sch",
                                                                                    _getCL ());
  private static final IReadableResource CATALOGUE_NOGOV = new ClassPathResource ("/ehf/ehf-catalogue-1.0/sch/NOGOV-UBL-T19.sch",
                                                                                  _getCL ());

  private static final IReadableResource CREDITNOTE_EHFCORE = new ClassPathResource ("/ehf/ehf-creditnote-2.0/sch/EHFCORE-UBL-T14.sch",
                                                                                     _getCL ());
  private static final IReadableResource CREDITNOTE_NONAT = new ClassPathResource ("/ehf/ehf-creditnote-2.0/sch/NONAT-UBL-T14.sch",
                                                                                   _getCL ());
  private static final IReadableResource CREDITNOTE_NOGOV = new ClassPathResource ("/ehf/ehf-creditnote-2.0/sch/NOGOV-UBL-T14.sch",
                                                                                   _getCL ());

  private static final IReadableResource DESPATCH_ADVICE_EHFCORE = new ClassPathResource ("/ehf/ehf-despatch-advice-1.0/sch/EHFCORE-UBL-T16.sch",
                                                                                          _getCL ());
  private static final IReadableResource DESPATCH_ADVICE_NOGOV = new ClassPathResource ("/ehf/ehf-despatch-advice-1.0/sch/NOGOV-UBL-T16.sch",
                                                                                        _getCL ());

  private static final IReadableResource INVOICE_EHFCORE = new ClassPathResource ("/ehf/ehf-invoice-2.0/sch/EHFCORE-UBL-T10.sch",
                                                                                  _getCL ());
  private static final IReadableResource INVOICE_NONAT = new ClassPathResource ("/ehf/ehf-invoice-2.0/sch/NONAT-UBL-T10.sch",
                                                                                _getCL ());
  private static final IReadableResource INVOICE_NOGOV = new ClassPathResource ("/ehf/ehf-invoice-2.0/sch/NOGOV-UBL-T10.sch",
                                                                                _getCL ());

  private static final IReadableResource ORDER_AGREEMENT_EHFCORE = new ClassPathResource ("/ehf/ehf-order-agreement-1.0/sch/EHF-UBL-T110.sch",
                                                                                          _getCL ());

  private EHFValidation ()
  {}

  @Nonnull
  private static TypedValidationResource _createPure (@Nonnull final IReadableResource aRes)
  {
    return new TypedValidationResource (EValidationType.SCHEMATRON_PURE, EHFValidation.class.getClassLoader (), aRes);
  }

  @Nonnull
  private static TypedValidationResource _createSCH (@Nonnull final IReadableResource aRes)
  {
    return new TypedValidationResource (EValidationType.SCHEMATRON_SCH, EHFValidation.class.getClassLoader (), aRes);
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

    final boolean bDeprecated = false;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CATALOGUTE_1_0_10,
                                                                           "EHF Catalogue " +
                                                                                                      VID_EHF_CATALOGUTE_1_0_10.getVersion (),
                                                                           CEHFValidationArtefact.VK_EHF_CATALOGUE_T19,
                                                                           bDeprecated,
                                                                           _createSCH (EHF_COMMON),
                                                                           _createPure (CATALOGUE_EHFCORE),
                                                                           _createSCH (CATALOGUE_NOGOV)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_CREDITNOTE_2_0_12,
                                                                           "EHF Creditnote " +
                                                                                                      VID_EHF_CREDITNOTE_2_0_12.getVersion (),
                                                                           CEHFValidationArtefact.VK_EHF_CREDITNOTE_T14,
                                                                           bDeprecated,
                                                                           _createSCH (EHF_COMMON),
                                                                           _createPure (CREDITNOTE_EHFCORE),
                                                                           _createSCH (CREDITNOTE_NONAT),
                                                                           _createSCH (CREDITNOTE_NOGOV)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_DESPATCH_ADVICE_1_0_8,
                                                                           "EHF Catalogue " +
                                                                                                          VID_EHF_DESPATCH_ADVICE_1_0_8.getVersion (),
                                                                           CEHFValidationArtefact.VK_EHF_DESPATCH_ADVICE_T14,
                                                                           bDeprecated,
                                                                           _createSCH (EHF_COMMON),
                                                                           _createPure (DESPATCH_ADVICE_EHFCORE),
                                                                           _createSCH (DESPATCH_ADVICE_NOGOV)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_INVOICE_2_0_12,
                                                                           "EHF Invoice " +
                                                                                                   VID_EHF_INVOICE_2_0_12.getVersion (),
                                                                           CEHFValidationArtefact.VK_EHF_INVOICE_T10,
                                                                           bDeprecated,
                                                                           _createSCH (EHF_COMMON),
                                                                           _createPure (INVOICE_EHFCORE),
                                                                           _createSCH (INVOICE_NONAT),
                                                                           _createSCH (INVOICE_NOGOV)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EHF_ORDER_AGREEMENT_1_0_0,
                                                                           "EHF Order Agreement " +
                                                                                                          VID_EHF_ORDER_AGREEMENT_1_0_0.getVersion (),
                                                                           CEHFValidationArtefact.VK_EHF_ORDER_AGREEMENT_T110,
                                                                           bDeprecated,
                                                                           _createSCH (EHF_COMMON),
                                                                           _createPure (ORDER_AGREEMENT_EHFCORE)));
  }
}
