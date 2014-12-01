package com.helger.peppol.validation.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.concurrent.Immutable;

import com.helger.peppol.validation.domain.TransactionKey;

@Immutable
public final class CTestFiles
{
  private static final List <TestFile> s_aTestFiles = new ArrayList <TestFile> ();

  static
  {
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Use case 1.xml", TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Use case 2.xml", TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Use case 3.xml", TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Use case 4.xml", TransactionKey.CATALOGUE_01_T19));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Use case 5.xml", TransactionKey.CATALOGUE_01_T19));

    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Response use case 1 TP.xml",
                                            TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Response use case 2 TP.xml",
                                            TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Response use case 3 TP.xml",
                                            TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Response use case 4 TP.xml",
                                            TransactionKey.CATALOGUE_01_T58));
    s_aTestFiles.add (new StandardTestFile ("BIS01A/Catalogue Response use case 5 TP.xml",
                                            TransactionKey.CATALOGUE_01_T58));

    s_aTestFiles.add (new StandardTestFile ("BIS03A/UC1_Order.xml", TransactionKey.ORDER_03_T01));
    s_aTestFiles.add (new StandardTestFile ("BIS03A/UC2_Order.xml", TransactionKey.ORDER_03_T01));
    s_aTestFiles.add (new StandardTestFile ("BIS03A/UC3_Order.xml", TransactionKey.ORDER_03_T01));
    s_aTestFiles.add (new StandardTestFile ("BIS03A/UC4_Order.xml", TransactionKey.ORDER_03_T01));

    s_aTestFiles.add (new StandardTestFile ("BIS04A/Use Case 1.a_ExampleFile_PEPPOL BIS.xml",
                                            TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (new StandardTestFile ("BIS04A/Use Case 1.b_ExampleFile_PEPPOL BIS.xml",
                                            TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (new StandardTestFile ("BIS04A/Use Case 2_ExampleFile_PEPPOL BIS.xml",
                                            TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (new StandardTestFile ("BIS04A/Use Case 3_ExampleFile_PEPPOL BIS.xml",
                                            TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (new StandardTestFile ("BIS04A/Use Case 4_ExampleFile_PEPPOL BIS.xml",
                                            TransactionKey.INVOICE_04_T10));
    s_aTestFiles.add (new StandardTestFile ("BIS04A/Use Case 5_ExampleFile_PEPPOL BIS.xml",
                                            TransactionKey.INVOICE_04_T10));
  }
}
