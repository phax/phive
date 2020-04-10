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
package com.helger.bdve.peppol.supplementary.createrules.sch;

import java.io.File;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.file.FileOperations;
import com.helger.commons.string.StringHelper;

@NotThreadSafe
public final class RuleSourceBusinessRule
{
  private final File m_aSourceFile;
  private final File m_aOutputSchematronDirectory;
  private final File m_aOutputXSLTDirectory;
  private final String m_sID;
  private final String m_sCodeListTransaction;
  private final ICommonsList <SchematronOutput> m_aResultSCHFiles = new CommonsArrayList <> ();

  public RuleSourceBusinessRule (@Nonnull final File aSourceFilename,
                                 @Nonnull final File aOutputSchematronDirectory,
                                 @Nonnull final File aOutputXSLTDirectory,
                                 @Nonnull @Nonempty final String sID,
                                 @Nullable final String sCodeListTransaction)
  {
    ValueEnforcer.notNull (aSourceFilename, "SourceFilename");
    ValueEnforcer.isTrue (aSourceFilename.isFile (), () -> "Source file does not exist: " + aSourceFilename);
    ValueEnforcer.notNull (aOutputSchematronDirectory, "OutputSchematronDirectory");
    ValueEnforcer.notNull (aOutputXSLTDirectory, "OutputXSLTDirectory");
    ValueEnforcer.notEmpty (sID, "ID");

    FileOperations.createDirIfNotExisting (aOutputSchematronDirectory);
    FileOperations.createDirIfNotExisting (new File (aOutputSchematronDirectory, "include"));
    FileOperations.createDirIfNotExisting (aOutputXSLTDirectory);

    m_aSourceFile = aSourceFilename;
    m_aOutputSchematronDirectory = aOutputSchematronDirectory;
    m_aOutputXSLTDirectory = aOutputXSLTDirectory;
    m_sID = sID;
    m_sCodeListTransaction = sCodeListTransaction;
  }

  @Nonnull
  public File getSourceFile ()
  {
    return m_aSourceFile;
  }

  @Nonnull
  public File getOutputXSLTDirectory ()
  {
    return m_aOutputXSLTDirectory;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  public File getSchematronAbstractFile ()
  {
    return new File (m_aOutputSchematronDirectory, "include/" + m_sID + "-abstract.sch");
  }

  @Nonnull
  public File getSchematronBindingFile (@Nonnull @Nonempty final String sBindingName)
  {
    return new File (m_aOutputSchematronDirectory,
                     "include/" + m_sID + "-" + sBindingName.toLowerCase (Locale.US) + "-test.sch");
  }

  @Nonnull
  public File getSchematronCodeListFile ()
  {
    return new File (m_aOutputSchematronDirectory, "include/" + m_sID + "-" + m_sCodeListTransaction + "-codes.sch");
  }

  @Nonnull
  public File getSchematronAssemblyFile (@Nonnull @Nonempty final String sBindingName)
  {
    return new File (m_aOutputSchematronDirectory, m_sID + "-" + sBindingName.toLowerCase (Locale.US) + ".sch");
  }

  public boolean hasCodeList ()
  {
    return StringHelper.hasText (m_sCodeListTransaction);
  }

  public String getCodeList ()
  {
    return m_sCodeListTransaction;
  }

  public void addResultSchematronFile (@Nonnull final File aSCHFile,
                                       @Nonnull @Nonempty final String sBindingPrefix,
                                       @Nonnull @Nonempty final String sNamespaceURI)
  {
    m_aResultSCHFiles.add (new SchematronOutput (aSCHFile, sBindingPrefix, sNamespaceURI));
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <SchematronOutput> getAllResultSchematronFiles ()
  {
    return m_aResultSCHFiles.getClone ();
  }
}
