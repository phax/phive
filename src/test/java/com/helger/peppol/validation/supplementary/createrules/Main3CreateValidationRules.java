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

public final class Main3CreateValidationRules
{
  public static void main (final String [] args) throws Exception
  {
    GlobalDebug.setDebugModeDirect (false);

    // Base directory for source rules
    final File aRuleSource = new File ("src/test/resources/rule-source");
    final File aRuleTarget = new File ("src/main/resources/peppol-rules");

    // Add all base directories
    final List <RuleSourceGroup> aRuleSourceGroups = new ArrayList <RuleSourceGroup> ();

    // Catalogue
    aRuleSourceGroups.add (new RuleSourceGroup (aRuleSource,
                                                new File (aRuleTarget, "Catalogue"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T19).addAllFrom (ERuleSource.T19));
    aRuleSourceGroups.add (new RuleSourceGroup (aRuleSource,
                                                new File (aRuleTarget, "Catalogue"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T58).addAllFrom (ERuleSource.T58));

    // Despatch Advice
    aRuleSourceGroups.add (new RuleSourceGroup (aRuleSource,
                                                new File (aRuleTarget, "DespatchAdvice"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T16).addAllFrom (ERuleSource.T16));

    // Invoice
    aRuleSourceGroups.add (new RuleSourceGroup (aRuleSource,
                                                new File (aRuleTarget, "Invoice"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T10).addAllFrom (ERuleSource.T10));

    // Message Level Response
    aRuleSourceGroups.add (new RuleSourceGroup (aRuleSource,
                                                new File (aRuleTarget, "MLR"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T71).addAllFrom (ERuleSource.T71));

    // Order
    aRuleSourceGroups.add (new RuleSourceGroup (aRuleSource,
                                                new File (aRuleTarget, "Order"),
                                                ESyntaxBinding.UBL,
                                                EBII2Transaction.T01).addAllFrom (ERuleSource.T01));

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
