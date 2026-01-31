/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.xsd;

import javax.xml.xpath.XPathExpression;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.Immutable;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.tostring.ToStringGenerator;

/**
 * This class defines the constraints validated in the
 * {@link ValidationExecutorXSDPartial}
 *
 * @author Philip Helger
 */
@Immutable
public class XSDPartialContext
{
  private final XPathExpression m_aXE;
  private final Integer m_aMinNodeCount;
  private final Integer m_aMaxNodeCount;

  /**
   * Constructor
   *
   * @param aXE
   *        {@link XPathExpression} that must be satisfied. May not be
   *        <code>null</code>.
   * @param aMinNodeCount
   *        Minimum node count that must be present. May be <code>null</code> to
   *        indicate no minimum node count is necessary.
   * @param aMaxNodeCount
   *        Maximum node count that must be present. May be <code>null</code> to
   *        indicate no maximum node count is necessary.
   */
  public XSDPartialContext (@NonNull final XPathExpression aXE,
                            @Nullable final Integer aMinNodeCount,
                            @Nullable final Integer aMaxNodeCount)
  {
    ValueEnforcer.notNull (aXE, "XPathExpression");
    m_aXE = aXE;
    m_aMinNodeCount = aMinNodeCount;
    m_aMaxNodeCount = aMaxNodeCount;
  }

  @NonNull
  public XPathExpression getXPathExpression ()
  {
    return m_aXE;
  }

  public boolean hasMinNodeCount ()
  {
    return m_aMinNodeCount != null;
  }

  public int getMinNodeCount ()
  {
    return m_aMinNodeCount.intValue ();
  }

  public boolean hasMaxNodeCount ()
  {
    return m_aMaxNodeCount != null;
  }

  public int getMaxNodeCount ()
  {
    return m_aMaxNodeCount.intValue ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("XPathExpression", m_aXE)
                                       .append ("MinNodeCount", m_aMinNodeCount)
                                       .append ("MaxNodeCount", m_aMaxNodeCount)
                                       .getToString ();
  }

  /**
   * Create a new XSD partial context without a min and max node constraint.
   *
   * @param aXE
   *        {@link XPathExpression} that must be satisfied. May not be
   *        <code>null</code>.
   * @return The new XSDPartialContext and never <code>null</code>.
   * @since 6.0.4
   */
  @NonNull
  public static XSDPartialContext create (@NonNull final XPathExpression aXE)
  {
    return new XSDPartialContext (aXE, null, null);
  }

  /**
   * Create a new XSD partial context with a min and max node constraint of 1.
   *
   * @param aXE
   *        {@link XPathExpression} that must be satisfied. May not be
   *        <code>null</code>.
   * @return The new XSDPartialContext and never <code>null</code>.
   * @since 10.0.0
   */
  @NonNull
  public static XSDPartialContext createMandatory (@NonNull final XPathExpression aXE)
  {
    return create (aXE, 1, 1);
  }

  /**
   * Create a new XSD partial context with a min and max node constraint.
   *
   * @param aXE
   *        {@link XPathExpression} that must be satisfied. May not be
   *        <code>null</code>.
   * @param nMinNodeCount
   *        Minimum node count that must be present. Should be &gt; 0.
   * @param nMaxNodeCount
   *        Maximum node count that must be present. Should be &gt; 0.
   * @return The new XSDPartialContext and never <code>null</code>.
   * @since 6.0.4
   */
  @NonNull
  public static XSDPartialContext create (@NonNull final XPathExpression aXE,
                                          @Nonnegative final int nMinNodeCount,
                                          @Nonnegative final int nMaxNodeCount)
  {
    return new XSDPartialContext (aXE, Integer.valueOf (nMinNodeCount), Integer.valueOf (nMaxNodeCount));
  }
}
