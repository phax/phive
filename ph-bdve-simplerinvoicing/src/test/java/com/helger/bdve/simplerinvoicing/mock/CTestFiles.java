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
package com.helger.bdve.simplerinvoicing.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.simplerinvoicing.SimplerInvoicingValidation;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

@Immutable
public final class CTestFiles
{
  private static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    SimplerInvoicingValidation.initSimplerInvoicing (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList<> ();
    for (final VESID aVESID : new VESID [] { SimplerInvoicingValidation.VID_SIMPLERINVOICING_V11 })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aVESID))
        ret.add (MockFile.createGoodCase (aRes, aVESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    if (aVESID.equals (SimplerInvoicingValidation.VID_SIMPLERINVOICING_V11))
    {
      final ICommonsList <IReadableResource> ret = new CommonsArrayList<> ();
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-BII2-T10-R034.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-BII2-T10-R035.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-BII2-T10-R037.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-BII2-T10-R045.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-BII2-T10-R046.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-EUGEN-T10-R026.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-EUGEN-T10-R030.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-EUGEN-T10-R035.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-EUGEN-T10-R036.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-EUGEN-T10-R037.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-EUGEN-T10-R038.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-extension.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-full-multiple-currencies.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-full-single-currency.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-full-tax-currency.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-full-tax-subcategory.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-full.xml"));
      if (false)
        ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-minimal-corrective.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-minimal.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-reference.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-ok-single-item.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-warning-CL-T10-R006.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-warning-CL-T10-R007.xml"));
      ret.add (new ClassPathResource ("/test-files/simplerinvoicing/1.1/SI-UBL-1.1-warning-CL-T10-R010.xml"));
      return ret;
    }

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
