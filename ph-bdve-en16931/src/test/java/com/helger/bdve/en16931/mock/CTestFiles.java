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
public final class CTestFiles
{
  private static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
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
    for (final VESID aVESID : new VESID [] { EN16931Validation.VID_CII,
                                             EN16931Validation.VID_EDIFACT,
                                             EN16931Validation.VID_UBL })
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
    if (aVESID.equals (EN16931Validation.VID_CII))
    {
      // CII files fail with pure!
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_business_example_01.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example1.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example2.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example3.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example4.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example5.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example6.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example7.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example8.xml"));
      ret.add (new ClassPathResource ("/test-files/cii/instance/CII_example9.xml"));
    }
    else
      if (aVESID.equals (EN16931Validation.VID_EDIFACT))
      {
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE1.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE2.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE3.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE4.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE5.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE6.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE7.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE8.xml"));
        ret.add (new ClassPathResource ("/test-files/edifact/instance/EDIFACT_EXAMPLE9.xml"));
      }
      else
        if (aVESID.equals (EN16931Validation.VID_UBL))
        {
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example1.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example2.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example3.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example4.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example5.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example6.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example7.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example8.xml"));
          ret.add (new ClassPathResource ("/test-files/ubl/examples/ubl-tc434-example9.xml"));
        }
        else
          throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
    return ret;
  }
}
