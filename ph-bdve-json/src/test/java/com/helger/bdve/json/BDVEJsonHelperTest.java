/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.json;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.Locale;

import org.junit.Test;

import com.helger.bdve.api.execute.ValidationExecutionManager;
import com.helger.bdve.api.executorset.IValidationExecutorSet;
import com.helger.bdve.api.executorset.VESID;
import com.helger.bdve.api.executorset.ValidationExecutorSet;
import com.helger.bdve.api.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.api.result.ValidationResultList;
import com.helger.bdve.engine.source.IValidationSourceXML;
import com.helger.bdve.engine.source.ValidationSourceXML;
import com.helger.bdve.engine.xsd.ValidationExecutorXSD;
import com.helger.commons.CGlobal;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.error.IError;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.text.ConstantHasErrorText;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.location.SimpleLocation;
import com.helger.commons.mock.CommonsTestHelper;
import com.helger.json.IJsonObject;
import com.helger.json.JsonObject;
import com.helger.schematron.svrl.SVRLResourceError;

/**
 * Test class for class {@link BDVEJsonHelper}.
 *
 * @author Philip Helger
 */
public final class BDVEJsonHelperTest
{
  @Test
  public void testGlobalError ()
  {
    final IJsonObject aObj = new JsonObject ();
    BDVEJsonHelper.applyGlobalError (aObj, "My error", 123);
    final String sJson = aObj.getAsJsonString ();
    assertEquals ("{\"success\":false," +
                  "\"interrupted\":false," +
                  "\"mostSevereErrorLevel\":\"ERROR\"," +
                  "\"results\":[{\"success\":\"FALSE\",\"artifactType\":\"input-parameter\",\"artifactPath\":\"none\",\"items\":[{\"errorLevel\":\"ERROR\",\"errorText\":\"My error\"}]}]," +
                  "\"durationMS\":123}",
                  sJson);
  }

  @Test
  public void testValidationResults ()
  {
    final IJsonObject aObj = new JsonObject ();
    final Locale aDisplayLocale = Locale.US;
    final VESID aVESID = new VESID ("group", "art", "1.0");
    final IValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID, "name", false);
    BDVEJsonHelper.applyValidationResultList (aObj, aVES, new CommonsArrayList <> (), aDisplayLocale, 123, null, null);
    final String sJson = aObj.getAsJsonString ();
    assertEquals ("{\"ves\":{\"vesid\":\"group:art:1.0\",\"name\":\"name\",\"deprecated\":false}," +
                  "\"success\":true," +
                  "\"interrupted\":false," +
                  "\"mostSevereErrorLevel\":\"SUCCESS\"," +
                  "\"results\":[]," +
                  "\"durationMS\":123}",
                  sJson);
  }

  @Test
  public void testValidationResultsBackAndForth ()
  {
    // Register
    final ValidationExecutorSetRegistry <IValidationSourceXML> aRegistry = new ValidationExecutorSetRegistry <> ();
    final VESID aVESID = new VESID ("group", "art", "1.0");
    final ValidationExecutorSet <IValidationSourceXML> aVES = new ValidationExecutorSet <> (aVESID, "name", false);
    aVES.addExecutor (ValidationExecutorXSD.create (new ClassPathResource ("test/schema1.xsd")));
    aRegistry.registerValidationExecutorSet (aVES);

    // Validate
    final ValidationResultList aVRL = ValidationExecutionManager.executeValidation (aVES,
                                                                                    ValidationSourceXML.create (new ClassPathResource ("test/schema1.xml")));
    assertTrue (aVRL.containsAtLeastOneError ());

    // To JSON
    final Locale aDisplayLocale = Locale.US;
    final IJsonObject aObj = new JsonObject ();
    BDVEJsonHelper.applyValidationResultList (aObj, aVES, aVRL, aDisplayLocale, 123, null, null);

    // And back
    final IValidationExecutorSet <IValidationSourceXML> aVES2 = BDVEJsonHelper.getAsVES (aRegistry, aObj);
    assertNotNull (aVES2);
    assertSame (aVES, aVES2);
  }

  @Test
  public void testException ()
  {
    final Exception ex = new IllegalArgumentException ("bla foo");

    // to Json
    final IJsonObject aObj = BDVEJsonHelper.getJsonStackTrace (ex);
    assertNotNull (aObj);
  }

  @Test
  public void testError ()
  {
    final IError aError = SingleError.builderError ()
                                     .setErrorID ("id1")
                                     .setErrorText ("fla")
                                     .setErrorLocation (new SimpleLocation ("res12", 3, 4))
                                     .build ();
    final IJsonObject aJson = BDVEJsonHelper.getJsonError (aError, CGlobal.DEFAULT_LOCALE);
    assertNotNull (aJson);

    final IError aError2 = BDVEJsonHelper.getAsIError (aJson);
    assertNotNull (aError2);

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aError, aError2);
  }

  @Test
  public void testSVRLError ()
  {
    final IError aError = new SVRLResourceError (EErrorLevel.ERROR,
                                                 "id2",
                                                 "field1",
                                                 new SimpleLocation ("res12", 3, 4),
                                                 new ConstantHasErrorText ("bla failed"),
                                                 null,
                                                 " my test <>");

    // To Json
    final IJsonObject aJson = BDVEJsonHelper.getJsonError (aError, CGlobal.DEFAULT_LOCALE);
    assertNotNull (aJson);

    // And back
    final IError aError2 = BDVEJsonHelper.getAsIError (aJson);
    assertNotNull (aError2);

    // And forth
    final IJsonObject aJson2 = BDVEJsonHelper.getJsonError (aError2, CGlobal.DEFAULT_LOCALE);
    assertNotNull (aJson2);

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aJson, aJson2);
    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aError, aError2);
  }

  @Test
  public void testSVRLErrorWithException ()
  {
    final IError aError = new SVRLResourceError (EErrorLevel.ERROR,
                                                 "id2",
                                                 "field1",
                                                 new SimpleLocation ("res12", 3, 4),
                                                 new ConstantHasErrorText ("bla failed"),
                                                 new IllegalStateException ("Sthg went wrong"),
                                                 " my test <>");

    // To Json
    final IJsonObject aJson = BDVEJsonHelper.getJsonError (aError, CGlobal.DEFAULT_LOCALE);
    assertNotNull (aJson);

    // And back
    final IError aError2 = BDVEJsonHelper.getAsIError (aJson);
    assertNotNull (aError2);

    // And forth
    final IJsonObject aJson2 = BDVEJsonHelper.getJsonError (aError2, CGlobal.DEFAULT_LOCALE);
    assertNotNull (aJson2);

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aJson, aJson2);
    // The objects differ, because of the different exception types
    assertTrue (aError2.getLinkedException () instanceof BDVERestoredException);
    if (false)
      CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aError, aError2);
  }
}
