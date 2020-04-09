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
package com.helger.bdve.peppol.supplementary.createrules.codelist;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.string.StringHelper;

@Immutable
final class CVAContextData
{
  private final String m_sID;
  private final String m_sItem;
  private final String m_sCodeListName;
  private final String m_sSeverity;
  private final String m_sMessage;

  public CVAContextData (@Nonnull @Nonempty final String sID,
                         @Nonnull @Nonempty final String sItem,
                         @Nonnull @Nonempty final String sCodeListName,
                         @Nonnull @Nonempty final String sSeverity,
                         @Nonnull @Nonempty final String sMessage)
  {
    if (StringHelper.hasNoText (sID))
      throw new IllegalArgumentException ("ID");
    if (StringHelper.hasNoText (sItem))
      throw new IllegalArgumentException ("item");
    if (StringHelper.hasNoText (sCodeListName))
      throw new IllegalArgumentException ("codeListName");
    if (StringHelper.hasNoText (sSeverity))
      throw new IllegalArgumentException ("severity");
    if (StringHelper.hasNoText (sMessage))
      throw new IllegalArgumentException ("message");
    m_sID = sID;
    m_sItem = sItem;
    m_sCodeListName = sCodeListName;
    m_sSeverity = sSeverity;
    m_sMessage = sMessage;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  @Nonempty
  public String getItem ()
  {
    return m_sItem;
  }

  @Nonnull
  @Nonempty
  public String getCodeListName ()
  {
    return m_sCodeListName;
  }

  @Nonnull
  @Nonempty
  public String getSeverity ()
  {
    return m_sSeverity;
  }

  @Nonnull
  @Nonempty
  public String getMessage ()
  {
    return m_sMessage;
  }
}
