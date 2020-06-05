/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.api.executorset;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.RegEx;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.compare.CompareHelper;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.hashcode.IHashCodeGenerator;
import com.helger.commons.regex.RegExHelper;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * Validation Executor Set ID - VESID
 *
 * @author Philip Helger
 */
@Immutable
public final class VESID implements Comparable <VESID>
{
  /** The regular expression to which each part must conform */
  @RegEx
  public static final String REGEX_PART = "[a-zA-Z0-9_\\-\\.]+";
  /** The separator char between ID elements */
  public static final char ID_SEPARATOR = ':';

  private final String m_sGroupID;
  private final String m_sArtifactID;
  private final String m_sVersion;
  private final String m_sClassifier;
  // status vars
  private transient int m_nHashCode = IHashCodeGenerator.ILLEGAL_HASHCODE;

  /**
   * Check if the provided part matches the regular expression
   * {@value #REGEX_PART}.
   *
   * @param sPart
   *        The part to be checked. May be <code>null</code>.
   * @return <code>true</code> if the value matches the regular expression,
   *         <code>false</code> otherwise.
   */
  public static boolean isValidPart (@Nullable final String sPart)
  {
    return StringHelper.hasText (sPart) && RegExHelper.stringMatchesPattern (REGEX_PART, sPart);
  }

  /**
   * Constructor without classifier. All parameters must match the constraints
   * from {@link #isValidPart(String)}.
   *
   * @param sGroupID
   *        Group ID. May neither be <code>null</code> nor empty.
   * @param sArtifactID
   *        Artifact ID. May neither be <code>null</code> nor empty.
   * @param sVersion
   *        Version string. May neither be <code>null</code> nor empty.
   */
  public VESID (@Nonnull @Nonempty final String sGroupID,
                @Nonnull @Nonempty final String sArtifactID,
                @Nonnull @Nonempty final String sVersion)
  {
    this (sGroupID, sArtifactID, sVersion, (String) null);
  }

  /**
   * Constructor. All parameters must match the constraints from
   * {@link #isValidPart(String)}.
   *
   * @param sGroupID
   *        Group ID. May neither be <code>null</code> nor empty.
   * @param sArtifactID
   *        Artifact ID. May neither be <code>null</code> nor empty.
   * @param sVersion
   *        Version string. May neither be <code>null</code> nor empty.
   * @param sClassifier
   *        Classifier. May be <code>null</code>.
   */
  public VESID (@Nonnull @Nonempty final String sGroupID,
                @Nonnull @Nonempty final String sArtifactID,
                @Nonnull @Nonempty final String sVersion,
                @Nullable final String sClassifier)
  {
    ValueEnforcer.notEmpty (sGroupID, "GroupID");
    ValueEnforcer.isTrue (isValidPart (sGroupID), () -> "GroupID '" + sGroupID + "' is invalid");
    ValueEnforcer.notEmpty (sArtifactID, "ArtifactID");
    ValueEnforcer.isTrue (isValidPart (sArtifactID), () -> "ArtifactID '" + sArtifactID + "' is invalid");
    ValueEnforcer.notEmpty (sVersion, "Version");
    ValueEnforcer.isTrue (isValidPart (sVersion), () -> "Version '" + sVersion + "' is invalid");
    if (StringHelper.hasText (sClassifier))
      ValueEnforcer.isTrue (isValidPart (sClassifier), () -> "Classifier '" + sClassifier + "' is invalid");
    m_sGroupID = sGroupID;
    m_sArtifactID = sArtifactID;
    m_sVersion = sVersion;
    // Unify "" and null
    m_sClassifier = StringHelper.hasText (sClassifier) ? sClassifier : null;
  }

  @Nonnull
  @Nonempty
  public String getGroupID ()
  {
    return m_sGroupID;
  }

  @Nonnull
  @Nonempty
  public String getArtifactID ()
  {
    return m_sArtifactID;
  }

  @Nonnull
  @Nonempty
  public String getVersion ()
  {
    return m_sVersion;
  }

  public boolean hasClassifier ()
  {
    return StringHelper.hasText (m_sClassifier);
  }

  @Nullable
  public String getClassifier ()
  {
    return m_sClassifier;
  }

  @Nonnull
  public VESID getWithVersion (@Nonnull @Nonempty final String sNewVersion)
  {
    if (EqualsHelper.equals (m_sVersion, sNewVersion))
      return this;
    return new VESID (m_sGroupID, m_sArtifactID, sNewVersion, m_sClassifier);
  }

  @Nonnull
  public VESID getWithClassifier (@Nullable final String sNewClassifier)
  {
    if (EqualsHelper.equals (m_sClassifier, sNewClassifier))
      return this;
    return new VESID (m_sGroupID, m_sArtifactID, m_sVersion, sNewClassifier);
  }

  @Nonnull
  @Nonempty
  public String getAsSingleID ()
  {
    String ret = m_sGroupID + ID_SEPARATOR + m_sArtifactID + ID_SEPARATOR + m_sVersion;
    if (hasClassifier ())
      ret += ID_SEPARATOR + m_sClassifier;
    return ret;
  }

  public int compareTo (final VESID aOther)
  {
    int ret = m_sGroupID.compareTo (aOther.m_sGroupID);
    if (ret == 0)
    {
      ret = m_sArtifactID.compareTo (aOther.m_sArtifactID);
      if (ret == 0)
      {
        ret = m_sVersion.compareTo (aOther.m_sVersion);
        if (ret == 0)
          ret = CompareHelper.compare (m_sClassifier, aOther.m_sClassifier);
      }
    }
    return ret;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final VESID rhs = (VESID) o;
    return m_sGroupID.equals (rhs.m_sGroupID) &&
           m_sArtifactID.equals (rhs.m_sArtifactID) &&
           m_sVersion.equals (rhs.m_sVersion) &&
           EqualsHelper.equals (m_sClassifier, rhs.m_sClassifier);
  }

  @Override
  public int hashCode ()
  {
    int ret = m_nHashCode;
    if (ret == IHashCodeGenerator.ILLEGAL_HASHCODE)
      ret = m_nHashCode = new HashCodeGenerator (this).append (m_sGroupID)
                                                      .append (m_sArtifactID)
                                                      .append (m_sVersion)
                                                      .append (m_sClassifier)
                                                      .getHashCode ();
    return ret;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("GroupID", m_sGroupID)
                                       .append ("ArtifactID", m_sArtifactID)
                                       .append ("Version", m_sVersion)
                                       .appendIf ("Classifier", m_sClassifier, StringHelper::hasText)
                                       .getToString ();
  }

  @Nonnull
  public static VESID parseID (@Nullable final String sVESID)
  {
    final ICommonsList <String> aParts = StringHelper.getExploded (ID_SEPARATOR, sVESID);
    final int nSize = aParts.size ();
    if (nSize >= 3 && nSize <= 4)
      return new VESID (aParts.get (0), aParts.get (1), aParts.get (2), nSize >= 4 ? aParts.get (3) : null);

    throw new IllegalArgumentException ("Invalid VESID '" + sVESID + "' provided!");
  }

  @Nullable
  public static VESID parseIDOrNull (@Nullable final String sVESID)
  {
    try
    {
      return parseID (sVESID);
    }
    catch (final IllegalArgumentException ex)
    {
      return null;
    }
  }
}
