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
package com.helger.bdve.ehf;

import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.spec.EBIITransaction;

/**
 * EHF validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CEHFValidationArtefact
{
  public static final ValidationArtefactKey VK_EHF_CATALOGUE_T19 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T19)
                                                                                                       .build ();
  public static final ValidationArtefactKey VK_EHF_CATALOGUE_RESPONSE_T58 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T58)
                                                                                                                .build ();
  public static final ValidationArtefactKey VK_EHF_CREDITNOTE_T14 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T14)
                                                                                                        .build ();
  public static final ValidationArtefactKey VK_EHF_DESPATCH_ADVICE_T14 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T16)
                                                                                                             .build ();
  public static final ValidationArtefactKey VK_EHF_INVOICE_T10 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T10)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_T01 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T01)
                                                                                                   .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_AGREEMENT_T110 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T110)
                                                                                                              .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_RESPONSE_T76 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T76)
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_EHF_PUNCH_OUT_T77 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T77)
                                                                                                       .build ();
  public static final ValidationArtefactKey VK_EHF_REMINDER_T17 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T17)
                                                                                                      .build ();

  private CEHFValidationArtefact ()
  {}
}
