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
package com.helger.bdve.ehf.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.ehf.EHFValidation;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

@Immutable
public final class CTestFiles
{
  private static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    EHFValidation.initEHF (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aESID : new VESID [] { EHFValidation.VID_EHF_CATALOGUTE_1_0_10,
                                            EHFValidation.VID_EHF_CREDITNOTE_2_0_12,
                                            EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_8,
                                            EHFValidation.VID_EHF_INVOICE_2_0_12,
                                            EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_0 })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aESID))
        ret.add (MockFile.createGoodCase (aRes, aESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    if (aVESID.equals (EHFValidation.VID_EHF_CATALOGUTE_1_0_10))
    {
      // final String sPath = "/ehf/ehf-catalogue-1.0/";
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (EHFValidation.VID_EHF_CREDITNOTE_2_0_12))
    {
      final String sPath = "/ehf/ehf-creditnote-2.0/";
      return new CommonsArrayList <> (new ClassPathResource (sPath + "test/T14-valid-profile-xx.xml"),
                                      new ClassPathResource (sPath + "test/T14-Valuta-EUR.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_8))
    {
      // final String sPath = "/ehf/ehf-despatch-advice-1.0/";
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (EHFValidation.VID_EHF_INVOICE_2_0_12))
    {
      final String sPath = "/ehf/ehf-invoice-2.0/";
      return new CommonsArrayList <> (new ClassPathResource (sPath + "test/T10-B2C.xml"),
                                      new ClassPathResource (sPath + "test/T10-Valuta-EUR.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_0))
    {
      // final String sPath = "/ehf/ehf-order-agreement-1.0/";
      return new CommonsArrayList <> ();
    }

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
