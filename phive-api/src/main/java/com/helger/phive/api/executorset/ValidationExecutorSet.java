/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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

import java.util.Collection;
import java.util.Iterator;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonempty;
import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.annotation.style.ReturnsMutableObject;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.hashcode.HashCodeGenerator;
import com.helger.base.state.EChange;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.ICommonsList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.execute.IValidationExecutorCacheSupport;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;

/**
 * Default implementation of {@link IValidationExecutorSet}.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
@NotThreadSafe
public class ValidationExecutorSet <SOURCETYPE extends IValidationSource> implements
                                   IValidationExecutorSetMutable <SOURCETYPE>
{
  private final DVRCoordinate m_aVESID;
  private final String m_sDisplayName;
  private final ICommonsList <IValidationExecutor <SOURCETYPE>> m_aList = new CommonsArrayList <> ();
  private final IValidationExecutorSetStatus m_aStatus;

  public ValidationExecutorSet (@NonNull final DVRCoordinate aVESID,
                                @NonNull @Nonempty final String sDisplayName,
                                @NonNull final IValidationExecutorSetStatus aStatus)
  {
    ValueEnforcer.notNull (aVESID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aStatus, "Status");
    m_aVESID = aVESID;
    m_sDisplayName = sDisplayName;
    m_aStatus = aStatus;
  }

  @NonNull
  public final DVRCoordinate getID ()
  {
    return m_aVESID;
  }

  @NonNull
  @Nonempty
  public final String getDisplayName ()
  {
    return m_sDisplayName;
  }

  @NonNull
  public final Iterator <IValidationExecutor <SOURCETYPE>> iterator ()
  {
    return m_aList.iterator ();
  }

  @NonNull
  @ReturnsMutableObject
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> executors ()
  {
    return m_aList;
  }

  @NonNull
  @ReturnsMutableCopy
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> getAllExecutors ()
  {
    return m_aList.getClone ();
  }

  @NonNull
  public final IValidationExecutorSetStatus getStatus ()
  {
    return m_aStatus;
  }

  @NonNull
  public ValidationExecutorSet <SOURCETYPE> addExecutor (@NonNull final IValidationExecutor <SOURCETYPE> aExecutor)
  {
    ValueEnforcer.notNull (aExecutor, "Executor");
    m_aList.add (aExecutor);
    return this;
  }

  public void setValidationExecutorDoCache (final boolean bCache)
  {
    for (final IValidationExecutor <SOURCETYPE> aExecutor : m_aList)
      if (aExecutor instanceof IValidationExecutorCacheSupport)
        ((IValidationExecutorCacheSupport) aExecutor).setCacheArtefact (bCache);
  }

  @NonNull
  public EChange removeAllExecutors ()
  {
    return m_aList.removeAll ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationExecutorSet <?> rhs = (ValidationExecutorSet <?>) o;
    return m_aVESID.equals (rhs.m_aVESID) && m_sDisplayName.equals (rhs.m_sDisplayName) && m_aList.equals (rhs.m_aList);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aVESID).append (m_sDisplayName).append (m_aList).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ID", m_aVESID)
                                       .append ("DisplayName", m_sDisplayName)
                                       .append ("List", m_aList)
                                       .append ("Status", m_aStatus)
                                       .getToString ();
  }

  @NonNull
  @SafeVarargs
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> create (@NonNull final DVRCoordinate aID,
                                                                                  @NonNull @Nonempty final String sDisplayName,
                                                                                  @NonNull final IValidationExecutorSetStatus aStatus,
                                                                                  @NonNull final IValidationExecutor <ST>... aValidationExecutors)
  {
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.noNullValue (aValidationExecutors, "ValidationExecutors");

    final ValidationExecutorSet <ST> ret = new ValidationExecutorSet <> (aID, sDisplayName, aStatus);

    // Add Schematrons
    for (final IValidationExecutor <ST> aItem : aValidationExecutors)
      ret.addExecutor (aItem);

    return ret;
  }

  @NonNull
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> create (@NonNull final DVRCoordinate aID,
                                                                                  @NonNull @Nonempty final String sDisplayName,
                                                                                  @NonNull final IValidationExecutorSetStatus aStatus,
                                                                                  @NonNull final Collection <? extends IValidationExecutor <ST>> aValidationExecutors)
  {
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.noNullValue (aValidationExecutors, "ValidationExecutors");

    final ValidationExecutorSet <ST> ret = new ValidationExecutorSet <> (aID, sDisplayName, aStatus);

    // Add Schematrons
    for (final IValidationExecutor <ST> aItem : aValidationExecutors)
      ret.addExecutor (aItem);

    return ret;
  }

  /**
   * Create a derived VES from an existing VES. This means that only Schematrons
   * can be added, but the XSDs are taken from the base VES only.
   *
   * @param aBaseVES
   *        The base VES to copy from. May not be <code>null</code>.
   * @param aID
   *        The ID to use. May not be <code>null</code>.
   * @param sDisplayName
   *        The name of the VES. May neither be <code>null</code> nor empty.
   * @param aStatus
   *        The status of the VES. May not be <code>null</code>.
   * @param aValidationExecutors
   *        The resources to be associated with the VES. May not be
   *        <code>null</code>.
   * @return The newly created VES. Never <code>null</code>.
   */
  @NonNull
  @SafeVarargs
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> createDerived (@NonNull final IValidationExecutorSet <ST> aBaseVES,
                                                                                         @NonNull final DVRCoordinate aID,
                                                                                         @NonNull @Nonempty final String sDisplayName,
                                                                                         @NonNull final IValidationExecutorSetStatus aStatus,
                                                                                         @NonNull final IValidationExecutor <ST>... aValidationExecutors)
  {
    ValueEnforcer.notNull (aBaseVES, "BaseVES");
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notEmptyNoNullValue (aValidationExecutors, "ValidationExecutors");

    final ValidationExecutorSet <ST> ret = new ValidationExecutorSet <> (aID, sDisplayName, aStatus);

    // Copy all existing ones
    for (final IValidationExecutor <ST> aVE : aBaseVES)
      ret.addExecutor (aVE);

    // Add Schematrons
    for (final IValidationExecutor <ST> aVE : aValidationExecutors)
      ret.addExecutor (aVE);

    return ret;
  }
}
