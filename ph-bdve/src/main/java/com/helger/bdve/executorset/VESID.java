package com.helger.bdve.executorset;

import java.io.Serializable;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.compare.CompareHelper;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.regex.RegExHelper;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

public final class VESID implements Serializable, Comparable <VESID>
{
  private final String m_sGroupID;
  private final String m_sArtifactID;
  private final String m_sVersion;
  private final String m_sClassifier;

  public static boolean isValidPart (@Nullable final String sPart)
  {
    return StringHelper.hasText (sPart) && RegExHelper.stringMatchesPattern ("[a-zA-Z0-9_\\-\\.]+", sPart);
  }

  public VESID (@Nonnull @Nonempty final String sGroupID,
                @Nonnull @Nonempty final String sArtifactID,
                @Nonnull @Nonempty final String sVersion)
  {
    this (sGroupID, sArtifactID, sVersion, (String) null);
  }

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
    m_sClassifier = sClassifier;
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

  @Nullable
  public String getClassifier ()
  {
    return m_sClassifier;
  }

  public boolean hasClassifier ()
  {
    return StringHelper.hasText (m_sClassifier);
  }

  @Nonnull
  @Nonempty
  public String getFileBaseName ()
  {
    String ret = m_sGroupID + '-' + m_sArtifactID + '-' + m_sVersion;
    if (hasClassifier ())
      ret += '-' + m_sClassifier;
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
    return new HashCodeGenerator (this).append (m_sGroupID)
                                       .append (m_sArtifactID)
                                       .append (m_sVersion)
                                       .append (m_sClassifier)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("GroupID", m_sGroupID)
                                       .append ("ArtifactID", m_sArtifactID)
                                       .append ("Version", m_sVersion)
                                       .appendIf ("Classifier", m_sClassifier, StringHelper::hasText)
                                       .toString ();
  }
}
