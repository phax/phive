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

import java.io.Serializable;
import java.util.Iterator;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsIterable;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.string.ToStringGenerator;

/**
 * A managed list of {@link ValidationResult} objects
 *
 * @author Philip Helger
 */
public class ValidationResultList implements ICommonsIterable <ValidationResult>, Serializable
{
  private final ICommonsList <ValidationResult> m_aResults = new CommonsArrayList <> ();

  public ValidationResultList ()
  {}

  public void add (@Nonnull final ValidationResult aValidationResult)
  {
    ValueEnforcer.notNull (aValidationResult, "ValidationResult");
    m_aResults.add (aValidationResult);
  }

  public void add (@Nonnegative final int nIndex, @Nonnull final ValidationResult aValidationResult)
  {
    ValueEnforcer.notNull (aValidationResult, "ValidationResult");
    m_aResults.add (nIndex, aValidationResult);
  }

  public void addAll (@Nonnull final ValidationResultList aValidationResultList)
  {
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    m_aResults.addAll (aValidationResultList.m_aResults);
  }

  @Nonnegative
  public int getSize ()
  {
    return m_aResults.size ();
  }

  public boolean isEmpty ()
  {
    return m_aResults.isEmpty ();
  }

  public boolean isNotEmpty ()
  {
    return m_aResults.isNotEmpty ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <ValidationResult> getAllResults ()
  {
    return m_aResults.getClone ();
  }

  @Nonnull
  public Iterator <ValidationResult> iterator ()
  {
    return m_aResults.iterator ();
  }

  public boolean containsNoFailure ()
  {
    return m_aResults.containsOnly (x -> x.getErrorList ().containsNoFailure ());
  }

  public boolean containsNoError ()
  {
    return m_aResults.containsOnly (x -> x.getErrorList ().containsNoError ());
  }

  public boolean containsAtLeastOneFailure ()
  {
    return m_aResults.containsAny (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  public boolean containsAtLeastOneError ()
  {
    return m_aResults.containsAny (x -> x.getErrorList ().containsAtLeastOneError ());
  }

  @Nonnull
  @ReturnsMutableCopy
  public ErrorList getAllFailures ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationResult aItem : m_aResults)
      ret.addAll (aItem.getErrorList ().getAllFailures ());
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ErrorList getAllErrors ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationResult aItem : m_aResults)
      ret.addAll (aItem.getErrorList ().getAllErrors ());
    return ret;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Results", m_aResults).getToString ();
  }
}
