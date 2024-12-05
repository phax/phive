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

import java.util.Iterator;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.state.EChange;
import com.helger.commons.string.ToStringGenerator;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;

/**
 * An implementation of {@link IValidationExecutorSet} that acts as an alias to
 * another {@link IValidationExecutorSet} with a different ID.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 * @since 10.1.0
 */
@NotThreadSafe
public class ValidationExecutorSetAlias <SOURCETYPE extends IValidationSource> implements
                                        IValidationExecutorSetMutable <SOURCETYPE>
{
  private final DVRCoordinate m_aVESID;
  private final String m_sDisplayName;
  private final IValidationExecutorSetMutable <SOURCETYPE> m_aVES;

  public ValidationExecutorSetAlias (@Nonnull final DVRCoordinate aVESID,
                                     @Nonnull @Nonempty final String sDisplayName,
                                     @Nonnull final IValidationExecutorSetMutable <SOURCETYPE> aVES)
  {
    ValueEnforcer.notNull (aVESID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aVES, "Status");
    m_aVESID = aVESID;
    m_sDisplayName = sDisplayName;
    m_aVES = aVES;
  }

  @Nonnull
  public final DVRCoordinate getID ()
  {
    return m_aVESID;
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
    return m_aVES.iterator ();
  }

  @Nonnull
  @ReturnsMutableObject
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> executors ()
  {
    return m_aVES.executors ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> getAllExecutors ()
  {
    return m_aVES.getAllExecutors ();
  }

  @Nonnull
  public final IValidationExecutorSetStatus getStatus ()
  {
    return m_aVES.getStatus ();
  }

  @Nonnull
  public ValidationExecutorSetAlias <SOURCETYPE> addExecutor (@Nonnull final IValidationExecutor <SOURCETYPE> aExecutor)
  {
    m_aVES.addExecutor (aExecutor);
    return this;
  }

  public void setValidationExecutorDoCache (final boolean bCache)
  {
    m_aVES.setValidationExecutorDoCache (bCache);
  }

  @Nonnull
  public EChange removeAllExecutors ()
  {
    return m_aVES.removeAllExecutors ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationExecutorSetAlias <?> rhs = (ValidationExecutorSetAlias <?>) o;
    return m_aVESID.equals (rhs.m_aVESID) && m_sDisplayName.equals (rhs.m_sDisplayName) && m_aVES.equals (rhs.m_aVES);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aVESID).append (m_sDisplayName).append (m_aVES).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ID", m_aVESID)
                                       .append ("DisplayName", m_sDisplayName)
                                       .append ("VES", m_aVES)
                                       .getToString ();
  }
}
