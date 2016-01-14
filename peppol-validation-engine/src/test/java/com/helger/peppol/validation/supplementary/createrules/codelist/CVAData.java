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

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;

@NotThreadSafe
public final class CVAData
{
  private final String m_sTransaction;
  private final List <CVAContextData> m_aContexts = new ArrayList <CVAContextData> ();

  public CVAData (@Nonnull @Nonempty final String sTransaction)
  {
    ValueEnforcer.notEmpty (sTransaction, "Transaction");
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
  public List <CVAContextData> getAllContexts ()
  {
    return CollectionHelper.newList (m_aContexts);
  }

  @Nonnull
  @ReturnsMutableCopy
  public Set <String> getAllUsedCodeListNames ()
  {
    final Set <String> ret = new TreeSet <String> ();
    for (final CVAContextData aContextData : m_aContexts)
      ret.add (aContextData.getCodeListName ());
    return ret;
  }
}
