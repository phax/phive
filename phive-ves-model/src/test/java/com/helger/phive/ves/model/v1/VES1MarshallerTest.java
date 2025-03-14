/*
 * Copyright (C) 2023-2025 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.model.v1;

import static org.junit.Assert.assertNotNull;

import java.io.File;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.io.file.FileSystemIterator;
import com.helger.commons.io.file.IFileFilter;
import com.helger.phive.ves.v10.VesType;

/**
 * Test class for class {@link VES1Marshaller}.
 *
 * @author Philip Helger
 */
public final class VES1MarshallerTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VES1MarshallerTest.class);
  private static final String TEST_BASE_PATH = "src/test/resources/ves/v1/";

  @Test
  public void testReadGoodExamples ()
  {
    final VES1Marshaller m = new VES1Marshaller ();
    for (final File f : new FileSystemIterator (new File (TEST_BASE_PATH)).withFilter (IFileFilter.filenameEndsWith (".xml")))
    {
      LOGGER.info ("Reading " + f.getName ());
      final VesType aVES = m.read (f);
      assertNotNull (aVES);
    }
  }
}
