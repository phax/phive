/**
 * Copyright (C) 2014-2019 Philip Helger (www.helger.com)
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
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * Peppol Australia/New Zealand (AUNZ) validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class PeppolValidationAUNZ
{
  @Nonnull
  private static ClassLoader _getCL ()
  {
    return PeppolValidationAUNZ.class.getClassLoader ();
  }

  // Version 1.0.1 is the current assumption but may not hold true
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                  "invoice",
                                                                                  "1.0.1");
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                               "invoice-self-billing",
                                                                                               "1.0.1");
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                      "creditnote",
                                                                                      "1.0.1");
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                                   "creditnote-self-billing",
                                                                                                   "1.0.1");

  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING = new ClassPathResource ("/aunz-peppol/xslt/AUNZ-PEPPOL-SB-validation.xslt",
                                                                                                       _getCL ());
  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL = new ClassPathResource ("/aunz-peppol/xslt/AUNZ-PEPPOL-validation.xslt",
                                                                                          _getCL ());
  public static final IReadableResource BIS3_BILLING_AUNZ_UBL = new ClassPathResource ("/aunz-peppol/xslt/AUNZ-UBL-validation.xslt",
                                                                                       _getCL ());

  private PeppolValidationAUNZ ()
  {}

  public static void init (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final MapBasedNamespaceContext aNSCtxInvoice = PeppolValidation.createUBLNSContext (EUBL21DocumentType.INVOICE.getNamespaceURI ());
    final MapBasedNamespaceContext aNSCtxCreditNote = PeppolValidation.createUBLNSContext (EUBL21DocumentType.CREDIT_NOTE.getNamespaceURI ());

    // For better error messages (merge both)
    LocationBeautifierSPI.addMappings (aNSCtxCreditNote.getClone ().setMappings (aNSCtxInvoice));

    final boolean bNotDeprecated = false;

    // Regular
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_101,
                                                                           "A-NZ PEPPOL BIS3 Invoice (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_UBL),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_101,
                                                                           "A-NZ PEPPOL BIS3 CreditNote (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_UBL),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));

    // Self-billing
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_101,
                                                                           "A-NZ PEPPOL BIS3 Invoice Self-Billing (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_UBL),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_101,
                                                                           "A-NZ PEPPOL BIS3 CreditNote Self-Billing (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_AUNZ_UBL),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));
  }
}
