/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.repo.util;

import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.io.stream.WrappedInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

/**
 * Special {@link InputStream} that creates a MessageDigest.
 *
 * @author Philip Helger
 */
public final class MessageDigestInputStream extends WrappedInputStream
{
  private final MessageDigest m_aMD;

  public MessageDigestInputStream(@Nonnull final InputStream aWrappedIS, @Nonnull final MessageDigest aMD)
  {
    super (aWrappedIS);
    m_aMD = aMD;
  }

  @Nonnull
  @ReturnsMutableObject
  public MessageDigest messageDigest ()
  {
    return m_aMD;
  }

  @Override
  public int read () throws IOException
  {
    final int ch = in.read ();
    if (ch != -1)
      m_aMD.update ((byte) ch);
    return ch;
  }

  @Override
  public int read (@Nonnull final byte [] aBuf, @Nonnegative final int nOfs, @Nonnegative final int nLen) throws IOException
  {
    final int result = in.read (aBuf, nOfs, nLen);
    if (result != -1)
      m_aMD.update (aBuf, nOfs, result);
    return result;
  }
}
