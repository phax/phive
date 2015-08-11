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
package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.helger.commons.debug.GlobalDebug;
import com.helger.commons.io.file.FileOperations;
import com.helger.peppol.validation.domain.peppol.EBII2Transaction;
import com.helger.peppol.validation.supplementary.createrules.codelist.RuleCodeListCreator;
import com.helger.peppol.validation.supplementary.createrules.codelist.RuleSourceCodeList;
import com.helger.peppol.validation.supplementary.createrules.sch.RuleSchematronCreator;
import com.helger.peppol.validation.supplementary.createrules.sch.RuleXSLTCreator;
import com.helger.peppol.validation.supplementary.createrules.util.CreateHelper;

public final class MainCreateValidationRules
{
  public static void main (final String [] args) throws Exception
  {
    GlobalDebug.setDebugModeDirect (false);

    // Base directory for source rules
    final File aRuleSource = new File ("src/test/resources/rule-source");
    final File aRuleTarget = new File ("src/main/resources/peppol-rules");

    // Add all base directories
    final List <RuleSourceGroup> aRuleSourceGroups = new ArrayList <RuleSourceGroup> ();
    if (false)
    {
      final RuleSourceGroup aT10_AT = new RuleSourceGroup (aRuleSource,
                                                           aRuleTarget,
                                                           ESyntaxBinding.UBL,
                                                           EBII2Transaction.T10);
      aT10_AT.addItem ("atgov")
             .addBussinessRule ("businessrules/atgov-T10-BusinessRules-v03.ods")
             .addBussinessRule ("businessrules/atgov-T14-BusinessRules-v03.ods");
      aT10_AT.addItem ("atnat")
             .addBussinessRule ("businessrules/atnat-T10-BusinessRules-v04.ods")
             .addBussinessRule ("businessrules/atnat-T14-BusinessRules-v04.ods");
    }

    // Catalogue
    {
      final RuleSourceGroup aT19 = new RuleSourceGroup (aRuleSource,
                                                        new File (aRuleTarget, "Catalogue"),
                                                        ESyntaxBinding.UBL,
                                                        EBII2Transaction.T19);
      aT19.addItem ("BIIRULES")
          .addCodeList ("biirules/businessrules/bii2rules-CodeLists-v04.ods")
          .addBussinessRule ("biirules/businessrules/bii2rules-T19-BusinessRules-v05.ods");
      aT19.addItem ("OPENPEPPOL")
          .addCodeList ("peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods")
          .addBussinessRule ("peppol/businessrules/OpenPEPPOL-T19-BusinessRules-v01.ods");
      aRuleSourceGroups.add (aT19);

      final RuleSourceGroup aT58 = new RuleSourceGroup (aRuleSource,
                                                        new File (aRuleTarget, "Catalogue"),
                                                        ESyntaxBinding.UBL,
                                                        EBII2Transaction.T58);
      aT58.addItem ("BIIRULES").addBussinessRule ("biirules/businessrules/bii2rules-T58-BusinessRules-v01.ods");
      aT58.addItem ("OPENPEPPOL")
          .addCodeList ("peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods")
          .addBussinessRule ("peppol/businessrules/OpenPEPPOL-T58-BusinessRules-v01.ods");
      aRuleSourceGroups.add (aT58);
    }

    // Despatch Advice
    {
      final RuleSourceGroup aT16 = new RuleSourceGroup (aRuleSource,
                                                        new File (aRuleTarget, "DespatchAdvice"),
                                                        ESyntaxBinding.UBL,
                                                        EBII2Transaction.T16);
      aT16.addItem ("BIIRULES").addBussinessRule ("biirules/businessrules/bii2rules-T16-BusinessRules-v05.ods");
      aT16.addItem ("OPENPEPPOL")
          .addCodeList ("peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods")
          .addBussinessRule ("peppol/businessrules/OpenPEPPOL-T16-BusinessRules-v01.ods");
      aRuleSourceGroups.add (aT16);
    }

    // Invoice
    {
      final RuleSourceGroup aT10 = new RuleSourceGroup (aRuleSource,
                                                        new File (aRuleTarget, "Invoice"),
                                                        ESyntaxBinding.UBL,
                                                        EBII2Transaction.T10);
      aT10.addItem ("BIIRULES")
          .addCodeList ("biirules/businessrules/bii2rules-CodeLists-v04.ods")
          .addBussinessRule ("biirules/businessrules/bii2rules-T10-BusinessRules-v12.ods");
      aT10.addItem ("OPENPEPPOL")
          .addCodeList ("peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods")
          .addBussinessRule ("peppol/businessrules/OpenPEPPOL-T10-BusinessRules-v03.ods");
      aRuleSourceGroups.add (aT10);
    }

    // Message Level Response
    {
      final RuleSourceGroup aT71 = new RuleSourceGroup (aRuleSource,
                                                        new File (aRuleTarget, "MLR"),
                                                        ESyntaxBinding.UBL,
                                                        EBII2Transaction.T71);
      aT71.addItem ("BIIRULES")
          .addCodeList ("biirules/businessrules/bii2rules-CodeLists-v04.ods")
          .addBussinessRule ("biirules/businessrules/bii2rules-T71-BusinessRules-v03.ods");
      aT71.addItem ("OPENPEPPOL")
          .addCodeList ("peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods")
          .addBussinessRule ("peppol/businessrules/OpenPEPPOL-T71-BusinessRules-v01.ods");
      aRuleSourceGroups.add (aT71);
    }

    // Order
    {
      final RuleSourceGroup aT01 = new RuleSourceGroup (aRuleSource,
                                                        new File (aRuleTarget, "Order"),
                                                        ESyntaxBinding.UBL,
                                                        EBII2Transaction.T01);
      aT01.addItem ("BIIRULES").addBussinessRule ("biirules/businessrules/bii2rules-T01-BusinessRules-v09.ods");
      aT01.addItem ("OPENPEPPOL")
          .addCodeList ("peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods")
          .addBussinessRule ("peppol/businessrules/OpenPEPPOL-T01-BusinessRules-v01.ods");
      aRuleSourceGroups.add (aT01);
    }

    for (final RuleSourceGroup aRuleSourceGroup : aRuleSourceGroups)
    {
      // Copy BIICORE file (if present)
      {
        final File aBIICore = aRuleSourceGroup.getBIICORESrcFile ();
        if (aBIICore.exists ())
          FileOperations.copyFile (aBIICore, aRuleSourceGroup.getBIICOREDstFile ());
      }

      final List <RuleSourceItem> aRuleSourceItems = aRuleSourceGroup.getAllItems ();

      // Process code lists
      for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
        for (final RuleSourceCodeList aCodeList : aRuleSourceItem.getAllCodeLists ())
          new RuleCodeListCreator ().createCodeLists (aCodeList);

      // Create Schematron
      RuleSchematronCreator.createSchematrons (aRuleSourceItems);

      if (false)
      {
        // Now create the validation XSLTs
        // Processing time: terribly slow for biicore
        RuleXSLTCreator.createXSLTs (aRuleSourceItems);
      }
    }

    CreateHelper.log ("Finished building validation rules");
    CreateHelper.log ("Now run 'mvn license:format' on the commandline to add all the file headers!");
  }
}
