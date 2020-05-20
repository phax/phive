/**
 * Copyright (C) 2019-2020 Philip Helger (www.helger.com)
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
 * Generic XRechnung validation configuration. It is based on the EN16931
 * validation artefacts.
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

  @Deprecated
  public static final VESID VID_XRECHNUNG_CII_120 = new VESID (GROUP_ID, "cii", "1.2.0");
  @Deprecated
  public static final VESID VID_XRECHNUNG_UBL_CREDITNOTE_120 = new VESID (GROUP_ID, "ubl-creditnote", "1.2.0");
  @Deprecated
  public static final VESID VID_XRECHNUNG_UBL_INVOICE_120 = new VESID (GROUP_ID, "ubl-invoice", "1.2.0");

  @Deprecated
  public static final VESID VID_XRECHNUNG_CII_121 = new VESID (GROUP_ID, "cii", "1.2.1");
  @Deprecated
  public static final VESID VID_XRECHNUNG_UBL_CREDITNOTE_121 = new VESID (GROUP_ID, "ubl-creditnote", "1.2.1");
  @Deprecated
  public static final VESID VID_XRECHNUNG_UBL_INVOICE_121 = new VESID (GROUP_ID, "ubl-invoice", "1.2.1");

  public static final VESID VID_XRECHNUNG_CII_122 = new VESID (GROUP_ID, "cii", "1.2.2");
  public static final VESID VID_XRECHNUNG_UBL_CREDITNOTE_122 = new VESID (GROUP_ID, "ubl-creditnote", "1.2.2");
  public static final VESID VID_XRECHNUNG_UBL_INVOICE_122 = new VESID (GROUP_ID, "ubl-invoice", "1.2.2");

  private XRechnungValidation ()
  {}

  @Nonnull
  private static IValidationExecutor _createXSLT (@Nonnull final IReadableResource aRes)
  {
    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, aRes);
    return new ValidationExecutorSchematron (aVA, null, null);
  }

  /**
   * Register all standard XRechnung validation execution sets to the provided
   * registry. Make sure to register the EN16931 artefacts before you register
   * this one.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  @SuppressWarnings ("deprecation")
  public static void initXRechnung (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final boolean bNotDeprecated = false;
    final boolean bDeprecated = true;

    // Extending third-party artefacts
    final IValidationExecutorSet aVESCII110 = aRegistry.getOfID (EN16931Validation.VID_CII_110);
    final IValidationExecutorSet aVESUBLCreditNote110 = aRegistry.getOfID (EN16931Validation.VID_UBL_CREDIT_NOTE_110);
    final IValidationExecutorSet aVESUBLInvoice110 = aRegistry.getOfID (EN16931Validation.VID_UBL_INVOICE_110);
    if (aVESCII110 == null || aVESUBLCreditNote110 == null || aVESUBLInvoice110 == null)
      throw new IllegalStateException ("Standard EN16931 artefacts 1.1.0 must be registered before XRechnung artefacts!");

    final IValidationExecutorSet aVESCII121 = aRegistry.getOfID (EN16931Validation.VID_CII_121);
    final IValidationExecutorSet aVESUBLCreditNote121 = aRegistry.getOfID (EN16931Validation.VID_UBL_CREDIT_NOTE_121);
    final IValidationExecutorSet aVESUBLInvoice121 = aRegistry.getOfID (EN16931Validation.VID_UBL_INVOICE_121);
    if (aVESCII121 == null || aVESUBLCreditNote121 == null || aVESUBLInvoice121 == null)
      throw new IllegalStateException ("Standard EN16931 artefacts 1.2.1 must be registered before XRechnung artefacts!");

    final IValidationExecutorSet aVESCII130 = aRegistry.getOfID (EN16931Validation.VID_CII_130);
    final IValidationExecutorSet aVESUBLCreditNote130 = aRegistry.getOfID (EN16931Validation.VID_UBL_CREDIT_NOTE_130);
    final IValidationExecutorSet aVESUBLInvoice130 = aRegistry.getOfID (EN16931Validation.VID_UBL_INVOICE_130);
    if (aVESCII130 == null || aVESUBLCreditNote130 == null || aVESUBLInvoice130 == null)
      throw new IllegalStateException ("Standard EN16931 artefacts 1.3.0 must be registered before XRechnung artefacts!");

    // Just new Schematrons on top
    // v1.2.0 (based on 1.1.0)
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCII110,
                                                                                  VID_XRECHNUNG_CII_120,
                                                                                  "XRechnung CII " +
                                                                                                         VID_XRECHNUNG_CII_120.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.0/XRechnung-CII-validation.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLCreditNote110,
                                                                                  VID_XRECHNUNG_UBL_CREDITNOTE_120,
                                                                                  "XRechnung UBL CrediteNote " +
                                                                                                                    VID_XRECHNUNG_UBL_CREDITNOTE_120.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.0/XRechnung-UBL-validation-CreditNote.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLInvoice110,
                                                                                  VID_XRECHNUNG_UBL_INVOICE_120,
                                                                                  "XRechnung UBL Invoice " +
                                                                                                                 VID_XRECHNUNG_UBL_INVOICE_120.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.0/XRechnung-UBL-validation-Invoice.xslt"))));

    // v1.2.1 (based on 1.2.1)
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCII121,
                                                                                  VID_XRECHNUNG_CII_121,
                                                                                  "XRechnung CII " +
                                                                                                         VID_XRECHNUNG_CII_121.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.1/XRechnung-CII-validation.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLCreditNote121,
                                                                                  VID_XRECHNUNG_UBL_CREDITNOTE_121,
                                                                                  "XRechnung UBL CrediteNote " +
                                                                                                                    VID_XRECHNUNG_UBL_CREDITNOTE_121.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.1/XRechnung-UBL-validation-CreditNote.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLInvoice121,
                                                                                  VID_XRECHNUNG_UBL_INVOICE_121,
                                                                                  "XRechnung UBL Invoice " +
                                                                                                                 VID_XRECHNUNG_UBL_INVOICE_121.getVersion (),
                                                                                  bDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.1/XRechnung-UBL-validation-Invoice.xslt"))));

    // v1.2.2 (based on 1.3.0)
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESCII130,
                                                                                  VID_XRECHNUNG_CII_122,
                                                                                  "XRechnung CII " +
                                                                                                         VID_XRECHNUNG_CII_122.getVersion (),
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.2/XRechnung-CII-validation.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLCreditNote130,
                                                                                  VID_XRECHNUNG_UBL_CREDITNOTE_122,
                                                                                  "XRechnung UBL CrediteNote " +
                                                                                                                    VID_XRECHNUNG_UBL_CREDITNOTE_122.getVersion (),
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.2/XRechnung-UBL-validation-CreditNote.xslt"))));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.createDerived (aVESUBLInvoice130,
                                                                                  VID_XRECHNUNG_UBL_INVOICE_122,
                                                                                  "XRechnung UBL Invoice " +
                                                                                                                 VID_XRECHNUNG_UBL_INVOICE_122.getVersion (),
                                                                                  bNotDeprecated,
                                                                                  _createXSLT (new ClassPathResource ("/schematron/1.2.2/XRechnung-UBL-validation-Invoice.xslt"))));
  }
}
