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
package com.helger.peppol.validation.supplementary.createrules.sch;

import java.io.File;
import java.util.List;

import javax.annotation.concurrent.Immutable;

import org.w3c.dom.Document;

import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.file.SimpleFileIO;
import com.helger.commons.io.resource.FileSystemResource;
import com.helger.commons.microdom.IMicroElement;
import com.helger.commons.microdom.serialize.MicroReader;
import com.helger.commons.xml.namespace.MapBasedNamespaceContext;
import com.helger.commons.xml.serialize.write.XMLWriter;
import com.helger.commons.xml.serialize.write.XMLWriterSettings;
import com.helger.peppol.validation.supplementary.createrules.RuleSourceItem;
import com.helger.peppol.validation.supplementary.createrules.util.CreateHelper;
import com.helger.schematron.xslt.ISchematronXSLTBasedProvider;
import com.helger.schematron.xslt.SCHTransformerCustomizer;
import com.helger.schematron.xslt.SchematronResourceSCHCache;

@Immutable
public final class RuleXSLTCreator
{
  private RuleXSLTCreator ()
  {}

  public static void createXSLTs (final List <RuleSourceItem> aRuleSourceItems)
  {
    for (final RuleSourceItem aRuleSourceItem : aRuleSourceItems)
    {
      CreateHelper.log ("Creating XSLT files for " + aRuleSourceItem.getID ());
      // Process all business rules
      for (final RuleSourceBusinessRule aBusinessRule : aRuleSourceItem.getAllBusinessRules ())
        for (final File aSCHFile : aBusinessRule.getAllResultSchematronFiles ())
        {
          CreateHelper.log ("  Creating XSLT for " + aSCHFile.getName ());

          final FileSystemResource aSCHRes = new FileSystemResource (aSCHFile);
          final ISchematronXSLTBasedProvider aXSLTProvider = SchematronResourceSCHCache.createSchematronXSLTProvider (aSCHRes,
                                                                                                                      new SCHTransformerCustomizer ());
          if (aXSLTProvider == null)
          {
            // Error message already emitted!
            continue;
          }
          final Document aXSLTDoc = aXSLTProvider.getXSLTDocument ();

          final MapBasedNamespaceContext aNSCtx = new MapBasedNamespaceContext ();
          aNSCtx.addMapping ("xsl", "http://www.w3.org/1999/XSL/Transform");
          aNSCtx.addMapping ("svrl", "http://purl.oclc.org/dsdl/svrl");
          // Read all mappings from Schematron file
          for (final IMicroElement aElement : MicroReader.readMicroXML (aSCHRes)
                                                         .getDocumentElement ()
                                                         .getAllChildElements ("ns"))
            aNSCtx.addMapping (aElement.getAttributeValue ("prefix"), aElement.getAttributeValue ("uri"));

          final XMLWriterSettings aXWS = new XMLWriterSettings ().setNamespaceContext (aNSCtx)
                                                                 .setPutNamespaceContextPrefixesInRoot (true);

          final File aXSLTFile = new File (FilenameHelper.getWithoutExtension (aSCHFile.getPath ()) + ".xslt");
          if (SimpleFileIO.writeFile (aXSLTFile, XMLWriter.getNodeAsString (aXSLTDoc, aXWS), aXWS.getCharsetObj ())
                          .isFailure ())
            throw new IllegalStateException ("Failed to write " + aXSLTFile);
        }
    }
  }

}
