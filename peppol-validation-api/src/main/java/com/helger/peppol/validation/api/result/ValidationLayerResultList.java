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
package com.helger.peppol.validation.api.result;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.error.ResourceErrorGroup;
import com.helger.commons.string.ToStringGenerator;

/**
 * A managed list of {@link ValidationLayerResult} objects
 *
 * @author Philip Helger
 */
public class ValidationLayerResultList implements Iterable <ValidationLayerResult>, Serializable
{
  private final ICommonsList <ValidationLayerResult> m_aList = new CommonsArrayList <> ();

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
  public List <ValidationLayerResult> getAll ()
  {
    return CollectionHelper.newList (m_aList);
  }

  @Nonnull
  public Iterator <ValidationLayerResult> iterator ()
  {
    return m_aList.iterator ();
  }

  public boolean containsNoFailure ()
  {
    for (final ValidationLayerResult aItem : m_aList)
      if (!aItem.getResourceErrorGroup ().containsNoFailure ())
        return false;
    return true;
  }

  public boolean containsNoError ()
  {
    for (final ValidationLayerResult aItem : m_aList)
      if (!aItem.getResourceErrorGroup ().containsNoError ())
        return false;
    return true;
  }

  public boolean containsAtLeastOneFailure ()
  {
    for (final ValidationLayerResult aItem : m_aList)
      if (aItem.getResourceErrorGroup ().containsAtLeastOneFailure ())
        return true;
    return false;
  }

  public boolean containsAtLeastOneError ()
  {
    for (final ValidationLayerResult aItem : m_aList)
      if (aItem.getResourceErrorGroup ().containsAtLeastOneError ())
        return true;
    return false;
  }

  @Nonnull
  @ReturnsMutableCopy
  public IResourceErrorGroup getAllFailures ()
  {
    final ResourceErrorGroup ret = new ResourceErrorGroup ();
    for (final ValidationLayerResult aItem : m_aList)
      ret.addResourceErrors (aItem.getResourceErrorGroup ().getAllFailures ());
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public IResourceErrorGroup getAllErrors ()
  {
    final ResourceErrorGroup ret = new ResourceErrorGroup ();
    for (final ValidationLayerResult aItem : m_aList)
      ret.addResourceErrors (aItem.getResourceErrorGroup ().getAllErrors ());
    return ret;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("List", m_aList).toString ();
  }
}
