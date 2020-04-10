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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;

@Immutable
final class SchematronOutput
{
  private final File m_aSchematronFile;
  private final String m_sPrefix;
  private final String m_sNamespaceURI;

  public SchematronOutput (@Nonnull final File aSchematronFile,
                           @Nonnull @Nonempty final String sPrefix,
                           @Nonnull @Nonempty final String sNamespaceURI)
  {
    ValueEnforcer.notNull (aSchematronFile, "SchematronFile");
    ValueEnforcer.notEmpty (sPrefix, "Prefix");
    ValueEnforcer.notEmpty (sNamespaceURI, "NamespaceURI");

    m_aSchematronFile = aSchematronFile;
    m_sPrefix = sPrefix;
    m_sNamespaceURI = sNamespaceURI;
  }

  @Nonnull
  public File getSchematronFile ()
  {
    return m_aSchematronFile;
  }

  @Nonnull
  @Nonempty
  public String getPrefix ()
  {
    return m_sPrefix;
  }

  @Nonnull
  @Nonempty
  public String getNamespaceURI ()
  {
    return m_sNamespaceURI;
  }
}
