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
package com.helger.phive.xml.partial;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;

import org.jspecify.annotations.NonNull;
import org.junit.Test;

import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.io.resource.ClassPathResource;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.validity.IValidityDeterminator;
import com.helger.phive.xml.executorset.VesXmlBuilder;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.schematron.ValidationExecutorSchematronBuilder;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.phive.xml.xsd.XSDPartialContext;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.read.DOMReader;
import com.helger.xml.xpath.XPathHelper;

/**
 * Test class for class {@link ValidationExecutorPartial}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorPartialTest
{
  private static final String ENV_START = "<env:Envelope xmlns:env='urn:test:envelope' xmlns:inv='urn:test:invoice'>" +
                                          "<env:Header><env:Type>invoice</env:Type></env:Header>";
  private static final String ENV_END = "</env:Envelope>";
  private static final String VALID_INVOICE = "<inv:Invoice><inv:ID>INV-001</inv:ID><inv:IssueDate>2026-01-15</inv:IssueDate></inv:Invoice>";
  // Missing IssueDate
  private static final String INVALID_INVOICE = "<inv:Invoice><inv:ID>INV-002</inv:ID></inv:Invoice>";

  private static final XPath XP;
  static
  {
    final MapBasedNamespaceContext aNSCtx = new MapBasedNamespaceContext ();
    aNSCtx.addMapping ("env", "urn:test:envelope");
    aNSCtx.addMapping ("inv", "urn:test:invoice");
    XP = XPathHelper.createNewXPath ();
    XP.setNamespaceContext (aNSCtx);
  }

  @NonNull
  private static XPathExpression _xp (@NonNull final String sXPath)
  {
    return XPathHelper.createNewXPathExpression (XP, sXPath);
  }

  @NonNull
  private static ValidationExecutorSchematron _createSchematron ()
  {
    // The Schematron uses the absolute context "/inv:Invoice"
    return ValidationExecutorSchematronBuilder.schIso (new ClassPathResource ("test-schematron/check-invoice.sch"))
                                              .build ();
  }

  @NonNull
  private static ValidationResult _validate (@NonNull final ValidationExecutorPartial aVE, @NonNull final String sXML)
  {
    final IValidationSourceXML aSource = ValidationSourceXML.create (null, DOMReader.readXMLDOM (sXML));
    return aVE.applyValidation (aSource, IValidityDeterminator.createDefault (), null);
  }

  @Test
  public void testSinglePart ()
  {
    final ValidationExecutorPartial aVE = ValidationExecutorPartial.create (_createSchematron (),
                                                                            XSDPartialContext.builder ()
                                                                                             .xpathExpression (XP,
                                                                                                               "/env:Envelope/inv:Invoice")
                                                                                             .exactNodeCount (1)
                                                                                             .build ());
    // The validation artefact is the one of the wrapped executor
    assertEquals (aVE.getWrappedExecutor ().getValidationArtefact (), aVE.getValidationArtefact ());

    ValidationResult aResult = _validate (aVE, ENV_START + VALID_INVOICE + ENV_END);
    assertTrue (aResult.getErrorList ().toString (), aResult.getErrorList ().isEmpty ());
    assertTrue (aResult.getValidity ().isValid ());

    aResult = _validate (aVE, ENV_START + INVALID_INVOICE + ENV_END);
    assertEquals (aResult.getErrorList ().toString (), 1, aResult.getErrorList ().size ());
    assertTrue (aResult.getErrorList ().getFirstOrNull ().getErrorText (null).contains ("IssueDate"));
    assertTrue (aResult.getValidity ().isInvalid ());

    // Mandatory part is missing
    aResult = _validate (aVE, ENV_START + ENV_END);
    assertEquals (1, aResult.getErrorList ().size ());
    assertTrue (aResult.getErrorList ().getFirstOrNull ().getErrorText (null).contains ("minimum number"));
  }

  @Test
  public void testMultipleParts ()
  {
    final ValidationExecutorPartial aVE = ValidationExecutorPartial.create (_createSchematron (),
                                                                            XSDPartialContext.builder ()
                                                                                             .xpathExpression (XP,
                                                                                                               "/env:Envelope/inv:Invoice")
                                                                                             .build ());
    // Each part is validated on its own
    ValidationResult aResult = _validate (aVE, ENV_START + VALID_INVOICE + VALID_INVOICE + ENV_END);
    assertTrue (aResult.getErrorList ().toString (), aResult.getErrorList ().isEmpty ());

    aResult = _validate (aVE, ENV_START + VALID_INVOICE + INVALID_INVOICE + INVALID_INVOICE + ENV_END);
    assertEquals (aResult.getErrorList ().toString (), 2, aResult.getErrorList ().size ());

    // No part and no constraint - nothing to validate
    aResult = _validate (aVE, ENV_START + ENV_END);
    assertTrue (aResult.getErrorList ().isEmpty ());
  }

  @Test
  public void testPrerequisite ()
  {
    final ValidationExecutorPartial aVE = new ValidationExecutorPartial (_createSchematron (),
                                                                         XSDPartialContext.builder ()
                                                                                          .xpathExpression (XP,
                                                                                                            "/env:Envelope/inv:Invoice")
                                                                                          .exactNodeCount (1)
                                                                                          .build (),
                                                                         _xp ("/env:Envelope/env:Header/env:Type = 'invoice'"));
    ValidationResult aResult = _validate (aVE, ENV_START + INVALID_INVOICE + ENV_END);
    assertFalse (aResult.getValidity ().isSkipped ());
    assertEquals (1, aResult.getErrorList ().size ());

    // Prerequisite not fulfilled - skipped, even though the mandatory part is missing
    aResult = _validate (aVE,
                         "<env:Envelope xmlns:env='urn:test:envelope'><env:Header><env:Type>order</env:Type></env:Header></env:Envelope>");
    assertTrue (aResult.getValidity ().isSkipped ());
    assertTrue (aResult.getErrorList ().isEmpty ());
  }

  @Test
  public void testClone ()
  {
    final ValidationExecutorPartial aVE = ValidationExecutorPartial.create (_createSchematron (),
                                                                            XSDPartialContext.builder ()
                                                                                             .xpathExpression (XP,
                                                                                                               "/env:Envelope/inv:Invoice")
                                                                                             .exactNodeCount (1)
                                                                                             .build ());
    final ValidationExecutorPartial aClone = aVE.getClone ();
    assertEquals (aVE, aClone);
    assertEquals (aVE.hashCode (), aClone.hashCode ());
    assertTrue (aClone.getContext () == aVE.getContext ());
  }

  @Test
  public void testVesXmlBuilder () throws Exception
  {
    final IValidationExecutorSet <IValidationSourceXML> aBaseVES = ValidationExecutorSet.create (DVRCoordinate.create ("com.helger.test",
                                                                                                                       "invoice",
                                                                                                                       "1.0.0"),
                                                                                                 "Invoice",
                                                                                                 ValidationExecutorSetStatus.createValidNow (),
                                                                                                 _createSchematron ());
    final IValidationExecutorSet <IValidationSourceXML> aVES = VesXmlBuilder.builder ()
                                                                            .vesID (DVRCoordinate.create ("com.helger.test",
                                                                                                          "envelope-invoice",
                                                                                                          "1.0.0"))
                                                                            .displayName ("Enveloped Invoice")
                                                                            .notDeprecated ()
                                                                            .addPartialVES (aBaseVES,
                                                                                            XSDPartialContext.builder ()
                                                                                                             .xpathExpression (XP,
                                                                                                                               "/env:Envelope/inv:Invoice")
                                                                                                             .exactNodeCount (1)
                                                                                                             .build (),
                                                                                            null)
                                                                            .createVES ();
    assertNotNull (aVES);
    assertEquals (1, aVES.executors ().size ());

    ValidationResultList aResults = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                  aVES,
                                                                                  ValidationSourceXML.create (null,
                                                                                                              DOMReader.readXMLDOM (ENV_START +
                                                                                                                                    VALID_INVOICE +
                                                                                                                                    ENV_END)));
    assertTrue (aResults.getAllErrors ().toString (), aResults.containsNoError ());

    aResults = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                             aVES,
                                                             ValidationSourceXML.create (null,
                                                                                         DOMReader.readXMLDOM (ENV_START +
                                                                                                               INVALID_INVOICE +
                                                                                                               ENV_END)));
    final ErrorList aErrors = aResults.getAllErrors ();
    assertEquals (aErrors.toString (), 1, aErrors.size ());
  }
}
