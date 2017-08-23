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
package com.helger.bdve.peppol;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.key.ValidationArtefactSectorKey;
import com.helger.bdve.spec.BusinessSpecification;
import com.helger.bdve.spec.BusinessSpecificationRegistry;
import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Peppol validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CPeppolValidationArtefact
{
  private static final String BUSINESS_SPEC_GROUP_ID = "eu.peppol";

  @Nonnull
  private static BusinessSpecification _createBusinessSpec (@Nonnull @Nonempty final String sGroupID,
                                                            @Nonnull @Nonempty final String sSpecID,
                                                            @Nonnull @Nonempty final String sDisplayName)
  {
    final BusinessSpecification ret = new BusinessSpecification (sGroupID, sSpecID, sDisplayName);
    BusinessSpecificationRegistry.INSTANCE.registerBusinessSpecification (ret);
    return ret;
  }

  public static final IBusinessSpecification CATALOGUE_01 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                 "bis-01",
                                                                                 "OpenPEPPOL BIS 1, Catalogue");
  public static final IBusinessSpecification ORDER_03 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                             "bis-03",
                                                                             "OpenPEPPOL BIS 3, Order");
  public static final IBusinessSpecification INVOICE_04 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                               "bis-04",
                                                                               "OpenPEPPOL BIS 4, Invoice");
  public static final IBusinessSpecification BILLING_05 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                               "bis-05",
                                                                               "OpenPEPPOL BIS 5, Billing");
  public static final IBusinessSpecification PUNCH_OUT_18 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                 "bis-18",
                                                                                 "OpenPEPPOL BIS 18, Punch Out");
  public static final IBusinessSpecification ORDERING_28 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                "bis-28",
                                                                                "OpenPEPPOL BIS 28, Ordering");
  public static final IBusinessSpecification DESPATCH_ADVICE_30 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                       "bis-30",
                                                                                       "OpenPEPPOL BIS 30, Despatch advice");
  public static final IBusinessSpecification MLR_36 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                           "bis-36",
                                                                           "OpenPEPPOL BIS 36, MLR");
  public static final IBusinessSpecification ORDER_AGREEMENT_42 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                       "bis-42",
                                                                                       "OpenPEPPOL BIS 42, Order Agreement");

  // Predefined transaction keys, ordered by BIS and than by BII2 transaction
  public static final ValidationArtefactKey VK_CATALOGUE_01_T19 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CATALOGUE_01)
                                                                                                      .setTransaction (EBII2Transaction.T19)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_CATALOGUE_01_T58 = new ValidationArtefactKey.Builder ().setBusinessSpecification (CATALOGUE_01)
                                                                                                      .setTransaction (EBII2Transaction.T58)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_ORDER_03_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (ORDER_03)
                                                                                                  .setTransaction (EBII2Transaction.T01)
                                                                                                  .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10 = new ValidationArtefactKey.Builder ().setBusinessSpecification (INVOICE_04)
                                                                                                    .setTransaction (EBII2Transaction.T10)
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10_ATNAT = new ValidationArtefactKey.Builder (VK_INVOICE_04_T10).setCountry ("AT")
                                                                                                                           .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                                                           .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10_ATGOV = new ValidationArtefactKey.Builder (VK_INVOICE_04_T10_ATNAT).setSectorKey (CPeppolValidationArtefact.SECTOR_AT_GOV)
                                                                                                                                 .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14 = new ValidationArtefactKey.Builder ().setBusinessSpecification (BILLING_05)
                                                                                                    .setTransaction (EBII2Transaction.T14)
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14_ATNAT = new ValidationArtefactKey.Builder (VK_BILLING_05_T14).setCountry ("AT")
                                                                                                                           .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                                                           .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14_ATGOV = new ValidationArtefactKey.Builder (VK_BILLING_05_T14_ATNAT).setSectorKey (CPeppolValidationArtefact.SECTOR_AT_GOV)
                                                                                                                                 .build ();
  public static final ValidationArtefactKey VK_PUNCH_OUT_18_T77 = new ValidationArtefactKey.Builder ().setBusinessSpecification (PUNCH_OUT_18)
                                                                                                      .setTransaction (EBII2Transaction.T77)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T01 = new ValidationArtefactKey.Builder ().setBusinessSpecification (ORDERING_28)
                                                                                                     .setTransaction (EBII2Transaction.T01)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T76 = new ValidationArtefactKey.Builder ().setBusinessSpecification (ORDERING_28)
                                                                                                     .setTransaction (EBII2Transaction.T76)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_DESPATCH_ADVICE_30_T16 = new ValidationArtefactKey.Builder ().setBusinessSpecification (DESPATCH_ADVICE_30)
                                                                                                            .setTransaction (EBII2Transaction.T16)
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_MLR_36_T71 = new ValidationArtefactKey.Builder ().setBusinessSpecification (MLR_36)
                                                                                                .setTransaction (EBII2Transaction.T71)
                                                                                                .build ();
  public static final ValidationArtefactKey VK_ORDER_AGREEMENT_42_T110 = new ValidationArtefactKey.Builder ().setBusinessSpecification (ORDER_AGREEMENT_42)
                                                                                                             .setTransaction (EBII2Transaction.T110)
                                                                                                             .build ();

  public static final ValidationArtefactSectorKey SECTOR_AT_GOV = new ValidationArtefactSectorKey ("ATGOV",
                                                                                                   "Austrian Government");

  // Third party
  public static final IReadableResource INVOICE_AT_NAT = new ClassPathResource ("/thirdparty/invoice/ATNAT-UBL-T10.sch",
                                                                                CPeppolValidationArtefact.class.getClassLoader ());
  public static final IReadableResource INVOICE_AT_GOV = new ClassPathResource ("/thirdparty/invoice/ATGOV-UBL-T10.sch",
                                                                                CPeppolValidationArtefact.class.getClassLoader ());

  public static final IReadableResource CREDIT_NOTE_AT_NAT = new ClassPathResource ("/thirdparty/creditnote/ATNAT-UBL-T14.sch",
                                                                                    CPeppolValidationArtefact.class.getClassLoader ());
  public static final IReadableResource CREDIT_NOTE_AT_GOV = new ClassPathResource ("/thirdparty/creditnote/ATGOV-UBL-T14.sch",
                                                                                    CPeppolValidationArtefact.class.getClassLoader ());

  private CPeppolValidationArtefact ()
  {}
}
