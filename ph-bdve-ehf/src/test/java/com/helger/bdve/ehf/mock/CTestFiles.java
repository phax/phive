/**
 * Copyright (C) 2018-2020 Philip Helger (www.helger.com)
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
import com.helger.bdve.peppol.PeppolValidation;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

@Immutable
public final class CTestFiles
{
  public static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    PeppolValidation.initStandard (VES_REGISTRY);
    EHFValidation.initEHF (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aESID : new VESID [] { /* 2018-11 */
                                            EHFValidation.VID_EHF_CATALOGUE_1_0_13,
                                            EHFValidation.VID_EHF_CATALOGUE_RESPONSE_1_0_13,
                                            EHFValidation.VID_EHF_CREDITNOTE_2_0_15,
                                            EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_10,
                                            EHFValidation.VID_EHF_INVOICE_2_0_15,
                                            EHFValidation.VID_EHF_ORDER_1_0_11,
                                            EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_2,
                                            EHFValidation.VID_EHF_ORDER_RESPONSE_1_0_11,
                                            EHFValidation.VID_EHF_PUNCH_OUT_1_0_1,
                                            EHFValidation.VID_EHF_REMINDER_1_1_0,
                                            /* 2019-06 */
                                            EHFValidation.VID_EHF_CATALOGUE_1_0_14,
                                            EHFValidation.VID_EHF_CATALOGUE_RESPONSE_1_0_14,
                                            EHFValidation.VID_EHF_CREDITNOTE_2_0_16,
                                            EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_11,
                                            EHFValidation.VID_EHF_INVOICE_2_0_16,
                                            EHFValidation.VID_EHF_ORDER_1_0_12,
                                            EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_3,
                                            EHFValidation.VID_EHF_ORDER_RESPONSE_1_0_12,
                                            EHFValidation.VID_EHF_PUNCH_OUT_1_0_2,
                                            /* 2019-12 */
                                            EHFValidation.VID_EHF_CATALOGUE_1_0_15,
                                            EHFValidation.VID_EHF_CATALOGUE_RESPONSE_1_0_15,
                                            EHFValidation.VID_EHF_CREDITNOTE_2_0_17,
                                            EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_12,
                                            EHFValidation.VID_EHF_INVOICE_2_0_17,
                                            EHFValidation.VID_EHF_ORDER_1_0_13,
                                            EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_4,
                                            EHFValidation.VID_EHF_ORDER_RESPONSE_1_0_13,
                                            EHFValidation.VID_EHF_PUNCH_OUT_1_0_3 })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aESID))
        ret.add (MockFile.createGoodCase (aRes, aESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    // 2018-11
    String sPath = "/ehf/2018-11/examples/";
    if (aVESID.equals (EHFValidation.VID_EHF_CATALOGUE_1_0_13))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T19 Example file EHF Catalogue.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_CATALOGUE_RESPONSE_1_0_13))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T58 Example file EHF Catalogue Response.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_CREDITNOTE_2_0_15))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T14 BII05 gyldig kreditnota.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_10))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T16 Eksempel1.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel2.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel3.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel4.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel5.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_INVOICE_2_0_15))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T10 BII05 gyldig faktura.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_1_0_11))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T01 Eksempelfil EHF Ordre.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_2))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T110 ehf-oa-case-2.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-case1.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-case2-5.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-full.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_RESPONSE_1_0_11))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T76 Eksempelfil EHF Ordrebekreftelse.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_PUNCH_OUT_1_0_1))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T77 ehf-po-case1-2.xml"),
                                      new ClassPathResource (sPath + "T77 ehf-po-case2.xml"),
                                      new ClassPathResource (sPath + "T77 ehf-po-full.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_REMINDER_1_1_0))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath +
                                                             "T17 biixy gyldig purring med alle elementer.xml"));
    }

    // 2019-06
    sPath = "/ehf/2019-06/examples/";
    if (aVESID.equals (EHFValidation.VID_EHF_CATALOGUE_1_0_14))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T19 Example file EHF Catalogue.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_CATALOGUE_RESPONSE_1_0_14))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T58 Example file EHF Catalogue Response.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_CREDITNOTE_2_0_16))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T14 BII05 gyldig kreditnota.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_11))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T16 Eksempel1.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel2.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel3.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel4.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel5.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_INVOICE_2_0_16))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T10 BII05 gyldig faktura.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_1_0_12))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T01 Eksempelfil EHF Ordre.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_3))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T110 ehf-oa-case-2.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-case1.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-case2-5.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-full.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_RESPONSE_1_0_12))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T76 Eksempelfil EHF Ordrebekreftelse.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_PUNCH_OUT_1_0_2))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T77 ehf-po-case1-2.xml"),
                                      new ClassPathResource (sPath + "T77 ehf-po-case2.xml"),
                                      new ClassPathResource (sPath + "T77 ehf-po-full.xml"));
    }

    // 2019-12
    sPath = "/ehf/2019-12/examples/";
    if (aVESID.equals (EHFValidation.VID_EHF_CATALOGUE_1_0_15))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T19 Example file EHF Catalogue.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_CATALOGUE_RESPONSE_1_0_15))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T58 Example file EHF Catalogue Response.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_CREDITNOTE_2_0_17))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T14 BII05 gyldig kreditnota.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_DESPATCH_ADVICE_1_0_12))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T16 Eksempel1.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel2.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel3.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel4.xml"),
                                      new ClassPathResource (sPath + "T16 Eksempel5.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_INVOICE_2_0_17))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T10 BII05 gyldig faktura.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_1_0_13))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T01 Eksempelfil EHF Ordre.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_AGREEMENT_1_0_4))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T110 ehf-oa-case-2.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-case1.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-case2-5.xml"),
                                      new ClassPathResource (sPath + "T110 ehf-oa-full.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_ORDER_RESPONSE_1_0_13))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T76 Eksempelfil EHF Ordrebekreftelse.xml"));
    }
    if (aVESID.equals (EHFValidation.VID_EHF_PUNCH_OUT_1_0_3))
    {
      return new CommonsArrayList <> (new ClassPathResource (sPath + "T77 ehf-po-case1-2.xml"),
                                      new ClassPathResource (sPath + "T77 ehf-po-case2.xml"),
                                      new ClassPathResource (sPath + "T77 ehf-po-full.xml"));
    }

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
