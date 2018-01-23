/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.spec.EBII2Transaction;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.file.FileOperations;
import com.helger.commons.io.file.FilenameHelper;

public final class RuleSourceGroup
{
  private final File m_aRuleDstDir;
  private final ESyntaxBinding m_eBinding;
  private final EBII2Transaction m_eTransaction;
  private File m_aBIICoreSchematronFile;
  // Status vars
  private final ICommonsList <RuleSourceItem> m_aItems = new CommonsArrayList<> ();

  /**
   * @param aRuleDstDir
   *        Rule destination directory. Must exist.
   * @param eBinding
   *        <code>null</code> if all syntax bindings should be processed, the
   *        chosen syntax otherwise.
   * @param eTransaction
   *        Transaction to use. May not be <code>null</code>.
   */
  public RuleSourceGroup (@Nonnull final File aRuleDstDir,
                          @Nullable final ESyntaxBinding eBinding,
                          @Nonnull final EBII2Transaction eTransaction)
  {
    FileOperations.createDirRecursiveIfNotExisting (aRuleDstDir);
    ValueEnforcer.isTrue (aRuleDstDir.isDirectory (), aRuleDstDir + " is not a directory!");
    m_aRuleDstDir = aRuleDstDir;
    m_eBinding = eBinding;
    m_eTransaction = eTransaction;
  }

  /**
   * Add all default items
   *
   * @param eRuleSource
   *        Rule source to add by default. May be <code>null</code>.
   * @return this
   */
  @Nonnull
  public RuleSourceGroup addDefault (@Nonnull final ERuleSource eRuleSource)
  {
    // Add rule items
    m_aBIICoreSchematronFile = eRuleSource.getBIICoreSchematronFile ();

    if (eRuleSource.usesBIICodeLists () || eRuleSource.hasBIIRules ())
    {
      final RuleSourceItem aItem = addItem ("BIIRULES");
      if (eRuleSource.usesBIICodeLists ())
        aItem.addCodeList (ERuleSource.CODELISTS.getBIIRuleFile ());
      if (eRuleSource.hasBIIRules ())
        aItem.addBussinessRule (eRuleSource.getBIIRuleFile ());
    }

    if (eRuleSource.usesOpenPEPPOLCodeLists () || eRuleSource.hasOpenPEPPOLRules ())
    {
      final RuleSourceItem aItem = addItem ("OPENPEPPOL");
      if (eRuleSource.usesOpenPEPPOLCodeLists ())
        aItem.addCodeList (ERuleSource.CODELISTS.getOpenPEPPOLRuleFile ());
      if (eRuleSource.hasOpenPEPPOLRules ())
        aItem.addBussinessRule (eRuleSource.getOpenPEPPOLRuleFile ());
    }

    return this;
  }

  /**
   * Add all third party rules for this transaction
   *
   * @return this
   */
  @Nonnull
  public RuleSourceGroup addThirdparty ()
  {
    // Add thirdparty rules
    for (final ERuleSourceThirdparty eThirdparty : ERuleSourceThirdparty.getAllForTransaction (m_eTransaction))
      addItem (eThirdparty.getPackageNameUC ()).addBussinessRule (eThirdparty.getRuleFile ());

    return this;
  }

  @Nonnull
  public RuleSourceItem addItem (@Nonnull @Nonempty final String sID)
  {
    final RuleSourceItem aItem = new RuleSourceItem (m_aRuleDstDir, sID, m_eBinding, m_eTransaction);
    m_aItems.add (aItem);
    return aItem;
  }

  @Nonnull
  public File getOutputSchematronDirectory ()
  {
    return m_aRuleDstDir;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <RuleSourceItem> getAllItems ()
  {
    return m_aItems.getClone ();
  }

  @Nullable
  public File getBIICoreSchematronSrcFile ()
  {
    return m_aBIICoreSchematronFile;
  }

  @Nullable
  public File getBIICoreSchematronDstFile ()
  {
    final File f = m_aBIICoreSchematronFile;
    return f == null ? null : new File (m_aRuleDstDir, f.getName ());
  }

  @Nullable
  public File getBIICoreXSLTSrcFile ()
  {
    return m_aBIICoreSchematronFile == null ? null
                                            : new File (FilenameHelper.getWithoutExtension (m_aBIICoreSchematronFile) +
                                                        ".xslt");
  }

  @Nullable
  public File getBIICoreXSLTDstFile ()
  {
    final File f = getBIICoreXSLTSrcFile ();
    return f == null ? null : new File (m_aRuleDstDir, f.getName ());
  }
}
