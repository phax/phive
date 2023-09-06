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
package com.helger.phive.repo;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;
import com.helger.phive.api.executorset.VESID;

/**
 * A key that identifies a single item to be exchanged. It is an abstract
 * interpretation of a combination of folder and filename.
 *
 * @author Philip Helger
 */
@Immutable
public final class RepoStorageKey
{
  public static final String SUFFIX_SHA256 = ".sha256";
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageKey.class);

  private final String m_sPath;

  protected RepoStorageKey (@Nonnull @Nonempty final String sPath)
  {
    ValueEnforcer.notEmpty (sPath, "Path");
    ValueEnforcer.isFalse (sPath.startsWith ("/"), "Path should not start with a Slash");
    ValueEnforcer.isFalse (sPath.endsWith ("/"), "Path should not end with a Slash");
    m_sPath = sPath;
  }

  @Nonnull
  @Nonempty
  public String getPath ()
  {
    return m_sPath;
  }

  @Nonnull
  @ReturnsMutableCopy
  public RepoStorageKey getKeyHashSha256 ()
  {
    if (m_sPath.endsWith (SUFFIX_SHA256))
    {
      // Seems like a doubled hash key
      LOGGER.warn ("You are trying to create a RepoStorageKey SHA-256 of something that already seems to be a SHA-256 key: '" +
                   m_sPath +
                   "'");
    }
    return new RepoStorageKey (m_sPath + SUFFIX_SHA256);
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final RepoStorageKey rhs = (RepoStorageKey) o;
    return m_sPath.equals (rhs.m_sPath);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_sPath).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Path", m_sPath).getToString ();
  }

  @Nonnull
  public static RepoStorageKey of (@Nonnull @Nonempty final String sPath)
  {
    return new RepoStorageKey (sPath);
  }

  /**
   * Create a {@link RepoStorageKey} from the passed VESID and the file
   * extension. The algorithm is like this:
   * <code>sGroupID.replace ('.', '/') + "/" + sArtifactID + "/" + sVersion + "/" + sArtifactID + "-" + sVersion [+ "-" + sClassifier] + sFileExt</code>
   * which is basically
   * <code>group/artifact/version/artifact-version[-classifier].fileExtension</code>
   *
   * @param aVESID
   *        The VESID to convert. Considers an optionally present classifier.
   *        May not be <code>null</code>.
   * @param sFileExt
   *        The file extension to use. Must start with ".". May not be
   *        <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  public static RepoStorageKey of (@Nonnull final VESID aVESID, @Nonnull @Nonempty final String sFileExt)
  {
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notEmpty (sFileExt, "FileExt");
    ValueEnforcer.isTrue ( () -> sFileExt.startsWith ("."), "FileExt must start with a dot");

    final String sGroupID = aVESID.getGroupID ();
    final String sArtifactID = aVESID.getArtifactID ();
    final String sVersion = aVESID.getVersionString ();
    final String sClassifier = aVESID.hasClassifier () ? "-" + aVESID.getClassifier () : "";
    return new RepoStorageKey (sGroupID.replace ('.', '/') +
                               "/" +
                               sArtifactID +
                               "/" +
                               sVersion +
                               "/" +
                               sArtifactID +
                               "-" +
                               sVersion +
                               sClassifier +
                               sFileExt);
  }
}
