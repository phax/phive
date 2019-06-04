/**
 * Copyright (C) 2014-2019 Philip Helger (www.helger.com)
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
package com.helger.bdve.xrechnung;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.en16931.EN16931Validation;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Generic XRechnung validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class XRechnungValidation
{
  @Nonnull
  private static ClassLoader _getCL ()
  {
    return XRechnungValidation.class.getClassLoader ();
  }

  public static final String GROUP_ID = "de.xrechnung";

  public static final VESID VID_XRECHNUNG_CII_120 = new VESID (GROUP_ID, "cii", "1.2.0");
  public static final VESID VID_XRECHNUNG_UBL_CREDITNOTE_120 = new VESID (GROUP_ID, "ubl-creditnote", "1.2.0");
  public static final VESID VID_XRECHNUNG_UBL_INVOICE_120 = new VESID (GROUP_ID, "ubl-invoice", "1.2.0");

  private XRechnungValidation ()
  {}

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes)
  {
    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, _getCL (), aRes);
    return new ValidationExecutorSchematron (aVA, null, null);
  }

  /**
   * Register all standard XRechnung validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  @SuppressWarnings ("deprecation")
  public static void initXRechnung (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final boolean bNotDeprecated = false;

    // Extending third-party artefacts
    final IValidationExecutorSet aVESCII = aRegistry.getOfID (EN16931Validation.VID_CII_110);
    final IValidationExecutorSet aVESUBLCreditNote = aRegistry.getOfID (EN16931Validation.VID_UBL_CREDIT_NOTE_110);
    final IValidationExecutorSet aVESUBLInvoice = aRegistry.getOfID (EN16931Validation.VID_UBL_INVOICE_110);
    if (aVESCII == null || aVESUBLCreditNote == null || aVESUBLInvoice == null)
      throw new IllegalStateException ("Standard EN16931 artefacts must be registered before XRechnung artefacts!");

    // Just new Schematrons on top
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCII,
                                                                                  VID_XRECHNUNG_CII_120,
                                                                                  "XRechnung CII " +
                                                                                                         VID_XRECHNUNG_CII_120.getVersion (),
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.0/XRechnung-CII-validation.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLCreditNote,
                                                                                  VID_XRECHNUNG_UBL_CREDITNOTE_120,
                                                                                  "XRechnung UBL CrediteNote " +
                                                                                                                    VID_XRECHNUNG_UBL_CREDITNOTE_120.getVersion (),
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.0/XRechnung-UBL-validation-CreditNote.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLInvoice,
                                                                                  VID_XRECHNUNG_UBL_INVOICE_120,
                                                                                  "XRechnung UBL Invoice " +
                                                                                                                 VID_XRECHNUNG_UBL_INVOICE_120.getVersion (),
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.0/XRechnung-UBL-validation-Invoice.xslt"))));
  }
}
