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
package com.helger.bdve.peppol.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.peppol.PeppolValidation;
import com.helger.bdve.peppol.PeppolValidation370;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.peppol.testfiles.official.OfficialTestFiles;

@Immutable
public final class CTestFiles
{
  private static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    PeppolValidation.initStandard (VES_REGISTRY);
    PeppolValidation.initThirdParty (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aESID : new VESID [] { PeppolValidation370.VID_OPENPEPPOL_T19_V2.getWithVersion (PeppolValidation.VERSION_TO_USE),
                                            PeppolValidation370.VID_OPENPEPPOL_T58_V2.getWithVersion (PeppolValidation.VERSION_TO_USE),
                                            PeppolValidation370.VID_OPENPEPPOL_T01_V2.getWithVersion (PeppolValidation.VERSION_TO_USE),
                                            PeppolValidation370.VID_OPENPEPPOL_T10_V2.getWithVersion (PeppolValidation.VERSION_TO_USE),
                                            PeppolValidation370.VID_OPENPEPPOL_T14_V2.getWithVersion (PeppolValidation.VERSION_TO_USE),
                                            PeppolValidation370.VID_OPENPEPPOL_T76_V2.getWithVersion (PeppolValidation.VERSION_TO_USE),
                                            PeppolValidation370.VID_OPENPEPPOL_T16_V2.getWithVersion (PeppolValidation.VERSION_TO_USE), })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aESID))
        ret.add (MockFile.createGoodCase (aRes, aESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    if (aVESID.equals (PeppolValidation370.VID_OPENPEPPOL_T19_V2.getWithVersion (PeppolValidation.VERSION_TO_USE)))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T19 ();
    if (aVESID.equals (PeppolValidation370.VID_OPENPEPPOL_T58_V2.getWithVersion (PeppolValidation.VERSION_TO_USE)))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T58 ();
    if (aVESID.equals (PeppolValidation370.VID_OPENPEPPOL_T01_V2.getWithVersion (PeppolValidation.VERSION_TO_USE)))
      return OfficialTestFiles.getAllTestFilesOrder_03_T01 ();
    if (aVESID.equals (PeppolValidation370.VID_OPENPEPPOL_T10_V2.getWithVersion (PeppolValidation.VERSION_TO_USE)))
      return OfficialTestFiles.getAllTestFilesInvoice_04_T10 ();
    if (aVESID.equals (PeppolValidation370.VID_OPENPEPPOL_T14_V2.getWithVersion (PeppolValidation.VERSION_TO_USE)))
      return OfficialTestFiles.getAllTestFilesBilling_05_T14 ();
    if (aVESID.equals (PeppolValidation370.VID_OPENPEPPOL_T76_V2.getWithVersion (PeppolValidation.VERSION_TO_USE)))
      return OfficialTestFiles.getAllTestFilesOrdering_28_T76 ();
    if (aVESID.equals (PeppolValidation370.VID_OPENPEPPOL_T16_V2.getWithVersion (PeppolValidation.VERSION_TO_USE)))
      return OfficialTestFiles.getAllTestFilesDespatchAdvice_30_T16 ();

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
