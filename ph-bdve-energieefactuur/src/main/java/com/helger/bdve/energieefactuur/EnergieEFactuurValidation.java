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
package com.helger.bdve.energieefactuur;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.execute.ValidationExecutorXSDPartial;
import com.helger.bdve.execute.XSDPartialContext;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.simplerinvoicing.SimplerInvoicingValidation;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.xpath.XPathHelper;

/**
 * Energie e-Factuur validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class EnergieEFactuurValidation
{
  public static final String GROUP_ID = "nl.energie-efactuur";
  public static final VESID VID_ENERGIE_EFACTUUR_1_0_0 = new VESID (GROUP_ID, "energie-efactuur", "1.0.0");
  public static final VESID VID_ENERGIE_EFACTUUR_1_0_1 = new VESID (GROUP_ID, "energie-efactuur", "1.0.1");
  public static final VESID VID_ENERGIE_EFACTUUR_2_0_0 = new VESID (GROUP_ID, "energie-efactuur", "2.0.0");
  public static final VESID VID_ENERGIE_EFACTUUR_3_0_0 = new VESID (GROUP_ID, "energie-efactuur", "3.0.0");

  /** Namespace URL for Energie e-Factuur 1.0.0 */
  public static final String SEEF_EXT_NS_1_0_0 = "urn:www.energie-efactuur.nl:profile:invoice:ver1.0.0";
  /** Namespace URL for Energie e-Factuur 1.0.1 */
  public static final String SEEF_EXT_NS_1_0_1 = "urn:www.energie-efactuur.nl:profile:invoice:ver1.0";
  /** Namespace URL for Energie e-Factuur 2.0.0 */
  public static final String SEEF_EXT_NS_2_0_0 = "urn:www.energie-efactuur.nl:profile:invoice:ver2.0";
  /** Namespace URL for Energie e-Factuur 3.0.0 */
  public static final String SEEF_EXT_NS_3_0_0 = "urn:www.energie-efactuur.nl:profile:invoice:ver3.0";

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return EnergieEFactuurValidation.class.getClassLoader ();
  }

  public static final IReadableResource SEEF_EXT_XSD_1_0_0 = new ClassPathResource ("/schemas/energieefactuur/SEeF_UBLExtension_v1.0.0.xsd",
                                                                                    _getCL ());
  public static final IReadableResource SEEF_EXT_XSD_1_0_1 = new ClassPathResource ("/schemas/energieefactuur/SEeF_UBLExtension_v1.0.1.xsd",
                                                                                    _getCL ());
  public static final IReadableResource SEEF_EXT_XSD_2_0_0 = new ClassPathResource ("/schemas/energieefactuur/SEeF_UBLExtension_v2.0.0.xsd",
                                                                                    _getCL ());
  public static final IReadableResource SEEF_EXT_XSD_3_0_0 = new ClassPathResource ("/schemas/energieefactuur/SEeF_UBLExtension_v3.0.0.xsd",
                                                                                    _getCL ());

  private EnergieEFactuurValidation ()
  {}

  /**
   * Register all standard Energie eFactuur validation execution sets to the
   * provided registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  @SuppressWarnings ("deprecation")
  public static void initEnergieEFactuur (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    final boolean bNotDeprecated = false;

    {
      // Create XPathExpression for extension validation
      final XPathFactory aXF = XPathHelper.createXPathFactorySaxonFirst ();
      final XPath aXP = aXF.newXPath ();
      final MapBasedNamespaceContext aCtx = UBL21NamespaceContext.getInstance ().getClone ();
      aCtx.addMapping ("ubl", EUBL21DocumentType.INVOICE.getNamespaceURI ());
      aCtx.addMapping ("seef", SEEF_EXT_NS_1_0_0);
      aXP.setNamespaceContext (aCtx);
      final XPathExpression aXE100 = XPathHelper.createNewXPathExpression (aXP,
                                                                           "/ubl:Invoice/cec:UBLExtensions/cec:UBLExtension/cec:ExtensionContent/seef:UtilityConsumptionPoint");

      // Same Schematrons as SimplerInvoicing - and same classloader!
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_ENERGIE_EFACTUUR_1_0_0,
                                                                             "Energie eFactuur " +
                                                                                                         VID_ENERGIE_EFACTUUR_1_0_0.getVersion (),
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                             new ValidationExecutorXSDPartial (new ValidationArtefact (EValidationType.PARTIAL_XSD,
                                                                                                                                       SEEF_EXT_XSD_1_0_0),
                                                                                                               new XSDPartialContext (aXE100,
                                                                                                                                      Integer.valueOf (1),
                                                                                                                                      Integer.valueOf (1))),
                                                                             new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                       SimplerInvoicingValidation.INVOICE_SI11),
                                                                                                               null,
                                                                                                               aCtx)));
    }

    {
      // Create XPathExpression for extension validation
      final XPathFactory aXF = XPathHelper.createXPathFactorySaxonFirst ();
      final XPath aXP = aXF.newXPath ();
      final MapBasedNamespaceContext aCtx = UBL21NamespaceContext.getInstance ().getClone ();
      aCtx.addMapping ("ubl", EUBL21DocumentType.INVOICE.getNamespaceURI ());
      aCtx.addMapping ("seef", SEEF_EXT_NS_1_0_1);
      aXP.setNamespaceContext (aCtx);
      final XPathExpression aXE101 = XPathHelper.createNewXPathExpression (aXP,
                                                                           "/ubl:Invoice/cec:UBLExtensions/cec:UBLExtension/cec:ExtensionContent/seef:SEEFExtensionWrapper");

      // Same Schematrons as SimplerInvoicing - and same classloader!
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_ENERGIE_EFACTUUR_1_0_1,
                                                                             "Energie eFactuur " +
                                                                                                         VID_ENERGIE_EFACTUUR_1_0_1.getVersion (),
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                             new ValidationExecutorXSDPartial (new ValidationArtefact (EValidationType.PARTIAL_XSD,
                                                                                                                                       SEEF_EXT_XSD_1_0_1),
                                                                                                               new XSDPartialContext (aXE101,
                                                                                                                                      Integer.valueOf (1),
                                                                                                                                      Integer.valueOf (1))),
                                                                             new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                       SimplerInvoicingValidation.INVOICE_SI11),
                                                                                                               null,
                                                                                                               aCtx)));
    }

    {
      // Create XPathExpression for extension validation
      final XPathFactory aXF = XPathHelper.createXPathFactorySaxonFirst ();
      final XPath aXP = aXF.newXPath ();
      final MapBasedNamespaceContext aCtx = UBL21NamespaceContext.getInstance ().getClone ();
      aCtx.addMapping ("ubl", EUBL21DocumentType.INVOICE.getNamespaceURI ());
      aCtx.addMapping ("eef", SEEF_EXT_NS_2_0_0);
      aXP.setNamespaceContext (aCtx);
      final XPathExpression aXE200 = XPathHelper.createNewXPathExpression (aXP,
                                                                           "/ubl:Invoice/cec:UBLExtensions/cec:UBLExtension/cec:ExtensionContent/eef:SEEFExtensionWrapper");

      // Same Schematrons as SimplerInvoicing - and same classloader!
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_ENERGIE_EFACTUUR_2_0_0,
                                                                             "Energie eFactuur " +
                                                                                                         VID_ENERGIE_EFACTUUR_2_0_0.getVersion (),
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                             new ValidationExecutorXSDPartial (new ValidationArtefact (EValidationType.PARTIAL_XSD,
                                                                                                                                       SEEF_EXT_XSD_2_0_0),
                                                                                                               new XSDPartialContext (aXE200,
                                                                                                                                      Integer.valueOf (1),
                                                                                                                                      Integer.valueOf (1))),
                                                                             new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                       SimplerInvoicingValidation.INVOICE_SI12),
                                                                                                               null,
                                                                                                               aCtx)));
    }

    {
      // Create XPathExpression for extension validation
      final XPathFactory aXF = XPathHelper.createXPathFactorySaxonFirst ();
      final XPath aXP = aXF.newXPath ();
      final MapBasedNamespaceContext aCtx = UBL21NamespaceContext.getInstance ().getClone ();
      aCtx.addMapping ("ubl", EUBL21DocumentType.INVOICE.getNamespaceURI ());
      aCtx.addMapping ("eef", SEEF_EXT_NS_3_0_0);
      aXP.setNamespaceContext (aCtx);
      final XPathExpression aXE300 = XPathHelper.createNewXPathExpression (aXP,
                                                                           "/ubl:Invoice/cec:UBLExtensions/cec:UBLExtension/cec:ExtensionContent/eef:SEEFExtensionWrapper");

      // Same Schematrons as SimplerInvoicing - and same classloader!
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_ENERGIE_EFACTUUR_3_0_0,
                                                                             "Energie eFactuur " +
                                                                                                         VID_ENERGIE_EFACTUUR_3_0_0.getVersion (),
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                             new ValidationExecutorXSDPartial (new ValidationArtefact (EValidationType.PARTIAL_XSD,
                                                                                                                                       SEEF_EXT_XSD_3_0_0),
                                                                                                               new XSDPartialContext (aXE300,
                                                                                                                                      Integer.valueOf (1),
                                                                                                                                      Integer.valueOf (1))),
                                                                             new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                                                                                                                       SimplerInvoicingValidation.INVOICE_SI20),
                                                                                                               null,
                                                                                                               aCtx)));
    }
  }
}
