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
package com.helger.bdve.api.execute;

import java.util.Locale;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.bdve.api.executorset.IValidationExecutorSet;
import com.helger.bdve.api.result.ValidationResult;
import com.helger.bdve.api.result.ValidationResultList;
import com.helger.bdve.api.source.IValidationSource;
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
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
@NotThreadSafe
public class ValidationExecutionManager <SOURCETYPE extends IValidationSource> implements IValidationExecutionManager <SOURCETYPE>
{
  private final ICommonsList <IValidationExecutor <SOURCETYPE>> m_aExecutors = new CommonsArrayList <> ();

  /**
   * Default constructor without executors.
   */
  public ValidationExecutionManager ()
  {}

  /**
   * Constructor with a collection of executors.
   *
   * @param aExecutors
   *        The executors to be added. May be <code>null</code> but may not
   *        contain <code>null</code> values.
   */
  public ValidationExecutionManager (@Nullable final Iterable <? extends IValidationExecutor <SOURCETYPE>> aExecutors)
  {
    addExecutors (aExecutors);
  }

  /**
   * Add a single executor.
   *
   * @param aExecutor
   *        The executor to be added. May not be <code>null</code>.
   * @return this for chaining
   * @see #addExecutors(Iterable)
   */
  @Nonnull
  public final ValidationExecutionManager <SOURCETYPE> addExecutor (@Nonnull final IValidationExecutor <SOURCETYPE> aExecutor)
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
  public final ValidationExecutionManager <SOURCETYPE> addExecutors (@Nullable final Iterable <? extends IValidationExecutor <SOURCETYPE>> aExecutors)
  {
    if (aExecutors != null)
      for (final IValidationExecutor <SOURCETYPE> aExecutor : aExecutors)
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
  public ICommonsList <IValidationExecutor <SOURCETYPE>> getAllExecutors ()
  {
    return m_aExecutors.getClone ();
  }

  /**
   * @return A read-only iterable with all contained executors. The only
   *         difference to {@link #getAllExecutors()} is that the returned
   *         object is not a clone!
   */
  @Nonnull
  public ICommonsIterable <IValidationExecutor <SOURCETYPE>> getExecutors ()
  {
    return m_aExecutors;
  }

  public void executeValidation (@Nonnull final SOURCETYPE aSource,
                                 @Nonnull final ValidationResultList aValidationResults,
                                 @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");
    ValueEnforcer.notNull (aValidationResults, "ValidationResults");

    boolean bIgnoreRest = false;
    for (final IValidationExecutor <SOURCETYPE> aExecutor : getAllExecutors ())
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
  public EValidity executeFastValidation (@Nonnull final SOURCETYPE aSource)
  {
    ValueEnforcer.notNull (aSource, "Source");

    for (final IValidationExecutor <SOURCETYPE> aExecutor : getAllExecutors ())
    {
      // Execute validation
      // Note: locale doesn't matter because we don't use the texts
      final ValidationResult aResult = aExecutor.applyValidation (aSource, (Locale) null);
      if (aResult.isFailure ())
      {
        // Break asap
        return EValidity.INVALID;
      }
    }
    return EValidity.VALID;
  }

  /**
   * This is a shortcut method to perform the full validation of a VES onto a
   * specific object to be validated.
   *
   * @param aVES
   *        The VES to be used. May not be <code>null</code>.
   * @param aSource
   *        The object to be validated. May not be <code>null</code>.
   * @return The validation result list and never <code>null</code>.
   */
  @Nonnull
  public static <ST extends IValidationSource> ValidationResultList executeValidation (@Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                       @Nonnull final ST aSource)
  {
    return new ValidationExecutionManager <> (aVES).executeValidation (aSource);
  }

  /**
   * This is a shortcut method to perform the full validation of a VES onto a
   * specific object to be validated.
   *
   * @param aVES
   *        The VES to be used. May not be <code>null</code>.
   * @param aSource
   *        The object to be validated. May not be <code>null</code>.
   * @param aLocale
   *        The locale to be used for error messages. May be <code>null</code>.
   * @return The validation result list and never <code>null</code>.
   */
  @Nonnull
  public static <ST extends IValidationSource> ValidationResultList executeValidation (@Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                       @Nonnull final ST aSource,
                                                                                       @Nullable final Locale aLocale)
  {
    return new ValidationExecutionManager <> (aVES).executeValidation (aSource, aLocale);
  }

  /**
   * This is a shortcut method to perform the full validation of a VES onto a
   * specific object to be validated.
   *
   * @param aVES
   *        The VES to be used. May not be <code>null</code>.
   * @param aSource
   *        The object to be validated. May not be <code>null</code>.
   * @param aValidationResults
   *        The result list to be filled. May not be <code>null</code>. Note:
   *        this list is NOT altered before start. For each contained executor a
   *        result is added to the result list.
   * @param aLocale
   *        The locale to be used for error messages. May be <code>null</code>.
   */
  @Nonnull
  public static <ST extends IValidationSource> void executeValidation (@Nonnull final IValidationExecutorSet <ST> aVES,
                                                                       @Nonnull final ST aSource,
                                                                       @Nonnull final ValidationResultList aValidationResults,
                                                                       @Nullable final Locale aLocale)
  {
    new ValidationExecutionManager <> (aVES).executeValidation (aSource, aValidationResults, aLocale);
  }

  /**
   * This is a shortcut method to perform the fast validation of a VES onto a
   * specific object to be validated.
   *
   * @param aVES
   *        The VES to be used. May not be <code>null</code>.
   * @param aSource
   *        The object to be validated. May not be <code>null</code>.
   * @return The validity of the validated object and never <code>null</code>.
   */
  @Nonnull
  public static <ST extends IValidationSource> EValidity executeFastValidation (@Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                @Nonnull final ST aSource)
  {
    return new ValidationExecutionManager <> (aVES).executeFastValidation (aSource);
  }
}
