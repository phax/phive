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

    final RuleSourceGroup aT10 = new RuleSourceGroup (aRuleSource,
                                                      aRuleTarget,
                                                      ESyntaxBinding.UBL,
                                                      EBII2Transaction.T10);
    aT10.addItem ("BIIRULES").addCodeList ("biirules/businessrules/bii2rules-CodeLists-v04.ods");
    aT10.addItem ("OPENPEPPOL")
        .addCodeList ("peppol/businessrules/OpenPEPPOL-CodeLists-v01.ods")
        .addBussinessRule ("peppol/businessrules/OpenPEPPOL-T10-BusinessRules-v03.ods");

    // Create all codelists (GC + CVA)
    // Processing time: quite quick
    for (final RuleSourceGroup aRuleSourceGroup : aRuleSourceGroups)
    {
      final List <RuleSourceItem> aRuleSourceItems = aRuleSourceGroup.getAllItems ();

      // Copy BIICORE file (if present)
      {
        final File aBIICore = aRuleSourceGroup.getBIICORESrcFile ();
        if (aBIICore.exists ())
          FileOperations.copyFile (aBIICore, aRuleSourceGroup.getBIICOREDstFile ());
      }

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
