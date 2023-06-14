/*
 * Copyright (C) 2014-2023 Philip Helger (www.helger.com)
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
package com.helger.phive.engine.ves;

import com.helger.commons.io.file.FileSystemIterator;
import com.helger.commons.io.file.IFileFilter;
import com.helger.phive.engine.ves.v10_new.VesType;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Test class for class {@link VESMarshaller}.
 *
 * @author Philip Helger
 */
public final class VESMarshallerTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESMarshallerTest.class);
  private static final String TEST_BASE_PATH = "src/test/resources/ves/";

  @Test
  public void testBasicVes2 ()
  {
    assertTrue (VESMarshaller.XSD.exists ());
  }

  @Test
  public void testReadVes2Examples ()
  {
    final VESMarshaller m = new VESMarshaller();
    for (final File f : new FileSystemIterator (new File (TEST_BASE_PATH + "new-approach")).withFilter (IFileFilter
                                                                                                    .filenameEndsWith (".xml")))
    {
      LOGGER.info("Reading " + f.getName());
      final VesType aVES = m.read(f);
      assertNotNull(aVES);
    }
  }

}
