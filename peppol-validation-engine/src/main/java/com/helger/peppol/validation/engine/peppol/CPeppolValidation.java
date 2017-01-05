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
package com.helger.peppol.validation.engine.peppol;

import javax.annotation.concurrent.Immutable;

import com.helger.bdve.ValidationArtefactKey;
import com.helger.bdve.ValidationArtefactSectorKey;
import com.helger.bdve.spec.BusinessSpecification;
import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.peppol.validation.api.peppol.EBII2Transaction;

/**
 * This class contains the validation transactions used in PEPPOL. It uses
 * transactions of type {@link EBII2Transaction}.
 *
 * @author Philip Helger
 */
@Immutable
public class CPeppolValidation
{
  public static final IBusinessSpecification CATALOGUE_01 = new BusinessSpecification ("openpeppol-bis-01",
                                                                                       "OpenPEPPOL BIS 1, Catalogue");
  public static final IBusinessSpecification ORDER_03 = new BusinessSpecification ("openpeppol-bis-03",
                                                                                   "OpenPEPPOL BIS 3, Order");
  public static final IBusinessSpecification INVOICE_04 = new BusinessSpecification ("openpeppol-bis-04",
                                                                                     "OpenPEPPOL BIS 4, Invoice");
  public static final IBusinessSpecification BILLING_05 = new BusinessSpecification ("openpeppol-bis-05",
                                                                                     "OpenPEPPOL BIS 5, Billing");
  public static final IBusinessSpecification ORDERING_28 = new BusinessSpecification ("openpeppol-bis-28",
                                                                                      "OpenPEPPOL BIS 28, Ordering");
  public static final IBusinessSpecification DESPATCH_ADVICE_30 = new BusinessSpecification ("openpeppol-bis-30",
                                                                                             "OpenPEPPOL BIS 30, Despatch advice");
  public static final IBusinessSpecification MLR_36 = new BusinessSpecification ("openpeppol-bis-36",
                                                                                 "OpenPEPPOL BIS 36, MLR");

  // Predefined transaction keys, ordered by BIS and than by BII2 transaction
  public static final ValidationArtefactKey CATALOGUE_01_T19 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CATALOGUE_01)
                                                                                   .setTransaction (EBII2Transaction.T19)
                                                                                   .build ();
  public static final ValidationArtefactKey CATALOGUE_01_T58 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CATALOGUE_01)
                                                                                   .setTransaction (EBII2Transaction.T58)
                                                                                   .build ();
  public static final ValidationArtefactKey ORDER_03_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (ORDER_03)
                                                                               .setTransaction (EBII2Transaction.T01)
                                                                               .build ();
  public static final ValidationArtefactKey INVOICE_04_T10 = new ValidationArtefactKey.Builder ().setBusinessSpecification (INVOICE_04)
                                                                                 .setTransaction (EBII2Transaction.T10)
                                                                                 .build ();
  public static final ValidationArtefactKey BILLING_05_T14 = new ValidationArtefactKey.Builder ().setBusinessSpecification (BILLING_05)
                                                                                 .setTransaction (EBII2Transaction.T14)
                                                                                 .build ();
  public static final ValidationArtefactKey ORDERING_28_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (ORDERING_28)
                                                                                  .setTransaction (EBII2Transaction.T01)
                                                                                  .build ();
  public static final ValidationArtefactKey ORDERING_28_T76 = new ValidationArtefactKey.Builder ().setBusinessSpecification (ORDERING_28)
                                                                                  .setTransaction (EBII2Transaction.T76)
                                                                                  .build ();
  public static final ValidationArtefactKey DESPATCH_ADVICE_30_T16 = new ValidationArtefactKey.Builder ().setBusinessSpecification (DESPATCH_ADVICE_30)
                                                                                         .setTransaction (EBII2Transaction.T16)
                                                                                         .build ();
  public static final ValidationArtefactKey MLR_36_T71 = new ValidationArtefactKey.Builder ().setBusinessSpecification (MLR_36)
                                                                             .setTransaction (EBII2Transaction.T71)
                                                                             .build ();

  public static final ValidationArtefactSectorKey SECTOR_AT_GOV = new ValidationArtefactSectorKey ("ATGOV", "Austrian Government");

  private CPeppolValidation ()
  {}
}
