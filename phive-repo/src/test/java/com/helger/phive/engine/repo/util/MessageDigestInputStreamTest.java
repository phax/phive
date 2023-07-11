/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.util;

import static com.helger.phive.engine.repo.IRepoStorage.DEFAULT_MD_ALGORITHM;
import static org.junit.Assert.assertEquals;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

import javax.annotation.Nonnull;

import org.junit.Test;

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
