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
package com.helger.bdve.spec;

import java.io.Serializable;
import java.util.function.Predicate;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsHashMap;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.collection.ext.ICommonsMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.string.StringHelper;

/**
 * A registry for {@link IBusinessSpecification} objects. The default instance
 * can be accessed via {@link #INSTANCE}.
 *
 * @author Philip Helger
 */
public class BusinessSpecificationRegistry implements Serializable
{
  public static final BusinessSpecificationRegistry INSTANCE = new BusinessSpecificationRegistry ();

  protected final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  protected final ICommonsMap <String, IBusinessSpecification> m_aMap = new CommonsHashMap<> ();

  protected BusinessSpecificationRegistry ()
  {}

  @Nonnull
  public <T extends IBusinessSpecification> T registerBusinessSpecification (@Nonnull final T aBusinessSpec)
  {
    ValueEnforcer.notNull (aBusinessSpec, "BusinessSpec");

    final String sKey = aBusinessSpec.getID ();
    m_aRWLock.writeLocked ( () -> {
      if (m_aMap.containsKey (sKey))
        throw new IllegalStateException ("Another business specification with the ID '" +
                                         sKey +
                                         "' is already registered!");
      m_aMap.put (sKey, aBusinessSpec);
    });
    return aBusinessSpec;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IBusinessSpecification> getAll ()
  {
    return m_aRWLock.readLocked ( () -> m_aMap.copyOfValues ());
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IBusinessSpecification> findAll (@Nonnull final Predicate <? super IBusinessSpecification> aFilter)
  {
    return m_aRWLock.readLocked ( () -> m_aMap.copyOfValues (aFilter));
  }

  @Nullable
  public IBusinessSpecification getOfID (@Nullable final String sID)
  {
    if (StringHelper.hasNoText (sID))
      return null;

    return m_aRWLock.readLocked ( () -> m_aMap.get (sID));
  }
}
