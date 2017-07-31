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
import javax.annotation.concurrent.ThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * A registry for {@link IBusinessSpecification} objects. The default instance
 * can be accessed via {@link #INSTANCE}.
 *
 * @author Philip Helger
 */
@ThreadSafe
public class BusinessSpecificationRegistry implements Serializable
{
  public static final BusinessSpecificationRegistry INSTANCE = new BusinessSpecificationRegistry ();

  protected final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  protected final ICommonsMap <String, IBusinessSpecification> m_aMap = new CommonsHashMap <> ();

  public BusinessSpecificationRegistry ()
  {}

  /**
   * Register a business specification into this registry.
   *
   * @param aBusinessSpec
   *        The object to register. MAy not be <code>null</code>.
   * @return The passed parameter
   * @throws IllegalStateException
   *         If another object with the same ID is already registered in this
   *         registry.
   * @param <T>
   *        The {@link IBusinessSpecification} implementation that is added and
   *        returned.
   */
  @Nonnull
  public <T extends IBusinessSpecification> T registerBusinessSpecification (@Nonnull final T aBusinessSpec) throws IllegalStateException
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

  /**
   * @return A list of all contained business specifications in this registry.
   *         Never <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IBusinessSpecification> getAll ()
  {
    return m_aRWLock.readLocked ( () -> m_aMap.copyOfValues ());
  }

  /**
   * Final all business specifications that match the provided filter.
   *
   * @param aFilter
   *        The filter to be used. May be <code>null</code> in which case the
   *        result is the same as {@link #getAll()}.
   * @return Never <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IBusinessSpecification> findAll (@Nonnull final Predicate <? super IBusinessSpecification> aFilter)
  {
    return m_aRWLock.readLocked ( () -> m_aMap.copyOfValues (aFilter));
  }

  /**
   * Find the business specification with the specified ID.
   *
   * @param sID
   *        The ID to search. May be <code>null</code>.
   * @return <code>null</code> if no such business specification is registered.
   */
  @Nullable
  public IBusinessSpecification getOfID (@Nullable final String sID)
  {
    if (StringHelper.hasNoText (sID))
      return null;

    return m_aRWLock.readLocked ( () -> m_aMap.get (sID));
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Map", m_aMap).getToString ();
  }
}
