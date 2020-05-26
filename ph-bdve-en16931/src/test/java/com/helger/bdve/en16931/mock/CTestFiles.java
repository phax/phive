/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.en16931.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.en16931.EN16931Validation;
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
@SuppressWarnings ("deprecation")
public final class CTestFiles
{
  public static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    EN16931Validation.initEN16931 (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aVESID : new VESID [] { EN16931Validation.VID_CII_100,
                                             EN16931Validation.VID_CII_110,
                                             EN16931Validation.VID_CII_120,
                                             EN16931Validation.VID_CII_121,
                                             EN16931Validation.VID_CII_123,
                                             EN16931Validation.VID_CII_130,
                                             EN16931Validation.VID_CII_131,
                                             EN16931Validation.VID_CII_132,
                                             EN16931Validation.VID_EDIFACT_100,
                                             EN16931Validation.VID_UBL_INVOICE_100,
                                             EN16931Validation.VID_UBL_INVOICE_110,
                                             EN16931Validation.VID_UBL_INVOICE_120,
                                             EN16931Validation.VID_UBL_INVOICE_121,
                                             EN16931Validation.VID_UBL_INVOICE_123,
                                             EN16931Validation.VID_UBL_INVOICE_130,
                                             EN16931Validation.VID_UBL_CREDIT_NOTE_130,
                                             EN16931Validation.VID_UBL_INVOICE_131,
                                             EN16931Validation.VID_UBL_CREDIT_NOTE_131,
                                             EN16931Validation.VID_UBL_INVOICE_132,
                                             EN16931Validation.VID_UBL_CREDIT_NOTE_132 })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aVESID))
        ret.add (MockFile.createGoodCase (aRes, aVESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    final ICommonsList <IReadableResource> ret = new CommonsArrayList <> ();
    if (aVESID.equals (EN16931Validation.VID_CII_100))
    {
      final String sPrefix = "/test-files/1.0.0/cii/";
      for (final String s : new String [] { "CII_business_example_01.xml",
                                            "CII_business_example_01a.xml",
                                            "CII_business_example_02.xml",
                                            "CII_example1.xml",
                                            "CII_example2.xml",
                                            "CII_example3.xml",
                                            "CII_example4.xml",
                                            "CII_example5.xml",
                                            "CII_example6.xml",
                                            "CII_example7.xml",
                                            "CII_example8.xml",
                                            "CII_example9.xml" })
        ret.add (new ClassPathResource (sPrefix + s));
    }
    else
      if (aVESID.equals (EN16931Validation.VID_CII_110))
      {
        final String sPrefix = "/test-files/1.1.0/cii/";
        for (final String s : new String [] { "CII_business_example_01.xml",
                                              "CII_business_example_02.xml",
                                              "CII_example1.xml",
                                              "CII_example2.xml",
                                              "CII_example3.xml",
                                              "CII_example4.xml",
                                              "CII_example5.xml",
                                              "CII_example6.xml",
                                              "CII_example7.xml",
                                              "CII_example8.xml",
                                              "CII_example9.xml" })
          ret.add (new ClassPathResource (sPrefix + s));
      }
      else
        if (aVESID.equals (EN16931Validation.VID_CII_120))
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
                                                "CII_example7.xml",
                                                "CII_example8.xml",
                                                "CII_example9.xml" })
            ret.add (new ClassPathResource (sPrefix + s));
        }
        else
          if (aVESID.equals (EN16931Validation.VID_CII_121))
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
                                                  "CII_example7.xml",
                                                  "CII_example8.xml",
                                                  "CII_example9.xml" })
              ret.add (new ClassPathResource (sPrefix + s));
          }
          else
            if (aVESID.equals (EN16931Validation.VID_CII_123))
            {
              final String sPrefix = "/test-files/1.2.3/cii/";
              for (final String s : new String [] { "CII_business_example_01.xml",
                                                    "CII_business_example_02.xml",
                                                    "CII_example1.xml",
                                                    "CII_example2.xml",
                                                    "CII_example3.xml",
                                                    "CII_example4.xml",
                                                    "CII_example5.xml",
                                                    "CII_example6.xml",
                                                    "CII_example7.xml",
                                                    "CII_example8.xml",
                                                    "CII_example9.xml" })
                ret.add (new ClassPathResource (sPrefix + s));
            }
            else
              if (aVESID.equals (EN16931Validation.VID_CII_130))
              {
                final String sPrefix = "/test-files/1.3.0/cii/";
                for (final String s : new String [] { "CII_business_example_01.xml",
                                                      "CII_business_example_02.xml",
                                                      "CII_example1.xml",
                                                      "CII_example2.xml",
                                                      "CII_example3.xml",
                                                      "CII_example4.xml",
                                                      "CII_example5.xml",
                                                      "CII_example6.xml",
                                                      "CII_example7.xml",
                                                      "CII_example8.xml",
                                                      "CII_example9.xml" })
                  ret.add (new ClassPathResource (sPrefix + s));
              }
              else
                if (aVESID.equals (EN16931Validation.VID_CII_131))
                {
                  final String sPrefix = "/test-files/1.3.1/cii/";
                  for (final String s : new String [] { "CII_example1.xml",
                                                        "CII_example2.xml",
                                                        "CII_example3.xml",
                                                        "CII_example4.xml",
                                                        "CII_example5.xml",
                                                        "CII_example6.xml",
                                                        "CII_example7.xml",
                                                        "CII_example8.xml",
                                                        "CII_example9.xml" })
                    ret.add (new ClassPathResource (sPrefix + s));
                }
                else
                  if (aVESID.equals (EN16931Validation.VID_CII_132))
                  {
                    final String sPrefix = "/test-files/1.3.2/cii/";
                    for (final String s : new String [] { "CII_example1.xml",
                                                          "CII_example2.xml",
                                                          "CII_example3.xml",
                                                          "CII_example4.xml",
                                                          "CII_example5.xml",
                                                          "CII_example6.xml",
                                                          "CII_example7.xml",
                                                          "CII_example8.xml",
                                                          "CII_example9.xml" })
                      ret.add (new ClassPathResource (sPrefix + s));
                  }
                  else
                    if (aVESID.equals (EN16931Validation.VID_EDIFACT_100))
                    {
                      final String sPrefix = "/test-files/1.0.0/edifact/";
                      for (final String s : new String [] { "EDIFACT_EXAMPLE1.xml",
                                                            "EDIFACT_EXAMPLE2.xml",
                                                            "EDIFACT_EXAMPLE3.xml",
                                                            "EDIFACT_EXAMPLE4.xml",
                                                            "EDIFACT_EXAMPLE5.xml",
                                                            "EDIFACT_EXAMPLE6.xml",
                                                            "EDIFACT_EXAMPLE7.xml",
                                                            "EDIFACT_EXAMPLE8.xml",
                                                            "EDIFACT_EXAMPLE9.xml" })
                        ret.add (new ClassPathResource (sPrefix + s));
                    }
                    else
                      if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_100))
                      {
                        final String sPrefix = "/test-files/1.0.0/ubl/";
                        for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                              "ubl-tc434-example2.xml",
                                                              "ubl-tc434-example3.xml",
                                                              "ubl-tc434-example4.xml",
                                                              "ubl-tc434-example5.xml",
                                                              "ubl-tc434-example6.xml",
                                                              "ubl-tc434-example7.xml",
                                                              "ubl-tc434-example8.xml",
                                                              "ubl-tc434-example9.xml" })
                          ret.add (new ClassPathResource (sPrefix + s));
                      }
                      else
                        if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_110))
                        {
                          final String sPrefix = "/test-files/1.1.0/ubl/";
                          for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                                "ubl-tc434-example2.xml",
                                                                "ubl-tc434-example3.xml",
                                                                "ubl-tc434-example4.xml",
                                                                "ubl-tc434-example5.xml",
                                                                "ubl-tc434-example6.xml",
                                                                "ubl-tc434-example7.xml",
                                                                "ubl-tc434-example8.xml",
                                                                "ubl-tc434-example9.xml" })
                            ret.add (new ClassPathResource (sPrefix + s));
                        }
                        else
                          if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_120))
                          {
                            final String sPrefix = "/test-files/1.2.0/ubl/";
                            for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                                  "ubl-tc434-example2.xml",
                                                                  "ubl-tc434-example3.xml",
                                                                  "ubl-tc434-example4.xml",
                                                                  "ubl-tc434-example5.xml",
                                                                  "ubl-tc434-example6.xml",
                                                                  "ubl-tc434-example7.xml",
                                                                  "ubl-tc434-example8.xml",
                                                                  "ubl-tc434-example9.xml" })
                              ret.add (new ClassPathResource (sPrefix + s));
                          }
                          else
                            if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_121))
                            {
                              final String sPrefix = "/test-files/1.2.1/ubl/";
                              for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                                    "ubl-tc434-example2.xml",
                                                                    "ubl-tc434-example3.xml",
                                                                    "ubl-tc434-example4.xml",
                                                                    "ubl-tc434-example5.xml",
                                                                    "ubl-tc434-example6.xml",
                                                                    "ubl-tc434-example7.xml",
                                                                    "ubl-tc434-example8.xml",
                                                                    "ubl-tc434-example9.xml" })
                                ret.add (new ClassPathResource (sPrefix + s));
                            }
                            else
                              if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_123))
                              {
                                final String sPrefix = "/test-files/1.2.3/ubl/";
                                for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                                      "ubl-tc434-example2.xml",
                                                                      "ubl-tc434-example3.xml",
                                                                      "ubl-tc434-example4.xml",
                                                                      "ubl-tc434-example5.xml",
                                                                      "ubl-tc434-example6.xml",
                                                                      "ubl-tc434-example7.xml",
                                                                      "ubl-tc434-example8.xml",
                                                                      "ubl-tc434-example9.xml" })
                                  ret.add (new ClassPathResource (sPrefix + s));
                              }
                              else
                                if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_130))
                                {
                                  final String sPrefix = "/test-files/1.3.0/ubl/";
                                  for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                                        "ubl-tc434-example2.xml",
                                                                        "ubl-tc434-example3.xml",
                                                                        "ubl-tc434-example4.xml",
                                                                        "ubl-tc434-example5.xml",
                                                                        "ubl-tc434-example6.xml",
                                                                        "ubl-tc434-example7.xml",
                                                                        "ubl-tc434-example8.xml",
                                                                        "ubl-tc434-example9.xml",
                                                                        "ubl-tc434-example10.xml" })
                                    ret.add (new ClassPathResource (sPrefix + s));
                                }
                                else
                                  if (aVESID.equals (EN16931Validation.VID_UBL_CREDIT_NOTE_130))
                                  {
                                    final String sPrefix = "/test-files/1.3.0/ubl/";
                                    for (final String s : new String [] { "ubl-tc434-creditnote1.xml" })
                                      ret.add (new ClassPathResource (sPrefix + s));
                                  }
                                  else
                                    if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_131))
                                    {
                                      final String sPrefix = "/test-files/1.3.1/ubl/";
                                      for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                                            "ubl-tc434-example2.xml",
                                                                            "ubl-tc434-example3.xml",
                                                                            "ubl-tc434-example4.xml",
                                                                            "ubl-tc434-example5.xml",
                                                                            "ubl-tc434-example6.xml",
                                                                            "ubl-tc434-example7.xml",
                                                                            "ubl-tc434-example8.xml",
                                                                            "ubl-tc434-example9.xml",
                                                                            "ubl-tc434-example10.xml" })
                                        ret.add (new ClassPathResource (sPrefix + s));
                                    }
                                    else
                                      if (aVESID.equals (EN16931Validation.VID_UBL_CREDIT_NOTE_131))
                                      {
                                        final String sPrefix = "/test-files/1.3.1/ubl/";
                                        for (final String s : new String [] { "ubl-tc434-creditnote1.xml" })
                                          ret.add (new ClassPathResource (sPrefix + s));
                                      }
                                      else
                                        if (aVESID.equals (EN16931Validation.VID_UBL_INVOICE_132))
                                        {
                                          final String sPrefix = "/test-files/1.3.2/ubl/";
                                          for (final String s : new String [] { "ubl-tc434-example1.xml",
                                                                                "ubl-tc434-example2.xml",
                                                                                "ubl-tc434-example3.xml",
                                                                                "ubl-tc434-example4.xml",
                                                                                "ubl-tc434-example5.xml",
                                                                                "ubl-tc434-example6.xml",
                                                                                "ubl-tc434-example7.xml",
                                                                                "ubl-tc434-example8.xml",
                                                                                "ubl-tc434-example9.xml",
                                                                                "ubl-tc434-example10.xml" })
                                            ret.add (new ClassPathResource (sPrefix + s));
                                        }
                                        else
                                          if (aVESID.equals (EN16931Validation.VID_UBL_CREDIT_NOTE_132))
                                          {
                                            final String sPrefix = "/test-files/1.3.2/ubl/";
                                            for (final String s : new String [] { "ubl-tc434-creditnote1.xml" })
                                              ret.add (new ClassPathResource (sPrefix + s));
                                          }
                                          else
                                            throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
    return ret;
  }
}
