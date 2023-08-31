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
package com.helger.phive.api.executorset;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.MustImplementComparable;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.commons.version.Version;

/**
 * This class contains the version of a VESID. This can either be a fixed
 * version or a pseudo version.
 *
 * @author Philip Helger
 * @since 9.0.0
 */
@Immutable
@MustImplementComparable
@MustImplementEqualsAndHashcode
public final class VESVersion implements Comparable <VESVersion>
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESVersion.class);

  private final Version m_aStaticVersion;
  private final EVESPseudoVersion m_ePseudoVersion;

  /**
   * Constructor - only invoked by the static factory methods below
   *
   * @param aStaticVersion
   *        Static version. May be <code>null</code>.
   * @param ePseudoVersion
   *        Pseudo version. May be <code>null</code>.
   */
  private VESVersion (@Nullable final Version aStaticVersion, @Nullable final EVESPseudoVersion ePseudoVersion)
  {
    ValueEnforcer.isTrue (aStaticVersion != null || ePseudoVersion != null,
                          "Either Static Version or Pseudo Version must be provided");
    ValueEnforcer.isFalse (aStaticVersion != null && ePseudoVersion != null,
                           "Only one of Static Version or Pseudo Version must be provided");
    m_aStaticVersion = aStaticVersion;
    m_ePseudoVersion = ePseudoVersion;
  }

  /**
   * @return <code>true</code> if it is a static version, <code>false</code> if
   *         it is a pseudo version
   * @see #isPseudoVersion()
   * @see #getStaticVersion()
   */
  public boolean isStaticVersion ()
  {
    return m_aStaticVersion != null;
  }

  /**
   * @return The static version of this VER version. Guaranteed to be
   *         non-<code>null</code> if {@link #isStaticVersion()} returns true.
   * @see #isStaticVersion()
   */
  @Nullable
  public Version getStaticVersion ()
  {
    return m_aStaticVersion;
  }

  /**
   * @return <code>true</code> if it is a pseudo version, <code>false</code> if
   *         it is a static version
   * @see #isStaticVersion()
   * @see #getPseudoVersion()
   */
  public boolean isPseudoVersion ()
  {
    return m_ePseudoVersion != null;
  }

  /**
   * @return The pseudo version of this VER version. Guaranteed to be
   *         non-<code>null</code> if {@link #isPseudoVersion()} returns true.
   * @see #isPseudoVersion()
   */
  @Nullable
  public EVESPseudoVersion getPseudoVersion ()
  {
    return m_ePseudoVersion;
  }

  @Nonnull
  private static String _getAsString (@Nonnull final Version aVersion,
                                      final char cClassifierSep,
                                      final boolean bEnforceNumbers)
  {
    // Different implementation then Version.getAsString (...)
    String ret = "";
    char cSep = cClassifierSep;
    boolean bMust = bEnforceNumbers;
    if (aVersion.hasQualifier ())
      ret = aVersion.getQualifier ();

    if (aVersion.getMicro () > 0 || bMust)
    {
      if (!ret.isEmpty ())
        ret = cSep + ret;
      ret = aVersion.getMicro () + ret;
      cSep = '.';
      bMust = true;
    }

    if (aVersion.getMinor () > 0 || bMust)
    {
      if (!ret.isEmpty ())
        ret = cSep + ret;
      ret = aVersion.getMinor () + ret;
      cSep = '.';
      bMust = true;
    }

    if (aVersion.getMajor () > 0 || bMust)
    {
      if (!ret.isEmpty ())
        ret = cSep + ret;
      ret = aVersion.getMajor () + ret;
    }

    return ret;
  }

  @Nonnull
  public static String getAsString (@Nonnull final Version aVersion)
  {
    return _getAsString (aVersion, '-', false);
  }

  @Nonnull
  public static String getAsString (@Nonnull final EVESPseudoVersion ePseudoVersion)
  {
    return ePseudoVersion.getID ();
  }

  /**
   * @return The unified string representation of the Version.
   */
  @Nonnull
  public String getAsString ()
  {
    if (m_aStaticVersion != null)
      return getAsString (m_aStaticVersion);

    return getAsString (m_ePseudoVersion);
  }

  /**
   * Compare a static version with a pseudo version
   *
   * @param aStaticVersion
   *        Static version. May not be <code>null</code>.
   * @param ePseudoVersion
   *        Pseudo version. May not be <code>null</code>.
   * @return -1, 0 or +1
   */
  private static int _compare (@Nonnull final Version aStaticVersion, @Nonnull final EVESPseudoVersion ePseudoVersion)
  {
    if (ePseudoVersion == EVESPseudoVersion.LATEST)
    {
      // Latest is always last
      return -1;
    }
    return +1;
  }

  public int compareTo (@Nonnull final VESVersion rhs)
  {
    if (isStaticVersion ())
    {
      if (rhs.isStaticVersion ())
        return m_aStaticVersion.compareTo (rhs.m_aStaticVersion);
      return _compare (m_aStaticVersion, rhs.m_ePseudoVersion);
    }

    // this is a pseudo version
    if (rhs.isStaticVersion ())
    {
      // Invert result
      return -_compare (rhs.m_aStaticVersion, m_ePseudoVersion);
    }
    return m_ePseudoVersion.compareToSemantically (rhs.m_ePseudoVersion);
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final VESVersion rhs = (VESVersion) o;
    return EqualsHelper.equals (m_aStaticVersion, rhs.m_aStaticVersion) &&
           EqualsHelper.equals (m_ePseudoVersion, rhs.m_ePseudoVersion);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aStaticVersion).append (m_ePseudoVersion).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).appendIfNotNull ("StaticVersion", m_aStaticVersion)
                                       .appendIfNotNull ("PseudoVersion", m_ePseudoVersion)
                                       .getToString ();
  }

  @Nonnull
  public static VESVersion of (@Nonnull final Version aVersion)
  {
    ValueEnforcer.notNull (aVersion, "Version");
    return new VESVersion (aVersion, null);
  }

  @Nonnull
  public static VESVersion of (@Nonnull final EVESPseudoVersion ePseudoVersion)
  {
    ValueEnforcer.notNull (ePseudoVersion, "PseudoVersion");
    return new VESVersion (null, ePseudoVersion);
  }

  public static boolean isValidStaticVersion (@Nullable final String sVersion)
  {
    // Must not be empty
    if (StringHelper.hasNoText (sVersion))
      return false;

    // Must follow the VESID constraints
    if (!VESID.isValidPart (sVersion))
      return false;

    // Parse to Version object
    final Version aParsedVersion = Version.parse (sVersion);
    if (aParsedVersion == null)
      return false;

    // Check if the parsing result equals the original in a way
    if (sVersion.equals (_getAsString (aParsedVersion, '-', true)))
      return true;
    if (sVersion.equals (_getAsString (aParsedVersion, '-', false)))
      return true;
    if (sVersion.equals (_getAsString (aParsedVersion, '.', true)))
      return true;
    if (sVersion.equals (_getAsString (aParsedVersion, '.', false)))
      return true;

    // TODO make debug
    LOGGER.warn ("'" +
                 sVersion +
                 "' is none of '" +
                 _getAsString (aParsedVersion, '-', true) +
                 "' x '" +
                 _getAsString (aParsedVersion, '-', false) +
                 "' x '" +
                 _getAsString (aParsedVersion, '.', true) +
                 "' x '" +
                 _getAsString (aParsedVersion, '.', false) +
                 "'");

    // Nope
    return false;
  }

  @Nonnull
  public static VESVersion parseOrThrow (@Nullable final String sVersion)
  {
    if (StringHelper.hasNoText (sVersion))
      throw new IllegalArgumentException ("Version string must not be empty");

    // Check pseudo version first
    final EVESPseudoVersion ePseudoVersion = EVESPseudoVersion.getFromIDOrNull (sVersion);
    if (ePseudoVersion != null)
      return of (ePseudoVersion);

    if (isValidStaticVersion (sVersion))
    {
      // Try to convert into a Version object instead
      return of (Version.parse (sVersion));
    }

    throw new IllegalArgumentException ("Failed to parse '" + sVersion + "' to a VES Version");
  }

  @Nullable
  public static VESVersion parseOrNull (@Nullable final String sVersion)
  {
    try
    {
      return parseOrThrow (sVersion);
    }
    catch (final RuntimeException ex)
    {
      LOGGER.warn (ex.getMessage ());
      return null;
    }
  }
}
