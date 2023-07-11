/*
 * Copyright (C) 2023 Philip Helger & ecosio
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
package com.helger.phive.repo.util;

import static com.helger.phive.repo.IRepoStorage.DEFAULT_MD_ALGORITHM;
import static org.junit.Assert.assertEquals;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

import javax.annotation.Nonnull;

import org.junit.Test;

import com.helger.phive.repo.util.MessageDigestInputStream;

public final class MessageDigestInputStreamTest
{
  @Nonnull
  private MessageDigestInputStream _createMDIS ()
  {
    final InputStream aIS = new ByteArrayInputStream ("bla".getBytes (StandardCharsets.ISO_8859_1));
    final MessageDigest aMD = DEFAULT_MD_ALGORITHM.createMessageDigest ();
    return new MessageDigestInputStream (aIS, aMD);
  }

  @Test
  public void testRead () throws IOException
  {
    try (final MessageDigestInputStream aMDIS = _createMDIS ())
    {
      final int nextByte = aMDIS.read ();
      assertEquals (98, nextByte);
    }
  }

  @Test
  public void testReadWithParams () throws IOException
  {
    try (final MessageDigestInputStream aMDIS = _createMDIS ())
    {
      final int bytesRead = aMDIS.read (new byte [1], 0, 1);
      assertEquals (1, bytesRead);
    }
  }

  @Test
  public void testCharset ()
  {
    final String s = "ÿ";

    byte [] b = s.getBytes (StandardCharsets.ISO_8859_1);
    assertEquals (1, b.length);
    assertEquals (0xff, b[0] & 0xff);

    b = s.getBytes (StandardCharsets.UTF_8);
    assertEquals (2, b.length);
    assertEquals (0xc3, b[0] & 0xff);
    assertEquals (0xbf, b[1] & 0xff);

    assertEquals (s, new String (new byte [] { (byte) 0xff }, StandardCharsets.ISO_8859_1));
    assertEquals (s, new String (new byte [] { (byte) 0xc3, (byte) 0xbf }, StandardCharsets.UTF_8));
  }
}
