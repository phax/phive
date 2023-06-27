/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.util;

import org.junit.Before;
import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;

import static com.helger.phive.engine.repo.IRepoStorage.DEFAULT_MD_ALGORITHM;
import static org.junit.Assert.assertEquals;

public final class MessageDigestInputStreamTest {

  private MessageDigestInputStream messageDigestInputStream;

  @Before
  public void beforeEach ()
  {
    InputStream aIS = new ByteArrayInputStream ("bla".getBytes ());
    final MessageDigest aMD = DEFAULT_MD_ALGORITHM.createMessageDigest ();
    messageDigestInputStream = new MessageDigestInputStream (aIS, aMD);
  }

  @Test
  public void testRead () throws IOException {
    int nextByte = messageDigestInputStream.read ();
    assertEquals (98, nextByte);
  }

  @Test
  public void testReadWithParams () throws IOException {
    int bytesRead = messageDigestInputStream.read (new byte[1], 0, 1);
    assertEquals (1, bytesRead);
  }
}
