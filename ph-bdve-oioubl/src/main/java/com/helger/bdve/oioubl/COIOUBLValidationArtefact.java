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
package com.helger.bdve.oioubl;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.spec.BusinessSpecification;
import com.helger.bdve.spec.BusinessSpecificationRegistry;
import com.helger.bdve.spec.EBIITransaction;
import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.bdve.spec.SpecificationTransaction;
import com.helger.commons.annotation.Nonempty;
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
  private static final String BUSINESS_SPEC_GROUP_ID = "dk.oioubl";

  @Nonnull
  private static BusinessSpecification _createBusinessSpec (@Nonnull @Nonempty final String sGroupID,
                                                            @Nonnull @Nonempty final String sSpecID,
                                                            @Nonnull @Nonempty final String sDisplayName)
  {
    final BusinessSpecification ret = new BusinessSpecification (sGroupID, sSpecID, sDisplayName);
    BusinessSpecificationRegistry.INSTANCE.registerBusinessSpecification (ret);
    return ret;
  }

  public static final IBusinessSpecification OIOUBL_APPLICATION_RESPONSE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                                "application-response",
                                                                                                "OIOUBL Application Response");
  public static final IBusinessSpecification OIOUBL_CATALOGUE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                     "catalogue",
                                                                                     "OIOUBL Catalogue");
  public static final IBusinessSpecification OIOUBL_CATALOGUE_DELETION = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                              "catalogue-deletion",
                                                                                              "OIOUBL Catalogue Deletion");
  public static final IBusinessSpecification OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                                               "catalogue-item-spec-update",
                                                                                                               "OIOUBL Catalogue Item Specification Update");
  public static final IBusinessSpecification OIOUBL_CATALOGUE_PRICING_UPDATE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                                    "catalogue-pricing-update",
                                                                                                    "OIOUBL Catalogue Pricing Update");
  public static final IBusinessSpecification OIOUBL_CATALOGUE_REQUEST = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                             "catalogue-request",
                                                                                             "OIOUBL Catalogue Request");
  public static final IBusinessSpecification OIOUBL_CREDIT_NOTE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                       "credit-note",
                                                                                       "OIOUBL Credit Note");
  public static final IBusinessSpecification OIOUBL_INVOICE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                   "invoice",
                                                                                   "OIOUBL Invoice");
  public static final IBusinessSpecification OIOUBL_ORDER = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                 "order",
                                                                                 "OIOUBL Order");
  public static final IBusinessSpecification OIOUBL_ORDER_CANCELLATION = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                              "order-cancellation",
                                                                                              "OIOUBL Order Cancellation");
  public static final IBusinessSpecification OIOUBL_ORDER_RESPONSE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                          "order-response",
                                                                                          "OIOUBL Order Response");
  public static final IBusinessSpecification OIOUBL_ORDER_RESPONSE_SIMPLE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                                 "order-response-simple",
                                                                                                 "OIOUBL Order Response Simple");
  public static final IBusinessSpecification OIOUBL_REMINDER = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                    "reminder",
                                                                                    "OIOUBL Reminder");
  public static final IBusinessSpecification OIOUBL_STATEMENT = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                     "statement",
                                                                                     "OIOUBL Statement");

  public static final ValidationArtefactKey VK_OIOUBL_APPLICATION_RESPONSE_T71 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_APPLICATION_RESPONSE)
                                                                                                                     .setTransaction (EBIITransaction.T71)
                                                                                                                     .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_T19 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_CATALOGUE)
                                                                                                          .setTransaction (EBIITransaction.T19)
                                                                                                          .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_DELETION_T22 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_CATALOGUE_DELETION)
                                                                                                                   .setTransaction (EBIITransaction.T22)
                                                                                                                   .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE_T20 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE)
                                                                                                                                    .setTransaction (EBIITransaction.T20)
                                                                                                                                    .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_PRICING_UPDATE_T21 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_CATALOGUE_PRICING_UPDATE)
                                                                                                                         .setTransaction (EBIITransaction.T21)
                                                                                                                         .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CATALOGUE_REQUEST_T18 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_CATALOGUE_REQUEST)
                                                                                                                  .setTransaction (EBIITransaction.T18)
                                                                                                                  .build ();
  public static final ValidationArtefactKey VK_OIOUBL_CREDIT_NOTE_T14 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_CREDIT_NOTE)
                                                                                                            .setTransaction (EBIITransaction.T14)
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_OIOUBL_INVOICE_T10 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_INVOICE)
                                                                                                        .setTransaction (EBIITransaction.T10)
                                                                                                        .build ();
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_ORDER)
                                                                                                      .setTransaction (EBIITransaction.T01)
                                                                                                      .build ();
  private static SpecificationTransaction T_O_C = new SpecificationTransaction ("urn:id:oioubl:order-cancellation",
                                                                                "Order Cancellation",
                                                                                EUBL21DocumentType.ORDER_CANCELLATION,
                                                                                UBL21NamespaceContext.getInstance ());
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_CANCELLATION = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_ORDER_CANCELLATION)
                                                                                                               .setTransaction (T_O_C)
                                                                                                               .build ();
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_RESPONSE_T76 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_ORDER_RESPONSE)
                                                                                                               .setTransaction (EBIITransaction.T76)
                                                                                                               .build ();
  public static final ValidationArtefactKey VK_OIOUBL_ORDER_RESPONSE_SIMPLE_T02 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_ORDER_RESPONSE_SIMPLE)
                                                                                                                      .setTransaction (EBIITransaction.T02)
                                                                                                                      .build ();
  public static final ValidationArtefactKey VK_OIOUBL_REMINDER_T17 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_REMINDER)
                                                                                                         .setTransaction (EBIITransaction.T17)
                                                                                                         .build ();
  public static final ValidationArtefactKey VK_OIOUBL_STATEMENT_T26 = new ValidationArtefactKey.Builder ().setBusinessSpecification (OIOUBL_STATEMENT)
                                                                                                          .setTransaction (EBIITransaction.T26)
                                                                                                          .build ();

  private COIOUBLValidationArtefact ()
  {}
}
