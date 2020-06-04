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

import java.util.Locale;

import org.junit.Test;

import com.helger.bdve.api.executorset.IValidationExecutorSet;
import com.helger.bdve.api.vesid.VESID;
import com.helger.bdve.engine.executorset.ValidationExecutorSet;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.json.IJsonObject;
import com.helger.json.JsonObject;

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
    final IValidationExecutorSet aVES = new ValidationExecutorSet (aVESID, "name", false);
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
  public void testException ()
  {
    final Exception ex = new IllegalArgumentException ("bla foo");

    // to Json
    final IJsonObject aObj = BDVEJsonHelper.getJsonStackTrace (ex);
    assertNotNull (aObj);
  }
}
