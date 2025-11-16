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
package com.helger.phive.api.executor;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.Immutable;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.hashcode.HashCodeGenerator;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.base.trait.IGenericImplTrait;
import com.helger.diagnostics.error.list.IErrorList;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.source.IValidationSource;

/**
 * Abstract base implementation of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 * @param <IMPLTYPE>
 *        Implementation type (Since v5.3.1)
 */
@Immutable
public abstract class AbstractValidationExecutor <SOURCETYPE extends IValidationSource, IMPLTYPE extends AbstractValidationExecutor <SOURCETYPE, IMPLTYPE>>
                                                 implements
                                                 IValidationExecutor <SOURCETYPE>,
                                                 IGenericImplTrait <IMPLTYPE>
{
  private final IValidationArtefact m_aValidationArtefact;
  private boolean m_bStopValidationOnError;

  public AbstractValidationExecutor (@NonNull final IValidationArtefact aValidationArtefact)
  {
    ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");

    m_aValidationArtefact = aValidationArtefact;
    m_bStopValidationOnError = aValidationArtefact.getValidationType ().isStopValidationOnError ();
  }

  @NonNull
  public final IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  public final boolean isStopValidationOnError ()
  {
    return m_bStopValidationOnError;
  }

  /**
   * Set the "stop on validation" flag for this executor. If the flag is set, no
   * further validation will be performed.
   *
   * @param bStopValidationOnError
   *        <code>true</code> to stop validation on error, <code>false</code> to
   *        continue anyway.
   * @return this for chaining
   */
  @NonNull
  public final IMPLTYPE setStopValidationOnError (final boolean bStopValidationOnError)
  {
    m_bStopValidationOnError = bStopValidationOnError;
    return thisAsT ();
  }

  @NonNull
  protected final ValidationResult createValidationResult (@NonNull final IErrorList aErrorList,
                                                           @Nonnegative final long nDurationMS)
  {
    return new ValidationResult (m_aValidationArtefact, aErrorList, nDurationMS);
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final AbstractValidationExecutor <?, ?> rhs = (AbstractValidationExecutor <?, ?>) o;
    return m_aValidationArtefact.equals (rhs.m_aValidationArtefact) &&
           m_bStopValidationOnError == rhs.m_bStopValidationOnError;
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aValidationArtefact).append (m_bStopValidationOnError).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact)
                                       .append ("StopValidationOnError", m_bStopValidationOnError)
                                       .getToString ();
  }
}
