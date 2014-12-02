package com.helger.peppol.validation.domain;

import java.util.Locale;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.Nonempty;
import com.helger.commons.locale.country.CountryCache;

/**
 * An extension to a transaction key that contains a mandatory country code and
 * an indicator whether it is a sector specific artefact or not.
 * 
 * @author Philip Helger
 */
public class ExtendedTransactionKey
{
  public static final ExtendedTransactionKey AT = new ExtendedTransactionKey ("AT", false);
  public static final ExtendedTransactionKey AT_SECTOR = new ExtendedTransactionKey ("AT", true);

  private final Locale m_aCountry;
  private final boolean m_bIsSectorSpecific;

  public ExtendedTransactionKey (@Nonnull @Nonempty final String sCountryCode, final boolean bIsSectorSpecific)
  {
    ValueEnforcer.notEmpty (sCountryCode, "CountryCode");
    m_aCountry = CountryCache.getInstance ().getCountry (sCountryCode);
    if (m_aCountry == null)
      throw new IllegalArgumentException ("The passed country '" + sCountryCode + "' does not exist!");
    m_bIsSectorSpecific = bIsSectorSpecific;
  }

  @Nonnull
  public Locale getCountryLocale ()
  {
    return m_aCountry;
  }

  @Nonnull
  @Nonempty
  public String getCountryCode ()
  {
    return m_aCountry.getCountry ();
  }

  public boolean isSectorSpecific ()
  {
    return m_bIsSectorSpecific;
  }
}
