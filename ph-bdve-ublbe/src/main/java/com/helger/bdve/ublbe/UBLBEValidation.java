/**
 * Copyright (C) 2018 Philip Helger (www.helger.com)
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
 * Generic UBL.BE validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class UBLBEValidation
{
  private static final String GROUPID = "be.ubl";
  private static final String VERSION = "3.0.0";
  public static final VESID VID_UBLBE_CREDIT_NOTE = new VESID (GROUPID, "credit-note", VERSION);
  public static final VESID VID_UBLBE_INVOICE = new VESID (GROUPID, "invoice", VERSION);

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return UBLBEValidation.class.getClassLoader ();
  }

  private static final IReadableResource UBLBE_EFFF = new ClassPathResource ("/ublbe/3.0.0/EFFF-UBL-T10.xsl",
                                                                             _getCL ());

  private UBLBEValidation ()
  {}

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, _getCL (), aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  /**
   * Register all standard UBL.BE validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initUBLBE (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    final boolean bNotDeprecated = false;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBLBE_CREDIT_NOTE,
                                                                           "UBL.BE Credit Note " +
                                                                                                  VID_UBLBE_CREDIT_NOTE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createXSLT (UBLBE_EFFF)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_UBLBE_INVOICE,
                                                                           "UBL.BE Invoice " +
                                                                                              VID_UBLBE_INVOICE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createXSLT (UBLBE_EFFF)));
  }
}
