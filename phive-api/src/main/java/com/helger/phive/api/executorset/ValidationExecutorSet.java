/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.state.EChange;
import com.helger.commons.string.ToStringGenerator;
import com.helger.diver.api.version.VESID;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.source.IValidationSource;

/**
 * Default implementation of {@link IValidationExecutorSet}.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
@NotThreadSafe
public class ValidationExecutorSet <SOURCETYPE extends IValidationSource> implements IValidationExecutorSet <SOURCETYPE>
{
  private final VESID m_aID;
  private final String m_sDisplayName;
  private final ICommonsList <IValidationExecutor <SOURCETYPE>> m_aList = new CommonsArrayList <> ();
  private final IValidationExecutorSetStatus m_aStatus;

  @Deprecated (forRemoval = true, since = "9.2.0")
  public ValidationExecutorSet (@Nonnull final VESID aID,
                                @Nonnull @Nonempty final String sDisplayName,
                                final boolean bDeprecated)
  {
    this (aID, sDisplayName, ValidationExecutorSetStatus.createDeprecatedNow (bDeprecated));
  }

  public ValidationExecutorSet (@Nonnull final VESID aID,
                                @Nonnull @Nonempty final String sDisplayName,
                                @Nonnull final IValidationExecutorSetStatus aStatus)
  {
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aStatus, "Status");
    m_aID = aID;
    m_sDisplayName = sDisplayName;
    m_aStatus = aStatus;
  }

  @Nonnull
  public final VESID getID ()
  {
    return m_aID;
  }

  @Nonnull
  @Nonempty
  public final String getDisplayName ()
  {
    return m_sDisplayName;
  }

  @Nonnull
  public final Iterator <IValidationExecutor <SOURCETYPE>> iterator ()
  {
    return m_aList.iterator ();
  }

  @Nonnull
  @ReturnsMutableObject
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> executors ()
  {
    return m_aList;
  }

  @Nonnull
  @ReturnsMutableCopy
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> getAllExecutors ()
  {
    return m_aList.getClone ();
  }

  @Nonnull
  public final IValidationExecutorSetStatus getStatus ()
  {
    return m_aStatus;
  }

  /**
   * Add a single executor.
   *
   * @param aExecutor
   *        The executor to be added. May not be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  public ValidationExecutorSet <SOURCETYPE> addExecutor (@Nonnull final IValidationExecutor <SOURCETYPE> aExecutor)
  {
    ValueEnforcer.notNull (aExecutor, "Executor");
    m_aList.add (aExecutor);
    return this;
  }

  public void setValidationExecutorDoCache (final boolean bCache)
  {
    for (final IValidationExecutor <SOURCETYPE> aExecutor : m_aList)
      if (aExecutor instanceof IValidationExecutor.ICacheSupport)
        ((IValidationExecutor.ICacheSupport) aExecutor).setCacheArtefact (bCache);
  }

  /**
   * As some {@link IValidationExecutor} instances may contain a hard reference
   * to a {@link ClassLoader} this methods removes all executors and allows for
   * them to be garbage collected.<br>
   * New executors may be added afterwards but this method is mainly meant for
   * safe cleanup.
   *
   * @return {@link EChange}
   */
  @Nonnull
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
    return m_aID.equals (rhs.m_aID) && m_sDisplayName.equals (rhs.m_sDisplayName) && m_aList.equals (rhs.m_aList);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aID).append (m_sDisplayName).append (m_aList).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ())
                            .append ("ID", m_aID)
                            .append ("DisplayName", m_sDisplayName)
                            .append ("List", m_aList)
                            .append ("Status", m_aStatus)
                            .getToString ();
  }

  @Nonnull
  @SafeVarargs
  @Deprecated (forRemoval = true, since = "9.2.0")
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> create (@Nonnull final VESID aID,
                                                                                  @Nonnull @Nonempty final String sDisplayName,
                                                                                  final boolean bIsDeprecated,
                                                                                  @Nonnull final IValidationExecutor <ST>... aValidationExecutors)
  {
    return create (aID,
                   sDisplayName,
                   ValidationExecutorSetStatus.createDeprecatedNow (bIsDeprecated),
                   aValidationExecutors);
  }

  @Nonnull
  @SafeVarargs
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> create (@Nonnull final VESID aID,
                                                                                  @Nonnull @Nonempty final String sDisplayName,
                                                                                  @Nonnull final IValidationExecutorSetStatus aStatus,
                                                                                  @Nonnull final IValidationExecutor <ST>... aValidationExecutors)
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

  @Nonnull
  @Deprecated (forRemoval = true, since = "9.2.0")
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> create (@Nonnull final VESID aID,
                                                                                  @Nonnull @Nonempty final String sDisplayName,
                                                                                  final boolean bIsDeprecated,
                                                                                  @Nonnull final Collection <? extends IValidationExecutor <ST>> aValidationExecutors)
  {
    return create (aID,
                   sDisplayName,
                   ValidationExecutorSetStatus.createDeprecatedNow (bIsDeprecated),
                   aValidationExecutors);
  }

  @Nonnull
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> create (@Nonnull final VESID aID,
                                                                                  @Nonnull @Nonempty final String sDisplayName,
                                                                                  @Nonnull final IValidationExecutorSetStatus aStatus,
                                                                                  @Nonnull final Collection <? extends IValidationExecutor <ST>> aValidationExecutors)
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
   * @param bIsDeprecated
   *        <code>true</code> if this VES is considered deprecated,
   *        <code>false</code> if not.
   * @param aValidationExecutors
   *        The resources to be associated with the VES. May not be
   *        <code>null</code>.
   * @return The newly created VES. Never <code>null</code>.
   */
  @Nonnull
  @SafeVarargs
  @Deprecated (forRemoval = true, since = "9.2.0")
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> createDerived (@Nonnull final IValidationExecutorSet <ST> aBaseVES,
                                                                                         @Nonnull final VESID aID,
                                                                                         @Nonnull @Nonempty final String sDisplayName,
                                                                                         final boolean bIsDeprecated,
                                                                                         @Nonnull final IValidationExecutor <ST>... aValidationExecutors)
  {
    return createDerived (aBaseVES,
                          aID,
                          sDisplayName,
                          ValidationExecutorSetStatus.createDeprecatedNow (bIsDeprecated),
                          aValidationExecutors);
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
  @Nonnull
  @SafeVarargs
  public static <ST extends IValidationSource> ValidationExecutorSet <ST> createDerived (@Nonnull final IValidationExecutorSet <ST> aBaseVES,
                                                                                         @Nonnull final VESID aID,
                                                                                         @Nonnull @Nonempty final String sDisplayName,
                                                                                         @Nonnull final IValidationExecutorSetStatus aStatus,
                                                                                         @Nonnull final IValidationExecutor <ST>... aValidationExecutors)
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
