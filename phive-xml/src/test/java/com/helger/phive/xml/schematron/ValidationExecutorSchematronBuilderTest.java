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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.io.resource.ClassPathResource;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.EValidationType;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * Test class for class {@link ValidationExecutorSchematronBuilder}.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSchematronBuilderTest
{
  // Using simplelogger.properties as a dummy resource - the builder tests do not execute validation
  private static final IReadableResource RES = new ClassPathResource ("simplelogger.properties");

  @Test
  public void testMinimal ()
  {
    final ValidationExecutorSchematron aExec = new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_PURE)
                                                                                         .resource (RES)
                                                                                         .build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_PURE, aExec.getValidationArtefact ().getValidationType ());
    assertEquals (RES, aExec.getValidationArtefact ().getRuleResource ());
    assertNull (aExec.getPrerequisiteXPath ());
    assertNull (aExec.getNamespaceContext ());
    assertTrue (aExec.isCacheArtefact ());
  }

  @Test
  public void testFullyConfigured ()
  {
    final MapBasedNamespaceContext aNSCtx = new MapBasedNamespaceContext ();
    aNSCtx.addMapping ("test", "urn:test");

    final ValidationExecutorSchematron aExec = new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_XSLT2)
                                                                                         .resource (RES)
                                                                                         .prerequisiteXPath ("/root/child")
                                                                                         .namespaceContext (aNSCtx)
                                                                                         .cacheSchematron (false)
                                                                                         .stopValidationOnError (true)
                                                                                         .customErrorDetail ("err1",
                                                                                                             CustomErrorDetails.of (EErrorLevel.WARN))
                                                                                         .build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_XSLT2, aExec.getValidationArtefact ().getValidationType ());
    assertEquals ("/root/child", aExec.getPrerequisiteXPath ());
    assertNotNull (aExec.getNamespaceContext ());
    assertFalse (aExec.isCacheArtefact ());
    assertTrue (aExec.isStopValidationOnError ());
  }

  @Test
  public void testStaticFactoryPure ()
  {
    final ValidationExecutorSchematron aExec = ValidationExecutorSchematronBuilder.pure (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_PURE, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testStaticFactorySchIso ()
  {
    final ValidationExecutorSchematron aExec = ValidationExecutorSchematronBuilder.schIso (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_SCH_ISO_XSLT2, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testStaticFactorySchXslt ()
  {
    final ValidationExecutorSchematron aExec = ValidationExecutorSchematronBuilder.schXslt1 (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_SCHXSLT1_XSLT2, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testStaticFactorySchXslt2 ()
  {
    final ValidationExecutorSchematron aExec = ValidationExecutorSchematronBuilder.schXslt2 (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_SCHXSLT2_XSLT3, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testStaticFactoryXslt ()
  {
    final ValidationExecutorSchematron aExec = ValidationExecutorSchematronBuilder.xslt2 (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_XSLT2, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testStaticFactoryOioubl ()
  {
    final ValidationExecutorSchematron aExec = ValidationExecutorSchematronBuilder.oioubl (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.SCHEMATRON_OIOUBL, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testCopyConstructor ()
  {
    final ValidationExecutorSchematron aOriginal = new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_PURE)
                                                                                             .resource (RES)
                                                                                             .prerequisiteXPath ("/test")
                                                                                             .cacheSchematron (false)
                                                                                             .build ();
    final ValidationExecutorSchematron aCopy = new ValidationExecutorSchematronBuilder (aOriginal).build ();
    assertNotNull (aCopy);
    assertEquals (EValidationType.SCHEMATRON_PURE, aCopy.getValidationArtefact ().getValidationType ());
    assertEquals ("/test", aCopy.getPrerequisiteXPath ());
    assertFalse (aCopy.isCacheArtefact ());
  }

  @Test (expected = IllegalStateException.class)
  public void testBuildMissingValidationType ()
  {
    new ValidationExecutorSchematronBuilder ().resource (RES).build ();
  }

  @Test (expected = IllegalStateException.class)
  public void testBuildMissingResource ()
  {
    new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_PURE).build ();
  }

  @Test
  public void testMultipleCustomErrorDetails ()
  {
    final ValidationExecutorSchematron aExec = ValidationExecutorSchematronBuilder.pure (RES)
                                                                                  .customErrorDetail ("err1",
                                                                                                      CustomErrorDetails.of (EErrorLevel.WARN))
                                                                                  .customErrorDetail ("err2",
                                                                                                      new CustomErrorDetails (EErrorLevel.ERROR,
                                                                                                                              "pre-",
                                                                                                                              "-suf"))
                                                                                  .build ();
    assertNotNull (aExec);
  }

  @Test
  public void testEquivalenceWithStaticFactoryMethods ()
  {
    // Builder-created should be equivalent to static factory-created
    final ValidationExecutorSchematron aFromFactory = ValidationExecutorSchematron.createPure (RES, null);
    final ValidationExecutorSchematron aFromBuilder = ValidationExecutorSchematronBuilder.pure (RES).build ();
    assertEquals (aFromFactory, aFromBuilder);
  }
}
