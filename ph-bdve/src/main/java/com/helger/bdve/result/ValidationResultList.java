/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve.result;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
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

  public boolean containsNoFailure ()
  {
    return containsOnly (x -> x.getErrorList ().containsNoFailure ());
  }

  public boolean containsNoError ()
  {
    return containsOnly (x -> x.getErrorList ().containsNoError ());
  }

  public boolean containsAtLeastOneFailure ()
  {
    return containsAny (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  public boolean containsAtLeastOneError ()
  {
    return containsAny (x -> x.getErrorList ().containsAtLeastOneError ());
  }

  @Nonnull
  @ReturnsMutableCopy
  public ErrorList getAllFailures ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationResult aItem : this)
      ret.addAll (aItem.getErrorList ().getAllFailures ());
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ErrorList getAllErrors ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationResult aItem : this)
      ret.addAll (aItem.getErrorList ().getAllErrors ());
    return ret;
  }
}
