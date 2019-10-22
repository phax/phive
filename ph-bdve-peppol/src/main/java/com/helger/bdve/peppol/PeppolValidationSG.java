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
 * Generic Peppol validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class PeppolValidationSG
{
  @Nonnull
  private static ClassLoader _getCL ()
  {
    return PeppolValidationSG.class.getClassLoader ();
  }

  public static final VESID VID_OPENPEPPOL_BIS3_SG_UBL_INVOICE = new VESID ("eu.peppol.bis3.sg.ubl", "invoice", "1");
  public static final VESID VID_OPENPEPPOL_BIS3_SG_UBL_CREDIT_NOTE = new VESID ("eu.peppol.bis3.sg.ubl",
                                                                                "creditnote",
                                                                                "1");

  public static final IReadableResource BIS3_BILLING_SG_CEN = new ClassPathResource ("/sg-peppol/xslt/CEN-EN16931-UBL-SG-Conformant.xslt",
                                                                                     _getCL ());
  public static final IReadableResource BIS3_BILLING_SG_PEPPOL = new ClassPathResource ("/sg-peppol/xslt/PEPPOL-EN16931-UBL-SG-Conformant.xslt",
                                                                                        _getCL ());

  private PeppolValidationSG ()
  {}

  public static void init (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final MapBasedNamespaceContext aNSCtxInvoice = PeppolValidation.createUBLNSContext (EUBL21DocumentType.INVOICE.getNamespaceURI ());
    final MapBasedNamespaceContext aNSCtxCreditNote = PeppolValidation.createUBLNSContext (EUBL21DocumentType.CREDIT_NOTE.getNamespaceURI ());

    // For better error messages (merge both)
    LocationBeautifierSPI.addMappings (aNSCtxCreditNote.getClone ().setMappings (aNSCtxInvoice));

    final boolean bNotDeprecated = false;

    // Billing BIS 3 Singapore (SG)
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_SG_UBL_INVOICE,
                                                                           "SG PEPPOL BIS3 Invoice (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_SG_CEN),
                                                                                                             null,
                                                                                                             aNSCtxInvoice),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_SG_PEPPOL),
                                                                                                             null,
                                                                                                             aNSCtxInvoice)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_SG_UBL_CREDIT_NOTE,
                                                                           "SG PEPPOL BIS3 CreditNote (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_SG_CEN),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_SG_PEPPOL),
                                                                                                             null,
                                                                                                             aNSCtxCreditNote)));
  }
}
