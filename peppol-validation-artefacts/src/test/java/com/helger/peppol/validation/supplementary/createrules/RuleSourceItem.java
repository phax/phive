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
package com.helger.peppol.validation.supplementary.createrules;

import java.io.File;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.id.IHasID;
import com.helger.peppol.validation.api.peppol.EBII2Transaction;
import com.helger.peppol.validation.supplementary.createrules.codelist.RuleSourceCodeList;
import com.helger.peppol.validation.supplementary.createrules.sch.RuleSourceBusinessRule;

public final class RuleSourceItem implements IHasID <String>
{
  private final File m_aRuleDstDir;
  private final String m_sID;
  private final ESyntaxBinding m_eBinding;
  private final EBII2Transaction m_eTransaction;
  // status vars
  private final ICommonsList <RuleSourceCodeList> m_aCodeLists = new CommonsArrayList<> ();
  private final ICommonsList <RuleSourceBusinessRule> m_aBusinessRules = new CommonsArrayList<> ();
  private boolean m_bHasCodeList = false;

  /**
   * @param aRuleDstDir
   *        Rule destination directory. Must exist.
   * @param sID
   *        Artefact ID
   * @param eBinding
   *        <code>null</code> if all syntax bindings should be processed, the
   *        chosen syntax otherwise.
   * @param eTransaction
   *        Transaction to use. May not be <code>null</code>.
   */
  public RuleSourceItem (@Nonnull final File aRuleDstDir,
                         @Nonnull @Nonempty final String sID,
                         @Nullable final ESyntaxBinding eBinding,
                         @Nonnull final EBII2Transaction eTransaction)
  {
    ValueEnforcer.isTrue (aRuleDstDir.isDirectory (), aRuleDstDir + " is not a directory!");
    m_aRuleDstDir = aRuleDstDir;
    m_sID = sID.toUpperCase (Locale.US);
    m_eBinding = eBinding;
    m_eTransaction = eTransaction;
  }

  @Nonnull
  public File getOutputSchematronDirectory ()
  {
    return m_aRuleDstDir;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  public RuleSourceItem addCodeList (@Nonnull final File aSourceFile)
  {
    m_aCodeLists.add (new RuleSourceCodeList (aSourceFile,
                                              getOutputSchematronDirectory (),
                                              m_sID,
                                              m_eBinding,
                                              m_eTransaction));
    m_bHasCodeList = true;
    return this;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <RuleSourceCodeList> getAllCodeLists ()
  {
    return m_aCodeLists.getClone ();
  }

  @Nonnull
  public RuleSourceItem addBussinessRule (@Nonnull final File aSourceFile)
  {
    m_aBusinessRules.add (new RuleSourceBusinessRule (aSourceFile,
                                                      getOutputSchematronDirectory (),
                                                      m_sID,
                                                      m_bHasCodeList ? m_eTransaction : null));
    return this;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <RuleSourceBusinessRule> getAllBusinessRules ()
  {
    return m_aBusinessRules.getClone ();
  }

  @Nullable
  public ESyntaxBinding getRequestedSyntaxBinding ()
  {
    return m_eBinding;
  }

  public boolean matchesRequestedSyntaxBinding (@Nonnull final ESyntaxBinding eBinding)
  {
    // If none is specified, accept all
    return m_eBinding == null || eBinding.equals (m_eBinding);
  }
}
