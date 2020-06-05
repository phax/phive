/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.engine.execute;

import java.util.Locale;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.bdve.api.execute.IValidationExecutionManager;
import com.helger.bdve.api.execute.IValidationExecutor;
import com.helger.bdve.api.result.ValidationResult;
import com.helger.bdve.api.result.ValidationResultList;
import com.helger.bdve.api.sources.IValidationSource;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsIterable;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.state.EValidity;

/**
 * Execute multiple {@link IValidationExecutor}s at once. It is basically a
 * chain of validators with different syntaxes (XSD, Schematron) and different
 * rules (rule files). All validation executors are handled in the order they
 * are specified.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class ValidationExecutionManager implements IValidationExecutionManager
{
  private final ICommonsList <IValidationExecutor> m_aExecutors = new CommonsArrayList <> ();

  /**
   * Default constructor without executors.
   */
  public ValidationExecutionManager ()
  {}

  /**
   * Constructor with an array of executors.
   *
   * @param aExecutors
   *        The executors to be added. May be <code>null</code> but may not
   *        contain <code>null</code> values.
   */
  public ValidationExecutionManager (@Nullable final IValidationExecutor... aExecutors)
  {
    addExecutors (aExecutors);
  }

  /**
   * Constructor with a collection of executors.
   *
   * @param aExecutors
   *        The executors to be added. May be <code>null</code> but may not
   *        contain <code>null</code> values.
   */
  public ValidationExecutionManager (@Nullable final Iterable <? extends IValidationExecutor> aExecutors)
  {
    addExecutors (aExecutors);
  }

  /**
   * Add a single executor.
   *
   * @param aExecutor
   *        The executor to be added. May not be <code>null</code>.
   * @return this for chaining
   * @see #addExecutors(IValidationExecutor...)
   * @see #addExecutors(Iterable)
   */
  @Nonnull
  public final ValidationExecutionManager addExecutor (@Nonnull final IValidationExecutor aExecutor)
  {
    ValueEnforcer.notNull (aExecutor, "Executor");
    m_aExecutors.add (aExecutor);
    return this;
  }

  /**
   * Add 0-n executors at once.
   *
   * @param aExecutors
   *        The executors to be added. May be <code>null</code> but may not
   *        contain <code>null</code> values.
   * @return this for chaining
   * @see #addExecutor(IValidationExecutor)
   */
  @Nonnull
  public final ValidationExecutionManager addExecutors (@Nullable final IValidationExecutor... aExecutors)
  {
    if (aExecutors != null)
      for (final IValidationExecutor aExecutor : aExecutors)
        addExecutor (aExecutor);
    return this;
  }

  /**
   * Add 0-n executors at once.
   *
   * @param aExecutors
   *        The executors to be added. May be <code>null</code> but may not
   *        contain <code>null</code> values.
   * @return this for chaining
   * @see #addExecutor(IValidationExecutor)
   */
  @Nonnull
  public final ValidationExecutionManager addExecutors (@Nullable final Iterable <? extends IValidationExecutor> aExecutors)
  {
    if (aExecutors != null)
      for (final IValidationExecutor aExecutor : aExecutors)
        addExecutor (aExecutor);
    return this;
  }

  /**
   * @return The number contained executors. Always &ge; 0.
   */
  @Nonnegative
  public int getExecutorCount ()
  {
    return m_aExecutors.size ();
  }

  /**
   * @return A copy of the list of the contained executors. Never
   *         <code>null</code>.
   */
  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutor> getAllExecutors ()
  {
    return m_aExecutors.getClone ();
  }

  /**
   * @return A read-only iterable with all contained executors. The only
   *         difference to {@link #getAllExecutors()} is that the returned
   *         object is not a clone!
   */
  @Nonnull
  public ICommonsIterable <IValidationExecutor> getExecutors ()
  {
    return m_aExecutors;
  }

  public void executeValidation (@Nonnull final IValidationSource aSource,
                                 @Nonnull final ValidationResultList aValidationResults,
                                 @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");
    ValueEnforcer.notNull (aValidationResults, "ValidationResults");

    boolean bIgnoreRest = false;
    for (final IValidationExecutor aExecutor : getAllExecutors ())
    {
      if (bIgnoreRest)
      {
        // Ignore executor because of previous failures
        aValidationResults.add (ValidationResult.createIgnoredResult (aExecutor.getValidationArtefact ()));
      }
      else
      {
        // Execute validation
        final ValidationResult aResult = aExecutor.applyValidation (aSource, aLocale);
        assert aResult != null;
        aValidationResults.add (aResult);

        if (aResult.isFailure () && aExecutor.isStopValidationOnError ())
        {
          // Ignore all following executors
          bIgnoreRest = true;
        }
      }
    }
  }

  @Nonnull
  public EValidity executeFastValidation (@Nonnull final IValidationSource aSource, @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");

    for (final IValidationExecutor aExecutor : getAllExecutors ())
    {
      // Execute validation
      final ValidationResult aResult = aExecutor.applyValidation (aSource, aLocale);
      if (aResult.isFailure ())
      {
        // Break asap
        return EValidity.INVALID;
      }
    }
    return EValidity.VALID;
  }
}
