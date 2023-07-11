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
