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
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.cii.d16b.CIID16BNamespaceContext;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.UBL21NamespaceContext;
import com.helger.xml.XMLSystemProperties;

/**
 * CEN/TC 434 - EN 16931 validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class EN16931Validation
{
  private static final String VERSION = "1.0.0";
  public static final VESID VID_UBL_1 = new VESID ("eu.cen.en16931", "ubl", VERSION);
  public static final VESID VID_CII_1 = new VESID ("eu.cen.en16931", "cii", VERSION);
  public static final VESID VID_EDIFACT_1 = new VESID ("eu.cen.en16931", "edifact", VERSION);

  static
  {
    // Required for EDIFACT ISO 20625
    XMLSystemProperties.setXMLMaxOccurIfLarger (9_999_999);
  }

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

    final boolean bDeprecated = false;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_CII_1,
                                                                           "EN 16931 CII " + VID_CII_1.getVersion (),
                                                                           CEN16931.VK_INVOICE_CII,
                                                                           bDeprecated,
                                                                           _createXSLT (CEN16931.INVOICE_CII_XSLT)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_EDIFACT_1,
                                                                           "EN 16931 EDIFACT/ISO 20625 " +
                                                                                          VID_EDIFACT_1.getVersion (),
                                                                           CEN16931.VK_INVOICE_EDIFACT,
                                                                           bDeprecated,
                                                                           _createXSLT (CEN16931.INVOICE_EDIFACT_XSLT)));
    // Pure SCH is quicker than XSLT!
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBL_1,
                                                                           "EN 16931 UBL " + VID_UBL_1.getVersion (),
                                                                           CEN16931.VK_INVOICE_UBL,
                                                                           bDeprecated,
                                                                           _createPure (CEN16931.INVOICE_UBL_SCH)));
  }
}
