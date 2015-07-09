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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.peppol.validation.domain.peppol.PeppolTransactionKey;

@Immutable
public final class CTestFiles
{
  private static final List <MockFile> s_aTestFiles = new ArrayList <MockFile> ();

  static
  {
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Use case 1.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Use case 2.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Use case 3.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Use case 4.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Use case 5.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T19));

    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Response use case 1 TP.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Response use case 2 TP.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Response use case 3 TP.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Response use case 4 TP.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS01A/Catalogue Response use case 5 TP.xml",
                                                       PeppolTransactionKey.CATALOGUE_01_T58));

    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS03A/UC1_Order.xml", PeppolTransactionKey.ORDER_03_T01));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS03A/UC2_Order.xml", PeppolTransactionKey.ORDER_03_T01));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS03A/UC3_Order.xml", PeppolTransactionKey.ORDER_03_T01));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS03A/UC4_Order.xml", PeppolTransactionKey.ORDER_03_T01));

    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS04A/good-bis4a-zero-amount.xml",
                                                       PeppolTransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS04A/Use Case 1.a_ExampleFile_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS04A/Use Case 1.b_ExampleFile_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS04A/Use Case 2_ExampleFile_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS04A/Use Case 3_ExampleFile_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS04A/Use Case 4_ExampleFile_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS04A/Use Case 5_ExampleFile_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.INVOICE_04_T10));

    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS05A/good-bis5a-zero-amount.xml",
                                                       PeppolTransactionKey.BILLING_05_T14));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS05A/Use Case 1.a_CreditNote_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.BILLING_05_T14));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS05A/Use Case 1.b_CreditNote_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.BILLING_05_T14));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS05A/Use Case 2_CreditNote_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.BILLING_05_T14));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS05A/Use Case 3_CreditNote_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.BILLING_05_T14));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS05A/Use Case 4_CreditNote_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.BILLING_05_T14));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS05A/Use Case 5_CreditNote_PEPPOL BIS.xml",
                                                       PeppolTransactionKey.BILLING_05_T14));

    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC1_Order.xml", PeppolTransactionKey.ORDERING_28_T01));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC2_Order.xml", PeppolTransactionKey.ORDERING_28_T01));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC3_Order.xml", PeppolTransactionKey.ORDERING_28_T01));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC4_Order.xml", PeppolTransactionKey.ORDERING_28_T01));

    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC1_Order_response.xml",
                                                       PeppolTransactionKey.ORDERING_28_T76));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC2_Order_response.xml",
                                                       PeppolTransactionKey.ORDERING_28_T76));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC3_Order_response.xml",
                                                       PeppolTransactionKey.ORDERING_28_T76));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS28A/UC4_Order_response.xml",
                                                       PeppolTransactionKey.ORDERING_28_T76));

    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2_1BII2 openPEPPOL BIS_UseCase4.xml",
                                                       PeppolTransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2_1BII2 openPEPPOL BIS_UseCase5.xml",
                                                       PeppolTransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2.1BII2 openPEPPOL BIS_UseCase1.xml",
                                                       PeppolTransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2.1BII2 openPEPPOL BIS_UseCase2.xml",
                                                       PeppolTransactionKey.DESPATCH_ADVICE_30_T16));
    s_aTestFiles.add (MockStandardFile.createGoodCase ("BIS30A/UBL-DespatchAdvice-2.1BII2 openPEPPOL BIS_UseCase3.xml",
                                                       PeppolTransactionKey.DESPATCH_ADVICE_30_T16));
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static List <MockFile> getAllTestFiles ()
  {
    return CollectionHelper.newList (s_aTestFiles);
  }

  @Nonnull
  @ReturnsMutableCopy
  public static List <MockFile> getAllMatchingTestFiles (@Nonnull final TransactionKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    final List <MockFile> ret = new ArrayList <MockFile> ();
    for (final MockFile aTF : s_aTestFiles)
      if (aTF.getTransactionKey ().equals (aTransactionKey))
        ret.add (aTF);
    return ret;
  }
}
