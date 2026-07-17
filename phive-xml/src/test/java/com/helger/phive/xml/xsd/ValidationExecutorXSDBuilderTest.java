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
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.io.resource.ClassPathResource;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.EValidationType;

/**
 * Test class for class {@link ValidationExecutorXSDBuilder}.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSDBuilderTest
{
  // Using simplelogger.properties as a dummy resource - the builder tests do not execute validation
  private static final IReadableResource RES = new ClassPathResource ("simplelogger.properties");
  private static final IReadableResource RES2 = new ClassPathResource ("dummy-second.xsd");

  @Test
  public void testMinimal ()
  {
    final ValidationExecutorXSD aExec = new ValidationExecutorXSDBuilder ().resource (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.XSD, aExec.getValidationArtefact ().getValidationType ());
    assertEquals (RES, aExec.getValidationArtefact ().getRuleResource ());
    assertNotNull (aExec.getSchemaProvider ());
    // XSD stops validation on error by default
    assertTrue (aExec.isStopValidationOnError ());
  }

  @Test
  public void testMultipleResourcesUsesLastForName ()
  {
    final ValidationExecutorXSD aExec = new ValidationExecutorXSDBuilder ().resources (RES, RES2).build ();
    assertNotNull (aExec);
    // The last resource is the important one for the name
    assertEquals (RES2, aExec.getValidationArtefact ().getRuleResource ());
  }

  @Test
  public void testAddResource ()
  {
    final ValidationExecutorXSD aExec = new ValidationExecutorXSDBuilder ().addResource (RES)
                                                                          .addResource (RES2)
                                                                          .build ();
    assertNotNull (aExec);
    assertEquals (RES2, aExec.getValidationArtefact ().getRuleResource ());
  }

  @Test
  public void testStopValidationOnError ()
  {
    final ValidationExecutorXSD aExec = new ValidationExecutorXSDBuilder ().resource (RES)
                                                                          .stopValidationOnError (false)
                                                                          .build ();
    assertNotNull (aExec);
    assertFalse (aExec.isStopValidationOnError ());
  }

  @Test
  public void testExplicitArtefactResource ()
  {
    final ValidationExecutorXSD aExec = new ValidationExecutorXSDBuilder ().resource (RES)
                                                                          .artefactResource (RES2)
                                                                          .build ();
    assertNotNull (aExec);
    assertEquals (RES2, aExec.getValidationArtefact ().getRuleResource ());
  }

  @Test
  public void testStaticFactory ()
  {
    final ValidationExecutorXSD aExec = ValidationExecutorXSDBuilder.create (RES).build ();
    assertNotNull (aExec);
    assertEquals (EValidationType.XSD, aExec.getValidationArtefact ().getValidationType ());
  }

  @Test
  public void testCopyConstructor ()
  {
    final ValidationExecutorXSD aOriginal = new ValidationExecutorXSDBuilder ().resource (RES)
                                                                              .stopValidationOnError (false)
                                                                              .build ();
    final ValidationExecutorXSD aCopy = new ValidationExecutorXSDBuilder (aOriginal).build ();
    assertNotNull (aCopy);
    assertEquals (EValidationType.XSD, aCopy.getValidationArtefact ().getValidationType ());
    assertEquals (RES, aCopy.getValidationArtefact ().getRuleResource ());
    assertFalse (aCopy.isStopValidationOnError ());
  }

  @Test
  public void testEquivalenceWithStaticFactoryMethods ()
  {
    // Builder-created should be equivalent to static factory-created
    final ValidationExecutorXSD aFromFactory = ValidationExecutorXSD.create (RES);
    final ValidationExecutorXSD aFromBuilder = ValidationExecutorXSDBuilder.create (RES).build ();
    assertEquals (aFromFactory, aFromBuilder);
  }

  @Test (expected = IllegalStateException.class)
  public void testBuildMissingResource ()
  {
    new ValidationExecutorXSDBuilder ().build ();
  }
}
