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
package com.helger.bdve.peppol.supplementary.createrules;

import java.io.File;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.peppol.EBII2Transaction;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.string.StringHelper;

/**
 * Don't alter the codes of this enum manually. They are automatically created
 * by {@link Main2CreateRuleSourceEnum}.
 *
 * @author Philip Helger
 */
public enum ERuleSourceThirdparty
{
  ATGOV_T10 ("atgov",
             EBII2Transaction.T10,
             "v07",
             "(/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT')"),
  ATGOV_T14 ("atgov",
             EBII2Transaction.T14,
             "v07",
             "(/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT')"),
  ATNAT_T10 ("atnat",
             EBII2Transaction.T10,
             "v05",
             "(/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT')"),
  ATNAT_T14 ("atnat",
             EBII2Transaction.T14,
             "v05",
             "(/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT')");

  private final String m_sPackageName;
  private final EBII2Transaction m_eTransaction;
  private final String m_sVersion;
  private String m_sGlobalPrerequisite;

  private ERuleSourceThirdparty (@Nonnull @Nonempty final String sPackageName,
                                 @Nonnull final EBII2Transaction eTransaction,
                                 @Nonnull @Nonempty final String sVersion,
                                 @Nonnull final String sGlobalPrerequisite)
  {
    m_sPackageName = sPackageName;
    m_eTransaction = eTransaction;
    m_sVersion = sVersion;
    m_sGlobalPrerequisite = sGlobalPrerequisite;
  }

  @Nonnull
  @Nonempty
  public String getPackageNameUC ()
  {
    return m_sPackageName.toUpperCase (Locale.US);
  }

  @Nonnull
  public EBII2Transaction getTransaction ()
  {
    return m_eTransaction;
  }

  @Nonnull
  public File getRuleFile ()
  {
    return new File ("src/test/resources/rule-source/thirdparty/" +
                     m_sPackageName +
                     "/" +
                     m_sPackageName +
                     "-" +
                     m_eTransaction.getTransactionKeyShort () +
                     "-BusinessRules-" +
                     m_sVersion +
                     ".ods");
  }

  @Nonnull
  public String getGlobalPrerequisite ()
  {
    return m_sGlobalPrerequisite;
  }

  public boolean hasGlobalPrerequisite ()
  {
    return StringHelper.hasText (m_sGlobalPrerequisite);
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <ERuleSourceThirdparty> getAllForTransaction (@Nullable final EBII2Transaction eTransaction)
  {
    final ICommonsList <ERuleSourceThirdparty> ret = new CommonsArrayList<> ();
    if (eTransaction != null)
      for (final ERuleSourceThirdparty e : values ())
        if (e.getTransaction ().equals (eTransaction))
          ret.add (e);
    return ret;
  }
}
