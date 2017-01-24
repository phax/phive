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
package com.helger.peppol.validation.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.peppol.testfiles.official.OfficialTestFiles;
import com.helger.peppol.validation.CPeppolValidation;
import com.helger.peppol.validation.EVASimplerInvoicing;

@Immutable
public final class CTestFiles
{
  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final ValidationArtefactKey aVK : new ValidationArtefactKey [] { EVASimplerInvoicing.INVOICE_SIMPLER_INVOICING.getValidationKey (),
                                                                          CPeppolValidation.VK_CATALOGUE_01_T19,
                                                                          CPeppolValidation.VK_CATALOGUE_01_T58,
                                                                          CPeppolValidation.VK_ORDER_03_T01,
                                                                          CPeppolValidation.VK_INVOICE_04_T10,
                                                                          CPeppolValidation.VK_BILLING_05_T14,
                                                                          CPeppolValidation.VK_ORDERING_28_T01,
                                                                          CPeppolValidation.VK_ORDERING_28_T76,
                                                                          CPeppolValidation.VK_DESPATCH_ADVICE_30_T16, })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aVK))
        ret.add (MockFile.createGoodCase (aRes, aVK));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final ValidationArtefactKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    if (aTransactionKey.equals (CPeppolValidation.VK_CATALOGUE_01_T19))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T19 ();
    if (aTransactionKey.equals (CPeppolValidation.VK_CATALOGUE_01_T58))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T58 ();
    if (aTransactionKey.equals (CPeppolValidation.VK_ORDER_03_T01))
      return OfficialTestFiles.getAllTestFilesOrder_03_T01 ();
    if (aTransactionKey.equals (CPeppolValidation.VK_INVOICE_04_T10))
      return OfficialTestFiles.getAllTestFilesInvoice_04_T10 ();
    if (aTransactionKey.equals (CPeppolValidation.VK_BILLING_05_T14))
      return OfficialTestFiles.getAllTestFilesBilling_05_T14 ();
    if (aTransactionKey.equals (CPeppolValidation.VK_ORDERING_28_T01))
      return OfficialTestFiles.getAllTestFilesOrdering_28_T01 ();
    if (aTransactionKey.equals (CPeppolValidation.VK_ORDERING_28_T76))
      return OfficialTestFiles.getAllTestFilesOrdering_28_T76 ();
    if (aTransactionKey.equals (CPeppolValidation.VK_DESPATCH_ADVICE_30_T16))
      return OfficialTestFiles.getAllTestFilesDespatchAdvice_30_T16 ();
    if (aTransactionKey.equals (EVASimplerInvoicing.INVOICE_SIMPLER_INVOICING.getValidationKey ()))
    {
      final ICommonsList <IReadableResource> ret = new CommonsArrayList <> ();
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

    throw new IllegalArgumentException ("Invalid transaction key: " + aTransactionKey);
  }
}
