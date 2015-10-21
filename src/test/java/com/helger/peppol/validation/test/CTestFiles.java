/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.peppol.testfiles.official.OfficialTestFiles;
import com.helger.peppol.validation.domain.ValidationKey;
import com.helger.peppol.validation.domain.peppol.PeppolValidationKey;

@Immutable
public final class CTestFiles
{
  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static List <MockFile> getAllTestFiles ()
  {
    final List <MockFile> ret = new ArrayList <MockFile> ();
    for (final ValidationKey aPTK : new ValidationKey [] { PeppolValidationKey.CATALOGUE_01_T19,
                                                             PeppolValidationKey.CATALOGUE_01_T58,
                                                             PeppolValidationKey.ORDER_03_T01,
                                                             PeppolValidationKey.INVOICE_04_T10,
                                                             PeppolValidationKey.BILLING_05_T14,
                                                             PeppolValidationKey.ORDERING_28_T01,
                                                             PeppolValidationKey.ORDERING_28_T76,
                                                             PeppolValidationKey.DESPATCH_ADVICE_30_T16 })
      for (final ClassPathResource aRes : getAllMatchingTestFiles (aPTK))
        ret.add (new MockFile (aRes, aPTK, (Set <String>) null));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static List <ClassPathResource> getAllMatchingTestFiles (@Nonnull final ValidationKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    if (aTransactionKey.equals (PeppolValidationKey.CATALOGUE_01_T19))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T19 ();
    if (aTransactionKey.equals (PeppolValidationKey.CATALOGUE_01_T58))
      return OfficialTestFiles.getAllTestFilesCatalogue_01_T58 ();
    if (aTransactionKey.equals (PeppolValidationKey.ORDER_03_T01))
      return OfficialTestFiles.getAllTestFilesOrder_03_T01 ();
    if (aTransactionKey.equals (PeppolValidationKey.INVOICE_04_T10))
      return OfficialTestFiles.getAllTestFilesInvoice_04_T10 ();
    if (aTransactionKey.equals (PeppolValidationKey.BILLING_05_T14))
      return OfficialTestFiles.getAllTestFilesBilling_05_T14 ();
    if (aTransactionKey.equals (PeppolValidationKey.ORDERING_28_T01))
      return OfficialTestFiles.getAllTestFilesOrdering_28_T01 ();
    if (aTransactionKey.equals (PeppolValidationKey.ORDERING_28_T76))
      return OfficialTestFiles.getAllTestFilesOrdering_28_T76 ();
    if (aTransactionKey.equals (PeppolValidationKey.DESPATCH_ADVICE_30_T16))
      return OfficialTestFiles.getAllTestFilesDespatchAdvice_30_T16 ();

    throw new IllegalArgumentException ("Invalid transaction key: " + aTransactionKey);
  }
}
