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
package com.helger.bdve.simplerinvoicing;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.peppol.CPeppolValidationArtefact;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * SimplerInvoicing validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class SimplerInvoicingValidation
{
  public static final VESID VID_SI_INVOICE_V11 = new VESID ("org.simplerinvoicing", "invoice", "1.1");
  public static final VESID VID_SI_INVOICE_V11_STRICT = VID_SI_INVOICE_V11.getWithClassifier ("strict");
  public static final VESID VID_SI_INVOICE_V12 = new VESID ("org.simplerinvoicing", "invoice", "1.2");
  public static final VESID VID_SI_ORDER_V12 = new VESID ("org.simplerinvoicing", "order", "1.2");

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return SimplerInvoicingValidation.class.getClassLoader ();
  }

  // SimplerInvoicing
  // 1.1
  public static final IReadableResource INVOICE_SI11 = new ClassPathResource ("/simplerinvoicing/SI-UBL-INV-11.xslt",
                                                                              _getCL ());
  public static final IReadableResource INVOICE_SI11_STRICT = new ClassPathResource ("/simplerinvoicing/SI-UBL-INV-11-STRICT.xslt",
                                                                                     _getCL ());
  // 1.2
  public static final IReadableResource INVOICE_SI12 = new ClassPathResource ("/simplerinvoicing/SI-UBL-INV-12.xslt",
                                                                              _getCL ());
  public static final IReadableResource ORDER_SI12 = new ClassPathResource ("/simplerinvoicing/SI-UBL-PO-12.xslt",
                                                                            _getCL ());

  private SimplerInvoicingValidation ()
  {}

  @Nonnull
  private static ValidationArtefact _createXSLT (@Nonnull final IReadableResource aRes)
  {
    return new ValidationArtefact (EValidationType.SCHEMATRON_XSLT,
                                   SimplerInvoicingValidation.class.getClassLoader (),
                                   aRes);
  }

  /**
   * Register all standard SimplerInvoicing validation execution sets to the
   * provided registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initSimplerInvoicing (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    // SimplerInvoicing is self-contained
    final boolean bNotDeprecated = false;
    // 1.1
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V11,
                                                                           "Simplerinvoicing Invoice 1.1",
                                                                           CPeppolValidationArtefact.VK_INVOICE_04_T10,
                                                                           bNotDeprecated,
                                                                           EUBL21DocumentType.INVOICE,
                                                                           _createXSLT (INVOICE_SI11)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V11_STRICT,
                                                                           "Simplerinvoicing Invoice 1.1 (strict)",
                                                                           CPeppolValidationArtefact.VK_INVOICE_04_T10,
                                                                           bNotDeprecated,
                                                                           EUBL21DocumentType.INVOICE,
                                                                           _createXSLT (INVOICE_SI11_STRICT)));
    // 1.2
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V12,
                                                                           "Simplerinvoicing Invoice 1.2",
                                                                           CPeppolValidationArtefact.VK_INVOICE_04_T10,
                                                                           bNotDeprecated,
                                                                           EUBL21DocumentType.INVOICE,
                                                                           _createXSLT (INVOICE_SI12)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_ORDER_V12,
                                                                           "Simplerinvoicing Order 1.2",
                                                                           CPeppolValidationArtefact.VK_ORDER_03_T01,
                                                                           bNotDeprecated,
                                                                           EUBL21DocumentType.ORDER,
                                                                           _createXSLT (ORDER_SI12)));
  }
}
