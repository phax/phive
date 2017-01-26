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

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;

/**
 * SimplerInvoicing validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class SimplerInvoicingValidation
{
  public static final VESID VID_SIMPLERINVOICING_V11 = new VESID ("org.simplerinvoicing", "invoice", "1.1");
  public static final VESID VID_SIMPLERINVOICING_V11_STRICT = VID_SIMPLERINVOICING_V11.getWithClassifier ("strict");

  private SimplerInvoicingValidation ()
  {}

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
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SIMPLERINVOICING_V11,
                                                                           "Simplerinvoicing 1.1",
                                                                           CSimplerInvoicingValidationArtefact.VK_SIMPLERINVOICING,
                                                                           CSimplerInvoicingValidationArtefact.INVOICE_SIMPLER_INVOICING));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_SIMPLERINVOICING_V11_STRICT,
                                                                           "Simplerinvoicing 1.1 (strict)",
                                                                           CSimplerInvoicingValidationArtefact.VK_SIMPLERINVOICING_STRICT,
                                                                           CSimplerInvoicingValidationArtefact.INVOICE_SIMPLER_INVOICING_STRICT));
  }
}
