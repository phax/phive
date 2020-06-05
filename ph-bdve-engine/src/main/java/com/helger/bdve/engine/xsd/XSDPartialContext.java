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
package com.helger.bdve.engine.xsd;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.xpath.XPathExpression;

import com.helger.commons.ValueEnforcer;

@NotThreadSafe
public class XSDPartialContext
{
  private final XPathExpression m_aXE;
  private final Integer m_aMinNodeCount;
  private final Integer m_aMaxNodeCount;

  public XSDPartialContext (@Nonnull final XPathExpression aXE,
                            @Nullable final Integer aMinNodeCount,
                            @Nullable final Integer aMaxNodeCount)
  {
    ValueEnforcer.notNull (aXE, "XPathExpression");
    m_aXE = aXE;
    m_aMinNodeCount = aMinNodeCount;
    m_aMaxNodeCount = aMaxNodeCount;
  }

  @Nonnull
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
}
