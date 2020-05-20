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
package com.helger.bdve.ublbe;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.IValidationExecutorSet;
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
 * Generic e-FFF/UBL.BE validation configuration
 *
 * @author Philip Helger
 */
@Immutable
@SuppressWarnings ("deprecation")
public final class UBLBEValidation
{
  @Deprecated
  private static final String GROUPID_EFFF = "be.efff";
  @Deprecated
  public static final VESID VID_EFFF_CREDIT_NOTE = new VESID (GROUPID_EFFF, "credit-note", "3.0.0");
  @Deprecated
  public static final VESID VID_EFFF_INVOICE = new VESID (GROUPID_EFFF, "invoice", "3.0.0");

  private static final String GROUPID_UBL_BE = "be.ubl";
  @Deprecated
  public static final VESID VID_UBL_BE_CREDIT_NOTE_100 = new VESID (GROUPID_UBL_BE, "credit-note", "1.0.0");
  @Deprecated
  public static final VESID VID_UBL_BE_INVOICE_100 = new VESID (GROUPID_UBL_BE, "invoice", "1.0.0");

  @Deprecated
  public static final VESID VID_UBL_BE_CREDIT_NOTE_110 = new VESID (GROUPID_UBL_BE, "credit-note", "1.1.0");
  @Deprecated
  public static final VESID VID_UBL_BE_INVOICE_110 = new VESID (GROUPID_UBL_BE, "invoice", "1.1.0");

  public static final VESID VID_UBL_BE_CREDIT_NOTE_120 = new VESID (GROUPID_UBL_BE, "credit-note", "1.2.0");
  public static final VESID VID_UBL_BE_INVOICE_120 = new VESID (GROUPID_UBL_BE, "invoice", "1.2.0");

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return UBLBEValidation.class.getClassLoader ();
  }

  @Deprecated
  private static final IReadableResource BE_EFFF_300 = new ClassPathResource ("/ublbe/3.0.0/EFFF-UBL-T10.xsl",
                                                                              _getCL ());
  @Deprecated
  private static final IReadableResource UBL_BE_100 = new ClassPathResource ("/ublbe/en16931/v1/GLOBALUBL.BE.xslt",
                                                                             _getCL ());
  @Deprecated
  private static final IReadableResource UBL_BE_110 = new ClassPathResource ("/ublbe/en16931/v1.1/GLOBALUBL.BE-201911.xslt",
                                                                             _getCL ());
  private static final IReadableResource UBL_BE_120 = new ClassPathResource ("/ublbe/en16931/v1.2/GLOBALUBL.BE.xslt",
                                                                             _getCL ());

  private UBLBEValidation ()
  {}

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  /**
   * Register all standard e-FFF/UBL.BE validation execution sets to the
   * provided registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initUBLBE (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    final IValidationExecutorSet aVESInvoice = aRegistry.getOfID (PeppolValidation370.VID_OPENPEPPOL_T10_V2);
    final IValidationExecutorSet aVESCreditNote = aRegistry.getOfID (PeppolValidation370.VID_OPENPEPPOL_T14_V2);
    if (aVESInvoice == null || aVESCreditNote == null)
      throw new IllegalStateException ("Standard Peppol artefacts must be registered before e-FFF artefacts!");

    final boolean bDeprecated = true;
    final boolean bNotDeprecated = false;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESInvoice,
                                                                                  VID_EFFF_INVOICE,
                                                                                  "e-FFF Invoice " +
                                                                                                    VID_EFFF_INVOICE.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (BE_EFFF_300)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCreditNote,
                                                                                  VID_EFFF_CREDIT_NOTE,
                                                                                  "e-FFF Credit Note " +
                                                                                                        VID_EFFF_CREDIT_NOTE.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (BE_EFFF_300)));

    // Not derived
    // v1.0.0
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_BE_INVOICE_100,
                                                                           "UBL.BE Invoice " +
                                                                                                   VID_UBL_BE_INVOICE_100.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (UBL_BE_100)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_BE_CREDIT_NOTE_100,
                                                                           "UBL.BE Credit Note " +
                                                                                                       VID_UBL_BE_CREDIT_NOTE_100.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (UBL_BE_100)));

    // v1.1.0
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_BE_INVOICE_110,
                                                                           "UBL.BE Invoice " +
                                                                                                   VID_UBL_BE_INVOICE_110.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (UBL_BE_110)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_BE_CREDIT_NOTE_110,
                                                                           "UBL.BE Credit Note " +
                                                                                                       VID_UBL_BE_CREDIT_NOTE_110.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (UBL_BE_110)));

    // v1.2.0
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_BE_INVOICE_120,
                                                                           "UBL.BE Invoice " +
                                                                                                   VID_UBL_BE_INVOICE_120.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (UBL_BE_120)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_BE_CREDIT_NOTE_120,
                                                                           "UBL.BE Credit Note " +
                                                                                                       VID_UBL_BE_CREDIT_NOTE_120.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (UBL_BE_120)));
  }
}
