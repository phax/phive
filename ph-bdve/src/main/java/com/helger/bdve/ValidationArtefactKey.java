/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve;

import java.io.Serializable;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.bdve.spec.ISpecificationTransaction;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.compare.CompareHelper;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.locale.country.CountryCache;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * A validation key that uniquely identifies a set of validation artefacts. It
 * consists of the following elements:
 * <ul>
 * <li>A business specification of type {@link IBusinessSpecification}</li>
 * <li>A transaction of type {@link ISpecificationTransaction}</li>
 * <li>An optional country code in case validation is country dependent.</li>
 * <li>An optional "sector key" of type {@link ValidationArtefactSectorKey} that
 * identifies the industry or sector to which the validation applies.</li>
 * <li>An optional "prerequisite expression" (like XPath) that may be used to
 * identify whether this validation key is applicable to a document or not.</li>
 * </ul>
 *
 * @author Philip Helger
 */
@Immutable
@MustImplementEqualsAndHashcode
public class ValidationArtefactKey implements Serializable, Comparable <ValidationArtefactKey>
{
  private final IBusinessSpecification m_aBusinessSpecification;
  private final ISpecificationTransaction m_aTransaction;
  private final Locale m_aCountry;
  private final ValidationArtefactSectorKey m_aSectorKey;
  private final String m_sPrerequisiteXPath;

  // Status vars
  private final String m_sID;

  public ValidationArtefactKey (@Nonnull final IBusinessSpecification aBusinessSpecification,
                                @Nonnull final ISpecificationTransaction aTransaction,
                                @Nullable final String sCountryCode,
                                @Nullable final ValidationArtefactSectorKey aSectorKey,
                                @Nullable final String sPrerequisiteXPath)
  {
    ValueEnforcer.notNull (aBusinessSpecification, "BusinessSpecification");
    ValueEnforcer.notNull (aTransaction, "Transaction");

    m_aBusinessSpecification = aBusinessSpecification;
    m_aTransaction = aTransaction;
    if (StringHelper.hasText (sCountryCode))
    {
      m_aCountry = CountryCache.getInstance ().getCountry (sCountryCode);
      if (m_aCountry == null)
        throw new IllegalArgumentException ("The passed country '" + sCountryCode + "' does not exist!");
    }
    else
      m_aCountry = null;
    m_aSectorKey = aSectorKey;
    m_sPrerequisiteXPath = sPrerequisiteXPath;

    String sID = aBusinessSpecification.getID () + "~" + aTransaction.getID ();
    if (m_aCountry != null)
      sID += "~" + m_aCountry.getCountry ();
    if (aSectorKey != null)
      sID += "~" + aSectorKey.getID ();
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  /**
   * @return The business specification this validation key refers to. This is
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
   * @return The JAXB class implementing the document type referenced by the
   *         transaction.
   */
  @Nonnull
  public Class <?> getImplementationClass ()
  {
    return m_aTransaction.getJAXBDocumentType ().getImplementationClass ();
  }

  /**
   * @return <code>true</code> if this validation key is country specific,
   *         <code>false</code> otherwise.
   */
  public boolean isCountrySpecific ()
  {
    return m_aCountry != null;
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
    return m_aSectorKey != null;
  }

  /**
   * @return The validation sector key specified in the constructor. May be
   *         <code>null</code> if not sector specific.
   */
  @Nullable
  public ValidationArtefactSectorKey getSectorKey ()
  {
    return m_aSectorKey;
  }

  /**
   * @return <code>true</code> if a prerequisite XPath expression is present,
   *         <code>false</code> if not
   */
  public boolean hasPrerequisiteXPath ()
  {
    return StringHelper.hasText (m_sPrerequisiteXPath);
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
   * Check if this and the passed validation artefact key have the same business
   * specification and transaction!
   *
   * @param aOther
   *        The validation artefact key to compare to. May be <code>null</code>.
   * @return <code>true</code> if the passed object is not <code>null</code> and
   *         if business specification and transaction are equal,
   *         <code>false</code> otherwise.
   */
  public boolean hasSameSpecificationAndTransaction (@Nullable final ValidationArtefactKey aOther)
  {
    if (aOther == null)
      return false;
    return m_aBusinessSpecification.equals (aOther.m_aBusinessSpecification) &&
           m_aTransaction.equals (aOther.m_aTransaction);
  }

  public boolean hasSameSpecificationAndTransactionAndCountryAndSector (@Nullable final ValidationArtefactKey aOther)
  {
    if (aOther == null)
      return false;
    return m_aBusinessSpecification.equals (aOther.m_aBusinessSpecification) &&
           m_aTransaction.equals (aOther.m_aTransaction) &&
           EqualsHelper.equals (m_aCountry, aOther.m_aCountry) &&
           (EqualsHelper.equals (m_aSectorKey, aOther.m_aSectorKey) ||
            (m_aSectorKey == null && aOther.m_aSectorKey != null));
  }

  public int compareTo (@Nonnull final ValidationArtefactKey aOther)
  {
    int ret = m_aBusinessSpecification.getDisplayName ().compareTo (aOther.m_aBusinessSpecification.getDisplayName ());
    if (ret == 0)
    {
      ret = m_aTransaction.getName ().compareTo (aOther.m_aTransaction.getName ());
      if (ret == 0)
      {
        ret = CompareHelper.compare (getCountryCode (), aOther.getCountryCode ());
        if (ret == 0)
        {
          ret = CompareHelper.compare (m_aSectorKey, m_aSectorKey);
          if (ret == 0)
          {
            ret = CompareHelper.compare (m_sPrerequisiteXPath, aOther.m_sPrerequisiteXPath);
          }
        }
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
    final ValidationArtefactKey rhs = (ValidationArtefactKey) o;
    return m_aBusinessSpecification.equals (rhs.m_aBusinessSpecification) &&
           m_aTransaction.equals (rhs.m_aTransaction) &&
           EqualsHelper.equals (m_aCountry, rhs.m_aCountry) &&
           EqualsHelper.equals (m_aSectorKey, rhs.m_aSectorKey) &&
           EqualsHelper.equals (m_sPrerequisiteXPath, rhs.m_sPrerequisiteXPath);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aBusinessSpecification)
                                       .append (m_aTransaction)
                                       .append (m_aCountry)
                                       .append (m_aSectorKey)
                                       .append (m_sPrerequisiteXPath)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("BusinessSpecification", m_aBusinessSpecification)
                                       .append ("Transaction", m_aTransaction)
                                       .appendIfNotNull ("Country", m_aCountry)
                                       .appendIfNotNull ("SectorKey", m_aSectorKey)
                                       .appendIfNotNull ("PrerequisiteXPath", m_sPrerequisiteXPath)
                                       .toString ();
  }

  /**
   * Builder class for {@link ValidationArtefactKey} objects.
   * {@link #setBusinessSpecification(IBusinessSpecification)} and
   * {@link #setTransaction(ISpecificationTransaction)} must be filled, as these
   * are the mandatory fields.
   *
   * @author Philip Helger
   */
  @NotThreadSafe
  public static class Builder
  {
    private IBusinessSpecification m_aBusinessSpecification;
    private ISpecificationTransaction m_aTransaction;
    private String m_sCountry;
    private ValidationArtefactSectorKey m_aSectorKey;
    private String m_sPrerequisiteXPath;

    /**
     * Create an empty Builder.
     */
    public Builder ()
    {}

    /**
     * Create a builder with the values of the provided validation artefact key.
     *
     * @param aOther
     *        Object to copy from. May not be <code>null</code>.
     */
    public Builder (@Nonnull final ValidationArtefactKey aOther)
    {
      m_aBusinessSpecification = aOther.m_aBusinessSpecification;
      m_aTransaction = aOther.m_aTransaction;
      m_sCountry = aOther.getCountryCode ();
      m_aSectorKey = aOther.m_aSectorKey;
      m_sPrerequisiteXPath = aOther.m_sPrerequisiteXPath;
    }

    /**
     * @param aBusinessSpecification
     *        The business specification to be used. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setBusinessSpecification (@Nullable final IBusinessSpecification aBusinessSpecification)
    {
      m_aBusinessSpecification = aBusinessSpecification;
      return this;
    }

    /**
     * @param aTransaction
     *        The transaction to be used. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setTransaction (@Nullable final ISpecificationTransaction aTransaction)
    {
      m_aTransaction = aTransaction;
      return this;
    }

    /**
     * @param sCountry
     *        The country code to be used. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setCountry (@Nullable final String sCountry)
    {
      m_sCountry = sCountry;
      return this;
    }

    /**
     * @param aSectorKey
     *        The sector specific validation key. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setSectorKey (@Nullable final ValidationArtefactSectorKey aSectorKey)
    {
      m_aSectorKey = aSectorKey;
      return this;
    }

    /**
     * @param sPrerequisiteXPath
     *        The optional prerequisite XPath that must be fullfilled to perform
     *        the validation. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setPrerequisiteXPath (@Nullable final String sPrerequisiteXPath)
    {
      m_sPrerequisiteXPath = sPrerequisiteXPath;
      return this;
    }

    /**
     * Build the validation artefact key from the specified fields. At least
     * business specification and transaction MUST not be <code>null</code>!
     * This method can be called many times and will return a new object every
     * time.
     *
     * @return The final validation key. Never <code>null</code>.
     * @throws IllegalStateException
     *         If a mandatory field is not filled.
     */
    @Nonnull
    public ValidationArtefactKey build ()
    {
      if (m_aBusinessSpecification == null)
        throw new IllegalStateException ("The Business specification must be provided");
      if (m_aTransaction == null)
        throw new IllegalStateException ("The Transaction must be provided");
      return new ValidationArtefactKey (m_aBusinessSpecification,
                                        m_aTransaction,
                                        m_sCountry,
                                        m_aSectorKey,
                                        m_sPrerequisiteXPath);
    }
  }
}
