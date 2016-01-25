/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.supplementary.createrules.codelist;

import java.io.File;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.io.file.FileOperations;
import com.helger.peppol.validation.api.peppol.EBII2Transaction;
import com.helger.peppol.validation.supplementary.createrules.ESyntaxBinding;

public final class RuleSourceCodeList
{
  private final File m_aSourceFile;
  private final File m_aSchematronOutputDirectory;
  private final String m_sID;
  private final ESyntaxBinding m_eBinding;
  private final EBII2Transaction m_eTransaction;

  public RuleSourceCodeList (@Nonnull final File aSourceFilename,
                             @Nonnull final File aSchematronOutputDirectory,
                             @Nonnull @Nonempty final String sID,
                             @Nonnull final ESyntaxBinding eBinding,
                             @Nonnull final EBII2Transaction eTransaction)
  {
    ValueEnforcer.isTrue (aSourceFilename.isFile (), "Source file does not exist: " + aSourceFilename);
    ValueEnforcer.notNull (eTransaction, "Transaction");
    FileOperations.createDirIfNotExisting (aSchematronOutputDirectory);
    m_aSourceFile = aSourceFilename;
    m_aSchematronOutputDirectory = aSchematronOutputDirectory;
    m_sID = sID;
    m_eBinding = eBinding;
    m_eTransaction = eTransaction;
  }

  @Nonnull
  public File getSourceFile ()
  {
    return m_aSourceFile;
  }

  @Nonnull
  public File getSchematronFile ()
  {
    return new File (m_aSchematronOutputDirectory,
                     "include/" + m_sID + "-" + m_eBinding.getID () + "-" + getTransactionKey () + "-codes.sch");
  }

  @Nonnull
  @Nonempty
  public String getTransactionKey ()
  {
    return m_eTransaction.getTransactionKeyShort ();
  }
}
