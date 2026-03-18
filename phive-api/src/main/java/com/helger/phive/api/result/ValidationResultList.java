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
package com.helger.phive.api.result;

import java.time.Duration;
import java.time.OffsetDateTime;
import java.util.Iterator;
import java.util.function.Consumer;
import java.util.function.Predicate;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.ICommonsIterable;
import com.helger.collection.commons.ICommonsList;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.validity.EExtendedValidity;

/**
 * A managed list of {@link ValidationResult} objects.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public final class ValidationResultList implements ICommonsIterable <ValidationResult>
{
  private final ICommonsList <ValidationResult> m_aResults = new CommonsArrayList <> ();
  private final IValidationSource m_aSource;
  private final OffsetDateTime m_aValidationDT;
  private Duration m_aValidationDuration;
  /**
   * By default assume it is valid. Each ValidationResult added may change this.
   */
  private EExtendedValidity m_eValidity = EExtendedValidity.VALID;

  /**
   * Create a validation result list with an optional source.
   *
   * @param aSource
   *        The validation source that was used. May be <code>null</code>.
   * @since 10.1.0
   */
  public ValidationResultList (@Nullable final IValidationSource aSource)
  {
    this (aSource, null);
  }

  /**
   * Create a validation result list with an optional source.
   *
   * @param aSource
   *        The validation source that was used. May be <code>null</code>.
   * @param aValidationDT
   *        The date and time the validation took place. May be <code>null</code> to indicate "now".
   * @since 12.0.0
   */
  public ValidationResultList (@Nullable final IValidationSource aSource, @Nullable final OffsetDateTime aValidationDT)
  {
    m_aSource = aSource;
    m_aValidationDT = aValidationDT != null ? aValidationDT : PDTFactory.getCurrentOffsetDateTime ();
  }

  /**
   * @return <code>true</code> if a validation source is present, <code>false</code> if not
   * @since 10.1.0
   */
  public boolean hasValidationSource ()
  {
    return m_aSource != null;
  }

  /**
   * @return The validation source this result list is based on. May be <code>null</code>.
   * @since 10.1.0
   */
  @Nullable
  public IValidationSource getValidationSource ()
  {
    return m_aSource;
  }

  /**
   * @return The date and time when the validation was executed. Never <code>null</code> .
   * @since 12.0.0
   */
  @NonNull
  public OffsetDateTime getValidationDateTime ()
  {
    return m_aValidationDT;
  }

  @Nonnegative
  public int size ()
  {
    return m_aResults.size ();
  }

  public void add (@NonNull final ValidationResult aVR)
  {
    ValueEnforcer.notNull (aVR, "ValidationResult");

    m_aResults.add (aVR);
    if (aVR.getValidity ().isInvalid ())
      m_eValidity = EExtendedValidity.INVALID;
  }

  /**
   * Add a validation result at a specific index
   *
   * @param nIndex
   *        The index to add at. Must be &ge; 0.
   * @param aVR
   *        The object to add. May not be <code>null</code>.
   * @since 12.0.2
   */
  public void addAt (@Nonnegative final int nIndex, @NonNull final ValidationResult aVR)
  {
    ValueEnforcer.isGE0 (nIndex, "Index");
    ValueEnforcer.notNull (aVR, "ValidationResult");

    m_aResults.add (nIndex, aVR);
    if (aVR.getValidity ().isInvalid ())
      m_eValidity = EExtendedValidity.INVALID;
  }

  @NonNull
  public ValidationResult get (@Nonnegative final int nIndex)
  {
    return m_aResults.get (nIndex);
  }

  /**
   * @return <code>true</code> if the validation duration is present, <code>false</code> if not.
   * @since 12.0.0
   */
  public boolean hasValidationDuration ()
  {
    return m_aValidationDuration != null;
  }

  /**
   * @return The duration the validation execution took. May be <code>null</code>.
   * @since 12.0.0
   */
  @Nullable
  public Duration getValidationDuration ()
  {
    return m_aValidationDuration;
  }

  /**
   * Set the validation duration.
   *
   * @param a
   *        The duration to set. May be <code>null</code>.
   * @return this for chaining
   * @since 12.0.0
   */
  @NonNull
  public ValidationResultList setValidationDuration (@Nullable final Duration a)
  {
    m_aValidationDuration = a;
    return this;
  }

  /**
   * @return The overall validity. Never be <code>null</code>.
   * @since 12.0.0
   */
  @NonNull
  public EExtendedValidity getOverallValidity ()
  {
    return m_eValidity;
  }

  /**
   * @return <code>true</code> if this list contains no failure, <code>false</code> otherwise.
   */
  public boolean containsNoFailure ()
  {
    return m_aResults.containsNone (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  /**
   * @return <code>true</code> if this list contains no error, <code>false</code> otherwise.
   */
  public boolean containsNoError ()
  {
    return m_aResults.containsNone (x -> x.getErrorList ().containsAtLeastOneError ());
  }

  /**
   * @return <code>true</code> if this list contains at least one failure, <code>false</code>
   *         otherwise.
   */
  public boolean containsAtLeastOneFailure ()
  {
    return m_aResults.containsAny (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  /**
   * @return <code>true</code> if this list contains at least one error, <code>false</code>
   *         otherwise.
   */
  public boolean containsAtLeastOneError ()
  {
    return m_aResults.containsAny (x -> x.getErrorList ().containsAtLeastOneError ());
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
    for (final ValidationResult aItem : m_aResults)
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

    for (final ValidationResult aItem : m_aResults)
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

    for (final ValidationResult aItem : m_aResults)
      aItem.getErrorList ().findAll (aFilter, aConsumer);
  }

  @NonNull
  public Iterator <ValidationResult> iterator ()
  {
    return m_aResults.iterator ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Results", m_aResults)
                                       .append ("Source", m_aSource)
                                       .append ("ValidationDT", m_aValidationDT)
                                       .append ("ValidationDuration", m_aValidationDuration)
                                       .append ("Validity", m_eValidity)
                                       .getToString ();
  }

  @NonNull
  public static ValidationResultList createNoSource ()
  {
    return new ValidationResultList (null);
  }
}
