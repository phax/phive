/**
 * Copyright (C) 2014-2019 Philip Helger (www.helger.com)
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
package com.helger.bdve.execute;

import java.lang.ref.WeakReference;
import java.util.Locale;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.bdve.result.ValidationResult;
import com.helger.bdve.result.ValidationResultList;
import com.helger.bdve.source.IValidationSource;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsIterable;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.lang.IHasClassLoader;

/**
 * Execute multiple {@link IValidationExecutor}s at once. It is basically a
 * chain of validators with different syntaxes (XSD, Schematron) and different
 * rules (rule files). All validation executors are handled in the order they
 * are specified.<br>
 * A special class loader for XML schema resolution can be set via
 * {@link #setClassLoader(ClassLoader)}. This class loader is than globally
 * applied to all executors.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class ValidationExecutionManager implements IHasClassLoader
{
  private final ICommonsList <IValidationExecutor> m_aExecutors = new CommonsArrayList <> ();
  private WeakReference <ClassLoader> m_aClassLoader = new WeakReference <> (null);

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

  /**
   * @return The class loader to be used. <code>null</code> by default.
   */
  @Nullable
  public final ClassLoader getClassLoader ()
  {
    return m_aClassLoader.get ();
  }

  /**
   * Set the class loader to be used for all following executions.
   *
   * @param aClassLoader
   *        The class loader to be used. May be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  public final ValidationExecutionManager setClassLoader (@Nullable final ClassLoader aClassLoader)
  {
    m_aClassLoader = new WeakReference <> (aClassLoader);
    return this;
  }

  /**
   * Perform a validation with all the contained executors.
   *
   * @param aSource
   *        The source artefact to be validated. May not be <code>null</code>.
   * @param aValidationResults
   *        The result list to be filled. May not be <code>null</code>. Note:
   *        this list is NOT altered before start. For each contained executor a
   *        result is added to the result list.
   * @param aLocale
   *        Custom locale to use e.g. for error messages. May be
   *        <code>null</code> to use the system default locale.
   * @see #executeValidation(IValidationSource, Locale)
   */
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
        // Find the matching class loader
        ClassLoader aValidationCL = aExecutor.getValidationArtefact ().getClassLoader ();
        if (aValidationCL == null)
        {
          // Use the global one as fallback, if none is defined in the
          // validation artefact
          aValidationCL = getClassLoader ();
        }

        // Execute validation
        final ValidationResult aResult = aExecutor.applyValidation (aSource, aLocale);
        assert aResult != null;
        aValidationResults.add (aResult);

        if (aResult.isFailure () && aExecutor.getValidationType ().isStopValidationOnError ())
        {
          // Ignore all following executors
          bIgnoreRest = true;
        }
      }
    }
  }

  /**
   * Perform a validation with all the contained executors.
   *
   * @param aSource
   *        The source artefact to be validated. May not be <code>null</code>.
   * @param aLocale
   *        Custom locale to use e.g. for error messages. May be
   *        <code>null</code> to use the system default locale.
   * @return The validation result list. Never <code>null</code>. For each
   *         contained executor a result is added to the result list.
   * @see #executeValidation(IValidationSource, ValidationResultList, Locale)
   */
  @Nonnull
  public ValidationResultList executeValidation (@Nonnull final IValidationSource aSource,
                                                 @Nullable final Locale aLocale)
  {
    final ValidationResultList ret = new ValidationResultList ();
    executeValidation (aSource, ret, aLocale);
    return ret;
  }

  /**
   * Perform a validation with all the contained executors and the system
   * default locale.
   *
   * @param aSource
   *        The source artefact to be validated. May not be <code>null</code>.
   *        contained executor a result is added to the result list.
   * @return The validation result list. Never <code>null</code>. For each
   *         contained executor a result is added to the result list.
   * @see #executeValidation(IValidationSource, ValidationResultList, Locale)
   * @since 5.1.1
   */
  @Nonnull
  public ValidationResultList executeValidation (@Nonnull final IValidationSource aSource)
  {
    return executeValidation (aSource, (Locale) null);
  }
}
