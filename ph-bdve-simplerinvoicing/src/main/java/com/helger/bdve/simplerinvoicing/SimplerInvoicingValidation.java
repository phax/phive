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
package com.helger.bdve.simplerinvoicing;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
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
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * SimplerInvoicing validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class SimplerInvoicingValidation
{
  @Deprecated
  public static final VESID VID_SI_INVOICE_V10 = new VESID ("org.simplerinvoicing", "invoice", "1.0");

  public static final VESID VID_SI_INVOICE_V11 = new VESID ("org.simplerinvoicing", "invoice", "1.1");

  public static final VESID VID_SI_INVOICE_V12 = new VESID ("org.simplerinvoicing", "invoice", "1.2");
  public static final VESID VID_SI_ORDER_V12 = new VESID ("org.simplerinvoicing", "order", "1.2");

  @Deprecated
  public static final VESID VID_SI_INVOICE_V20 = new VESID ("org.simplerinvoicing", "invoice", "2.0");
  @Deprecated
  public static final VESID VID_SI_CREDIT_NOTE_V20 = new VESID ("org.simplerinvoicing", "creditnote", "2.0");

  @Deprecated
  public static final VESID VID_SI_INVOICE_V201 = new VESID ("org.simplerinvoicing", "invoice", "2.0.1");
  @Deprecated
  public static final VESID VID_SI_CREDIT_NOTE_V201 = new VESID ("org.simplerinvoicing", "creditnote", "2.0.1");

  public static final VESID VID_SI_INVOICE_V202 = new VESID ("org.simplerinvoicing", "invoice", "2.0.2");
  public static final VESID VID_SI_CREDIT_NOTE_V202 = new VESID ("org.simplerinvoicing", "creditnote", "2.0.2");

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return SimplerInvoicingValidation.class.getClassLoader ();
  }

  // SimplerInvoicing
  // 1.0
  @Deprecated
  public static final IReadableResource INVOICE_SI10 = new ClassPathResource ("/simplerinvoicing/si-ubl-1.0.xslt",
                                                                              _getCL ());
  // 1.1
  public static final IReadableResource INVOICE_SI11 = new ClassPathResource ("/simplerinvoicing/si-ubl-1.1.xslt",
                                                                              _getCL ());
  // 1.2
  public static final IReadableResource INVOICE_SI12 = new ClassPathResource ("/simplerinvoicing/si-ubl-1.2.xslt",
                                                                              _getCL ());
  public static final IReadableResource ORDER_SI12 = new ClassPathResource ("/simplerinvoicing/si-ubl-1.2-purchaseorder.xslt",
                                                                            _getCL ());

  // 2.0
  @Deprecated
  public static final IReadableResource INVOICE_SI20 = new ClassPathResource ("/simplerinvoicing/si-ubl-2.0.xslt",
                                                                              _getCL ());

  // 2.0.1
  @Deprecated
  public static final IReadableResource INVOICE_SI201 = new ClassPathResource ("/simplerinvoicing/si-ubl-2.0.1.xslt",
                                                                               _getCL ());

  // 2.0.2
  public static final IReadableResource INVOICE_SI202 = new ClassPathResource ("/simplerinvoicing/si-ubl-2.0.2.xslt",
                                                                               _getCL ());

  private SimplerInvoicingValidation ()
  {}

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
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
    final boolean bDeprecated = true;
    final boolean bNotDeprecated = false;
    // 1.1
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V10,
                                                                           "Simplerinvoicing Invoice 1.0",
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (INVOICE_SI10)));

    // 1.1
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V11,
                                                                           "Simplerinvoicing Invoice 1.1",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (INVOICE_SI11)));

    // 1.2
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V12,
                                                                           "Simplerinvoicing Invoice 1.2",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (INVOICE_SI12)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_ORDER_V12,
                                                                           "Simplerinvoicing Order 1.2",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createXSLT (ORDER_SI12)));

    // 2.0
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V20,
                                                                           "Simplerinvoicing Invoice 2.0",
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (INVOICE_SI20)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_CREDIT_NOTE_V20,
                                                                           "Simplerinvoicing CreditNote 2.0",
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (INVOICE_SI20)));

    // 2.0.1
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V201,
                                                                           "Simplerinvoicing Invoice 2.0.1",
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (INVOICE_SI201)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_CREDIT_NOTE_V201,
                                                                           "Simplerinvoicing CreditNote 2.0.1",
                                                                           bDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (INVOICE_SI201)));

    // 2.0.2
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V202,
                                                                           "Simplerinvoicing Invoice 2.0.2",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (INVOICE_SI202)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_CREDIT_NOTE_V202,
                                                                           "Simplerinvoicing CreditNote 2.0.2",
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (INVOICE_SI202)));
  }
}
