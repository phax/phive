/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.w3c.dom.Node;

import com.helger.bdve.result.ValidationResult;
import com.helger.bdve.result.ValidationResultList;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;

/**
 * Execute multiple {@link IValidationExecutor}s at once. It is basically a
 * chain of validators with different syntaxes (XSD, Schematron) and different
 * rules (rule files). All validation executors are handled in order.
 *
 * @author Philip Helger
 */
public class ValidationExecutionManager
{
  private final ICommonsList <IValidationExecutor> m_aExecutors = new CommonsArrayList<> ();
  private ClassLoader m_aClassLoader;

  public ValidationExecutionManager ()
  {}

  public ValidationExecutionManager (@Nullable final IValidationExecutor... aExecutors)
  {
    addExecutors (aExecutors);
  }

  public ValidationExecutionManager (@Nullable final Iterable <? extends IValidationExecutor> aExecutors)
  {
    addExecutors (aExecutors);
  }

  @Nonnull
  public final ValidationExecutionManager addExecutor (@Nonnull final IValidationExecutor aExecutor)
  {
    ValueEnforcer.notNull (aExecutor, "Executor");
    m_aExecutors.add (aExecutor);
    return this;
  }

  @Nonnull
  public final ValidationExecutionManager addExecutors (@Nullable final IValidationExecutor... aExecutors)
  {
    if (aExecutors != null)
      for (final IValidationExecutor aExecutor : aExecutors)
        addExecutor (aExecutor);
    return this;
  }

  @Nonnull
  public final ValidationExecutionManager addExecutors (@Nullable final Iterable <? extends IValidationExecutor> aExecutors)
  {
    if (aExecutors != null)
      for (final IValidationExecutor aExecutor : aExecutors)
        addExecutor (aExecutor);
    return this;
  }

  @Nonnegative
  public int getExecutorCount ()
  {
    return m_aExecutors.size ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutor> getAllExecutors ()
  {
    return m_aExecutors.getClone ();
  }

  @Nullable
  public ClassLoader getClassLoader ()
  {
    return m_aClassLoader;
  }

  @Nonnull
  public ValidationExecutionManager setClassLoader (@Nullable final ClassLoader aClassLoader)
  {
    m_aClassLoader = aClassLoader;
    return this;
  }

  @Nonnull
  public ValidationResultList executeValidation (@Nonnull final Node aNode)
  {
    final ValidationResultList ret = new ValidationResultList ();
    final ClassLoader aClassLoader = getClassLoader ();

    boolean bIgnoreRest = false;
    for (final IValidationExecutor aExecutor : getAllExecutors ())
    {
      if (bIgnoreRest)
      {
        // Ignore layer
        ret.add (ValidationResult.createIgnoredResult (aExecutor.getValidationArtefact ()));
      }
      else
      {
        final ValidationResult aResult = aExecutor.applyValidation (aNode, aClassLoader);
        assert aResult != null;
        ret.add (aResult);

        if (aResult.isFailure () && aExecutor.getValidationType ().isStopValidationOnError ())
          bIgnoreRest = true;
      }
    }
    return ret;
  }
}
