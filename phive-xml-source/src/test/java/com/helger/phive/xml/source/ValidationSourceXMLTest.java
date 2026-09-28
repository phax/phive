/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.source;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicInteger;

import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;

import org.junit.Test;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.io.resource.ClassPathResource;
import com.helger.xml.XMLHelper;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Test class for class {@link ValidationSourceXML}.
 *
 * @author Philip Helger
 */
public final class ValidationSourceXMLTest
{
  private static final String TEST_XML = "<Invoice><ID>Invoice-1</ID></Invoice>";
  private static final String TEST_RESOURCE_PATH = "test-source/simple.xml";

  @Test
  public void testCreateFromDocument ()
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    assertNotNull (aDoc);

    final ValidationSourceXML aVS = ValidationSourceXML.create ("doc.xml", aDoc);
    assertNotNull (aVS);
    assertEquals ("doc.xml", aVS.getSystemID ());
    assertTrue (aVS.hasSystemID ());
    assertFalse (aVS.isPartialSource ());
    assertSame (aDoc, aVS.getNode ());
    assertEquals (IValidationSourceXML.VALIDATION_SOURCE_TYPE, aVS.getValidationSourceTypeID ());
    assertNotNull (aVS.toString ());
  }

  @Test
  public void testCreateFromElementUsesOwnerDocument ()
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    final Element aElement = aDoc.getDocumentElement ();

    // A complete source always validates the whole Document
    final ValidationSourceXML aVS = ValidationSourceXML.create ("doc.xml", aElement);
    assertFalse (aVS.isPartialSource ());
    assertSame (aDoc, aVS.getNode ());
  }

  @Test
  public void testCreatePartial ()
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    final Element aElement = XMLHelper.getFirstChildElementOfName (aDoc.getDocumentElement (), "ID");
    assertNotNull (aElement);

    final ValidationSourceXML aVS = ValidationSourceXML.createPartial ("partial.xml", aElement);
    assertEquals ("partial.xml", aVS.getSystemID ());
    assertTrue (aVS.isPartialSource ());
    // The partial source keeps the child element and does not widen to the Document
    assertSame (aElement, aVS.getNode ());
  }

  @Test
  public void testCreateWithNullSystemID ()
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    final ValidationSourceXML aVS = ValidationSourceXML.create (null, aDoc);
    assertNotNull (aVS);
    assertFalse (aVS.hasSystemID ());
  }

  @Test
  public void testNodeFactoryIsLazyAndInvokedOnlyOnce ()
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    final AtomicInteger aInvocations = new AtomicInteger (0);
    final ValidationSourceXML aVS = new ValidationSourceXML ("lazy.xml", () -> {
      aInvocations.incrementAndGet ();
      return aDoc;
    }, false);

    assertEquals (0, aInvocations.get ());
    assertSame (aDoc, aVS.getNode ());
    assertEquals (1, aInvocations.get ());
    // Second call must be served from the cached Node
    assertSame (aDoc, aVS.getNode ());
    assertEquals (1, aInvocations.get ());
  }

  @Test
  public void testWriteTo () throws IOException
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    final ValidationSourceXML aVS = ValidationSourceXML.create ("doc.xml", aDoc);

    try (final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ())
    {
      aVS.writeTo (aBAOS);

      final Document aReadDoc = DOMReader.readXMLDOM (aBAOS.getAsString (StandardCharsets.UTF_8));
      assertNotNull (aReadDoc);
      assertEquals ("Invoice", aReadDoc.getDocumentElement ().getTagName ());
      final Element aReadID = XMLHelper.getFirstChildElementOfName (aReadDoc.getDocumentElement (), "ID");
      assertNotNull (aReadID);
      assertEquals ("Invoice-1", aReadID.getTextContent ());
    }
  }

  @Test
  public void testGetAsTransformSource ()
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    final ValidationSourceXML aVS = ValidationSourceXML.create ("doc.xml", aDoc);

    final Source aSource = aVS.getAsTransformSource ();
    assertNotNull (aSource);
    assertTrue (aSource instanceof DOMSource);
    assertSame (aDoc, ((DOMSource) aSource).getNode ());
    assertEquals ("doc.xml", aSource.getSystemId ());
  }

  @Test
  public void testGetAsTransformSourceOfPartialElement ()
  {
    final Document aDoc = DOMReader.readXMLDOM (TEST_XML);
    final Element aElement = XMLHelper.getFirstChildElementOfName (aDoc.getDocumentElement (), "ID");
    final ValidationSourceXML aVS = ValidationSourceXML.createPartial ("partial.xml", aElement);

    // A partial element must be wrapped in a new Document, because XSLT based
    // Schematron needs a Document node
    final Source aSource = aVS.getAsTransformSource ();
    assertTrue (aSource instanceof DOMSource);
    final Node aSourceNode = ((DOMSource) aSource).getNode ();
    assertTrue (aSourceNode instanceof Document);
    assertNotSame (aDoc, aSourceNode);
    assertEquals ("ID", ((Document) aSourceNode).getDocumentElement ().getTagName ());
    assertEquals ("partial.xml", aSource.getSystemId ());
  }

  @Test
  public void testCreateFromReadableResource ()
  {
    final ClassPathResource aRes = new ClassPathResource (TEST_RESOURCE_PATH);
    assertTrue (aRes.exists ());

    final ValidationSourceXML aVS = ValidationSourceXML.create (aRes);
    assertNotNull (aVS);
    assertTrue (aVS instanceof ValidationSourceXMLReadableResource);
    assertSame (aRes, ((ValidationSourceXMLReadableResource) aVS).getResource ());
    assertEquals (aRes.getPath (), aVS.getSystemID ());
    assertFalse (aVS.isPartialSource ());
    assertEquals (IValidationSourceXML.VALIDATION_SOURCE_TYPE, aVS.getValidationSourceTypeID ());

    // Node is read on demand
    final Node aNode = aVS.getNode ();
    assertNotNull (aNode);
    assertTrue (aNode instanceof Document);
    assertEquals ("Invoice", ((Document) aNode).getDocumentElement ().getTagName ());

    // The resource based source uses the resource, to keep line and column
    // numbers in error messages
    assertTrue (aVS.getAsTransformSource () instanceof StreamSource);
    assertNotNull (aVS.toString ());
  }
}
