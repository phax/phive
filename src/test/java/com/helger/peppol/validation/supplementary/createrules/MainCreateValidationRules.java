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
import com.helger.peppol.validation.supplementary.createrules.codelist.CodeListCreator;
import com.helger.peppol.validation.supplementary.createrules.codelist.RuleSourceCodeList;
import com.helger.peppol.validation.supplementary.createrules.sch.SchematronCreator;
import com.helger.peppol.validation.supplementary.createrules.sch.XSLTCreator;
import com.helger.peppol.validation.supplementary.createrules.util.CreateHelper;

public final class MainCreateValidationRules
{
  public static void main (final String [] args) throws Exception
  {
    GlobalDebug.setDebugModeDirect (false);

    // Base directory for source rules
    final File aRuleSource = new File ("src/test/resources/rule-source");
    final File aRuleTarget = new File ("src/main/resources/peppol-rules");
    final File aCodeListTarget = new File ("src/test/resources/codelist-generated");

    // Add all base directories
    final List <RuleSourceItem> aRuleSourceItems = new ArrayList <RuleSourceItem> ();
    if (false)
    {
      aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                                aRuleTarget,
                                                aCodeListTarget,
                                                "atgov",
                                                ESyntaxBinding.UBL).addBussinessRule ("businessrules/atgov-T10-BusinessRules-v03.ods")
                                                                   .addBussinessRule ("businessrules/atgov-T14-BusinessRules-v03.ods"));
      aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                                aRuleTarget,
                                                aCodeListTarget,
                                                "atnat",
                                                ESyntaxBinding.UBL).addBussinessRule ("businessrules/atnat-T10-BusinessRules-v04.ods")
                                                                   .addBussinessRule ("businessrules/atnat-T14-BusinessRules-v04.ods"));
    }

    aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                              aRuleTarget,
                                              aCodeListTarget,
                                              "codelists",
                                              ESyntaxBinding.UBL).addCodeList ("biirules/businessrules/bii2rules-CodeLists-v04.ods"));

    aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                              aRuleTarget,
                                              aCodeListTarget,
                                              "BIS2.0-invoice4a-VA_V3.0",
                                              ESyntaxBinding.UBL).addBussinessRule ("biirules/businessrules/bii2rules-T10-BusinessRules-v11.ods"));

    // Create all codelists (GC + CVA)
    // Processing time: quite quick
    for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
    {
      // Process all code lists
      for (final RuleSourceCodeList aCodeList : aRuleSourceItem.getAllCodeLists ())
        new CodeListCreator ().createCodeLists (aCodeList);
    }

    if (true)
    {
      // Create Schematron
      // Processing time: quite OK
      SchematronCreator.createSchematrons (aRuleSourceItems);

      if (false)
      {
        // Now create the validation XSLTs
        // Processing time: terribly slow for biicore
        XSLTCreator.createXSLTs (aRuleSourceItems);
      }
    }

    CreateHelper.log ("Finished building validation rules");
    CreateHelper.log ("Now run 'mvn license:format' on the commandline to add all the file headers!");
  }
}
