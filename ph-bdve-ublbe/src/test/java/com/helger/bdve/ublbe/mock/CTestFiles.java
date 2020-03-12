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
package com.helger.bdve.ublbe.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.peppol.PeppolValidation;
import com.helger.bdve.ublbe.UBLBEValidation;
import com.helger.collection.multimap.MultiHashMapArrayListBased;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

@Immutable
@SuppressWarnings ("deprecation")
public final class CTestFiles
{
  public static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    // Peppol is a prerequisite
    PeppolValidation.initStandard (VES_REGISTRY);
    UBLBEValidation.initUBLBE (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aESID : new VESID [] { UBLBEValidation.VID_EFFF_INVOICE,
                                            UBLBEValidation.VID_EFFF_CREDIT_NOTE,
                                            UBLBEValidation.VID_UBL_BE_INVOICE_100,
                                            UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_100,
                                            UBLBEValidation.VID_UBL_BE_INVOICE_110,
                                            UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_110,
                                            UBLBEValidation.VID_UBL_BE_INVOICE_120,
                                            UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_120 })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aESID))
        ret.add (MockFile.createGoodCase (aRes, aESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    final MultiHashMapArrayListBased <VESID, IReadableResource> aMap = new MultiHashMapArrayListBased <> ();
    final String sPathPrefix = "/test-files/";
    {
      final String sPath = sPathPrefix + "3.0.0/";
      aMap.putSingle (UBLBEValidation.VID_EFFF_INVOICE,
                      new ClassPathResource (sPath + "efff_BE0827405743_V01-15000001-1.xml"));
      aMap.putSingle (UBLBEValidation.VID_EFFF_INVOICE,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001.xml"));

      aMap.putSingle (UBLBEValidation.VID_EFFF_CREDIT_NOTE,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000002.xml"));
    }
    // 1.0.0
    {
      final String sPath = sPathPrefix + "en16931/v1/";
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000003.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000004.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000005.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000006.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000007.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000008.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000009.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000010.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000012.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000013.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000015.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000016.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000017.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000018.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000019.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000020.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000021.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000022.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000023.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000025.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000026.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000027.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000028.xml"));

      aMap.putSingle (UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000002.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_100,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000024.xml"));
    }
    // 1.1.0
    {
      final String sPath = sPathPrefix + "en16931/v1.1/";
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath +
                                             "UBLBE_BE0000000196_V01-15000001 - DocumentStatusCode Converted.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001 - Temporary.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001 Full.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000003.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000004.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000005.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000006.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000007.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000008.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000009.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000010.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000012.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000013.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000015.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000016.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000017.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000018.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000019.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000020.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000021.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000022.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000023.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000025.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000026.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000027.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000028.xml"));

      aMap.putSingle (UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000002.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_110,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000024.xml"));
    }
    // 1.2.0
    {
      final String sPath = sPathPrefix + "en16931/v1.2/";
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath +
                                             "UBLBE_BE0000000196_V01-15000001 - DocumentStatusCode Converted.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001 - Temporary.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001 Full.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000001.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000003.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000004.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000005.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000006.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000007.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000008.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000009.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000010.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000012.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000013.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000015.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000016.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000017.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000018.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000019.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000020.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000021.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000022.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000023.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000025.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000026.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000027.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000028.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000029.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_INVOICE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000030.xml"));

      aMap.putSingle (UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000002.xml"));
      aMap.putSingle (UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_120,
                      new ClassPathResource (sPath + "UBLBE_BE0000000196_V01-15000024.xml"));
    }

    final ICommonsList <IReadableResource> ret = aMap.get (aVESID);
    if (ret != null)
      return ret;

    // TODO work around
    if (aVESID.equals (UBLBEValidation.VID_UBL_BE_INVOICE_110) ||
        aVESID.equals (UBLBEValidation.VID_UBL_BE_CREDIT_NOTE_110))
      return new CommonsArrayList <> ();

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
