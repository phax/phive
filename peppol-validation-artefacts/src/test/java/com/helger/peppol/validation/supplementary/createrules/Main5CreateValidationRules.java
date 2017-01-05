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
package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;

import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.debug.GlobalDebug;
import com.helger.commons.io.file.FileOperations;
import com.helger.peppol.validation.api.peppol.EBII2Transaction;
import com.helger.peppol.validation.supplementary.createrules.codelist.RuleCodeListCreator;
import com.helger.peppol.validation.supplementary.createrules.codelist.RuleSourceCodeList;
import com.helger.peppol.validation.supplementary.createrules.sch.RuleSchematronCreator;
import com.helger.peppol.validation.supplementary.createrules.sch.RuleXSLTCreator;
import com.helger.peppol.validation.supplementary.createrules.util.CreateHelper;

public final class Main5CreateValidationRules
{
  public static void main (final String [] args) throws Exception
  {
    GlobalDebug.setDebugModeDirect (false);

    final File aRuleTarget = new File ("src/main/resources/peppol-rules");

    // Add all base directories
    final ICommonsList <RuleSourceGroup> aRuleSourceGroups = new CommonsArrayList<> ();

    // Billing
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Billing"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T14).addDefault (ERuleSource.T14));
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Billing-Thirdparty"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T14).addThirdparty ());

    // Catalogue
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Catalogue"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T19).addDefault (ERuleSource.T19));
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Catalogue"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T58).addDefault (ERuleSource.T58));

    // Despatch Advice
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "DespatchAdvice"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T16).addDefault (ERuleSource.T16));

    // Invoice
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Invoice"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T10).addDefault (ERuleSource.T10));
    // Invoice
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Invoice-Thirdparty"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T10).addThirdparty ());

    // Message Level Response
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "MLR"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T71).addDefault (ERuleSource.T71));

    // Order
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Order"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T01).addDefault (ERuleSource.T01));

    // Ordering
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Ordering"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T01).addDefault (ERuleSource.T01));
    aRuleSourceGroups.add (new RuleSourceGroup (new File (aRuleTarget, "Ordering"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T76).addDefault (ERuleSource.T76));

    for (final RuleSourceGroup aRuleSourceGroup : aRuleSourceGroups)
    {
      // Copy BIICORE files (if present)
      {
        final File aBIICoreSchematron = aRuleSourceGroup.getBIICoreSchematronSrcFile ();
        if (aBIICoreSchematron != null)
          FileOperations.copyFile (aBIICoreSchematron, aRuleSourceGroup.getBIICoreSchematronDstFile ());

        final File aBIICoreXSLT = aRuleSourceGroup.getBIICoreXSLTSrcFile ();
        if (aBIICoreXSLT != null)
          FileOperations.copyFile (aBIICoreXSLT, aRuleSourceGroup.getBIICoreXSLTDstFile ());
      }

      final ICommonsList <RuleSourceItem> aRuleSourceItems = aRuleSourceGroup.getAllItems ();

      // Process code lists
      for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
        for (final RuleSourceCodeList aCodeList : aRuleSourceItem.getAllCodeLists ())
          new RuleCodeListCreator ().createCodeLists (aCodeList);

      // Create Schematron
      RuleSchematronCreator.createSchematrons (aRuleSourceItems);

      // Now create the validation XSLTs
      RuleXSLTCreator.createXSLTs (aRuleSourceItems);
    }

    CreateHelper.log ("Finished building validation rules");
    CreateHelper.log ("Now run 'mvn license:format' on the commandline to add all the file headers!");
  }
}
