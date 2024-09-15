/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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
package com.helger.phive.result.json;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.Locale;

import org.junit.Test;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.datetime.PDTWebDateHelper;
import com.helger.commons.error.IError;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.text.ConstantHasErrorText;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.location.SimpleLocation;
import com.helger.commons.mock.CommonsTestHelper;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.json.IJsonObject;
import com.helger.json.JsonObject;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSetRegistry;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.validity.IValidityDeterminator;
import com.helger.phive.result.exception.PhiveRestoredException;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;
import com.helger.schematron.svrl.SVRLResourceError;

/**
 * Test class for class {@link PhiveJsonHelper}.
 *
 * @author Philip Helger
 */
public final class PhiveJsonHelperTest
{
  @Test
  public void testGlobalError ()
  {
    final IJsonObject aObj = new JsonObject ();
    PhiveJsonHelper.applyGlobalError (aObj, "My error", 123);
    final String sJson = aObj.getAsJsonString ();
    assertEquals ("{\"success\":false," +
                  "\"interrupted\":false," +
                  "\"mostSevereErrorLevel\":\"ERROR\"," +
                  "\"results\":[{\"success\":\"FALSE\",\"artifactType\":\"input-parameter\",\"artifactPath\":\"none\",\"items\":[{\"errorLevel\":\"ERROR\",\"errorText\":\"My error\"}]}]," +
                  "\"durationMS\":123}",
                  sJson);
  }

  @Test
  public void testValidationResults () throws DVRVersionException
  {
    final IJsonObject aObj = new JsonObject ();
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnly ();
    final IValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                          "name",
                                                                          ValidationExecutorSetStatus.createValidAt (aNow));
    PhiveJsonHelper.applyValidationResultList (aObj, aVES, new CommonsArrayList <> (), aDisplayLocale, 123, null, null);
    final String sJson = aObj.getAsJsonString ();
    assertEquals ("{\"ves\":{\"vesid\":\"group:art:1\",\"name\":\"name\",\"deprecated\":false,\"status\":{\"lastModification\":\"" +
                  PDTWebDateHelper.getAsStringXSD (aNow) +
                  "\",\"type\":\"valid\"}}," +
                  "\"success\":true," +
                  "\"interrupted\":false," +
                  "\"mostSevereErrorLevel\":\"SUCCESS\"," +
                  "\"results\":[]," +
                  "\"durationMS\":123}",
                  sJson);
  }

  @Test
  public void testValidationResultsBackAndForth () throws DVRVersionException
  {
    // Register
    final ValidationExecutorSetRegistry <IValidationSourceXML> aRegistry = new ValidationExecutorSetRegistry <> ();
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");
    final ValidationExecutorSet <IValidationSourceXML> aVES = new ValidationExecutorSet <> (aVESID,
                                                                                            "name",
                                                                                            ValidationExecutorSetStatus.createValidNow ());
    aVES.addExecutor (ValidationExecutorXSD.create (new ClassPathResource ("test/schema1.xsd")));
    aRegistry.registerValidationExecutorSet (aVES);

    // Validate
    final ValidationResultList aVRL = ValidationExecutionManager.executeValidation (IValidityDeterminator.getDefault (),
                                                                                    aVES,
                                                                                    ValidationSourceXML.create (new ClassPathResource ("test/schema1.xml")));
    assertTrue (aVRL.containsAtLeastOneError ());

    // To JSON
    final Locale aDisplayLocale = Locale.US;
    final IJsonObject aObj = new JsonObject ();
    PhiveJsonHelper.applyValidationResultList (aObj, aVES, aVRL, aDisplayLocale, 123, null, null);

    // And back
    final IValidationExecutorSet <IValidationSourceXML> aVES2 = PhiveJsonHelper.getAsVES (aRegistry, aObj);
    assertNotNull (aVES2);
    assertSame (aVES, aVES2);

    final ValidationResultList aVRL2 = PhiveJsonHelper.getAsValidationResultList (aObj);
    assertNotNull (aVRL2);
    // direct equals doesn't work, because of the restored exception
    assertEquals (aVRL.size (), aVRL2.size ());
    assertEquals (1, aVRL.size ());
    assertEquals (aVRL.get (0).getErrorList ().size (), aVRL2.get (0).getErrorList ().size ());

    // and forth
    final IJsonObject aObj2 = new JsonObject ();
    PhiveJsonHelper.applyValidationResultList (aObj2, aVES2, aVRL2, aDisplayLocale, 123, null, null);

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aObj, aObj2);
  }

  @Test
  public void testException ()
  {
    final Exception ex = new IllegalArgumentException ("bla foo");

    // to Json
    final IJsonObject aObj = PhiveJsonHelper.getJsonStackTrace (ex);
    assertNotNull (aObj);
  }

  @Test
  public void testError ()
  {
    final IError aError = SingleError.builderError ()
                                     .errorID ("id1")
                                     .errorText ("fla")
                                     .errorLocation (new SimpleLocation ("res12", 3, 4))
                                     .build ();
    final IJsonObject aJson = PhiveJsonHelper.getJsonError (aError, Locale.US);
    assertNotNull (aJson);

    final IError aError2 = PhiveJsonHelper.getAsIError (aJson);
    assertNotNull (aError2);

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aError, aError2);
  }

  @Test
  public void testSVRLError ()
  {
    final LocalDateTime aNow = PDTFactory.getCurrentLocalDateTimeMillisOnly ();
    final IError aError = new SVRLResourceError (aNow,
                                                 EErrorLevel.ERROR,
                                                 "id2",
                                                 "field1",
                                                 new SimpleLocation ("res12", 3, 4),
                                                 new ConstantHasErrorText ("bla failed"),
                                                 null,
                                                 " my test <>");

    // To Json
    final IJsonObject aJson = PhiveJsonHelper.getJsonError (aError, Locale.US);
    assertNotNull (aJson);

    // And back
    final IError aError2 = PhiveJsonHelper.getAsIError (aJson);
    assertNotNull (aError2);

    // And forth
    final IJsonObject aJson2 = PhiveJsonHelper.getJsonError (aError2, Locale.US);
    assertNotNull (aJson2);

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aJson, aJson2);
    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aError, aError2);
  }

  @Test
  public void testSVRLErrorWithException ()
  {
    final LocalDateTime aNow = PDTFactory.getCurrentLocalDateTimeMillisOnly ();
    final IError aError = new SVRLResourceError (aNow,
                                                 EErrorLevel.ERROR,
                                                 "id2",
                                                 "field1",
                                                 new SimpleLocation ("res12", 3, 4),
                                                 new ConstantHasErrorText ("bla failed"),
                                                 new IllegalStateException ("Sthg went wrong"),
                                                 " my test <>");

    // To Json
    final IJsonObject aJson = PhiveJsonHelper.getJsonError (aError, Locale.US);
    assertNotNull (aJson);

    // And back
    final IError aError2 = PhiveJsonHelper.getAsIError (aJson);
    assertNotNull (aError2);

    // And forth
    final IJsonObject aJson2 = PhiveJsonHelper.getJsonError (aError2, Locale.US);
    assertNotNull (aJson2);

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aJson, aJson2);
    // The objects differ, because of the different exception types
    assertTrue (aError2.getLinkedException () instanceof PhiveRestoredException);
    if (false)
      CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aError, aError2);
  }
}
