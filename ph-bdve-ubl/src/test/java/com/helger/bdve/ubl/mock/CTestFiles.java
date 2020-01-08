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
package com.helger.bdve.ubl.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.ubl.UBLValidation;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl.testfiles.UBLTestFiles;

@Immutable
public final class CTestFiles
{
  public static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    UBLValidation.initUBLAllVersions (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aESID : new VESID [] { UBLValidation.VID_UBL_20_INVOICE,
                                            UBLValidation.VID_UBL_21_INVOICE,
                                            UBLValidation.VID_UBL_22_INVOICE,
                                            UBLValidation.VID_UBL_23_INVOICE })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aESID))
        ret.add (MockFile.createGoodCase (aRes, aESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    if (aVESID.equals (UBLValidation.VID_UBL_20_INVOICE))
      return new CommonsArrayList <> (UBLTestFiles.INVOICE_FILES, ClassPathResource::new);
    if (aVESID.equals (UBLValidation.VID_UBL_21_INVOICE))
      return new CommonsArrayList <> (UBLTestFiles.INVOICE_FILES, ClassPathResource::new);
    if (aVESID.equals (UBLValidation.VID_UBL_22_INVOICE))
      return new CommonsArrayList <> (UBLTestFiles.INVOICE_FILES, ClassPathResource::new);
    if (aVESID.equals (UBLValidation.VID_UBL_23_INVOICE))
      return new CommonsArrayList <> (UBLTestFiles.INVOICE_FILES, ClassPathResource::new);

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
