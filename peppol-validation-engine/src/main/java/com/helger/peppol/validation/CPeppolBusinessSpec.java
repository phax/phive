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
package com.helger.peppol.validation;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.spec.BusinessSpecification;
import com.helger.bdve.spec.BusinessSpecificationRegistry;
import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.commons.annotation.Nonempty;

/**
 * This class contains the PEPPOL Business specifications.
 *
 * @author Philip Helger
 */
@Immutable
public final class CPeppolBusinessSpec
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
  public static final IBusinessSpecification ORDERING_28 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                "bis-28",
                                                                                "OpenPEPPOL BIS 28, Ordering");
  public static final IBusinessSpecification DESPATCH_ADVICE_30 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                       "bis-30",
                                                                                       "OpenPEPPOL BIS 30, Despatch advice");
  public static final IBusinessSpecification MLR_36 = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                           "bis-36",
                                                                           "OpenPEPPOL BIS 36, MLR");

  private CPeppolBusinessSpec ()
  {}
}
