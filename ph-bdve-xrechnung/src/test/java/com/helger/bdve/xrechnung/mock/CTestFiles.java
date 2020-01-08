/**
 * Copyright (C) 2019-2020 Philip Helger (www.helger.com)
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
@SuppressWarnings ("deprecation")
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
                                            XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_120,
                                            XRechnungValidation.VID_XRECHNUNG_CII_121,
                                            XRechnungValidation.VID_XRECHNUNG_UBL_CREDITNOTE_121,
                                            XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_121,
                                            XRechnungValidation.VID_XRECHNUNG_CII_122,
                                            XRechnungValidation.VID_XRECHNUNG_UBL_CREDITNOTE_122,
                                            XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_122 })
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
      for (final String s : new String [] { "CII_business_example_01.xml",
                                            "CII_business_example_02.xml",
                                            "CII_example1.xml",
                                            "CII_example2.xml",
                                            "CII_example3.xml",
                                            "CII_example4.xml",
                                            "CII_example5.xml",
                                            "CII_example6.xml",
                                            // "CII_example7.xml",
                                            "CII_example8.xml",
                                            "CII_example9.xml" })
        ret.add (new ClassPathResource (sPrefix + s));
    }
    else
      if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_CREDITNOTE_120))
      {
        // None atm
      }
      else
        if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_120))
        {
          final String sPrefix = "/test-files/1.2.0/ubl/";
          for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                "ubl-tc434-example2.xml",
                                                "ubl-tc434-example3.xml",
                                                "ubl-tc434-example4.xml",
                                                "ubl-tc434-example5.xml",
                                                "ubl-tc434-example6.xml",
                                                // "ubl-tc434-example7.xml",
                                                "ubl-tc434-example8.xml",
                                                "ubl-tc434-example9.xml" })
            ret.add (new ClassPathResource (sPrefix + s));
        }
        else
          if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_CII_121))
          {
            final String sPrefix = "/test-files/1.2.1/cii/";
            for (final String s : new String [] { "CII_business_example_01.xml",
                                                  "CII_business_example_02.xml",
                                                  "CII_example1.xml",
                                                  "CII_example2.xml",
                                                  "CII_example3.xml",
                                                  "CII_example4.xml",
                                                  "CII_example5.xml",
                                                  "CII_example6.xml",
                                                  // "CII_example7.xml",
                                                  "CII_example8.xml",
                                                  "CII_example9.xml" })
              ret.add (new ClassPathResource (sPrefix + s));
          }
          else
            if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_CREDITNOTE_121))
            {
              // None atm
            }
            else
              if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_121))
              {
                final String sPrefix = "/test-files/1.2.1/ubl/";
                for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                      "ubl-tc434-example2.xml",
                                                      "ubl-tc434-example3.xml",
                                                      "ubl-tc434-example4.xml",
                                                      "ubl-tc434-example5.xml",
                                                      "ubl-tc434-example6.xml",
                                                      // "ubl-tc434-example7.xml",
                                                      "ubl-tc434-example8.xml",
                                                      "ubl-tc434-example9.xml" })
                  ret.add (new ClassPathResource (sPrefix + s));
              }
              else
                if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_CII_122))
                {
                  final String sPrefix = "/test-files/1.2.2/cii/";
                  for (final String s : new String [] { "01.01a-INVOICE_uncefact.xml",
                                                        "01.02a-INVOICE_uncefact.xml",
                                                        "01.03a-INVOICE_uncefact.xml",
                                                        "01.04a-INVOICE_uncefact.xml",
                                                        "01.05a-INVOICE_uncefact.xml",
                                                        "01.06a-INVOICE_uncefact.xml",
                                                        "01.07a-INVOICE_uncefact.xml",
                                                        "01.08a-INVOICE_uncefact.xml",
                                                        "01.09a-INVOICE_uncefact.xml",
                                                        "01.10a-INVOICE_uncefact.xml",
                                                        "01.11a-INVOICE_uncefact.xml",
                                                        "01.12a-INVOICE_uncefact.xml",
                                                        "01.13a-INVOICE_uncefact.xml",
                                                        "01.14a-INVOICE_uncefact.xml",
                                                        "01.15a-INVOICE_uncefact.xml",
                                                        "02.01a-INVOICE_uncefact.xml",
                                                        "02.02a-INVOICE_uncefact.xml",
                                                        "03.01a-INVOICE_uncefact.xml",
                                                        "03.02a-INVOICE_uncefact.xml" })
                    ret.add (new ClassPathResource (sPrefix + s));
                }
                else
                  if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_CREDITNOTE_122))
                  {
                    // None atm
                  }
                  else
                    if (aVESID.equals (XRechnungValidation.VID_XRECHNUNG_UBL_INVOICE_122))
                    {
                      final String sPrefix = "/test-files/1.2.2/ubl/";
                      for (final String s : new String [] { "01.01a-INVOICE_ubl.xml",
                                                            "01.02a-INVOICE_ubl.xml",
                                                            "01.03a-INVOICE_ubl.xml",
                                                            "01.04a-INVOICE_ubl.xml",
                                                            "01.05a-INVOICE_ubl.xml",
                                                            "01.06a-INVOICE_ubl.xml",
                                                            "01.07a-INVOICE_ubl.xml",
                                                            "01.08a-INVOICE_ubl.xml",
                                                            "01.09a-INVOICE_ubl.xml",
                                                            "01.10a-INVOICE_ubl.xml",
                                                            "01.11a-INVOICE_ubl.xml",
                                                            "01.12a-INVOICE_ubl.xml",
                                                            "01.13a-INVOICE_ubl.xml",
                                                            "01.14a-INVOICE_ubl.xml",
                                                            "01.15a-INVOICE_ubl.xml",
                                                            "02.01a-INVOICE_ubl.xml",
                                                            "02.02a-INVOICE_ubl.xml",
                                                            "03.01a-INVOICE_ubl.xml",
                                                            "03.02a-INVOICE_ubl.xml" })
                        ret.add (new ClassPathResource (sPrefix + s));
                    }
                    else
                      throw new IllegalArgumentException ("Invalid VESID: " + aVESID);

    return ret;
  }
}
