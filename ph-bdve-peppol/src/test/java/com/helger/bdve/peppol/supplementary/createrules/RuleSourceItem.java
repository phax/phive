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
package com.helger.bdve.peppol.supplementary.createrules;

import java.io.File;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.peppol.supplementary.createrules.codelist.RuleSourceCodeList;
import com.helger.bdve.peppol.supplementary.createrules.sch.RuleSourceBusinessRule;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.id.IHasID;

public final class RuleSourceItem implements IHasID <String>
{
  private final File m_aRuleSrcDir;
  private final File m_aOutputSchematronDir;
  private final File m_aOutputXSLTDir;
  private final String m_sIDLC;
  private final ICommonsList <RuleSourceCodeList> m_aCodeLists = new CommonsArrayList <> ();
  private final ICommonsList <RuleSourceBusinessRule> m_aBusinessRules = new CommonsArrayList <> ();

  public RuleSourceItem (@Nonnull final File aRuleSrcDir,
                         @Nonnull final File aOutputSchematronDir,
                         @Nonnull final File aXSLTOutputDir,
                         @Nonnull @Nonempty final String sID)
  {
    ValueEnforcer.notNull (aRuleSrcDir, "RuleSrcDir");
    ValueEnforcer.isTrue (aRuleSrcDir.isDirectory (), () -> aRuleSrcDir + " is not a directory!");
    ValueEnforcer.notNull (aOutputSchematronDir, "OutputSchematronDir");
    // Not existing or a directory
    ValueEnforcer.isFalse (aOutputSchematronDir.isFile (), () -> aOutputSchematronDir + " is not a directory!");
    ValueEnforcer.notNull (aXSLTOutputDir, "XSLTOutputDir");
    // Not existing or a directory
    ValueEnforcer.isFalse (aXSLTOutputDir.isFile (), () -> aXSLTOutputDir + " is not a directory!");
    ValueEnforcer.notEmpty (sID, "ID");

    m_aRuleSrcDir = new File (aRuleSrcDir, sID);
    m_aOutputSchematronDir = new File (aOutputSchematronDir, sID);
    m_aOutputXSLTDir = new File (aXSLTOutputDir, sID);
    m_sIDLC = sID.toLowerCase (Locale.US);
  }

  @Nonnull
  public File getOutputCodeListDirectory ()
  {
    return new File (m_aOutputSchematronDir, "codelist");
  }

  @Nonnull
  public File getOutputSchematronDirectory ()
  {
    return m_aOutputSchematronDir;
  }

  @Nonnull
  public File getOutputXSLTDirectory ()
  {
    return m_aOutputXSLTDir;
  }

  @Nonnull
  public RuleSourceItem addCodeList (@Nonnull @Nonempty final String sSourceFilename)
  {
    m_aCodeLists.add (new RuleSourceCodeList (new File (m_aRuleSrcDir, sSourceFilename),
                                              getOutputCodeListDirectory (),
                                              m_aOutputSchematronDir,
                                              m_sIDLC));
    return this;
  }

  @Nonnull
  public RuleSourceItem addBussinessRule (@Nonnull @Nonempty final String sSourceFilename)
  {
    return addBussinessRule (sSourceFilename, null);
  }

  @Nonnull
  public RuleSourceItem addBussinessRule (@Nonnull @Nonempty final String sSourceFilename,
                                          @Nullable final String sCodeListTransaction)
  {
    m_aBusinessRules.add (new RuleSourceBusinessRule (new File (m_aRuleSrcDir, sSourceFilename),
                                                      m_aOutputSchematronDir,
                                                      m_aOutputXSLTDir,
                                                      m_sIDLC,
                                                      sCodeListTransaction));
    return this;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sIDLC;
  }

  @Nonnull
  public ICommonsList <RuleSourceCodeList> getAllCodeLists ()
  {
    return m_aCodeLists.getClone ();
  }

  @Nonnull
  public ICommonsList <RuleSourceBusinessRule> getAllBusinessRules ()
  {
    return m_aBusinessRules.getClone ();
  }
}
