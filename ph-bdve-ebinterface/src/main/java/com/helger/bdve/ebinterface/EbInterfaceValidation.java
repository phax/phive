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
package com.helger.bdve.ebinterface;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.commons.ValueEnforcer;
import com.helger.ebinterface.builder.EEbInterfaceDocumentType;

/**
 * Generic ebInterface validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class EbInterfaceValidation
{
  public static final String GROUP_ID = "at.ebinterface";

  public static final VESID VID_EBI_30 = new VESID (GROUP_ID, "invoice", "3.0");
  public static final VESID VID_EBI_302 = new VESID (GROUP_ID, "invoice", "3.02");
  public static final VESID VID_EBI_40 = new VESID (GROUP_ID, "invoice", "4.0");
  public static final VESID VID_EBI_41 = new VESID (GROUP_ID, "invoice", "4.1");
  public static final VESID VID_EBI_42 = new VESID (GROUP_ID, "invoice", "4.2");
  public static final VESID VID_EBI_43 = new VESID (GROUP_ID, "invoice", "4.3");
  public static final VESID VID_EBI_50 = new VESID (GROUP_ID, "invoice", "5.0");
  public static final VESID VID_EBI_60 = new VESID (GROUP_ID, "invoice", "6.0");

  private EbInterfaceValidation ()
  {}

  /**
   * Register all standard ebInterface validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initEbInterface (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final boolean bNotDeprecated = false;

    // No Schematrons here
    for (final EEbInterfaceDocumentType e : EEbInterfaceDocumentType.values ())
    {
      final String sVersion = e.name ().charAt (3) + "." + e.name ().substring (4);
      final VESID aVESID = new VESID (GROUP_ID, "invoice", sVersion);

      // No Schematrons here
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                             "ebInterface " + sVersion,
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (e)));
    }
  }

  // public static void main (final String [] args)
  // {
  // for (final EEbInterfaceDocumentType e : EEbInterfaceDocumentType.values ())
  // {
  // final String sVersion = e.name ().charAt (3) + "." + e.name ().substring
  // (4);
  // System.out.println ("public static final VESID VID_EBI_" +
  // e.name ().substring (3) +
  // " = new VESID (GROUP_ID, \"invoice\", \"" +
  // sVersion +
  // "\");");
  // }
  // }
}
