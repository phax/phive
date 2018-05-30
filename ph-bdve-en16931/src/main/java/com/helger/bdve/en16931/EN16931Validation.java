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
package com.helger.bdve.en16931;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.cii.d16b.CIID16BNamespaceContext;
import com.helger.cii.d16b.ECIID16BDocumentType;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.jaxb.builder.IJAXBDocumentType;
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
  public static final VESID VID_UBL_1 = new VESID ("eu.cen.en16931", "ubl", VERSION_100);
  public static final VESID VID_CII_1 = new VESID ("eu.cen.en16931", "cii", VERSION_100);
  public static final VESID VID_EDIFACT_1 = new VESID ("eu.cen.en16931", "edifact", VERSION_100);

  // Predefined keys for UBL, CII and EDIFACT
  public static final ValidationArtefactKey VK_INVOICE_CII = new ValidationArtefactKey.Builder ().setDocType (ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE)
                                                                                                 .setNamespaceContext (CIID16BNamespaceContext.getInstance ())
                                                                                                 .build ();
  private static final IJAXBDocumentType EDIFACT_DOCTYPE = new JAXBDocumentType (MINVOIC.class,
                                                                                 new CommonsArrayList <> ("/schemas/INVOIC_D14B_ISO20625.xsd"),
                                                                                 null);
  public static final ValidationArtefactKey VK_INVOICE_EDIFACT = new ValidationArtefactKey.Builder ().setDocType (EDIFACT_DOCTYPE)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_INVOICE_UBL = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.INVOICE)
                                                                                                 .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                 .build ();

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return EN16931Validation.class.getClassLoader ();
  }

  public static final IReadableResource INVOICE_CII_SCH = new ClassPathResource ("/en16931/1.0.0/cii/schematron/EN16931-CII-validation.sch",
                                                                                 _getCL ());
  public static final IReadableResource INVOICE_CII_XSLT = new ClassPathResource ("/en16931/1.0.0/cii/xslt/EN16931-CII-validation.xslt",
                                                                                  _getCL ());
  public static final IReadableResource INVOICE_EDIFACT_SCH = new ClassPathResource ("/en16931/1.0.0/edifact/schematron/EN16931-EDIFACT-validation.sch",
                                                                                     _getCL ());
  public static final IReadableResource INVOICE_EDIFACT_XSLT = new ClassPathResource ("/en16931/1.0.0/edifact/xslt/EN16931-EDIFACT-validation.xslt",
                                                                                      _getCL ());
  public static final IReadableResource INVOICE_UBL_SCH = new ClassPathResource ("/en16931/1.0.0/ubl/schematron/EN16931-UBL-model.sch",
                                                                                 _getCL ());
  public static final IReadableResource INVOICE_UBL_XSLT = new ClassPathResource ("/en16931/1.0.0/ubl/xslt/EN16931-UBL-model.xslt",
                                                                                  _getCL ());

  private EN16931Validation ()
  {}

  @Nonnull
  private static ValidationArtefact _createPure (@Nonnull final IReadableResource aRes)
  {
    return new ValidationArtefact (EValidationType.SCHEMATRON_PURE, EN16931Validation.class.getClassLoader (), aRes);
  }

  @Nonnull
  private static ValidationArtefact _createXSLT (@Nonnull final IReadableResource aRes)
  {
    return new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, EN16931Validation.class.getClassLoader (), aRes);
  }

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

    final boolean bNotDeprecated = false;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_1,
                                                                           "EN 16931 CII " + VID_CII_1.getVersion (),
                                                                           VK_INVOICE_CII,
                                                                           bNotDeprecated,
                                                                           ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE,
                                                                           _createXSLT (INVOICE_CII_XSLT)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EDIFACT_1,
                                                                           "EN 16931 EDIFACT/ISO 20625 " +
                                                                                          VID_EDIFACT_1.getVersion (),
                                                                           VK_INVOICE_EDIFACT,
                                                                           bNotDeprecated,
                                                                           EDIFACT_DOCTYPE,
                                                                           _createXSLT (INVOICE_EDIFACT_XSLT)));
    // Pure SCH is quicker than XSLT!
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_1,
                                                                           "EN 16931 UBL " + VID_UBL_1.getVersion (),
                                                                           VK_INVOICE_UBL,
                                                                           bNotDeprecated,
                                                                           EUBL21DocumentType.INVOICE,
                                                                           _createPure (INVOICE_UBL_SCH)));
  }
}
