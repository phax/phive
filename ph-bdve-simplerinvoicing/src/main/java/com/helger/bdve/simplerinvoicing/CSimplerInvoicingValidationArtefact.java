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

import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.key.ValidationArtefactSectorKey;
import com.helger.bdve.peppol.CPeppolValidationArtefact;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Peppol validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CSimplerInvoicingValidationArtefact
{
  public static final ValidationArtefactSectorKey SECTOR_NL_SIMPLERINVOICING = new ValidationArtefactSectorKey ("NLSI",
                                                                                                                "SimplerInvoicing");
  public static final ValidationArtefactSectorKey SECTOR_NL_SIMPLERINVOICING_STRICT = new ValidationArtefactSectorKey ("NLSIS",
                                                                                                                       "SimplerInvoicing (Strict)");

  public static final ValidationArtefactKey VK_SIMPLERINVOICING = new ValidationArtefactKey.Builder (CPeppolValidationArtefact.VK_INVOICE_04_T10).setCountry ("NL")
                                                                                                                                                 .setSectorKey (CSimplerInvoicingValidationArtefact.SECTOR_NL_SIMPLERINVOICING)
                                                                                                                                                 .build ();
  public static final ValidationArtefactKey VK_SIMPLERINVOICING_STRICT = new ValidationArtefactKey.Builder (CPeppolValidationArtefact.VK_INVOICE_04_T10).setCountry ("NL")
                                                                                                                                                        .setSectorKey (CSimplerInvoicingValidationArtefact.SECTOR_NL_SIMPLERINVOICING_STRICT)
                                                                                                                                                        .build ();

  // SimplerInvoicing
  public static final IReadableResource INVOICE_SIMPLER_INVOICING = new ClassPathResource ("/simplerinvoicing/SI-UBL-INV.SCH");
  public static final IReadableResource INVOICE_SIMPLER_INVOICING_STRICT = new ClassPathResource ("/simplerinvoicing/SI-UBL-INV-STRICT.SCH");

  private CSimplerInvoicingValidationArtefact ()
  {}
}
