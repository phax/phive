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
package com.helger.bdve.energieefactuur;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.key.ValidationArtefactSectorKey;
import com.helger.bdve.simplerinvoicing.CSimplerInvoicingValidationArtefact;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Energie eFactuur validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CEnergieEFactuur
{
  /** Namespace URL for Energie e-Factuur 2.0.0 */
  public static final String SEEF_EXT_NS_2_0_0 = "urn:www.energie-efactuur.nl:profile:invoice:ver2.0";

  public static final ValidationArtefactSectorKey SECTOR_NL_EE = new ValidationArtefactSectorKey ("NLEE",
                                                                                                  "Energie eFactuur");

  public static final ValidationArtefactKey VK_ENERGIE_EFACTUUR = new ValidationArtefactKey.Builder (CSimplerInvoicingValidationArtefact.VK_SI_INVOICE).setSectorKey (SECTOR_NL_EE)
                                                                                                                                                       .build ();

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return CEnergieEFactuur.class.getClassLoader ();
  }

  public static final IReadableResource SEEF_EXT_XSD_2_0_0 = new ClassPathResource ("/schemas/energieefactuur/SEeF_UBLExtension_v2.0.0.xsd",
                                                                                    _getCL ());

  private CEnergieEFactuur ()
  {}
}
