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
package com.helger.phive.api.source;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.junit.Test;

import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;

/**
 * Test class for class {@link ValidationSourceBinary}.
 *
 * @author Philip Helger
 */
public final class ValidationSourceBinaryTest
{
  @Test
  public void testCreate ()
  {
    final byte [] aBytes = "Hello World".getBytes (StandardCharsets.UTF_8);
    final ValidationSourceBinary aVS = ValidationSourceBinary.create ("test.txt", aBytes);
    assertNotNull (aVS);
    assertEquals ("test.txt", aVS.getSystemID ());
    assertTrue (aVS.hasSystemID ());
    assertFalse (aVS.isPartialSource ());
    assertNotNull (aVS.getBytes ());
    assertNotNull (aVS.toString ());
    assertEquals (IValidationSourceBinary.VALIDATION_SOURCE_TYPE, aVS.getValidationSourceTypeID ());
  }

  @Test
  public void testCreatePartial ()
  {
    final byte [] aBytes = "Partial content".getBytes (StandardCharsets.UTF_8);
    final ValidationSourceBinary aVS = ValidationSourceBinary.createPartial ("partial.txt", aBytes);
    assertNotNull (aVS);
    assertEquals ("partial.txt", aVS.getSystemID ());
    assertTrue (aVS.isPartialSource ());
  }

  @Test
  public void testCreateWithNullSystemID ()
  {
    final byte [] aBytes = "test".getBytes (StandardCharsets.UTF_8);
    final ValidationSourceBinary aVS = ValidationSourceBinary.create (null, aBytes);
    assertNotNull (aVS);
    assertFalse (aVS.hasSystemID ());
  }

  @Test
  public void testWriteTo () throws IOException
  {
    final String sContent = "Hello World";
    final byte [] aBytes = sContent.getBytes (StandardCharsets.UTF_8);
    final ValidationSourceBinary aVS = ValidationSourceBinary.create ("test.txt", aBytes);

    try (final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ())
    {
      aVS.writeTo (aBAOS);
      assertEquals (sContent, aBAOS.getAsString (StandardCharsets.UTF_8));
    }
  }

  @Test
  public void testGetContentAsString ()
  {
    final String sContent = "Hello World";
    final byte [] aBytes = sContent.getBytes (StandardCharsets.UTF_8);
    final ValidationSourceBinary aVS = ValidationSourceBinary.create ("test.txt", aBytes);
    assertEquals (sContent, aVS.getContentAsString (StandardCharsets.UTF_8));
  }
}
