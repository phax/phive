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
package com.helger.peppol.validation.engine.mock;

import java.util.Set;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.ValidationArtefactKey;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.peppol.testfiles.official.OfficialTestFiles;
import com.helger.peppol.validation.engine.peppol.CPeppolValidation;

@Immutable
public final class CTestFiles
{
  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList<> ();
    for (final ValidationArtefactKey aPTK : new ValidationArtefactKey [] { CPeppolValidation.CATALOGUE_01_T19,
                                                           CPeppolValidation.CATALOGUE_01_T58,
                                                           CPeppolValidation.ORDER_03_T01,
                                                           CPeppolValidation.INVOICE_04_T10,
                                                           CPeppolValidation.BILLING_05_T14,
                                                           CPeppolValidation.ORDERING_28_T01,
                                                           CPeppolValidation.ORDERING_28_T76,
                                                           CPeppolValidation.DESPATCH_ADVICE_30_T16 })
      for (final ClassPathResource aRes : getAllMatchingTestFiles (aPTK))
        ret.add (new MockFile (aRes, aPTK, (Set <String>) null));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <ClassPathResource> getAllMatchingTestFiles (@Nonnull final ValidationArtefactKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    if (aTransactionKey.equals (CPeppolValidation.CATALOGUE_01_T19))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T19 ();
    if (aTransactionKey.equals (CPeppolValidation.CATALOGUE_01_T58))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T58 ();
    if (aTransactionKey.equals (CPeppolValidation.ORDER_03_T01))
      return OfficialTestFiles.getAllTestFilesOrder_03_T01 ();
    if (aTransactionKey.equals (CPeppolValidation.INVOICE_04_T10))
      return OfficialTestFiles.getAllTestFilesInvoice_04_T10 ();
    if (aTransactionKey.equals (CPeppolValidation.BILLING_05_T14))
      return OfficialTestFiles.getAllTestFilesBilling_05_T14 ();
    if (aTransactionKey.equals (CPeppolValidation.ORDERING_28_T01))
      return OfficialTestFiles.getAllTestFilesOrdering_28_T01 ();
    if (aTransactionKey.equals (CPeppolValidation.ORDERING_28_T76))
      return OfficialTestFiles.getAllTestFilesOrdering_28_T76 ();
    if (aTransactionKey.equals (CPeppolValidation.DESPATCH_ADVICE_30_T16))
      return OfficialTestFiles.getAllTestFilesDespatchAdvice_30_T16 ();

    throw new IllegalArgumentException ("Invalid transaction key: " + aTransactionKey);
  }
}
