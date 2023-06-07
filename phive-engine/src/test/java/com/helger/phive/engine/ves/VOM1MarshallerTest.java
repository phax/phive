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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.Locale;

import javax.xml.validation.Schema;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.error.IError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.file.FileSystemIterator;
import com.helger.commons.io.file.IFileFilter;
import com.helger.commons.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.phive.engine.ves.VOM1ComplianceSettings.IEdifactValidationExecutorProviderXML;
import com.helger.phive.engine.ves.v10.VOMType;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.schema.XMLSchemaCache;

/**
 * Test class for class {@link VOM1Marshaller}.
 *
 * @author Philip Helger
 */
public final class VOM1MarshallerTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VOM1MarshallerTest.class);

  @Test
  public void testBasic ()
  {
    assertTrue (VOM1Marshaller.XSD.exists ());
  }

  @Test
  public void testReadGoodExamples ()
  {
    final VOM1Marshaller m = new VOM1Marshaller ();
    for (final File f : new FileSystemIterator (new File ("src/test/resources/vom/good")).withFilter (IFileFilter.filenameEndsWith (".xml")))
    {
      LOGGER.info ("Reading " + f.getName ());
      final VOMType aVOM = m.read (f);
      assertNotNull (aVOM);

      final Schema aFakeSchema = XMLSchemaCache.getInstance ()
                                               .getSchema (new ReadableResourceByteArray ("<xs:schema xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"urn:1\" targetNamespace=\"urn:a\" version=\"1.0\"><xs:element name=\"a\" type=\"xs:string\" /></xs:schema>".getBytes ()));

      final IVOMXmlSchemaResolver aXmlSchemaResolver = new MapBasedVOMXmlSchemaResolver ().addMapping ("ubl21-invoice", aFakeSchema);
      final IVOMNamespaceContextResolver aNamespaceContextResolver = new MapBasedVOMNamespaceContextResolver ().addMapping ("ubl21",
                                                                                                                            new MapBasedNamespaceContext ().addMapping ("a",
                                                                                                                                                                        "urn:a"));
      final IVOMResourceResolver aResourceResolver = new MapBasedVOMResourceResolver ().addMapping ("cius-pt-200",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("cius-pt-201",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("atnat-invoice-6",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("xrechnung-ublinv-200",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY))
                                                                                       .addMapping ("en16931-ublinv-132",
                                                                                                    new ReadableResourceByteArray (ArrayHelper.EMPTY_BYTE_ARRAY));
      final IEdifactValidationExecutorProviderXML aEdifactProvider = (sDirectory, sMessage, aOptions) -> null;
      final VOM1ComplianceSettings aSettings = VOM1ComplianceSettings.builder ()
                                                                     .allowEdifact (true)
                                                                     .edifactValidationExecutorProviderXML (aEdifactProvider)
                                                                     .build ();
      final ErrorList aErrorList = VOM1Validator.validate (aVOM,
                                                           aXmlSchemaResolver,
                                                           aNamespaceContextResolver,
                                                           aResourceResolver,
                                                           aSettings);
      assertEquals (aErrorList.toString (), 0, aErrorList.getErrorCount ());
    }
  }

  @Test
  public void testReadBadXSDExamples ()
  {
    final VOM1Marshaller m = new VOM1Marshaller ();
    for (final File f : new FileSystemIterator (new File ("src/test/resources/vom/bad-xsd")).withFilter (IFileFilter.filenameEndsWith (".xml")))
    {
      LOGGER.info ("Reading " + f.getName ());
      final VOMType aVOM = m.read (f);
      assertNull (aVOM);
    }
  }

  @Test
  public void testReadBadExamples ()
  {
    final VOM1Marshaller m = new VOM1Marshaller ();
    for (final File f : new FileSystemIterator (new File ("src/test/resources/vom/bad")).withFilter (IFileFilter.filenameEndsWith (".xml")))
    {
      LOGGER.info ("Reading " + f.getName ());
      final VOMType aVOM = m.read (f);
      assertNotNull (aVOM);

      final IVOMXmlSchemaResolver aXmlSchemaResolver = new MapBasedVOMXmlSchemaResolver ();
      final IVOMNamespaceContextResolver aNamespaceContextResolver = new MapBasedVOMNamespaceContextResolver ();
      final IVOMResourceResolver aResourceResolver = new MapBasedVOMResourceResolver ();
      final IEdifactValidationExecutorProviderXML aEdifactProvider = (sDirectory, sMessage, aOptions) -> null;
      final VOM1ComplianceSettings aSettings = VOM1ComplianceSettings.builder ()
                                                                     .allowEdifact (true)
                                                                     .edifactValidationExecutorProviderXML (aEdifactProvider)
                                                                     .build ();
      final ErrorList aErrorList = VOM1Validator.validate (aVOM,
                                                           aXmlSchemaResolver,
                                                           aNamespaceContextResolver,
                                                           aResourceResolver,
                                                           aSettings);
      for (final IError e : aErrorList)
        LOGGER.info ("  " + e.getAsString (Locale.ROOT));
      assertTrue (aErrorList.getErrorCount () > 0);
    }
  }
}
