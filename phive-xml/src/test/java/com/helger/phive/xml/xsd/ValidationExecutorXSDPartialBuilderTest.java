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
package com.helger.phive.xml.xsd;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;

import org.junit.Test;

import com.helger.io.resource.ClassPathResource;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.EValidationType;
import com.helger.xml.xpath.XPathHelper;

/**
 * Test class for class {@link ValidationExecutorXSDPartialBuilder}.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSDPartialBuilderTest
{
  // Using simplelogger.properties as a dummy resource - the builder tests do not execute validation
  private static final IReadableResource RES = new ClassPathResource ("simplelogger.properties");
  private static final IReadableResource RES2 = new ClassPathResource ("dummy-second.xsd");

  private static XSDPartialContext _ctx () throws XPathExpressionException
  {
    final XPathExpression aXE = XPathHelper.createNewXPath ().compile ("/root/child");
    return XSDPartialContext.create (aXE);
  }

  @Test
  public void testMinimal () throws XPathExpressionException
  {
    final XSDPartialContext aCtx = _ctx ();
    final ValidationExecutorXSDPartial aExec = new ValidationExecutorXSDPartialBuilder ().resource (RES)
                                                                                        .partialContext (aCtx)
                                                                                        .build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.PARTIAL_XSD, aExec.getValidationArtefact ().getValidationType ());
    assertEquals (RES, aExec.getValidationArtefact ().getRuleResource ());
    assertSame (aCtx, aExec.getContext ());
    assertNotNull (aExec.getSchemaProvider ());
    // XSD stops validation on error by default
    assertTrue (aExec.isStopValidationOnError ());
  }

  @Test
  public void testMultipleResourcesUsesLastForName () throws XPathExpressionException
  {
    final ValidationExecutorXSDPartial aExec = new ValidationExecutorXSDPartialBuilder ().resources (RES, RES2)
                                                                                        .partialContext (_ctx ())
                                                                                        .build ();
    assertNotNull (aExec);
    // The last resource is the important one for the name
    assertEquals (RES2, aExec.getValidationArtefact ().getRuleResource ());
  }

  @Test
  public void testStopValidationOnError () throws XPathExpressionException
  {
    final ValidationExecutorXSDPartial aExec = new ValidationExecutorXSDPartialBuilder ().resource (RES)
                                                                                        .partialContext (_ctx ())
                                                                                        .stopValidationOnError (false)
                                                                                        .build ();
    assertNotNull (aExec);
    assertFalse (aExec.isStopValidationOnError ());
  }

  @Test
  public void testStaticFactory () throws XPathExpressionException
  {
    final ValidationExecutorXSDPartial aExec = ValidationExecutorXSDPartialBuilder.create (_ctx (), RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.PARTIAL_XSD, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testCopyConstructor () throws XPathExpressionException
  {
    final XSDPartialContext aCtx = _ctx ();
    final ValidationExecutorXSDPartial aOriginal = new ValidationExecutorXSDPartialBuilder ().resource (RES)
                                                                                            .partialContext (aCtx)
                                                                                            .stopValidationOnError (false)
                                                                                            .build ();
    final ValidationExecutorXSDPartial aCopy = new ValidationExecutorXSDPartialBuilder (aOriginal).build ();
    assertNotNull (aCopy);
    assertEquals (EValidationType.PARTIAL_XSD, aCopy.getValidationArtefact ().getValidationType ());
    assertEquals (RES, aCopy.getValidationArtefact ().getRuleResource ());
    assertSame (aCtx, aCopy.getContext ());
    assertFalse (aCopy.isStopValidationOnError ());
  }

  @Test
  public void testEquivalenceWithStaticFactoryMethods () throws XPathExpressionException
  {
    final XSDPartialContext aCtx = _ctx ();
    // Builder-created should be equivalent to static factory-created
    final ValidationExecutorXSDPartial aFromFactory = ValidationExecutorXSDPartial.create (RES, aCtx);
    final ValidationExecutorXSDPartial aFromBuilder = ValidationExecutorXSDPartialBuilder.create (aCtx, RES).build ();
    assertEquals (aFromFactory, aFromBuilder);
  }

  @Test (expected = IllegalStateException.class)
  public void testBuildMissingPartialContext ()
  {
    new ValidationExecutorXSDPartialBuilder ().resource (RES).build ();
  }

  @Test (expected = IllegalStateException.class)
  public void testBuildMissingResource () throws XPathExpressionException
  {
    new ValidationExecutorXSDPartialBuilder ().partialContext (_ctx ()).build ();
  }
}
