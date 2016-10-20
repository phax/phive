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
import com.helger.commons.error.list.IErrorList;
import com.helger.commons.string.ToStringGenerator;

/**
 * A managed list of {@link ValidationLayerResult} objects
 *
 * @author Philip Helger
 */
public class ValidationLayerResultList implements ICommonsIterable <ValidationLayerResult>, Serializable
{
  private final ICommonsList <ValidationLayerResult> m_aList = new CommonsArrayList<> ();

  public ValidationLayerResultList ()
  {}

  public void add (@Nonnull final ValidationLayerResult aValidationLayerResult)
  {
    ValueEnforcer.notNull (aValidationLayerResult, "ValidationLayerResult");
    m_aList.add (aValidationLayerResult);
  }

  public void add (@Nonnegative final int nIndex, @Nonnull final ValidationLayerResult aValidationLayerResult)
  {
    ValueEnforcer.notNull (aValidationLayerResult, "ValidationLayerResult");
    m_aList.add (nIndex, aValidationLayerResult);
  }

  public void addAll (@Nonnull final ValidationLayerResultList aValidationLayerResultList)
  {
    ValueEnforcer.notNull (aValidationLayerResultList, "ValidationLayerResultList");
    m_aList.addAll (aValidationLayerResultList.m_aList);
  }

  @Nonnegative
  public int getSize ()
  {
    return m_aList.size ();
  }

  public boolean isEmpty ()
  {
    return m_aList.isEmpty ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <ValidationLayerResult> getAll ()
  {
    return m_aList.getClone ();
  }

  @Nonnull
  public Iterator <ValidationLayerResult> iterator ()
  {
    return m_aList.iterator ();
  }

  public boolean containsNoFailure ()
  {
    return m_aList.containsOnly (x -> x.getErrorList ().containsNoFailure ());
  }

  public boolean containsNoError ()
  {
    return m_aList.containsOnly (x -> x.getErrorList ().containsNoError ());
  }

  public boolean containsAtLeastOneFailure ()
  {
    return m_aList.containsAny (x -> x.getErrorList ().containsAtLeastOneFailure ());
  }

  public boolean containsAtLeastOneError ()
  {
    return m_aList.containsAny (x -> x.getErrorList ().containsAtLeastOneError ());
  }

  @Nonnull
  @ReturnsMutableCopy
  public IErrorList getAllFailures ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationLayerResult aItem : m_aList)
      ret.addAll (aItem.getErrorList ().getAllFailures ());
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public IErrorList getAllErrors ()
  {
    final ErrorList ret = new ErrorList ();
    for (final ValidationLayerResult aItem : m_aList)
      ret.addAll (aItem.getErrorList ().getAllErrors ());
    return ret;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("List", m_aList).toString ();
  }
}
