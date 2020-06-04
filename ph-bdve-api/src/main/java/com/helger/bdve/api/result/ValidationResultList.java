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
package com.helger.bdve.api.result;

import java.util.function.Consumer;
import java.util.function.Predicate;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.error.IError;
import com.helger.commons.error.list.ErrorList;

/**
 * A managed list of {@link ValidationResult} objects
 *
 * @author Philip Helger
 */
public class ValidationResultList extends CommonsArrayList <ValidationResult>
{
  public ValidationResultList ()
  {}

  /**
   * @return <code>true</code> if this list contains no failure,
   *         <code>false</code> otherwise.
   */
  public boolean containsNoFailure ()
  {
    return containsOnly (x -> x.getErrorList ().containsNoFailure ());
  }

  /**
   * @return <code>true</code> if this list contains no error,
   *         <code>false</code> otherwise.
   */
  public boolean containsNoError ()
  {
    return containsOnly (x -> x.getErrorList ().containsNoError ());
  }

  /**
   * @return <code>true</code> if this list contains at least one failure,
   *         <code>false</code> otherwise.
   */
  public boolean containsAtLeastOneFailure ()
  {
    return containsAny (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  /**
   * @return <code>true</code> if this list contains at least one error,
   *         <code>false</code> otherwise.
   */
  public boolean containsAtLeastOneError ()
  {
    return containsAny (x -> x.getErrorList ().containsAtLeastOneError ());
  }

  /**
   * @return A flattened list of all failures. In this case the association to
   *         the different layers is lost. Never <code>null</code> but maybe
   *         empty. All error levels except
   *         {@link com.helger.commons.error.level.EErrorLevel#SUCCESS} are
   *         considered to be a failure!
   */
  @Nonnull
  @ReturnsMutableCopy
  public ErrorList getAllFailures ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationResult aItem : this)
      ret.addAll (aItem.getErrorList ().getAllFailures ());
    return ret;
  }

  /**
   * @return A flattened list of all errors. In this case the association to the
   *         different layers is lost. Never <code>null</code> but maybe empty.
   *         All error levels &ge; to
   *         {@link com.helger.commons.error.level.EErrorLevel#ERROR} are
   *         considered to be an error!
   */
  @Nonnull
  @ReturnsMutableCopy
  public ErrorList getAllErrors ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationResult aItem : this)
      ret.addAll (aItem.getErrorList ().getAllErrors ());
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
   *        Consumer to be invoked for each {@link IError}. May not be
   *        <code>null</code>.
   * @since 4.0.0
   */
  public void forEachFlattened (@Nonnull final Consumer <? super IError> aConsumer)
  {
    for (final ValidationResult aItem : this)
      aItem.getErrorList ().forEach (aConsumer);
  }
}
