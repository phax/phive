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

  // 1.0.0
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_100 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                  "invoice",
                                                                                  "1.0.0");
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_100 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                               "invoice-self-billing",
                                                                                               "1.0.0");
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_100 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                      "creditnote",
                                                                                      "1.0.0");
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_100 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                                   "creditnote-self-billing",
                                                                                                   "1.0.0");

  @Deprecated
  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_100 = new ClassPathResource ("/aunz-peppol/1.0.0/xslt/AUNZ-PEPPOL-SB-validation.xslt",
                                                                                                           _getCL ());
  @Deprecated
  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL_100 = new ClassPathResource ("/aunz-peppol/1.0.0/xslt/AUNZ-PEPPOL-validation.xslt",
                                                                                              _getCL ());
  @Deprecated
  public static final IReadableResource BIS3_BILLING_AUNZ_UBL_100 = new ClassPathResource ("/aunz-peppol/1.0.0/xslt/AUNZ-UBL-validation.xslt",
                                                                                           _getCL ());

  // 1.0.1
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                  "invoice",
                                                                                  "1.0.1");
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                               "invoice-self-billing",
                                                                                               "1.0.1");
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                      "creditnote",
                                                                                      "1.0.1");
  @Deprecated
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_101 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                                   "creditnote-self-billing",
                                                                                                   "1.0.1");

  @Deprecated
  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_101 = new ClassPathResource ("/aunz-peppol/1.0.1/xslt/AUNZ-PEPPOL-SB-validation.xslt",
                                                                                                           _getCL ());
  @Deprecated
  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL_101 = new ClassPathResource ("/aunz-peppol/1.0.1/xslt/AUNZ-PEPPOL-validation.xslt",
                                                                                              _getCL ());
  @Deprecated
  public static final IReadableResource BIS3_BILLING_AUNZ_UBL_101 = new ClassPathResource ("/aunz-peppol/1.0.1/xslt/AUNZ-UBL-validation.xslt",
                                                                                           _getCL ());

  // 1.0.2
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_102 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                  "invoice",
                                                                                  "1.0.2");
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_102 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                               "invoice-self-billing",
                                                                                               "1.0.2");
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_102 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                      "creditnote",
                                                                                      "1.0.2");
  public static final VESID VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_102 = new VESID ("eu.peppol.bis3.aunz.ubl",
                                                                                                   "creditnote-self-billing",
                                                                                                   "1.0.2");

  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_102 = new ClassPathResource ("/aunz-peppol/1.0.2/xslt/AUNZ-PEPPOL-SB-validation.xslt",
                                                                                                           _getCL ());
  public static final IReadableResource BIS3_BILLING_AUNZ_PEPPOL_102 = new ClassPathResource ("/aunz-peppol/1.0.2/xslt/AUNZ-PEPPOL-validation.xslt",
                                                                                              _getCL ());
  public static final IReadableResource BIS3_BILLING_AUNZ_UBL_102 = new ClassPathResource ("/aunz-peppol/1.0.2/xslt/AUNZ-UBL-validation.xslt",
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

    final boolean bDeprecated = true;
    final boolean bNotDeprecated = false;

    // 1.0.0
    final String sVersion100 = VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_100.getVersion ();
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_100,
                                                                           "A-NZ PEPPOL BIS3 Invoice (UBL) " +
                                                                                                                     sVersion100,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_100),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_100),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_100,
                                                                           "A-NZ PEPPOL BIS3 CreditNote (UBL) " +
                                                                                                                         sVersion100,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_100),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_100),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));

    // Self-billing
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_100,
                                                                           "A-NZ PEPPOL BIS3 Invoice Self-Billing (UBL) " +
                                                                                                                                  sVersion100,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_100),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_100),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_100,
                                                                           "A-NZ PEPPOL BIS3 CreditNote Self-Billing (UBL) " +
                                                                                                                                      sVersion100,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_100),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_100),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));

    // 1.0.1
    final String sVersion101 = VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_101.getVersion ();
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_101,
                                                                           "A-NZ PEPPOL BIS3 Invoice (UBL) " +
                                                                                                                     sVersion101,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_101),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_101),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_101,
                                                                           "A-NZ PEPPOL BIS3 CreditNote (UBL) " +
                                                                                                                         sVersion101,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_101),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_101),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));

    // Self-billing
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_101,
                                                                           "A-NZ PEPPOL BIS3 Invoice Self-Billing (UBL) " +
                                                                                                                                  sVersion101,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_101),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_101),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_101,
                                                                           "A-NZ PEPPOL BIS3 CreditNote Self-Billing (UBL) " +
                                                                                                                                      sVersion101,
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_101),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_101),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));

    // 1.0.2
    final String sVersion102 = VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_102.getVersion ();
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_102,
                                                                           "A-NZ PEPPOL BIS3 Invoice (UBL) " +
                                                                                                                     sVersion102,
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_102),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_102),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_102,
                                                                           "A-NZ PEPPOL BIS3 CreditNote (UBL) " +
                                                                                                                         sVersion102,
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_102),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_102),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));

    // Self-billing
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_INVOICE_SELF_BILLING_102,
                                                                           "A-NZ PEPPOL BIS3 Invoice Self-Billing (UBL) " +
                                                                                                                                  sVersion102,
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_102),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_102),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_AUNZ_UBL_CREDIT_NOTE_SELF_BILLING_102,
                                                                           "A-NZ PEPPOL BIS3 CreditNote Self-Billing (UBL) " +
                                                                                                                                      sVersion102,
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_PEPPOL_SELF_BILLING_102),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     BIS3_BILLING_AUNZ_UBL_102),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));
  }
}
