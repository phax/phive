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
package com.helger.bdve.cii;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.cii.d16b.CIID16BNamespaceContext;
import com.helger.cii.d16b.ECIID16BDocumentType;
import com.helger.commons.ValueEnforcer;

/**
 * Generic CII validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class CIIValidation
{
  public static final String GROUP_ID = "un.unece.uncefact";
  public static final String VERSION_D16B = "D16B";

  public static final VESID VID_CII_D16B_CROSSINDUSTRYINVOICE = new VESID (GROUP_ID,
                                                                           "crossindustryinvoice",
                                                                           VERSION_D16B);

  private CIIValidation ()
  {}

  /**
   * Register all standard CII D16B validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initCIID16B (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (CIID16BNamespaceContext.getInstance ());

    final boolean bNotDeprecated = false;
    for (final ECIID16BDocumentType e : ECIID16BDocumentType.values ())
    {
      final String sName = e.getLocalName ();
      final VESID aVESID = new VESID (GROUP_ID, sName.toLowerCase (Locale.US), VERSION_D16B);

      // No Schematrons here
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                             "CII " + sName + " " + VERSION_D16B,
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (e)));
    }
  }
}
