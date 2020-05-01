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
package com.helger.bdve.ebinterface.mock;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

public enum EEbInterfaceTestFiles
{
  V30 ("/ebinterface/v30/",
       new String [] { "230A001-FA08-3242.XML",
                       "230A004-FA08-3244.XML",
                       "230A004-FA08-3245.XML",
                       "beispielwordrechnung.xml",
                       "ebInterface-Beispiel-GU-public.xml",
                       "ebInterface-Beispiel-RE-public.xml",
                       "valid1.xml",
                       "valid2.xml",
                       "valid3.xml",
                       "valid4.xml",
                       "valid5.xml",
                       "valid6.xml" }),
  V302 ("/ebinterface/v302/",
        new String [] { "2011-0001-2011-09-12.XML",
                        "InvoiceExample1.xml",
                        "InvoiceExample2.xml",
                        "mesonic1-corrupted.xml",
                        "mesonic1.xml",
                        "mesonic2-corrupted.xml",
                        "mesonic2.xml",
                        "mesonic3-corrupted.xml",
                        "valid_and_signed.xml" }),
  V40 ("/ebinterface/v40/",
       new String [] { "86516_203053.xml",
                       "86523_203054.xml",
                       "86525_203055.xml",
                       "86526_203056.xml",
                       "86528_203057.xml",
                       "86529_203058.xml",
                       "ebinterface4-test1.xml",
                       "ebinterface4-test2.xml",
                       "handysignature.xml",
                       "testinstance-no-svnr.xml",
                       "testinstance-valid-schema.xml", }),
  V41 ("/ebinterface/v41/", new String [] { "testinstance-valid-schema.xml" }),
  V42 ("/ebinterface/v42/", new String [] { "testinstance-valid-schema.xml" }),
  V43 ("/ebinterface/v43/", new String [] { "testinstance-valid-schema.xml" }),
  V50 ("/ebinterface/v50/", new String [] { "testinstance-valid-schema.xml" }),
  V60 ("/ebinterface/v60/", new String [] { "ebinterface_6p0_sample_dokumentation.xml", "ebinterface_6p0_sample.xml" });

  private final ICommonsList <IReadableResource> m_aTestFiles = new CommonsArrayList <> ();

  EEbInterfaceTestFiles (final String sBaseDir, final String [] aFiles)
  {
    for (final String sFile : aFiles)
      m_aTestFiles.add (new ClassPathResource (sBaseDir + sFile));
  }

  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  public ICommonsList <IReadableResource> getTestResources ()
  {
    return m_aTestFiles.getClone ();
  }
}
