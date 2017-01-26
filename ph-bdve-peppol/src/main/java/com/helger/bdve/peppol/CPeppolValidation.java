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

import com.helger.bdve.execute.IValidationExecutorSet;
import com.helger.bdve.execute.ValidationExecutorSet;
import com.helger.bdve.execute.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;

/**
 * Peppol validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class CPeppolValidation
{
  // Standard
  public static final String VID_OPENPEPPOL_T71_V2 = "openpeppol-t71-v2";
  public static final String VID_OPENPEPPOL_T14_V2 = "openpeppol-t14-v2";
  public static final String VID_OPENPEPPOL_T10_V2 = "openpeppol-t10-v2";
  public static final String VID_OPENPEPPOL_T16_V2 = "openpeppol-t16-v2";
  public static final String VID_OPENPEPPOL_T76_V2 = "openpeppol-t76-v2";
  public static final String VID_OPENPEPPOL_T01_V2 = "openpeppol-t01-v2";
  public static final String VID_OPENPEPPOL_T58_V2 = "openpeppol-t58-v2";
  public static final String VID_OPENPEPPOL_T19_V2 = "openpeppol-t19-v2";

  // Third-party
  public static final String VID_OPENPEPPOL_T10_V2_AT = "openpeppol-t10-v2-at";
  public static final String VID_OPENPEPPOL_T10_V2_AT_GOV = "openpeppol-t10-v2-at-gov";
  public static final String VID_OPENPEPPOL_T14_V2_AT = "openpeppol-t14-v2-at";
  public static final String VID_OPENPEPPOL_T14_V2_AT_GOV = "openpeppol-t14-v2-at-gov";
  public static final String VID_SIMPLERINVOICING_V11 = "simplerinvoicing-t10-v11-nl";
  public static final String VID_SIMPLERINVOICING_V11_STRICT = "simplerinvoicing-t10-v11-nl-strict";

  private CPeppolValidation ()
  {}

  /**
   * Register all standard PEPPOL validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initStandard (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T19_V2,
                                                                           "OpenPEPPOL Catalogue",
                                                                           CPeppolValidationArtefact.VK_CATALOGUE_01_T19,
                                                                           CPeppolValidationArtefact.CATALOGUE_RULES,
                                                                           CPeppolValidationArtefact.CATALOGUE_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.CATALOGUE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T58_V2,
                                                                           "OpenPEPPOL Catalogue Response",
                                                                           CPeppolValidationArtefact.VK_CATALOGUE_01_T58,
                                                                           CPeppolValidationArtefact.CATALOGUE_RESPONSE_RULES,
                                                                           CPeppolValidationArtefact.CATALOGUE_RESPONSE_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.CATALOGUE_RESPONSE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T01_V2,
                                                                           "OpenPEPPOL Order",
                                                                           CPeppolValidationArtefact.VK_ORDER_03_T01,
                                                                           CPeppolValidationArtefact.ORDER_RULES,
                                                                           CPeppolValidationArtefact.ORDER_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.ORDER_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T76_V2,
                                                                           "OpenPEPPOL Order Response",
                                                                           CPeppolValidationArtefact.VK_ORDERING_28_T76,
                                                                           CPeppolValidationArtefact.ORDER_RESPONSE_RULES,
                                                                           CPeppolValidationArtefact.ORDER_RESPONSE_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.ORDER_RESPONSE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T16_V2,
                                                                           "OpenPEPPOL Despatch Advice",
                                                                           CPeppolValidationArtefact.VK_DESPATCH_ADVICE_30_T16,
                                                                           CPeppolValidationArtefact.DESPATCH_ADVICE_RULES,
                                                                           CPeppolValidationArtefact.DESPATCH_ADVICE_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.DESPATCH_ADVICE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T10_V2,
                                                                           "OpenPEPPOL Invoice",
                                                                           CPeppolValidationArtefact.VK_INVOICE_04_T10,
                                                                           CPeppolValidationArtefact.INVOICE_RULES,
                                                                           CPeppolValidationArtefact.INVOICE_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.INVOICE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T14_V2,
                                                                           "OpenPEPPOL Credit Note",
                                                                           CPeppolValidationArtefact.VK_BILLING_05_T14,
                                                                           CPeppolValidationArtefact.CREDIT_NOTE_RULES,
                                                                           CPeppolValidationArtefact.CREDIT_NOTE_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.CREDIT_NOTE_OPENPEPPOL_CORE));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_T71_V2,
                                                                           "OpenPEPPOL MLR",
                                                                           CPeppolValidationArtefact.VK_MLR_36_T71,
                                                                           CPeppolValidationArtefact.MLR_RULES,
                                                                           CPeppolValidationArtefact.MLR_OPENPEPPOL,
                                                                           CPeppolValidationArtefact.MLR_OPENPEPPOL_CORE));
  }

  public static void initThirdParty (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // Extending third-party artefacts
    final IValidationExecutorSet aVESInvoice = aRegistry.getOfID (VID_OPENPEPPOL_T10_V2);
    final IValidationExecutorSet aVESCreditNote = aRegistry.getOfID (VID_OPENPEPPOL_T14_V2);
    if (aVESInvoice == null || aVESCreditNote == null)
      throw new IllegalStateException ("Standard PEPPOL artefacts must be registered before third-party artefacts!");

    final IValidationExecutorSet aVESInvoiceAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoice,
                                                                                                                               VID_OPENPEPPOL_T10_V2_AT,
                                                                                                                               "OpenPEPPOL Invoice (Austria)",
                                                                                                                               CPeppolValidationArtefact.VK_INVOICE_04_T10_ATNAT,
                                                                                                                               CPeppolValidationArtefact.INVOICE_AT_NAT));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoiceAT,
                                                                                  VID_OPENPEPPOL_T10_V2_AT_GOV,
                                                                                  "OpenPEPPOL Invoice (Austrian Government)",
                                                                                  CPeppolValidationArtefact.VK_INVOICE_04_T10_ATGOV,
                                                                                  CPeppolValidationArtefact.INVOICE_AT_GOV));
    final IValidationExecutorSet aVESCreditNoteAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNote,
                                                                                                                                  VID_OPENPEPPOL_T14_V2_AT,
                                                                                                                                  "OpenPEPPOL Credit Note (Austria)",
                                                                                                                                  CPeppolValidationArtefact.VK_BILLING_05_T14_ATNAT,
                                                                                                                                  CPeppolValidationArtefact.CREDIT_NOTE_AT_NAT));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNoteAT,
                                                                                  VID_OPENPEPPOL_T14_V2_AT_GOV,
                                                                                  "OpenPEPPOL Credit Note (Austrian Government)",
                                                                                  CPeppolValidationArtefact.VK_BILLING_05_T14_ATGOV,
                                                                                  CPeppolValidationArtefact.CREDIT_NOTE_AT_GOV));

    // SimplerInvoicing is self-contained
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SIMPLERINVOICING_V11,
                                                                           "SimplerInvoicing 1.1",
                                                                           CPeppolValidationArtefact.VK_SIMPLERINVOICING,
                                                                           CPeppolValidationArtefact.INVOICE_SIMPLER_INVOICING));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SIMPLERINVOICING_V11_STRICT,
                                                                           "SimplerInvoicing 1.1 (strict)",
                                                                           CPeppolValidationArtefact.VK_SIMPLERINVOICING_STRICT,
                                                                           CPeppolValidationArtefact.INVOICE_SIMPLER_INVOICING_STRICT));
  }
}
