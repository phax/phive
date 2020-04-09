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
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.CommonsTreeSet;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsSet;
import com.helger.commons.string.StringHelper;

@NotThreadSafe
final class CVAData
{
  private final String m_sTransaction;
  private final ICommonsList <CVAContextData> m_aContexts = new CommonsArrayList <> ();

  public CVAData (@Nonnull @Nonempty final String sTransaction)
  {
    if (StringHelper.hasNoText (sTransaction))
      throw new IllegalArgumentException ("transaction");
    m_sTransaction = sTransaction;
  }

  public void addContext (@Nonnull @Nonempty final String sID,
                          @Nonnull @Nonempty final String sItem,
                          @Nonnull @Nonempty final String sCodeListName,
                          @Nonnull @Nonempty final String sSeverity,
                          @Nonnull @Nonempty final String sMessage)
  {
    m_aContexts.add (new CVAContextData (sID, sItem, sCodeListName, sSeverity, sMessage));
  }

  @Nonnull
  @Nonempty
  public String getTransaction ()
  {
    return m_sTransaction;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <CVAContextData> getAllContexts ()
  {
    return m_aContexts.getClone ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsSet <String> getAllUsedCodeListNames ()
  {
    final ICommonsSet <String> ret = new CommonsTreeSet <> ();
    for (final CVAContextData aContextData : m_aContexts)
      ret.add (aContextData.getCodeListName ());
    return ret;
  }
}
