/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.domain.peppol;

import javax.annotation.concurrent.Immutable;

import com.helger.peppol.validation.domain.ValidationKey;

/**
 * This class contains the validation transactions used in PEPPOL. It uses
 * business specifications of type {@link EPeppolBIS} and transaction of type
 * {@link EBII2Transaction}.
 *
 * @author Philip Helger
 */
@Immutable
public class PeppolValidationKeys
{
  // Predefined transaction keys, ordered by BIS and than by BII2 transaction
  public static final ValidationKey CATALOGUE_01_T19 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.CATALOGUE_01)
                                                                                     .setTransaction (EBII2Transaction.T19)
                                                                                     .build ();
  public static final ValidationKey CATALOGUE_01_T58 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.CATALOGUE_01)
                                                                                     .setTransaction (EBII2Transaction.T58)
                                                                                     .build ();
  public static final ValidationKey ORDER_03_T01 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.ORDER_03)
                                                                                 .setTransaction (EBII2Transaction.T01)
                                                                                 .build ();
  public static final ValidationKey INVOICE_04_T10 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.INVOICE_04)
                                                                                   .setTransaction (EBII2Transaction.T10)
                                                                                   .build ();
  public static final ValidationKey BILLING_05_T14 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.BILLING_05)
                                                                                   .setTransaction (EBII2Transaction.T14)
                                                                                   .build ();
  public static final ValidationKey ORDERING_28_T01 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.ORDERING_28)
                                                                                    .setTransaction (EBII2Transaction.T01)
                                                                                    .build ();
  public static final ValidationKey ORDERING_28_T76 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.ORDERING_28)
                                                                                    .setTransaction (EBII2Transaction.T76)
                                                                                    .build ();
  public static final ValidationKey DESPATCH_ADVICE_30_T16 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.DESPATCH_ADVICE_30)
                                                                                           .setTransaction (EBII2Transaction.T16)
                                                                                           .build ();
  public static final ValidationKey MLR_36_T71 = new ValidationKey.Builder ().setBusinessSpecification (EPeppolBIS.MLR_36)
                                                                               .setTransaction (EBII2Transaction.T71)
                                                                               .build ();

  private PeppolValidationKeys ()
  {}
}
