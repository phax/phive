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
package com.helger.phive.xml.schematron;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Locale;

import org.jspecify.annotations.NonNull;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.io.resource.ClassPathResource;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSetRegistry;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.validity.IValidityDeterminator;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.xml.XMLHelper;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Test class for {@link ValidationExecutorSchematron} with partial source (child node, simulating
 * SBDH unwrap).
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSchematronPartialSourceFuncTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (ValidationExecutorSchematronPartialSourceFuncTest.class);

  private static final String INVOICE_NS = "urn:test:invoice";

  /**
   * A valid Invoice as a standalone document. Schematron should find no errors.
   */
  private static final String VALID_INVOICE_XML = "<inv:Invoice xmlns:inv='urn:test:invoice'>" +
                                                  "  <inv:ID>INV-001</inv:ID>" +
                                                  "  <inv:IssueDate>2026-01-15</inv:IssueDate>" +
                                                  "</inv:Invoice>";

  /**
   * An invalid Invoice (missing IssueDate). Schematron should find 1 error (INV-02).
   */
  private static final String INVALID_INVOICE_XML = "<inv:Invoice xmlns:inv='urn:test:invoice'>" +
                                                    "  <inv:ID>INV-002</inv:ID>" +
                                                    "</inv:Invoice>";

  /**
   * A valid Invoice wrapped in an SBDH-like envelope. The Invoice element is a child of the
   * Envelope and must be extracted before validation.
   */
  private static final String WRAPPED_VALID_INVOICE_XML = "<Envelope xmlns:inv='urn:test:invoice'>" +
                                                          "  <Header>some-header</Header>" +
                                                          "  <inv:Invoice>" +
                                                          "    <inv:ID>INV-003</inv:ID>" +
                                                          "    <inv:IssueDate>2026-02-20</inv:IssueDate>" +
                                                          "  </inv:Invoice>" +
                                                          "</Envelope>";

  /**
   * An invalid Invoice wrapped in an SBDH-like envelope (missing IssueDate).
   */
  private static final String WRAPPED_INVALID_INVOICE_XML = "<Envelope xmlns:inv='urn:test:invoice'>" +
                                                            "  <Header>some-header</Header>" +
                                                            "  <inv:Invoice>" +
                                                            "    <inv:ID>INV-004</inv:ID>" +
                                                            "  </inv:Invoice>" +
                                                            "</Envelope>";

  @NonNull
  private static IValidationExecutorSet <IValidationSourceXML> _createVES () throws Exception
  {
    final ValidationExecutorSetRegistry <IValidationSourceXML> aVESRegistry = new ValidationExecutorSetRegistry <> ();
    final DVRCoordinate aVESID = DVRCoordinate.create ("com.helger.test", "schematron-partial", "1.0.0");

    aVESRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                              "Schematron Partial Source Test",
                                                                              ValidationExecutorSetStatus.createValidNow (),
                                                                              ValidationExecutorSchematron.createSCH (new ClassPathResource ("test-schematron/check-invoice.sch"),
                                                                                                                      null)));
    final IValidationExecutorSet <IValidationSourceXML> aVES = aVESRegistry.getOfID (aVESID);
    assertNotNull (aVES);
    return aVES;
  }

  /**
   * Extract the first child element in the given namespace from the document.
   */
  @NonNull
  private static Element _extractChild (final Document aDoc, final String sNamespaceURI)
  {
    final Element aChild = XMLHelper.getFirstChildElementOfName (aDoc.getDocumentElement (), sNamespaceURI, "Invoice");
    assertNotNull ("Child element {" + sNamespaceURI + "}Invoice must exist", aChild);
    return aChild;
  }

  /**
   * Baseline: validate a standalone valid Invoice (full document, non-partial). Schematron should
   * report no errors.
   *
   * @throws Exception
   *         in case of error
   */
  @Test
  public void testFullDocumentValid () throws Exception
  {
    final IValidationExecutorSet <IValidationSourceXML> aVES = _createVES ();
    final IValidationSourceXML aSource = ValidationSourceXML.create (null, DOMReader.readXMLDOM (VALID_INVOICE_XML));

    final ValidationResultList aResults = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                        aVES,
                                                                                        aSource);
    assertTrue ("Valid full document should have no errors. Errors: " + aResults.getAllErrors (),
                aResults.containsNoError ());
  }

  /**
   * Baseline: validate a standalone invalid Invoice (full document, non-partial). Schematron should
   * report at least one error.
   *
   * @throws Exception
   *         in case of error
   */
  @Test
  public void testFullDocumentInvalid () throws Exception
  {
    final IValidationExecutorSet <IValidationSourceXML> aVES = _createVES ();
    final IValidationSourceXML aSource = ValidationSourceXML.create (null, DOMReader.readXMLDOM (INVALID_INVOICE_XML));

    final ValidationResultList aResults = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                        aVES,
                                                                                        aSource);
    final ErrorList aErrors = aResults.getAllErrors ();
    assertTrue ("Invalid full document should have errors", aErrors.isNotEmpty ());
    LOGGER.info ("Full document invalid - errors: " + aErrors.size ());
  }

  /**
   * Core test: validate a valid Invoice extracted from an SBDH-like wrapper as a partial source
   * (child node). The Schematron rules should fire correctly and produce valid SVRL, resulting in
   * no errors.
   *
   * @throws Exception
   *         in case of error
   */
  @Test
  public void testPartialSourceValidInvoiceFromWrapper () throws Exception
  {
    final IValidationExecutorSet <IValidationSourceXML> aVES = _createVES ();

    // Parse the wrapped document and extract the Invoice child element
    final Document aDoc = DOMReader.readXMLDOM (WRAPPED_VALID_INVOICE_XML);
    assertNotNull (aDoc);
    final Element aInvoiceElement = _extractChild (aDoc, INVOICE_NS);

    // Create a partial validation source from the child element
    final IValidationSourceXML aSource = ValidationSourceXML.createPartial (null, aInvoiceElement);

    final ValidationResultList aResults = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                        aVES,
                                                                                        aSource);

    // The valid Invoice, even when extracted as a child node, should validate
    // without errors. If SVRL generation is broken for partial sources, this
    // will either throw an exception or produce spurious errors.
    assertTrue ("Valid partial source should have no errors. Errors: " + aResults.getAllErrors (),
                aResults.containsNoError ());
  }

  /**
   * Core test: validate an invalid Invoice extracted from an SBDH-like wrapper as a partial source.
   * The Schematron rules should detect the missing IssueDate and report the error properly in the
   * SVRL.
   *
   * @throws Exception
   *         in case of error
   */
  @Test
  public void testPartialSourceInvalidInvoiceFromWrapper () throws Exception
  {
    final IValidationExecutorSet <IValidationSourceXML> aVES = _createVES ();

    // Parse the wrapped document and extract the Invoice child element
    final Document aDoc = DOMReader.readXMLDOM (WRAPPED_INVALID_INVOICE_XML);
    assertNotNull (aDoc);
    final Element aInvoiceElement = _extractChild (aDoc, INVOICE_NS);

    // Create a partial validation source from the child element
    final IValidationSourceXML aSource = ValidationSourceXML.createPartial (null, aInvoiceElement);

    final ValidationResultList aResults = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                        aVES,
                                                                                        aSource);
    final ErrorList aErrors = aResults.getAllErrors ();

    // The invalid Invoice should produce errors even as a partial source.
    // If SVRL generation is broken, errors may be lost or the assertion count
    // may differ from the full-document case.
    assertTrue ("Invalid partial source should have errors", aErrors.isNotEmpty ());
    LOGGER.info ("Partial source invalid - errors: " + aErrors.size ());
    for (final var aError : aErrors)
      LOGGER.info ("  Error: " + aError.getErrorText (Locale.US));
  }
}
