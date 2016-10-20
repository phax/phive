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
package com.helger.bdve.spec;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsLinkedHashSet;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.collection.ext.ICommonsOrderedSet;
import com.helger.commons.string.ToStringGenerator;
import com.helger.commons.text.display.IHasDisplayText;

/**
 * Standalone implementation of {@link ISpecificationProfile}.
 *
 * @author Philip Helger
 */
@Immutable
public class SpecificationProfile implements ISpecificationProfile
{
  private final String m_sID;
  private final IHasDisplayText m_aName;
  private final ICommonsOrderedSet <ISpecificationTransaction> m_aTransactions;

  public SpecificationProfile (@Nonnull @Nonempty final String sID,
                               @Nonnull final IHasDisplayText aName,
                               @Nonnull @Nonempty final ISpecificationTransaction... aTransactions)
  {
    m_sID = ValueEnforcer.notEmpty (sID, "ID");
    m_aName = ValueEnforcer.notNull (aName, "Name");
    ValueEnforcer.notEmptyNoNullValue (aTransactions, "Transactions");
    m_aTransactions = new CommonsLinkedHashSet<> (aTransactions);
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nullable
  public String getDisplayText (@Nonnull final Locale aContentLocale)
  {
    return m_aName.getDisplayText (aContentLocale);
  }

  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  public ICommonsList <ISpecificationTransaction> getAllTransactions ()
  {
    return m_aTransactions.getCopyAsList ();
  }

  public boolean containsTransaction (@Nullable final ISpecificationTransaction aTransaction)
  {
    return m_aTransactions.contains (aTransaction);
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ID", m_sID)
                                       .append ("Name", m_aName)
                                       .append ("Transactions", m_aTransactions)
                                       .toString ();
  }
}
