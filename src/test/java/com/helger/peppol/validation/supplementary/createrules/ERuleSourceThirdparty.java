package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.peppol.validation.domain.peppol.EBII2Transaction;

/**
 * Don't alter the codes of this enum manually. They are automatically created
 * by {@link Main2CreateRuleSourceEnum}.
 *
 * @author Philip Helger
 */
public enum ERuleSourceThirdparty
{
 ATGOV_T10 ("atgov", EBII2Transaction.T10, "v05"),
 ATGOV_T14 ("atgov", EBII2Transaction.T14, "v05"),
 ATNAT_T10 ("atnat", EBII2Transaction.T10, "v05"),
 ATNAT_T14 ("atnat", EBII2Transaction.T14, "v05");

  private final String m_sPackageName;
  private final EBII2Transaction m_eTransaction;
  private final String m_sVersion;

  private ERuleSourceThirdparty (@Nonnull @Nonempty final String sPackageName,
                                 @Nonnull final EBII2Transaction eTransaction,
                                 @Nonnull @Nonempty final String sVersion)
  {
    m_sPackageName = sPackageName;
    m_eTransaction = eTransaction;
    m_sVersion = sVersion;
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
  @ReturnsMutableCopy
  public static List <ERuleSourceThirdparty> getAllForTransaction (@Nullable final EBII2Transaction eTransaction)
  {
    final List <ERuleSourceThirdparty> ret = new ArrayList <ERuleSourceThirdparty> ();
    if (eTransaction != null)
      for (final ERuleSourceThirdparty e : values ())
        if (e.getTransaction ().equals (eTransaction))
          ret.add (e);
    return ret;
  }
}
