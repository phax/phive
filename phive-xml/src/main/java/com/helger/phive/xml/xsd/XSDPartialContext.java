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

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.Immutable;
import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.base.builder.IBuilder;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.xml.xpath.XPathHelper;

/**
 * This class defines the constraints validated in the {@link ValidationExecutorXSDPartial} and the
 * {@link com.helger.phive.xml.partial.ValidationExecutorPartial}
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
   *        {@link XPathExpression} that must be satisfied. May not be <code>null</code>.
   * @param aMinNodeCount
   *        Minimum node count that must be present. May be <code>null</code> to indicate no minimum
   *        node count is necessary.
   * @param aMaxNodeCount
   *        Maximum node count that must be present. May be <code>null</code> to indicate no maximum
   *        node count is necessary.
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
   *        {@link XPathExpression} that must be satisfied. May not be <code>null</code>.
   * @return The new XSDPartialContext and never <code>null</code>.
   * @since 6.0.4
   */
  @NonNull
  @Deprecated (forRemoval = true, since = "12.3.0")
  public static XSDPartialContext create (@NonNull final XPathExpression aXE)
  {
    return builder ().xpathExpression (aXE).build ();
  }

  /**
   * Create a new XSD partial context with a min and max node constraint of 1.
   *
   * @param aXE
   *        {@link XPathExpression} that must be satisfied. May not be <code>null</code>.
   * @return The new XSDPartialContext and never <code>null</code>.
   * @since 10.0.0
   */
  @NonNull
  @Deprecated (forRemoval = true, since = "12.3.0")
  public static XSDPartialContext createMandatory (@NonNull final XPathExpression aXE)
  {
    return builder ().xpathExpression (aXE).exactNodeCount (1).build ();
  }

  /**
   * Create a new XSD partial context with a min and max node constraint.
   *
   * @param aXE
   *        {@link XPathExpression} that must be satisfied. May not be <code>null</code>.
   * @param nMinNodeCount
   *        Minimum node count that must be present. Should be &gt; 0.
   * @param nMaxNodeCount
   *        Maximum node count that must be present. Should be &gt; 0.
   * @return The new XSDPartialContext and never <code>null</code>.
   * @since 6.0.4
   */
  @NonNull
  @Deprecated (forRemoval = true, since = "12.3.0")
  public static XSDPartialContext create (@NonNull final XPathExpression aXE,
                                          @Nonnegative final int nMinNodeCount,
                                          @Nonnegative final int nMaxNodeCount)
  {
    return builder ().xpathExpression (aXE).minNodeCount (nMinNodeCount).maxNodeCount (nMaxNodeCount).build ();
  }

  /**
   * @return A new builder for {@link XSDPartialContext} objects. Never <code>null</code>.
   * @since 12.3.0
   */
  @NonNull
  public static XSDPartialContextBuilder builder ()
  {
    return new XSDPartialContextBuilder ();
  }

  /**
   * Create a new builder that is pre-filled with the values of the provided context.
   *
   * @param aSrc
   *        The source context to copy from. May not be <code>null</code>.
   * @return A new builder for {@link XSDPartialContext} objects. Never <code>null</code>.
   * @since 12.3.0
   */
  @NonNull
  public static XSDPartialContextBuilder builder (@NonNull final XSDPartialContext aSrc)
  {
    return new XSDPartialContextBuilder (aSrc);
  }

  /**
   * Builder class for {@link XSDPartialContext} objects.
   *
   * @author Philip Helger
   * @since 12.3.0
   */
  @NotThreadSafe
  public static class XSDPartialContextBuilder implements IBuilder <XSDPartialContext>
  {
    private XPathExpression m_aXE;
    private Integer m_aMinNodeCount;
    private Integer m_aMaxNodeCount;

    public XSDPartialContextBuilder ()
    {}

    /**
     * Copy constructor from an existing {@link XSDPartialContext}.
     *
     * @param aSrc
     *        The source context to copy from. May not be <code>null</code>.
     */
    public XSDPartialContextBuilder (@NonNull final XSDPartialContext aSrc)
    {
      ValueEnforcer.notNull (aSrc, "Src");
      m_aXE = aSrc.m_aXE;
      m_aMinNodeCount = aSrc.m_aMinNodeCount;
      m_aMaxNodeCount = aSrc.m_aMaxNodeCount;
    }

    /**
     * Set the XPath expression that selects the nodes to validate.
     *
     * @param a
     *        The XPath expression to use. May be <code>null</code>.
     * @return this for chaining
     */
    @NonNull
    public final XSDPartialContextBuilder xpathExpression (@Nullable final XPathExpression a)
    {
      m_aXE = a;
      return this;
    }

    /**
     * Compile the provided XPath string with the provided {@link XPath} object (that also defines
     * the namespace context) and use it as the XPath expression that selects the nodes to validate.
     *
     * @param aXPath
     *        The XPath object used to compile the expression. May not be <code>null</code>.
     * @param sXPath
     *        The XPath expression to compile. May neither be <code>null</code> nor empty.
     * @return this for chaining
     * @throws IllegalArgumentException
     *         if the XPath expression cannot be compiled
     */
    @NonNull
    public final XSDPartialContextBuilder xpathExpression (@NonNull final XPath aXPath,
                                                           @NonNull @Nonempty final String sXPath)
    {
      return xpathExpression (XPathHelper.createNewXPathExpression (aXPath, sXPath));
    }

    /**
     * Set the minimum number of nodes that must be selected.
     *
     * @param a
     *        The minimum node count. May be <code>null</code> to indicate that no minimum node
     *        count is required.
     * @return this for chaining
     */
    @NonNull
    public final XSDPartialContextBuilder minNodeCount (@Nullable final Integer a)
    {
      m_aMinNodeCount = a;
      return this;
    }

    /**
     * Set the minimum number of nodes that must be selected.
     *
     * @param n
     *        The minimum node count. Must be &ge; 0.
     * @return this for chaining
     */
    @NonNull
    public final XSDPartialContextBuilder minNodeCount (@Nonnegative final int n)
    {
      return minNodeCount (Integer.valueOf (n));
    }

    /**
     * Set the maximum number of nodes that may be selected.
     *
     * @param a
     *        The maximum node count. May be <code>null</code> to indicate that no maximum node
     *        count is required.
     * @return this for chaining
     */
    @NonNull
    public final XSDPartialContextBuilder maxNodeCount (@Nullable final Integer a)
    {
      m_aMaxNodeCount = a;
      return this;
    }

    /**
     * Set the maximum number of nodes that may be selected.
     *
     * @param n
     *        The maximum node count. Must be &ge; 0.
     * @return this for chaining
     */
    @NonNull
    public final XSDPartialContextBuilder maxNodeCount (@Nonnegative final int n)
    {
      return maxNodeCount (Integer.valueOf (n));
    }

    /**
     * Set the minimum and maximum number of nodes to the same value.
     *
     * @param n
     *        The exact node count. Must be &ge; 0.
     * @return this for chaining
     */
    @NonNull
    public final XSDPartialContextBuilder exactNodeCount (@Nonnegative final int n)
    {
      return minNodeCount (n).maxNodeCount (n);
    }

    /**
     * Remove the minimum and maximum node count constraints.
     *
     * @return this for chaining
     */
    @NonNull
    public final XSDPartialContextBuilder noNodeCountConstraint ()
    {
      return minNodeCount ((Integer) null).maxNodeCount ((Integer) null);
    }

    @NonNull
    public XSDPartialContext build ()
    {
      if (m_aXE == null)
        throw new IllegalStateException ("XPath expression is missing");
      if (m_aMinNodeCount != null && m_aMinNodeCount.intValue () < 0)
        throw new IllegalStateException ("The minimum node count may not be negative");
      if (m_aMaxNodeCount != null && m_aMaxNodeCount.intValue () < 0)
        throw new IllegalStateException ("The maximum node count may not be negative");
      if (m_aMinNodeCount != null &&
          m_aMaxNodeCount != null &&
          m_aMinNodeCount.intValue () > m_aMaxNodeCount.intValue ())
        throw new IllegalStateException ("The minimum node count (" +
                                         m_aMinNodeCount +
                                         ") may not be greater than the maximum node count (" +
                                         m_aMaxNodeCount +
                                         ")");

      return new XSDPartialContext (m_aXE, m_aMinNodeCount, m_aMaxNodeCount);
    }
  }
}
