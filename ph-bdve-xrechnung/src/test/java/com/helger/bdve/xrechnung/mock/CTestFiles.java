/**
 * Copyright (C) 2014-2019 Philip Helger (www.helger.com)
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
package com.helger.bdve.xrechnung.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.en16931.EN16931Validation;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.xrechnung.XRechnungValidation;
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
    EN16931Validation.initEN16931 (VES_REGISTRY);
    XRechnungValidation.initXRechnung (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aESID : new VESID [] { XRechnungValidation.VID_XRECHNUNG_CII_120,
                                            XRechnungValidation.VID_XRECHNUNG_UBL_CREDITNOTE_120,
                                            XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_120 })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aESID))
        ret.add (MockFile.createGoodCase (aRes, aESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    final ICommonsList <IReadableResource> ret = new CommonsArrayList <> ();
    if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_CII_120))
    {
      final String sPrefix = "/test-files/1.2.0/cii/";
      for (final String s : new String [] { "DE_Validation_DE_R_001_CII.xml",
                                            "DE_Validation_DE_R_002_CII.xml",
                                            "DE_Validation_DE_R_003_CII.xml",
                                            "DE_Validation_DE_R_004_CII.xml",
                                            "DE_Validation_DE_R_005_CII.xml",
                                            "DE_Validation_DE_R_006_CII.xml",
                                            "DE_Validation_DE_R_007_CII.xml",
                                            "DE_Validation_DE_R_008_CII.xml",
                                            "DE_Validation_DE_R_009_CII.xml",
                                            "DE_Validation_DE_R_010_CII.xml",
                                            "DE_Validation_DE_R_011_CII.xml",
                                            "DE_Validation_DE_R_013_CII.xml",
                                            "DE_Validation_DE_R_014_CII.xml",
                                            "DE_Validation_DE_R_015_CII.xml",
                                            "DE_Validation_DE_R_016_CII.xml",
                                            "DE_Validation_DE_R_017_CII.xml",
                                            "DE_Validation_DE_R_018_CII.xml" })
        ret.add (new ClassPathResource (sPrefix + s));
    }
    else
      if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_CREDITNOTE_120))
      {
        // None atm
        final String sPrefix = "/test-files/1.2.0/ubl/";
      }
      else
        if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_120))
        {
          final String sPrefix = "/test-files/1.2.0/ubl/";
          for (final String s : new String [] { "DE_Validation_DE_R_001_UBL.xml",
                                                "DE_Validation_DE_R_002_UBL.xml",
                                                "DE_Validation_DE_R_003_UBL.xml",
                                                "DE_Validation_DE_R_004_UBL.xml",
                                                "DE_Validation_DE_R_005_UBL.xml",
                                                "DE_Validation_DE_R_006_UBL.xml",
                                                "DE_Validation_DE_R_007_UBL.xml",
                                                "DE_Validation_DE_R_008_UBL.xml",
                                                "DE_Validation_DE_R_009_UBL.xml",
                                                "DE_Validation_DE_R_010_UBL.xml",
                                                "DE_Validation_DE_R_011_UBL.xml",
                                                "DE_Validation_DE_R_013_UBL.xml",
                                                "DE_Validation_DE_R_014_UBL.xml",
                                                "DE_Validation_DE_R_015_UBL.xml",
                                                "DE_Validation_DE_R_016_UBL.xml",
                                                "DE_Validation_DE_R_017_UBL.xml",
                                                "DE_Validation_DE_R_018_UBL.xml" })
            ret.add (new ClassPathResource (sPrefix + s));
        }
        else
          throw new IllegalArgumentException ("Invalid VESID: " + aVESID);

    return ret;
  }
}
