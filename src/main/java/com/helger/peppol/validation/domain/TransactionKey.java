/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.domain;

import java.io.Serializable;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.locale.country.CountryCache;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.ubl21.EUBL21DocumentType;

/**
 * An immutable pair of a business specification of type
 * {@link IBusinessSpecification} and a transaction of type
 * {@link ISpecificationTransaction}.
 *
 * @author Philip Helger
 */
@Immutable
@MustImplementEqualsAndHashcode
public class TransactionKey implements Serializable
{
  private final IBusinessSpecification m_aBusinessSpecification;
  private final ISpecificationTransaction m_aTransaction;
  private final Locale m_aCountry;
  private final boolean m_bIsSectorSpecific;
  private final String m_sPrerequisiteXPath;

  public TransactionKey (@Nonnull final IBusinessSpecification aBusinessSpecification, @Nonnull final ISpecificationTransaction aTransaction)
  {
    this (aBusinessSpecification, aTransaction, null, false, null);
  }

  public TransactionKey (@Nonnull final IBusinessSpecification aBusinessSpecification,
                         @Nonnull final ISpecificationTransaction aTransaction,
                         @Nullable final String sCountryCode,
                         final boolean bIsSectorSpecific,
                         @Nullable final String sPrerequisiteXPath)
  {
    m_aBusinessSpecification = ValueEnforcer.notNull (aBusinessSpecification, "BusinessSpecification");
    m_aTransaction = ValueEnforcer.notNull (aTransaction, "Transaction");
    if (StringHelper.hasText (sCountryCode))
    {
      m_aCountry = CountryCache.getInstance ().getCountry (sCountryCode);
      if (m_aCountry == null)
        throw new IllegalArgumentException ("The passed country '" + sCountryCode + "' does not exist!");
    }
    else
      m_aCountry = null;
    m_bIsSectorSpecific = bIsSectorSpecific;
    m_sPrerequisiteXPath = sPrerequisiteXPath;
  }

  /**
   * @return The business specification this transaction key refers to. This is
   *         the object passed in the constructor. Never <code>null</code>.
   */
  @Nonnull
  public IBusinessSpecification getBusinessSpecification ()
  {
    return m_aBusinessSpecification;
  }

  /**
   * @return The transaction of the specification as passed in the constructor.
   *         Never <code>null</code>.
   */
  @Nonnull
  public ISpecificationTransaction getTransaction ()
  {
    return m_aTransaction;
  }

  /**
   * @return The UBL document type to be used for this transaction.
   */
  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return m_aTransaction.getUBLDocumentType ();
  }

  /**
   * @return The country locale as specified in the constructor.
   */
  @Nullable
  public Locale getCountryLocale ()
  {
    return m_aCountry;
  }

  /**
   * @return The country code extracted from the contained locale. Never
   *         <code>null</code>.
   */
  @Nullable
  public String getCountryCode ()
  {
    return m_aCountry == null ? null : m_aCountry.getCountry ();
  }

  /**
   * @return <code>true</code> if sector specific is enabled, <code>false</code>
   *         if not.
   */
  public boolean isSectorSpecific ()
  {
    return m_bIsSectorSpecific;
  }

  /**
   * @return An optional prerequisite XPath expression that must match before
   *         the validation artefact can be applied. May be <code>null</code>.
   */
  @Nullable
  public String getPrerequisiteXPath ()
  {
    return m_sPrerequisiteXPath;
  }

  /**
   * @return <code>true</code> if a prerequisite XPath expression is present,
   *         <code>false</code> if not
   */
  public boolean hasPrerequisiteXPath ()
  {
    return StringHelper.hasText (m_sPrerequisiteXPath);
  }

  public boolean hasSameSpecificationAndTransaction (@Nullable final TransactionKey aOther)
  {
    if (aOther == null)
      return false;
    return m_aBusinessSpecification.equals (aOther.m_aBusinessSpecification) && m_aTransaction.equals (aOther.m_aTransaction);
  }

  public boolean hasSameSpecificationAndTransactionAndCountryAndSector (@Nullable final TransactionKey aOther)
  {
    if (aOther == null)
      return false;
    return m_aBusinessSpecification.equals (aOther.m_aBusinessSpecification) &&
           m_aTransaction.equals (aOther.m_aTransaction) &&
           EqualsHelper.equals (m_aCountry, aOther.m_aCountry) &&
           m_bIsSectorSpecific == aOther.m_bIsSectorSpecific;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final TransactionKey rhs = (TransactionKey) o;
    return m_aBusinessSpecification.equals (rhs.m_aBusinessSpecification) &&
           m_aTransaction.equals (rhs.m_aTransaction) &&
           EqualsHelper.equals (m_aCountry, rhs.m_aCountry) &&
           m_bIsSectorSpecific == rhs.m_bIsSectorSpecific &&
           EqualsHelper.equals (m_sPrerequisiteXPath, rhs.m_sPrerequisiteXPath);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aBusinessSpecification)
                                       .append (m_aTransaction)
                                       .append (m_aCountry)
                                       .append (m_bIsSectorSpecific)
                                       .append (m_sPrerequisiteXPath)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("BusinessSpecification", m_aBusinessSpecification)
                                       .append ("Transaction", m_aTransaction)
                                       .append ("Country", m_aCountry)
                                       .append ("IsSectorSpecific", m_bIsSectorSpecific)
                                       .append ("PrerequisiteXPath", m_sPrerequisiteXPath)
                                       .toString ();
  }

  /**
   * Builder class for {@link TransactionKey} objects.
   * {@link #setBusinessSpecification(IBusinessSpecification)} and
   * {@link #setTransaction(ISpecificationTransaction)} must be filled, as these
   * are the mandatory fields.
   *
   * @author Philip Helger
   */
  public static class Builder
  {
    private IBusinessSpecification m_aBusinessSpecification;
    private ISpecificationTransaction m_aTransaction;
    private String m_sCountry;
    private boolean m_bIsSectorSpecific;
    private String m_sPrerequisiteXPath;

    public Builder ()
    {}

    public Builder (@Nonnull final TransactionKey aOther)
    {
      m_aBusinessSpecification = aOther.m_aBusinessSpecification;
      m_aTransaction = aOther.m_aTransaction;
      m_sCountry = aOther.getCountryCode ();
      m_bIsSectorSpecific = aOther.m_bIsSectorSpecific;
      m_sPrerequisiteXPath = aOther.m_sPrerequisiteXPath;
    }

    @Nonnull
    public Builder setBusinessSpecification (@Nullable final IBusinessSpecification aBusinessSpecification)
    {
      m_aBusinessSpecification = aBusinessSpecification;
      return this;
    }

    @Nonnull
    public Builder setTransaction (@Nullable final ISpecificationTransaction aTransaction)
    {
      m_aTransaction = aTransaction;
      return this;
    }

    @Nonnull
    public Builder setCountry (@Nullable final String sCountry)
    {
      m_sCountry = sCountry;
      return this;
    }

    @Nonnull
    public Builder setIsSectorSpecific (final boolean bIsSectorSpecific)
    {
      m_bIsSectorSpecific = bIsSectorSpecific;
      return this;
    }

    @Nonnull
    public Builder setPrerequisiteXPath (@Nullable final String sPrerequisiteXPath)
    {
      m_sPrerequisiteXPath = sPrerequisiteXPath;
      return this;
    }

    @Nonnull
    public TransactionKey build ()
    {
      if (m_aBusinessSpecification == null)
        throw new IllegalStateException ("The Business specification must be provided");
      if (m_aTransaction == null)
        throw new IllegalStateException ("The Transaction must be provided");
      return new TransactionKey (m_aBusinessSpecification, m_aTransaction, m_sCountry, m_bIsSectorSpecific, m_sPrerequisiteXPath);
    }
  }
}
