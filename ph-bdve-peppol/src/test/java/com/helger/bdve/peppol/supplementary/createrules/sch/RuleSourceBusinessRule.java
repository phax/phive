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
package com.helger.bdve.peppol.supplementary.createrules.sch;

import java.io.File;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.bdve.peppol.EBII2Transaction;
import com.helger.bdve.peppol.supplementary.createrules.ESyntaxBinding;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.file.FileOperations;

public final class RuleSourceBusinessRule
{
  private final File m_aSourceFile;
  private final File m_aOutputDirectory;
  private final String m_sID;
  private final EBII2Transaction m_eCodeListTransaction;
  private final ICommonsList <File> m_aResultSCHFiles = new CommonsArrayList<> ();

  public RuleSourceBusinessRule (@Nonnull final File aSourceFilename,
                                 @Nonnull final File aOutputDirectory,
                                 @Nonnull @Nonempty final String sID,
                                 @Nullable final EBII2Transaction eCodeListTransaction)
  {
    ValueEnforcer.notNull (aSourceFilename, "SourceFilename");
    ValueEnforcer.isTrue (aSourceFilename.isFile (), "Source file does not exist: " + aSourceFilename);
    ValueEnforcer.notNull (aOutputDirectory, "OutputDirectory");
    FileOperations.createDirIfNotExisting (aOutputDirectory);
    FileOperations.createDirIfNotExisting (new File (aOutputDirectory, "include"));
    ValueEnforcer.notEmpty (sID, "ID");

    m_aSourceFile = aSourceFilename;
    m_aOutputDirectory = aOutputDirectory;
    m_sID = sID;
    m_eCodeListTransaction = eCodeListTransaction;
  }

  @Nonnull
  public File getSourceFile ()
  {
    return m_aSourceFile;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  public File getSchematronAbstractFile (@Nonnull @Nonempty final String sTransaction)
  {
    return new File (m_aOutputDirectory, "include/" + m_sID + "-" + sTransaction + "-abstract.sch");
  }

  @Nonnull
  public File getSchematronBindingFile (@Nonnull final ESyntaxBinding eBinding,
                                        @Nonnull @Nonempty final String sTransaction)
  {
    return new File (m_aOutputDirectory,
                     "include/" + m_sID + "-" + eBinding.getID () + "-" + sTransaction + "-test.sch");
  }

  @Nonnull
  public File getSchematronCodeListFile (@Nonnull final ESyntaxBinding eBinding)
  {
    return new File (m_aOutputDirectory,
                     "include/" + m_sID + "-" + eBinding.getID () + "-" + m_eCodeListTransaction + "-codes.sch");
  }

  @Nonnull
  public File getSchematronAssemblyFile (@Nonnull final ESyntaxBinding eBinding,
                                         @Nonnull @Nonempty final String sTransaction)
  {
    return new File (m_aOutputDirectory, m_sID + "-" + eBinding.getID () + "-" + sTransaction + ".sch");
  }

  public boolean hasCodeList ()
  {
    return m_eCodeListTransaction != null;
  }

  @Nullable
  public EBII2Transaction getCodeList ()
  {
    return m_eCodeListTransaction;
  }

  public void addResultSchematronFile (@Nonnull final File aSCHFile)
  {
    m_aResultSCHFiles.add (aSCHFile);
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <File> getAllResultSchematronFiles ()
  {
    return m_aResultSCHFiles.getClone ();
  }
}
