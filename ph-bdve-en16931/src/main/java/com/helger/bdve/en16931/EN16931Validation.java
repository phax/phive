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
package com.helger.bdve.en16931;

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
import com.helger.cii.d16b.CIID16BNamespaceContext;
import com.helger.cii.d16b.ECIID16BDocumentType;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.jaxb.builder.JAXBDocumentType;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;
import com.helger.xml.XMLSystemProperties;

import eu.cen.en16931.edifact.invoicd14b.iso20625.MINVOIC;

/**
 * CEN/TC 434 - EN 16931 validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class EN16931Validation
{
  static
  {
    // Required for EDIFACT ISO 20625
    XMLSystemProperties.setXMLMaxOccurIfLarger (9_999_999);
  }

  private static final String VERSION_100 = "1.0.0";
  private static final String VERSION_110 = "1.1.0";
  private static final String VERSION_120 = "1.2.0";
  private static final String VERSION_121 = "1.2.1";
  private static final String VERSION_123 = "1.2.3";
  private static final String VERSION_130 = "1.3.0";
  private static final String VERSION_131 = "1.3.1";
  private static final String VERSION_132 = "1.3.2";

  // CII
  @Deprecated
  public static final VESID VID_CII_100 = new VESID ("eu.cen.en16931", "cii", VERSION_100);
  @Deprecated
  public static final VESID VID_CII_110 = new VESID ("eu.cen.en16931", "cii", VERSION_110);
  @Deprecated
  public static final VESID VID_CII_120 = new VESID ("eu.cen.en16931", "cii", VERSION_120);
  @Deprecated
  public static final VESID VID_CII_121 = new VESID ("eu.cen.en16931", "cii", VERSION_121);
  @Deprecated
  public static final VESID VID_CII_123 = new VESID ("eu.cen.en16931", "cii", VERSION_123);
  @Deprecated
  public static final VESID VID_CII_130 = new VESID ("eu.cen.en16931", "cii", VERSION_130);
  @Deprecated
  public static final VESID VID_CII_131 = new VESID ("eu.cen.en16931", "cii", VERSION_131);
  public static final VESID VID_CII_132 = new VESID ("eu.cen.en16931", "cii", VERSION_132);

  // EDIFACT
  @Deprecated
  public static final VESID VID_EDIFACT_100 = new VESID ("eu.cen.en16931", "edifact", VERSION_100);

  // UBL
  @Deprecated
  public static final VESID VID_UBL_INVOICE_100 = new VESID ("eu.cen.en16931", "ubl", VERSION_100);
  @Deprecated
  public static final VESID VID_UBL_INVOICE_110 = new VESID ("eu.cen.en16931", "ubl", VERSION_110);
  @Deprecated
  public static final VESID VID_UBL_INVOICE_120 = new VESID ("eu.cen.en16931", "ubl", VERSION_120);
  @Deprecated
  public static final VESID VID_UBL_INVOICE_121 = new VESID ("eu.cen.en16931", "ubl", VERSION_121);
  @Deprecated
  public static final VESID VID_UBL_INVOICE_123 = new VESID ("eu.cen.en16931", "ubl", VERSION_123);
  @Deprecated
  public static final VESID VID_UBL_INVOICE_130 = new VESID ("eu.cen.en16931", "ubl", VERSION_130);
  @Deprecated
  public static final VESID VID_UBL_INVOICE_131 = new VESID ("eu.cen.en16931", "ubl", VERSION_131);
  public static final VESID VID_UBL_INVOICE_132 = new VESID ("eu.cen.en16931", "ubl", VERSION_132);

  @Deprecated
  public static final VESID VID_UBL_CREDIT_NOTE_100 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_100);
  @Deprecated
  public static final VESID VID_UBL_CREDIT_NOTE_110 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_110);
  @Deprecated
  public static final VESID VID_UBL_CREDIT_NOTE_120 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_120);
  @Deprecated
  public static final VESID VID_UBL_CREDIT_NOTE_121 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_121);
  @Deprecated
  public static final VESID VID_UBL_CREDIT_NOTE_123 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_123);
  @Deprecated
  public static final VESID VID_UBL_CREDIT_NOTE_130 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_130);
  @Deprecated
  public static final VESID VID_UBL_CREDIT_NOTE_131 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_131);
  public static final VESID VID_UBL_CREDIT_NOTE_132 = new VESID ("eu.cen.en16931", "ubl-creditnote", VERSION_132);

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return EN16931Validation.class.getClassLoader ();
  }

  // CII
  @Deprecated
  public static final IReadableResource INVOICE_CII_100_XSLT = new ClassPathResource ("/en16931/1.0.0/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_CII_110_XSLT = new ClassPathResource ("/en16931/1.1.0/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_CII_120_XSLT = new ClassPathResource ("/en16931/1.2.0/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_CII_121_XSLT = new ClassPathResource ("/en16931/1.2.1/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_CII_123_XSLT = new ClassPathResource ("/en16931/1.2.3/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_CII_130_XSLT = new ClassPathResource ("/en16931/1.3.0/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_CII_131_XSLT = new ClassPathResource ("/en16931/1.3.1/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());
  public static final IReadableResource INVOICE_CII_132_XSLT = new ClassPathResource ("/en16931/1.3.2/cii/xslt/EN16931-CII-validation.xslt",
                                                                                      _getCL ());

  // EDIFACT
  @Deprecated
  public static final IReadableResource INVOICE_EDIFACT_100_XSLT = new ClassPathResource ("/en16931/1.0.0/edifact/xslt/EN16931-EDIFACT-validation.xslt",
                                                                                          _getCL ());

  // UBL
  @Deprecated
  public static final IReadableResource INVOICE_UBL_100_XSLT = new ClassPathResource ("/en16931/1.0.0/ubl/xslt/EN16931-UBL-model.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_UBL_110_XSLT = new ClassPathResource ("/en16931/1.1.0/ubl/xslt/EN16931-UBL-model.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_UBL_120_XSLT = new ClassPathResource ("/en16931/1.2.0/ubl/xslt/EN16931-UBL-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_UBL_121_XSLT = new ClassPathResource ("/en16931/1.2.1/ubl/xslt/EN16931-UBL-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_UBL_123_XSLT = new ClassPathResource ("/en16931/1.2.3/ubl/xslt/EN16931-UBL-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_UBL_130_XSLT = new ClassPathResource ("/en16931/1.3.0/ubl/xslt/EN16931-UBL-validation.xslt",
                                                                                      _getCL ());
  @Deprecated
  public static final IReadableResource INVOICE_UBL_131_XSLT = new ClassPathResource ("/en16931/1.3.1/ubl/xslt/EN16931-UBL-validation.xslt",
                                                                                      _getCL ());
  public static final IReadableResource INVOICE_UBL_132_XSLT = new ClassPathResource ("/en16931/1.3.2/ubl/xslt/EN16931-UBL-validation.xslt",
                                                                                      _getCL ());

  private EN16931Validation ()
  {}

  /**
   * Register all standard EN 16931 validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initEN16931 (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());
    LocationBeautifierSPI.addMappings (CIID16BNamespaceContext.getInstance ());

    final boolean bDeprecated = true;
    final boolean bNotDeprecated = false;

    // CII
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_100,
                                                                           "EN 16931 CII " + VID_CII_100.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_100_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_110,
                                                                           "EN 16931 CII " + VID_CII_110.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_110_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_120,
                                                                           "EN 16931 CII " + VID_CII_120.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_120_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_121,
                                                                           "EN 16931 CII " + VID_CII_121.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_121_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_123,
                                                                           "EN 16931 CII " + VID_CII_123.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_123_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_130,
                                                                           "EN 16931 CII " + VID_CII_130.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_130_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_131,
                                                                           "EN 16931 CII " + VID_CII_131.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_131_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_132,
                                                                           "EN 16931 CII " + VID_CII_132.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_CII_132_XSLT),
                                                                                                             null,
                                                                                                             CIID16BNamespaceContext.getInstance ())));

    // EDIFACT
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EDIFACT_100,
                                                                           "EN 16931 EDIFACT/ISO 20625 " + VID_EDIFACT_100.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (new JAXBDocumentType (MINVOIC.class,
                                                                                                                               new CommonsArrayList <> (new ClassPathResource ("/schemas/INVOIC_D14B_ISO20625.xsd",
                                                                                                                                                                               _getCL ())),
                                                                                                                               null)),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_EDIFACT_100_XSLT),
                                                                                                             null,
                                                                                                             null)));

    // UBL
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_100,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_100.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_100_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_100,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_100.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_110_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_110,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_110.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_110_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_110,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_110.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_110_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_120,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_120.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_120_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_120,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_120.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_120_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_121,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_121.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_121_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_121,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_121.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_121_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_123,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_123.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_123_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_123,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_123.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_123_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_130,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_130.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_130_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_130,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_130.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_130_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));

    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_131,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_131.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_131_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_131,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_131.getVersion (),
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_131_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));

    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_INVOICE_132,
                                                                           "EN 16931 UBL Invoice " + VID_UBL_INVOICE_132.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_132_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_CREDIT_NOTE_132,
                                                                           "EN 16931 UBL CreditNote " +
                                                                                                    VID_UBL_CREDIT_NOTE_132.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                     INVOICE_UBL_132_XSLT),
                                                                                                             null,
                                                                                                             UBL21NamespaceContext.getInstance ())));
  }
}
