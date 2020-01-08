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
package com.helger.bdve.teapps;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;

/**
 * Generic TEAPPS validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class TEAPPSValidation
{
  public static final String GROUP_ID = "com.tieto";

  public static final VESID VID_TEAPPS_272 = new VESID (GROUP_ID, "teappsxml", "2.7.2");
  public static final VESID VID_TEAPPS_30 = new VESID (GROUP_ID, "teappsxml", "3.0");

  private TEAPPSValidation ()
  {}

  /**
   * Register all standard TEAPPS validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initTEAPPS (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final boolean bNotDeprecated = false;

    // No Schematrons here
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_TEAPPS_272,
                                                                           "TEAPPSXML " + VID_TEAPPS_272.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (new ClassPathResource ("/schemas/TEAPPSXMLv272_schema_INVOICES.xsd"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_TEAPPS_30,
                                                                           "TEAPPSXML " + VID_TEAPPS_30.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (new ClassPathResource ("/schemas/teappsxmlv30_schema_invoices_0.xsd"))));
  }
}
