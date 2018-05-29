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
package com.helger.bdve.oioubl;

import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.spec.EBIITransaction;
import com.helger.bdve.spec.SpecificationTransaction;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * OIOUBL validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class COIOUBLValidationArtefact
{
  public static final ValidationArtefactKey VK_OIOUBL_APPLICATION_RESPONSE_T71 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T71)
                                                                                                                     .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_T19 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T19)
                                                                                                          .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_DELETION_T22 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T22)
                                                                                                                   .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE_T20 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T20)
                                                                                                                                    .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_PRICING_UPDATE_T21 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T21)
                                                                                                                         .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_REQUEST_T18 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T18)
                                                                                                                  .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CREDIT_NOTE_T14 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T14)
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_OIOUBL_INVOICE_T10 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T10)
                                                                                                        .build ();
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_T01 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T01)
                                                                                                      .build ();
  private static SpecificationTransaction T_O_C = new SpecificationTransaction ("urn:id:oioubl:order-cancellation",
                                                                                "Order Cancellation",
                                                                                EUBL21DocumentType.ORDER_CANCELLATION,
                                                                                UBL21NamespaceContext.getInstance ());
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_CANCELLATION = new ValidationArtefactKey.Builder ().setTransaction (T_O_C)
                                                                                                               .build ();
  private static SpecificationTransaction T_O_C2 = new SpecificationTransaction ("urn:id:oioubl:order-change",
                                                                                 "Order Change",
                                                                                 EUBL21DocumentType.ORDER_CHANGE,
                                                                                 UBL21NamespaceContext.getInstance ());
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_CHANGE = new ValidationArtefactKey.Builder ().setTransaction (T_O_C2)
                                                                                                         .build ();
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_RESPONSE_T76 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T76)
                                                                                                               .build ();
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_RESPONSE_SIMPLE_T02 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T02)
                                                                                                                      .build ();
  public static final ValidationArtefactKey VK_OIOUBL_REMINDER_T17 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T17)
                                                                                                         .build ();
  public static final ValidationArtefactKey VK_OIOUBL_STATEMENT_T26 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T26)
                                                                                                          .build ();

  private COIOUBLValidationArtefact ()
  {}
}
