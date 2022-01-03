/*
 * Copyright (C) 2014-2022 Philip Helger (www.helger.com)
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
package com.helger.phive.api.executorset;

import java.util.function.Predicate;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ELockType;
import com.helger.commons.annotation.MustBeLocked;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.state.EChange;
import com.helger.commons.string.ToStringGenerator;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.source.IValidationSource;

/**
 * A registry for {@link IValidationExecutorSet} objects. This class is
 * thread-safe and can therefore be used as a singleton.<br>
 * Initially all validation artefact providers need to register themselves via
 * {@link #registerValidationExecutorSet(IValidationExecutorSet)}. This needs to
 * be done only once upon initialization before usage.<br>
 * For applying validation of rules onto an XML document,
 * {@link #getOfID(VESID)} needs to be invoked to find a matching VES
 * (Validation Executor Set - type `IValidationExecutorSet`). If the returned
 * value is non-<code>null</code> than some rules are registered.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
@ThreadSafe
public class ValidationExecutorSetRegistry <SOURCETYPE extends IValidationSource> implements IValidationExecutorSetRegistry <SOURCETYPE>
{
  private static final Logger LOGGER = LoggerFactory.getLogger (ValidationExecutorSetRegistry.class);

  protected final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  private final ICommonsMap <VESID, IValidationExecutorSet <SOURCETYPE>> m_aMap = new CommonsHashMap <> ();

  public ValidationExecutorSetRegistry ()
  {}

  /**
   * @return the internal map. Never <code>null</code>. Must be locked properly.
   */
  @Nonnull
  @MustBeLocked (ELockType.DEPENDS)
  protected final ICommonsMap <VESID, IValidationExecutorSet <SOURCETYPE>> internalMap ()
  {
    return m_aMap;
  }

  public void registerValidationExecutorSet (@Nonnull final IValidationExecutorSet <SOURCETYPE> aVES)
  {
    ValueEnforcer.notNull (aVES, "VES");

    final VESID aKey = aVES.getID ();
    m_aRWLock.writeLocked ( () -> {
      if (m_aMap.containsKey (aKey))
        throw new IllegalStateException ("Another validation executor set with the ID '" +
                                         aKey.getAsSingleID () +
                                         "' is already registered!");
      m_aMap.put (aKey, aVES);
    });

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Registered validation executor set '" +
                    aKey.getAsSingleID () +
                    "' of type " +
                    aVES.getClass ().getName () +
                    " with " +
                    aVES.getCount () +
                    " elements");
  }

  @Nonnull
  public EChange unregisterValidationExecutorSet (@Nullable final VESID aVESID)
  {
    if (aVESID == null)
      return EChange.UNCHANGED;

    final EChange ret = m_aRWLock.writeLockedGet ( () -> m_aMap.removeObject (aVESID));
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ((ret.isChanged () ? "Successfully unregistered" : "Failed to unregister") +
                    " validation executor set '" +
                    aVESID.getAsSingleID () +
                    "'");
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutorSet <SOURCETYPE>> getAll ()
  {
    return m_aRWLock.readLockedGet (m_aMap::copyOfValues);
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutorSet <SOURCETYPE>> findAll (@Nonnull final Predicate <? super IValidationExecutorSet <SOURCETYPE>> aFilter)
  {
    return m_aRWLock.readLockedGet ( () -> m_aMap.copyOfValues (aFilter));
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> findFirst (@Nonnull final Predicate <? super IValidationExecutorSet <SOURCETYPE>> aFilter)
  {
    return m_aRWLock.readLockedGet ( () -> m_aMap.findFirstValue (e -> aFilter.test (e.getValue ())));
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getOfID (@Nullable final VESID aID)
  {
    if (aID == null)
      return null;

    return m_aRWLock.readLockedGet ( () -> m_aMap.get (aID));
  }

  /**
   * This is a cleanup method that frees all resources when they are no longer
   * needed. This may be helpful because some {@link IValidationExecutor}
   * implementations contained in the {@link IValidationExecutorSet} contained
   * in this registry might have strong references to {@link ClassLoader}
   * instances. By calling this method, you can clear the contained map and
   * invoke {@link ValidationExecutorSet#removeAllExecutors()} if applicable.
   *
   * @return {@link EChange}
   * @see #removeAll(boolean)
   */
  @Nonnull
  public EChange removeAll ()
  {
    return removeAll (true);
  }

  /**
   * This is a cleanup method that frees all resources when they are no longer
   * needed. This removes all registered validators.
   *
   * @param bCleanVES
   *        This may be helpful because some {@link IValidationExecutor}
   *        implementations contained in the {@link IValidationExecutorSet}
   *        contained in this registry might have strong references to
   *        {@link ClassLoader} instances. By passing <code>true</code>,
   *        {@link ValidationExecutorSet#removeAllExecutors()} is invoked on all
   *        matching validation executor sets.
   * @return {@link EChange}
   * @since 6.0.1
   */
  @Nonnull
  public EChange removeAll (final boolean bCleanVES)
  {
    EChange ret = EChange.UNCHANGED;
    m_aRWLock.writeLock ().lock ();
    try
    {
      if (m_aMap.isNotEmpty ())
      {
        ret = EChange.CHANGED;
        if (bCleanVES)
          for (final IValidationExecutorSet <?> aVES : m_aMap.values ())
            if (aVES instanceof ValidationExecutorSet)
              ((ValidationExecutorSet <?>) aVES).removeAllExecutors ();
        m_aMap.clear ();
      }
    }
    finally
    {
      m_aRWLock.writeLock ().unlock ();
    }
    if (ret.isChanged ())
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Successfully removed all validatione executor sets" + (bCleanVES ? " and cleaned all VES." : "."));
    return ret;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Map", m_aMap).getToString ();
  }
}
