/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * Peppol validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CPeppolValidationArtefact
{
  @Nonnull
  private static ClassLoader _getCL ()
  {
    return CPeppolValidationArtefact.class.getClassLoader ();
  }

  // Predefined transaction keys, ordered by BIS and than by BII2 transaction
  public static final ValidationArtefactKey VK_CATALOGUE_01_T19 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.CATALOGUE)
                                                                                                      .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_CATALOGUE_01_T58 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.APPLICATION_RESPONSE)
                                                                                                      .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_ORDER_03_T01 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.ORDER)
                                                                                                  .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                  .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.INVOICE)
                                                                                                    .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.CREDIT_NOTE)
                                                                                                    .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_PUNCH_OUT_18_T77 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.CATALOGUE)
                                                                                                      .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T01 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.ORDER)
                                                                                                     .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T76 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.ORDER_RESPONSE)
                                                                                                     .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_DESPATCH_ADVICE_30_T16 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.DESPATCH_ADVICE)
                                                                                                            .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_MLR_36_T71 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.APPLICATION_RESPONSE)
                                                                                                .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                .build ();
  public static final ValidationArtefactKey VK_ORDER_AGREEMENT_42_T110 = new ValidationArtefactKey.Builder ().setDocType (EUBL21DocumentType.ORDER_RESPONSE)
                                                                                                             .setNamespaceContext (UBL21NamespaceContext.getInstance ())
                                                                                                             .build ();

  // Third party
  public static final IReadableResource INVOICE_AT_NAT = new ClassPathResource ("/thirdparty/invoice/ATNAT-UBL-T10.sch",
                                                                                _getCL ());
  public static final IReadableResource INVOICE_AT_GOV = new ClassPathResource ("/thirdparty/invoice/ATGOV-UBL-T10.sch",
                                                                                _getCL ());

  public static final IReadableResource CREDIT_NOTE_AT_NAT = new ClassPathResource ("/thirdparty/creditnote/ATNAT-UBL-T14.sch",
                                                                                    _getCL ());
  public static final IReadableResource CREDIT_NOTE_AT_GOV = new ClassPathResource ("/thirdparty/creditnote/ATGOV-UBL-T14.sch",
                                                                                    _getCL ());

  private CPeppolValidationArtefact ()
  {}
}
