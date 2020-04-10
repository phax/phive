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
package com.helger.bdve.peppol.supplementary.createrules.sch;

import java.io.File;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;

import com.helger.bdve.peppol.supplementary.createrules.RuleSourceItem;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsOrderedMap;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.io.resource.FileSystemResource;
import com.helger.schematron.svrl.CSVRL;
import com.helger.schematron.xslt.SCHTransformerCustomizer;
import com.helger.schematron.xslt.SchematronProviderXSLTFromSCH;
import com.helger.schematron.xslt.SchematronResourceSCHCache;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.write.IXMLWriterSettings;
import com.helger.xml.serialize.write.XMLWriter;
import com.helger.xml.serialize.write.XMLWriterSettings;

@Immutable
public final class XSLTCreator
{

  private static final Logger LOGGER = LoggerFactory.getLogger (XSLTCreator.class);

  private XSLTCreator ()
  {}

  public static void createXSLTs (@Nonnull final ICommonsList <RuleSourceItem> aRuleSourceItems,
                                  @Nonnull final ICommonsOrderedMap <String, String> aDefaultNamespaces)
  {

    for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
    {
      LOGGER.info ("Creating XSLT files for " + aRuleSourceItem.getID ());
      // Process all business rules
      for (final RuleSourceBusinessRule aBusinessRule : aRuleSourceItem.getAllBusinessRules ())
        for (final SchematronOutput aSCH : aBusinessRule.getAllResultSchematronFiles ())
        {
          final File aSCHFile = aSCH.getSchematronFile ();
          LOGGER.info ("  Creating XSLT for " + aSCHFile.getName ());

          final SCHTransformerCustomizer aCustomizer = new SCHTransformerCustomizer ().setForceCacheResult (false);
          final SchematronProviderXSLTFromSCH aXSLTProvider = SchematronResourceSCHCache.createSchematronXSLTProvider (new FileSystemResource (aSCHFile),
                                                                                                                       aCustomizer);
          if (aXSLTProvider == null)
          {
            // Error message already emitted!
            continue;
          }
          final Document aXSLTDoc = aXSLTProvider.getXSLTDocument ();

          final File aXSLTFile = new File (aBusinessRule.getOutputXSLTDirectory (),
                                           FilenameHelper.getBaseName (aSCHFile) + ".xslt");

          final MapBasedNamespaceContext aNSCtx = new MapBasedNamespaceContext ();
          aNSCtx.addMapping ("xsl", "http://www.w3.org/1999/XSL/Transform");
          aNSCtx.addMapping ("svrl", CSVRL.SVRL_NAMESPACE_URI);
          aNSCtx.addMapping (aSCH.getPrefix (), aSCH.getNamespaceURI ());
          aNSCtx.addMappings (aDefaultNamespaces);

          final IXMLWriterSettings aXWS = new XMLWriterSettings ().setNamespaceContext (aNSCtx)
                                                                  .setPutNamespaceContextPrefixesInRoot (true);

          if (SimpleFileIO.writeFile (aXSLTFile, XMLWriter.getNodeAsBytes (aXSLTDoc, aXWS)).isFailure ())
            throw new IllegalStateException ("Failed to write " + aXSLTFile);
        }
    }
  }

}
