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
package com.helger.phive.api.execute;

import java.util.Locale;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsIterable;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.state.EValidity;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.phive.api.validity.IValidityDeterminator;

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
public class ValidationExecutionManager <SOURCETYPE extends IValidationSource> implements
                                        IValidationExecutionManager <SOURCETYPE>
{
  private static final Logger LOGGER = LoggerFactory.getLogger (ValidationExecutionManager.class);

  private final IValidityDeterminator <SOURCETYPE> m_aValidityDeterminator;
  private final ICommonsList <IValidationExecutor <SOURCETYPE>> m_aExecutors = new CommonsArrayList <> ();

  /**
   * Default constructor without executors.
   *
   * @param aValidityDeterminator
   *        The validity determinator to be used. May not be <code>null</code>.
   */
  public ValidationExecutionManager (@Nonnull final IValidityDeterminator <SOURCETYPE> aValidityDeterminator)
  {
    ValueEnforcer.notNull (aValidityDeterminator, "ValidityDeterminator");
    m_aValidityDeterminator = aValidityDeterminator;
  }

  /**
   * Constructor with a collection of executors.
   *
   * @param aValidityDeterminator
   *        The validity determinator to be used. May not be <code>null</code>.
   * @param aExecutors
   *        The executors to be added. May be <code>null</code> but may not
   *        contain <code>null</code> values.
   */
  public ValidationExecutionManager (@Nonnull final IValidityDeterminator <SOURCETYPE> aValidityDeterminator,
                                     @Nullable final Iterable <? extends IValidationExecutor <SOURCETYPE>> aExecutors)
  {
    this (aValidityDeterminator);
    addExecutors (aExecutors);
  }

  @Nonnull
  public final IValidityDeterminator <SOURCETYPE> getValidityDeterminator ()
  {
    return m_aValidityDeterminator;
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

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Executing validation on source " + aSource + (aLocale == null ? "" : " and locale " + aLocale));

    boolean bSkipRest = false;

    // Run over all executors
    for (final IValidationExecutor <SOURCETYPE> aExecutor : getAllExecutors ())
    {
      if (bSkipRest)
      {
        // Ignore executor because of previous failures
        aValidationResults.add (ValidationResult.createSkippedResult (aExecutor.getValidationArtefact ()));
      }
      else
      {
        // Execute validation
        final ValidationResult aResult = aExecutor.applyValidation (aSource, aLocale);
        assert aResult != null;
        aValidationResults.add (aResult);

        // Determine validity
        final EExtendedValidity eValidity = m_aValidityDeterminator.getValidity (aExecutor, aResult.getErrorList ());
        if (eValidity.isInvalid () && aExecutor.isStopValidationOnError ())
        {
          // Ignore all following executors
          bSkipRest = true;
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

      // Determine validity
      final EExtendedValidity eValidity = m_aValidityDeterminator.getValidity (aExecutor, aResult.getErrorList ());
      if (eValidity.isInvalid ())
      {
        // Break asap
        return EValidity.INVALID;
      }
    }

    // Absence of invalidity means (currently) valid
    // This interpretation may change sometimes
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
   * @deprecated Use
   *             {@link #executeValidation(IValidityDeterminator, IValidationExecutorSet, IValidationSource)}
   *             instead
   */
  @Nonnull
  @Deprecated (forRemoval = true, since = "10.0.0")
  public static <ST extends IValidationSource> ValidationResultList executeValidation (@Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                       @Nonnull final ST aSource)
  {
    return executeValidation (IValidityDeterminator.createDefault (), aVES, aSource);
  }

  /**
   * This is a shortcut method to perform the full validation of a VES onto a
   * specific object to be validated.
   *
   * @param aValidityDeterminator
   *        The validity determinator to be used. May not be <code>null</code>.
   * @param aVES
   *        The VES to be used. May not be <code>null</code>.
   * @param aSource
   *        The object to be validated. May not be <code>null</code>.
   * @return The validation result list and never <code>null</code>.
   */
  @Nonnull
  public static <ST extends IValidationSource> ValidationResultList executeValidation (@Nonnull final IValidityDeterminator <ST> aValidityDeterminator,
                                                                                       @Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                       @Nonnull final ST aSource)
  {
    return new ValidationExecutionManager <> (aValidityDeterminator, aVES).executeValidation (aSource);
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
   * @deprecated Use
   *             {@link #executeValidation(IValidityDeterminator, IValidationExecutorSet, IValidationSource, Locale)}
   *             instead
   */
  @Nonnull
  @Deprecated (forRemoval = true, since = "10.0.0")
  public static <ST extends IValidationSource> ValidationResultList executeValidation (@Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                       @Nonnull final ST aSource,
                                                                                       @Nullable final Locale aLocale)
  {
    return executeValidation (IValidityDeterminator.createDefault (), aVES, aSource, aLocale);
  }

  /**
   * This is a shortcut method to perform the full validation of a VES onto a
   * specific object to be validated.
   *
   * @param aValidityDeterminator
   *        The validity determinator to be used. May not be <code>null</code>.
   * @param aVES
   *        The VES to be used. May not be <code>null</code>.
   * @param aSource
   *        The object to be validated. May not be <code>null</code>.
   * @param aLocale
   *        The locale to be used for error messages. May be <code>null</code>.
   * @return The validation result list and never <code>null</code>.
   */
  @Nonnull
  public static <ST extends IValidationSource> ValidationResultList executeValidation (@Nonnull final IValidityDeterminator <ST> aValidityDeterminator,
                                                                                       @Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                       @Nonnull final ST aSource,
                                                                                       @Nullable final Locale aLocale)
  {
    return new ValidationExecutionManager <> (aValidityDeterminator, aVES).executeValidation (aSource, aLocale);
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
   * @deprecated Use
   *             {@link #executeValidation(IValidityDeterminator, IValidationExecutorSet, IValidationSource, ValidationResultList, Locale)}
   *             instead
   */
  @Nonnull
  @Deprecated (forRemoval = true, since = "10.0.0")
  public static <ST extends IValidationSource> void executeValidation (@Nonnull final IValidationExecutorSet <ST> aVES,
                                                                       @Nonnull final ST aSource,
                                                                       @Nonnull final ValidationResultList aValidationResults,
                                                                       @Nullable final Locale aLocale)
  {
    executeValidation (IValidityDeterminator.createDefault (), aVES, aSource, aValidationResults, aLocale);
  }

  /**
   * This is a shortcut method to perform the full validation of a VES onto a
   * specific object to be validated.
   *
   * @param aValidityDeterminator
   *        The validity determinator to be used. May not be <code>null</code>.
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
  public static <ST extends IValidationSource> void executeValidation (@Nonnull final IValidityDeterminator <ST> aValidityDeterminator,
                                                                       @Nonnull final IValidationExecutorSet <ST> aVES,
                                                                       @Nonnull final ST aSource,
                                                                       @Nonnull final ValidationResultList aValidationResults,
                                                                       @Nullable final Locale aLocale)
  {
    new ValidationExecutionManager <> (aValidityDeterminator, aVES).executeValidation (aSource,
                                                                                       aValidationResults,
                                                                                       aLocale);
  }

  /**
   * This is a shortcut method to perform the fast validation of a VES onto a
   * specific object to be validated.
   *
   * @param aValidityDeterminator
   *        The validity determinator to be used. May not be <code>null</code>.
   * @param aVES
   *        The VES to be used. May not be <code>null</code>.
   * @param aSource
   *        The object to be validated. May not be <code>null</code>.
   * @return The validity of the validated object and never <code>null</code>.
   */
  @Nonnull
  public static <ST extends IValidationSource> EValidity executeFastValidation (@Nonnull final IValidityDeterminator <ST> aValidityDeterminator,
                                                                                @Nonnull final IValidationExecutorSet <ST> aVES,
                                                                                @Nonnull final ST aSource)
  {
    return new ValidationExecutionManager <> (aValidityDeterminator, aVES).executeFastValidation (aSource);
  }
}
