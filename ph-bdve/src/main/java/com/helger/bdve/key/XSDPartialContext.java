package com.helger.bdve.key;

import java.io.Serializable;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.xpath.XPathExpression;

import com.helger.commons.ValueEnforcer;

@NotThreadSafe
public class XSDPartialContext implements Serializable
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
