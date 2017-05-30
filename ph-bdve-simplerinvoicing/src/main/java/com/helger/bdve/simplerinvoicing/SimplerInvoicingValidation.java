/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
import com.helger.bdve.executorset.TypedValidationResource;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.IReadableResource;

/**
 * SimplerInvoicing validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class SimplerInvoicingValidation
{
  public static final VESID VID_SI_INVOICE_V11 = new VESID ("org.simplerinvoicing", "invoice", "1.1");
  public static final VESID VID_SI_INVOICE_V12 = new VESID ("org.simplerinvoicing", "invoice", "1.2");
  public static final VESID VID_SI_ORDER_V12 = new VESID ("org.simplerinvoicing", "order", "1.2");

  private SimplerInvoicingValidation ()
  {}

  @Nonnull
  private static TypedValidationResource _create (@Nonnull final IReadableResource aRes)
  {
    return new TypedValidationResource (aRes, EValidationType.SCHEMATRON_PURE);
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

    // SimplerInvoicing is self-contained
    // 1.1
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V11,
                                                                           "Simplerinvoicing Invoice 1.1",
                                                                           CSimplerInvoicingValidationArtefact.VK_SI_INVOICE,
                                                                           _create (CSimplerInvoicingValidationArtefact.INVOICE_SI11)));
    // 1.2
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_INVOICE_V12,
                                                                           "Simplerinvoicing Invoice 1.2",
                                                                           CSimplerInvoicingValidationArtefact.VK_SI_INVOICE,
                                                                           _create (CSimplerInvoicingValidationArtefact.INVOICE_SI12)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SI_ORDER_V12,
                                                                           "Simplerinvoicing Order 1.2",
                                                                           CSimplerInvoicingValidationArtefact.VK_SI_ORDER,
                                                                           _create (CSimplerInvoicingValidationArtefact.ORDER_SI12)));
  }
}
