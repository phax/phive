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
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * EHF validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CEHFValidationArtefact
{
  public static final ValidationArtefactKey VK_EHF_CATALOGUE_T19 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.CATALOGUE)
                                                                                                       .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                       .build ();
  public static final ValidationArtefactKey VK_EHF_CATALOGUE_RESPONSE_T58 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.APPLICATION_RESPONSE)
                                                                                                                .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                                .build ();
  public static final ValidationArtefactKey VK_EHF_CREDITNOTE_T14 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.CREDIT_NOTE)
                                                                                                        .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                        .build ();
  public static final ValidationArtefactKey VK_EHF_DESPATCH_ADVICE_T14 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.DESPATCH_ADVICE)
                                                                                                             .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                             .build ();
  public static final ValidationArtefactKey VK_EHF_INVOICE_T10 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.INVOICE)
                                                                                                     .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_T01 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.ORDER)
                                                                                                   .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                   .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_AGREEMENT_T110 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.ORDER_RESPONSE)
                                                                                                              .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                              .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_RESPONSE_T76 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.ORDER_RESPONSE)
                                                                                                            .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_EHF_PUNCH_OUT_T77 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.CATALOGUE)
                                                                                                       .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                       .build ();
  public static final ValidationArtefactKey VK_EHF_REMINDER_T17 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.REMINDER)
                                                                                                      .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                      .build ();

  private CEHFValidationArtefact ()
  {}
}
