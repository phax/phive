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

  public static final IBusinessSpecification EHF_INVOICE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                "invoice",
                                                                                "EHF Invoice");
  public static final IBusinessSpecification EHF_CREDITNOTE = _createBusinessSpec (BUSINESS_SPEC_GROUP_ID,
                                                                                   "creditnote",
                                                                                   "EHF Creditnote");

  public static final ValidationArtefactKey VK_EHF_INVOICE_T10 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_INVOICE)
                                                                                                     .setTransaction (EBII2Transaction.T10)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_EHF_CREDITNOTE_T14 = new ValidationArtefactKey.Builder ().setBusinessSpecification (EHF_CREDITNOTE)
                                                                                                        .setTransaction (EBII2Transaction.T14)
                                                                                                        .build ();

  private CEHFValidationArtefact ()
  {}
}
