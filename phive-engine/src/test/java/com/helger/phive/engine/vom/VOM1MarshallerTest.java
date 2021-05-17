/**
 * Copyright (C) 2014-2021 Philip Helger (www.helger.com)
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
package com.helger.phive.engine.vom;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
  public void testReadExamples ()
  {
    final VOM1Marshaller m = new VOM1Marshaller ();
    for (final String s : new String [] { "examples-ves.xml",
                                          "examples-ves-edifact-based.xml",
                                          "examples-ves-xrechnung-200-ublinv.xml" })
    {
      LOGGER.info ("Reading " + s);
      assertNotNull (m.read (new File ("src/test/resources/vom/" + s)));
    }
  }
}
