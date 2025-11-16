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
package com.helger.phive.api.result;

import java.util.function.Consumer;
import java.util.function.Predicate;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonnegative;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.phive.api.source.IValidationSource;

/**
 * A managed list of {@link ValidationResult} objects.
 *
 * @author Philip Helger
 */
public class ValidationResultList extends CommonsArrayList <ValidationResult>
{
  private final IValidationSource m_aSource;

  /**
   * Create a validation result list with an optional source.
   *
   * @param aSource
   *        The validation source that was used. May be <code>null</code>.
   * @since 10.1.0
   */
  public ValidationResultList (@Nullable final IValidationSource aSource)
  {
    m_aSource = aSource;
  }

  /**
   * @return <code>true</code> if a validation source is present, <code>false</code> if not
   * @since 10.1.0
   */
  public final boolean hasValidationSource ()
  {
    return m_aSource != null;
  }

  /**
   * @return The validation source this result list is based on. May be <code>null</code>.
   * @since 10.1.0
   */
  @Nullable
  public final IValidationSource getValidationSource ()
  {
    return m_aSource;
  }

  /**
   * @return <code>true</code> if this list contains no failure, <code>false</code> otherwise.
   */
  public boolean containsNoFailure ()
  {
    return containsNone (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  /**
   * @return <code>true</code> if this list contains no error, <code>false</code> otherwise.
   */
  public boolean containsNoError ()
  {
    return containsNone (x -> x.getErrorList ().containsAtLeastOneError ());
  }

  /**
   * @return <code>true</code> if this list contains at least one failure, <code>false</code>
   *         otherwise.
   */
  public boolean containsAtLeastOneFailure ()
  {
    return containsAny (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  /**
   * @return <code>true</code> if this list contains at least one error, <code>false</code>
   *         otherwise.
   */
  public boolean containsAtLeastOneError ()
  {
    return containsAny (x -> x.getErrorList ().containsAtLeastOneError ());
  }

  /**
   * @return A flattened list of all failures. In this case the association to the different layers
   *         is lost. Never <code>null</code> but maybe empty. All error levels except
   *         {@link com.helger.diagnostics.error.level.EErrorLevel#SUCCESS} are considered to be a
   *         failure!
   */
  @NonNull
  @ReturnsMutableCopy
  public ErrorList getAllFailures ()
  {
    final ErrorList ret = new ErrorList ();
    forEachFlattened (IError::isFailure, ret::add);
    return ret;
  }

  /**
   * @return A flattened list of all errors. In this case the association to the different layers is
   *         lost. Never <code>null</code> but maybe empty. All error levels &ge; to
   *         {@link com.helger.diagnostics.error.level.EErrorLevel#ERROR} are considered to be an
   *         error!
   */
  @NonNull
  @ReturnsMutableCopy
  public ErrorList getAllErrors ()
  {
    final ErrorList ret = new ErrorList ();
    forEachFlattened (IError::isError, ret::add);
    return ret;
  }

  /**
   * Count all items according to the provided filter.
   *
   * @param aFilter
   *        Optional filter to use. May be <code>null</code>.
   * @return The number of errors matching the provided filter.
   */
  @Nonnegative
  public int getAllCount (@Nullable final Predicate <? super IError> aFilter)
  {
    int ret = 0;
    for (final ValidationResult aItem : this)
      ret += aItem.getErrorList ().getCount (aFilter);
    return ret;
  }

  /**
   * Invoke the provided consumer on all items.
   *
   * @param aConsumer
   *        Consumer to be invoked for each {@link IError}. May not be <code>null</code>.
   * @since 4.0.0
   */
  public void forEachFlattened (@NonNull final Consumer <? super IError> aConsumer)
  {
    ValueEnforcer.notNull (aConsumer, "Consumer");

    for (final ValidationResult aItem : this)
      aItem.getErrorList ().forEach (aConsumer);
  }

  /**
   * Invoke the provided consumer on all items.
   *
   * @param aFilter
   *        Optional filter to use. May be <code>null</code>.
   * @param aConsumer
   *        Consumer to be invoked for each {@link IError}. May not be <code>null</code>.
   * @since 10.1.1
   */
  public void forEachFlattened (@Nullable final Predicate <? super IError> aFilter,
                                @NonNull final Consumer <? super IError> aConsumer)
  {
    ValueEnforcer.notNull (aConsumer, "Consumer");

    for (final ValidationResult aItem : this)
      aItem.getErrorList ().findAll (aFilter, aConsumer);
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ()).append ("Source", m_aSource).getToString ();
  }
}
