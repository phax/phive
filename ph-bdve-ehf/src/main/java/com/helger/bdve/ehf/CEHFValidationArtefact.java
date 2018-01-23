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
package com.helger.bdve.ehf;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.spec.BusinessSpecification;
import com.helger.bdve.spec.BusinessSpecificationRegistry;
import com.helger.bdve.spec.EBII2Transaction;
import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.commons.annotation.Nonempty;

/**
 * EHF validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CEHFValidationArtefact
{
  private static final String BUSINESS_SPEC_GROUP_ID = "no.ehf";

  @Nonnull
  private static BusinessSpecification _createBusinessSpec (@Nonnull @Nonempty final String sGroupID,
                                                            @Nonnull @Nonempty final String sSpecID,
                                                            @Nonnull @Nonempty final String sDisplayName)
  {
    final BusinessSpecification ret = new BusinessSpecification (sGroupID, sSpecID, sDisplayName);
    BusinessSpecificationRegistry.INSTANCE.registerBusinessSpecification (ret);
    return ret;
  }

  public static final IBusinessSpecification EHF_CATALOGUE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                  "catalogue",
                                                                                  "EHF Catalogue");
  public static final IBusinessSpecification EHF_CATALOGUE_RESPONSE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                           "catalogue-response",
                                                                                           "EHF Catalogue Response");
  public static final IBusinessSpecification EHF_CREDITNOTE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                   "creditnote",
                                                                                   "EHF Creditnote");
  public static final IBusinessSpecification EHF_DESPATCH_ADVICE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                        "despatch-advice",
                                                                                        "EHF Despatch Advice");
  public static final IBusinessSpecification EHF_INVOICE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                "invoice",
                                                                                "EHF Invoice");
  public static final IBusinessSpecification EHF_ORDER = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                              "order",
                                                                              "EHF Order");
  public static final IBusinessSpecification EHF_ORDER_AGREEMENT = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                        "order-agreement",
                                                                                        "EHF Order Agreement");
  public static final IBusinessSpecification EHF_ORDER_RESPONSE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                       "order-response",
                                                                                       "EHF Order Response");
  public static final IBusinessSpecification EHF_PUNCH_OUT = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                  "punch-out",
                                                                                  "EHF Punch Out");
  public static final IBusinessSpecification EHF_REMINDER = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                 "reminder",
                                                                                 "EHF Reminder");

  public static final ValidationArtefactKey VK_EHF_CATALOGUE_T19 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_CATALOGUE)
                                                                                                       .setTransaction (EBII2Transaction.T19)
                                                                                                       .build ();
  public static final ValidationArtefactKey VK_EHF_CREDITNOTE_T14 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_CREDITNOTE)
                                                                                                        .setTransaction (EBII2Transaction.T14)
                                                                                                        .build ();
  public static final ValidationArtefactKey VK_EHF_DESPATCH_ADVICE_T14 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_DESPATCH_ADVICE)
                                                                                                             .setTransaction (EBII2Transaction.T16)
                                                                                                             .build ();
  public static final ValidationArtefactKey VK_EHF_INVOICE_T10 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_INVOICE)
                                                                                                     .setTransaction (EBII2Transaction.T10)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_AGREEMENT_T110 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_ORDER_AGREEMENT)
                                                                                                              .setTransaction (EBII2Transaction.T110)
                                                                                                              .build ();
  public static final ValidationArtefactKey VK_EHF_ORDER_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_ORDER)
                                                                                                   .setTransaction (EBII2Transaction.T01)
                                                                                                   .build ();

  private CEHFValidationArtefact ()
  {}
}
