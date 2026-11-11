/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonempty;
import com.helger.annotation.concurrent.Immutable;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.annotation.style.ReturnsMutableObject;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.hashcode.HashCodeGenerator;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.ICommonsList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.source.IValidationSource;

/**
 * An implementation of {@link IValidationExecutorSetAlias} that acts as a read-only alias to any
 * other {@link IValidationExecutorSet} with a different ID. In contrast to
 * {@link ValidationExecutorSetAlias} the source VES does not need to be mutable.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 * @since 12.3.0
 */
@Immutable
public class ValidationExecutorSetAliasReadOnly <SOURCETYPE extends IValidationSource> implements
                                                IValidationExecutorSetAlias <SOURCETYPE>
{
  private final DVRCoordinate m_aVESID;
  private final String m_sDisplayName;
  private final IValidationExecutorSet <SOURCETYPE> m_aVES;

  public ValidationExecutorSetAliasReadOnly (@NonNull final DVRCoordinate aVESID,
                                             @NonNull @Nonempty final String sDisplayName,
                                             @NonNull final IValidationExecutorSet <SOURCETYPE> aVES)
  {
    ValueEnforcer.notNull (aVESID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aVES, "VES");
    m_aVESID = aVESID;
    m_sDisplayName = sDisplayName;
    m_aVES = aVES;
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
  public final IValidationExecutorSet <SOURCETYPE> getSourceVES ()
  {
    return m_aVES;
  }

  @NonNull
  public final Iterator <IValidationExecutor <SOURCETYPE>> iterator ()
  {
    return m_aVES.iterator ();
  }

  @NonNull
  @ReturnsMutableObject
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> executors ()
  {
    return m_aVES.executors ();
  }

  @NonNull
  @ReturnsMutableCopy
  public final ICommonsList <IValidationExecutor <SOURCETYPE>> getAllExecutors ()
  {
    return m_aVES.getAllExecutors ();
  }

  @NonNull
  public final IValidationExecutorSetStatus getStatus ()
  {
    return m_aVES.getStatus ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationExecutorSetAliasReadOnly <?> rhs = (ValidationExecutorSetAliasReadOnly <?>) o;
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
