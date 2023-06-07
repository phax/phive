/*
 * Copyright (C) 2014-2023 Philip Helger (www.helger.com)
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
package com.helger.phive.engine.ves;

import static org.junit.Assert.assertNotNull;

import java.io.File;
import java.nio.charset.StandardCharsets;

import javax.xml.validation.Schema;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.file.FileSystemIterator;
import com.helger.commons.io.file.IFileFilter;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.engine.source.IValidationSourceXML;
import com.helger.phive.engine.ves.VES1ComplianceSettings.IEdifactValidationExecutorProviderXML;
import com.helger.phive.engine.ves.v10.VESType;
import com.helger.phive.engine.xsd.ValidationExecutorXSD;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.schema.XMLSchemaCache;

/**
 * Test class for class {@link VES1Marshaller}.
 *
 * @author Philip Helger
 */
public final class VES1ConverterTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VES1ConverterTest.class);
  private static final String TEST_BASE_PATH = "src/test/resources/ves/";

  @Test
  public void testReadGoodExamples ()
  {
    final VES1Marshaller m = new VES1Marshaller ();
    for (final File f : new FileSystemIterator (new File (TEST_BASE_PATH + "good")).withFilter (IFileFilter
                                                                                                           .filenameEndsWith (".xml")))
    {
      LOGGER.info ("Reading " + f.getName ());
      final VESType aVESDefinition = m.read (f);
      assertNotNull (aVESDefinition);

      final IReadableResource aFakeXSD = new ReadableResourceByteArray ("<xs:schema xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"urn:1\" targetNamespace=\"urn:a\" version=\"1.0\"><xs:element name=\"a\" type=\"xs:string\" /></xs:schema>".getBytes (StandardCharsets.ISO_8859_1));
      final Schema aFakeSchema = XMLSchemaCache.getInstance ().getSchema (aFakeXSD);

      final IVESXmlSchemaResolver aXmlSchemaResolver = new MapBasedVESXmlSchemaResolver ().addMapping ("ubl21-invoice",
                                                                                                       aFakeSchema);
      final IVESNamespaceContextResolver aNamespaceContextResolver = new MapBasedVESNamespaceContextResolver ().addMapping ("ubl21",
                                                                                                                            new MapBasedNamespaceContext ().addMapping ("a",
                                                                                                                                                                        "urn:a"));
      final IVESResourceResolver aResourceResolver = new MapBasedVESResourceResolver ().addMapping ("cius-pt-200",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("cius-pt-201",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("atnat-invoice-6",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("xrechnung-ublinv-200",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("en16931-ublinv-132",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY));
      final IVESArtifactResolver aAR = aVESID -> {
        switch (aVESID.getAsSingleID ())
        {
          case "com.helger:test-special:1.5.678":
            return new ReadableResourceByteArray ("crap".getBytes (StandardCharsets.ISO_8859_1));
        }
        return null;
      };
      final IEdifactValidationExecutorProviderXML aEdifactProvider = (sDirectory, sMessage, aOptions) -> {
        if (sDirectory.equals ("d01b") && sMessage.equals ("DESADV"))
          return ValidationExecutorXSD.create (aFakeXSD);
        return null;
      };
      final VES1ComplianceSettings aSettings = VES1ComplianceSettings.builder ()
                                                                     .allowEdifact (true)
                                                                     .edifactValidationExecutorProviderXML (aEdifactProvider)
                                                                     .build ();
      final ErrorList aErrorList = new ErrorList ();
      final VES1Converter aConverter1 = new VES1Converter ().xmlSchemaResolver (aXmlSchemaResolver)
                                                            .namespaceContextResolver (aNamespaceContextResolver)
                                                            .resourceResolver (aResourceResolver)
                                                            .complianceSettings (aSettings)
                                                            .artifactResolver (aAR)
                                                            .validationEnabled (true);
      final ValidationExecutorSet <IValidationSourceXML> aResolvedVES = aConverter1.convertToVES_XML (aVESDefinition, aErrorList);
      assertNotNull (aErrorList.toString (), aResolvedVES);
    }
  }
}
