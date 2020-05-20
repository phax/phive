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

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
import javax.xml.XMLConstants;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.datetime.PDTFactory;
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
@SuppressWarnings ("deprecation")
public final class PeppolValidation
{
  @Nonnull
  private static ClassLoader _getCL ()
  {
    return PeppolValidation.class.getClassLoader ();
  }

  // Third-party
  public static final VESID VID_OPENPEPPOL_T10_V2_5_AT = new VESID ("eu.peppol.bis2", "t10", "6", "at");
  public static final VESID VID_OPENPEPPOL_T10_V2_7_AT_GOV = new VESID ("eu.peppol.bis2", "t10", "8", "at-gov");
  public static final VESID VID_OPENPEPPOL_T14_V2_5_AT = new VESID ("eu.peppol.bis2", "t14", "6", "at");
  public static final VESID VID_OPENPEPPOL_T14_V2_7_AT_GOV = new VESID ("eu.peppol.bis2", "t14", "8", "at-gov");

  public static final IReadableResource INVOICE_AT_NAT = new ClassPathResource ("/thirdparty/atnat-invoice/atnat-invoice-ubl.xslt",
                                                                                _getCL ());
  public static final IReadableResource INVOICE_AT_GOV = new ClassPathResource ("/thirdparty/atgov-invoice/atgov-invoice-ubl.xslt",
                                                                                _getCL ());

  public static final IReadableResource CREDIT_NOTE_AT_NAT = new ClassPathResource ("/thirdparty/atnat-creditnote/atnat-creditnote-ubl.xslt",
                                                                                    _getCL ());
  public static final IReadableResource CREDIT_NOTE_AT_GOV = new ClassPathResource ("/thirdparty/atgov-creditnote/atgov-creditnote-ubl.xslt",
                                                                                    _getCL ());

  /**
   * @return The currently active version number, dependent on the current date.
   *         Never <code>null</code>.
   * @since 5.1.8
   */
  @Nonnull
  @Nonempty
  public static final String getVersionToUse ()
  {
    final LocalDate aNow = PDTFactory.getCurrentLocalDate ();
    if (aNow.isBefore (PeppolValidation3_10_0.VALID_PER))
    {
      // Previous version
      return PeppolValidation391.VERSION_STR;
    }
    // Latest version
    return PeppolValidation3_10_0.VERSION_STR;
  }

  private PeppolValidation ()
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
    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    PeppolValidation350.init (aRegistry);
    PeppolValidation360.init (aRegistry);
    PeppolValidation370.init (aRegistry);
    PeppolValidation380.init (aRegistry);
    PeppolValidation381.init (aRegistry);
    PeppolValidation390.init (aRegistry);
    PeppolValidation391.init (aRegistry);
    PeppolValidation3_10_0.init (aRegistry);
    PeppolValidationAUNZ.init (aRegistry);
    PeppolValidationSG.init (aRegistry);
  }

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes,
                                                  @Nullable final String sPrerequisiteXPath,
                                                  @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, aRes),
                                             sPrerequisiteXPath,
                                             aNamespaceContext);
  }

  @Nonnull
  @ReturnsMutableObject
  static MapBasedNamespaceContext createUBLNSContext (@Nonnull final String sNamespaceURI)
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
    final IValidationExecutorSet aVESInvoice = aRegistry.getOfID (PeppolValidation370.VID_OPENPEPPOL_T10_V2);
    final IValidationExecutorSet aVESCreditNote = aRegistry.getOfID (PeppolValidation370.VID_OPENPEPPOL_T14_V2);
    if (aVESInvoice == null || aVESCreditNote == null)
      throw new IllegalStateException ("Standard PEPPOL artefacts must be registered before third-party artefacts!");

    final String sPreReqInvoice = "/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'";
    final String sPreReqCreditNote = "/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'";

    final boolean bNotDeprecated = false;
    // Invoice
    final IValidationExecutorSet aVESInvoiceAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoice,
                                                                                                                               VID_OPENPEPPOL_T10_V2_5_AT,
                                                                                                                               "OpenPEPPOL Invoice (Austria)",
                                                                                                                               bNotDeprecated,
                                                                                                                               _createXSLT (INVOICE_AT_NAT,
                                                                                                                                            sPreReqInvoice,
                                                                                                                                            createUBLNSContext (EUBL21DocumentType.INVOICE.getNamespaceURI ()))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoiceAT,
                                                                                  VID_OPENPEPPOL_T10_V2_7_AT_GOV,
                                                                                  "OpenPEPPOL Invoice (Austrian Government)",
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (INVOICE_AT_GOV,
                                                                                               sPreReqInvoice,
                                                                                               createUBLNSContext (EUBL21DocumentType.INVOICE.getNamespaceURI ()))));

    // CreditNote
    final IValidationExecutorSet aVESCreditNoteAT = aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNote,
                                                                                                                                  VID_OPENPEPPOL_T14_V2_5_AT,
                                                                                                                                  "OpenPEPPOL Credit Note (Austria)",
                                                                                                                                  bNotDeprecated,
                                                                                                                                  _createXSLT (CREDIT_NOTE_AT_NAT,
                                                                                                                                               sPreReqCreditNote,
                                                                                                                                               createUBLNSContext (EUBL21DocumentType.CREDIT_NOTE.getNamespaceURI ()))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNoteAT,
                                                                                  VID_OPENPEPPOL_T14_V2_7_AT_GOV,
                                                                                  "OpenPEPPOL Credit Note (Austrian Government)",
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (CREDIT_NOTE_AT_GOV,
                                                                                               sPreReqCreditNote,
                                                                                               createUBLNSContext (EUBL21DocumentType.CREDIT_NOTE.getNamespaceURI ()))));
  }
}
