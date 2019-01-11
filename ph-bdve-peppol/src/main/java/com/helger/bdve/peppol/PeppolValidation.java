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
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
import javax.xml.XMLConstants;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;
import com.helger.xml.namespace.IIterableNamespaceContext;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * Generic Peppol validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class PeppolValidation
{
  @Nonnull
  private static ClassLoader _getCL ()
  {
    return PeppolValidation.class.getClassLoader ();
  }

  // Third-party
  public static final VESID VID_OPENPEPPOL_T10_V2_5_AT = new VESID ("eu.peppol.bis2", "t10", "5", "at");
  public static final VESID VID_OPENPEPPOL_T10_V2_7_AT_GOV = new VESID ("eu.peppol.bis2", "t10", "7", "at-gov");
  public static final VESID VID_OPENPEPPOL_T14_V2_5_AT = new VESID ("eu.peppol.bis2", "t14", "5", "at");
  public static final VESID VID_OPENPEPPOL_T14_V2_7_AT_GOV = new VESID ("eu.peppol.bis2", "t14", "7", "at-gov");

  public static final VESID VID_OPENPEPPOL_BIS3_UBL_INVOICE = new VESID ("eu.peppol.bis3.ubl", "invoice", "1");
  public static final VESID VID_OPENPEPPOL_BIS3_UBL_CREDIT_NOTE = new VESID ("eu.peppol.bis3.ubl", "creditnote", "1");
  public static final VESID VID_OPENPEPPOL_BIS3_CII_INVOICE = new VESID ("eu.peppol.bis3.cii", "invoice", "1");
  public static final VESID VID_OPENPEPPOL_BIS3_CII_CREDIT_NOTE = new VESID ("eu.peppol.bis3.cii", "creditnote", "1");

  public static final IReadableResource INVOICE_AT_NAT = new ClassPathResource ("/thirdparty/invoice/ATNAT-UBL-T10.sch",
                                                                                _getCL ());
  public static final IReadableResource INVOICE_AT_GOV = new ClassPathResource ("/thirdparty/invoice/ATGOV-UBL-T10.sch",
                                                                                _getCL ());

  public static final IReadableResource CREDIT_NOTE_AT_NAT = new ClassPathResource ("/thirdparty/creditnote/ATNAT-UBL-T14.sch",
                                                                                    _getCL ());
  public static final IReadableResource CREDIT_NOTE_AT_GOV = new ClassPathResource ("/thirdparty/creditnote/ATGOV-UBL-T14.sch",
                                                                                    _getCL ());

  public static final IReadableResource BIS3_BILLING_CEN = new ClassPathResource ("/openpeppol/billingbis3/CEN-EN16931-UBL.sch",
                                                                                  _getCL ());
  public static final IReadableResource BIS3_BILLING_PEPPOL = new ClassPathResource ("/openpeppol/billingbis3/PEPPOL-EN16931-UBL.sch",
                                                                                     _getCL ());

  public static final String VERSION_TO_USE = PeppolValidation370.VERSION_STR;

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

    PeppolValidation350.init (aRegistry);
    PeppolValidation360.init (aRegistry);
    PeppolValidation370.init (aRegistry);
  }

  @Nonnull
  private static IValidationExecutor _createPure (@Nonnull final IReadableResource aRes,
                                                  @Nullable final String sPrerequisiteXPath,
                                                  @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.SCHEMATRON_PURE,
                                                           PeppolValidation.class.getClassLoader (),
                                                           aRes);
    return new ValidationExecutorSchematron (aVA, sPrerequisiteXPath, aNamespaceContext);
  }

  @Nonnull
  @ReturnsMutableObject
  private static MapBasedNamespaceContext _createUBLNSContext (@Nonnull final String sNamespaceURI)
  {
    final MapBasedNamespaceContext aNSContext = UBL21NamespaceContext.getInstance ().getClone ();

    // Add the default mapping for the root namespace
    aNSContext.addMapping (XMLConstants.DEFAULT_NS_PREFIX, sNamespaceURI);
    // For historical reasons, the "ubl" prefix is also mapped to this
    // namespace URI
    aNSContext.addMapping ("ubl", sNamespaceURI);
    return aNSContext;
  }

  public static void initThirdParty (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    // Extending third-party artefacts
    final IValidationExecutorSet aVESInvoice = aRegistry.getOfID (PeppolValidation370.VID_OPENPEPPOL_T10_V2.getWithVersion (VERSION_TO_USE));
    final IValidationExecutorSet aVESCreditNote = aRegistry.getOfID (PeppolValidation370.VID_OPENPEPPOL_T14_V2.getWithVersion (VERSION_TO_USE));
    if (aVESInvoice == null || aVESCreditNote == null)
      throw new IllegalStateException ("Standard PEPPOL artefacts must be registered before third-party artefacts!");

    final String sPreReqInvoice = "/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'";
    final String sPreReqCreditNote = "/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'";

    final boolean bNotDeprecated = false;
    final IValidationExecutorSet aVESInvoiceAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoice,
                                                                                                                               VID_OPENPEPPOL_T10_V2_5_AT,
                                                                                                                               "OpenPEPPOL Invoice (Austria)",
                                                                                                                               bNotDeprecated,
                                                                                                                               _createPure (INVOICE_AT_NAT,
                                                                                                                                            sPreReqInvoice,
                                                                                                                                            _createUBLNSContext (EUBL21DocumentType.INVOICE.getNamespaceURI ()))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoiceAT,
                                                                                  VID_OPENPEPPOL_T10_V2_7_AT_GOV,
                                                                                  "OpenPEPPOL Invoice (Austrian Government)",
                                                                                  bNotDeprecated,
                                                                                  _createPure (INVOICE_AT_GOV,
                                                                                               sPreReqInvoice,
                                                                                               _createUBLNSContext (EUBL21DocumentType.INVOICE.getNamespaceURI ()))));
    final IValidationExecutorSet aVESCreditNoteAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNote,
                                                                                                                                  VID_OPENPEPPOL_T14_V2_5_AT,
                                                                                                                                  "OpenPEPPOL Credit Note (Austria)",
                                                                                                                                  bNotDeprecated,
                                                                                                                                  _createPure (CREDIT_NOTE_AT_NAT,
                                                                                                                                               sPreReqCreditNote,
                                                                                                                                               _createUBLNSContext (EUBL21DocumentType.CREDIT_NOTE.getNamespaceURI ()))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNoteAT,
                                                                                  VID_OPENPEPPOL_T14_V2_7_AT_GOV,
                                                                                  "OpenPEPPOL Credit Note (Austrian Government)",
                                                                                  bNotDeprecated,
                                                                                  _createPure (CREDIT_NOTE_AT_GOV,
                                                                                               sPreReqCreditNote,
                                                                                               _createUBLNSContext (EUBL21DocumentType.CREDIT_NOTE.getNamespaceURI ()))));

    // Billing BIS 3
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_UBL_INVOICE,
                                                                           "OpenPEPPOL BIS3 Invoice (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_PURE,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_CEN),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ()),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_SCH,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_PEPPOL),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OPENPEPPOL_BIS3_UBL_CREDIT_NOTE,
                                                                           "OpenPEPPOL BIS3 CreditNote (UBL)",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_PURE,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_CEN),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ()),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_SCH,
                                                                                                                                     _getCL (),
                                                                                                                                     BIS3_BILLING_PEPPOL),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));

  }
}
