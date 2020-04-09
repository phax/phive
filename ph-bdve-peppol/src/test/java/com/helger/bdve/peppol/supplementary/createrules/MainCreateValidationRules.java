/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol.supplementary.createrules;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.bdve.peppol.supplementary.createrules.codelist.CodeListCreator;
import com.helger.bdve.peppol.supplementary.createrules.codelist.RuleSourceCodeList;
import com.helger.bdve.peppol.supplementary.createrules.sch.SchematronCreator;
import com.helger.bdve.peppol.supplementary.createrules.sch.XSLTCreator;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;

public final class MainCreateValidationRules
{

  private static final Logger LOGGER = LoggerFactory.getLogger (MainCreateValidationRules.class);

  public static void main (final String [] args) throws Exception
  {
    // Base directory for source rules
    final File aRuleSource = new File ("src/test/resources/rule-source/thirdparty");
    final File aSchematronDir = new File ("src/test/resources/rule-source/thirdparty");
    final File aXSLTDir = new File ("src/main/resources/thirdparty");

    // Add all base directories
    final ICommonsList <RuleSourceItem> aRuleSourceItems = new CommonsArrayList <> ();
    aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                              aSchematronDir,
                                              aXSLTDir,
                                              "atgov").addBussinessRule ("atgov-T10-BusinessRules-v08.ods"));
    aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                              aSchematronDir,
                                              aXSLTDir,
                                              "atgov").addBussinessRule ("atgov-T14-BusinessRules-v08.ods"));
    aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                              aSchematronDir,
                                              aXSLTDir,
                                              "atnat").addBussinessRule ("atnat-T10-BusinessRules-v06.ods"));
    aRuleSourceItems.add (new RuleSourceItem (aRuleSource,
                                              aSchematronDir,
                                              aXSLTDir,
                                              "atnat").addBussinessRule ("atnat-T14-BusinessRules-v06.ods"));

    // Create all codelists (GC + CVA)
    // Processing time: quite quick
    for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
    {
      // Process all code lists
      for (final RuleSourceCodeList aCodeList : aRuleSourceItem.getAllCodeLists ())
        new CodeListCreator ().createCodeLists (aCodeList);
    }

    {
      // Create Schematron
      // Processing time: quite OK
      SchematronCreator.createSchematrons (aRuleSourceItems);

      // Now create the validation XSLTs
      // Processing time: terribly slow for biicore
      XSLTCreator.createXSLTs (aRuleSourceItems);
    }

    LOGGER.info ("Finished building validation rules; run 'mvn license:format' on the commandline to add all the file headers!");
  }
}
