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
package com.helger.bdve.peppol;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * Generic Peppol validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class PeppolValidation
{
  // Third-party
  public static final VESID VID_OPENPEPPOL_T10_V2_5_AT = new VESID ("eu.peppol.bis2", "t10", "5", "at");
  public static final VESID VID_OPENPEPPOL_T10_V2_7_AT_GOV = new VESID ("eu.peppol.bis2", "t10", "7", "at-gov");
  public static final VESID VID_OPENPEPPOL_T14_V2_5_AT = new VESID ("eu.peppol.bis2", "t14", "5", "at");
  public static final VESID VID_OPENPEPPOL_T14_V2_7_AT_GOV = new VESID ("eu.peppol.bis2", "t14", "7", "at-gov");

  public static final String VERSION_TO_USE = PeppolValidation360.VERSION_STR;

  private PeppolValidation ()
  {}

  /**
   * Register all standard PEPPOL validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  @SuppressWarnings ("deprecation")
  public static void initStandard (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    PeppolValidation340.init (aRegistry);
    PeppolValidation350.init (aRegistry);
    PeppolValidation360.init (aRegistry);
  }

  @Nonnull
  private static ValidationArtefact _createPure (@Nonnull final IReadableResource aRes)
  {
    return new ValidationArtefact (EValidationType.SCHEMATRON_PURE, PeppolValidation.class.getClassLoader (), aRes);
  }

  public static void initThirdParty (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    // Extending third-party artefacts
    final IValidationExecutorSet aVESInvoice = aRegistry.getOfID (PeppolValidation360.VID_OPENPEPPOL_T10_V2.getWithVersion (VERSION_TO_USE));
    final IValidationExecutorSet aVESCreditNote = aRegistry.getOfID (PeppolValidation360.VID_OPENPEPPOL_T14_V2.getWithVersion (VERSION_TO_USE));
    if (aVESInvoice == null || aVESCreditNote == null)
      throw new IllegalStateException ("Standard PEPPOL artefacts must be registered before third-party artefacts!");

    final boolean bDeprecated = false;
    final IValidationExecutorSet aVESInvoiceAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoice,
                                                                                                                               VID_OPENPEPPOL_T10_V2_5_AT,
                                                                                                                               "OpenPEPPOL Invoice (Austria)",
                                                                                                                               CPeppolValidationArtefact.VK_INVOICE_04_T10_ATNAT,
                                                                                                                               bDeprecated,
                                                                                                                               _createPure (CPeppolValidationArtefact.INVOICE_AT_NAT)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoiceAT,
                                                                                  VID_OPENPEPPOL_T10_V2_7_AT_GOV,
                                                                                  "OpenPEPPOL Invoice (Austrian Government)",
                                                                                  CPeppolValidationArtefact.VK_INVOICE_04_T10_ATGOV,
                                                                                  bDeprecated,
                                                                                  _createPure (CPeppolValidationArtefact.INVOICE_AT_GOV)));
    final IValidationExecutorSet aVESCreditNoteAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNote,
                                                                                                                                  VID_OPENPEPPOL_T14_V2_5_AT,
                                                                                                                                  "OpenPEPPOL Credit Note (Austria)",
                                                                                                                                  CPeppolValidationArtefact.VK_BILLING_05_T14_ATNAT,
                                                                                                                                  bDeprecated,
                                                                                                                                  _createPure (CPeppolValidationArtefact.CREDIT_NOTE_AT_NAT)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNoteAT,
                                                                                  VID_OPENPEPPOL_T14_V2_7_AT_GOV,
                                                                                  "OpenPEPPOL Credit Note (Austrian Government)",
                                                                                  CPeppolValidationArtefact.VK_BILLING_05_T14_ATGOV,
                                                                                  bDeprecated,
                                                                                  _createPure (CPeppolValidationArtefact.CREDIT_NOTE_AT_GOV)));
  }
}
