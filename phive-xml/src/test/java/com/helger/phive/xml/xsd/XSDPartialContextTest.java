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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;

import org.junit.Test;

import com.helger.xml.xpath.XPathHelper;

/**
 * Test class for class {@link XSDPartialContext}.
 *
 * @author Philip Helger
 */
public final class XSDPartialContextTest
{
  private static final XPath XP = XPathHelper.createNewXPath ();
  private static final XPathExpression XE = XPathHelper.createNewXPathExpression (XP, "/root/child");

  @Test
  public void testBuilderMinimal ()
  {
    final XSDPartialContext aCtx = XSDPartialContext.builder ().xpathExpression (XE).build ();
    assertNotNull (aCtx);
    assertSame (XE, aCtx.getXPathExpression ());
    assertFalse (aCtx.hasMinNodeCount ());
    assertFalse (aCtx.hasMaxNodeCount ());
  }

  @Test
  public void testBuilderNodeCounts ()
  {
    XSDPartialContext aCtx = XSDPartialContext.builder ()
                                              .xpathExpression (XE)
                                              .minNodeCount (1)
                                              .maxNodeCount (3)
                                              .build ();
    assertTrue (aCtx.hasMinNodeCount ());
    assertEquals (1, aCtx.getMinNodeCount ());
    assertTrue (aCtx.hasMaxNodeCount ());
    assertEquals (3, aCtx.getMaxNodeCount ());

    aCtx = XSDPartialContext.builder ().xpathExpression (XE).minNodeCount (2).build ();
    assertEquals (2, aCtx.getMinNodeCount ());
    assertFalse (aCtx.hasMaxNodeCount ());

    aCtx = XSDPartialContext.builder ().xpathExpression (XE).exactNodeCount (0).build ();
    assertEquals (0, aCtx.getMinNodeCount ());
    assertEquals (0, aCtx.getMaxNodeCount ());

    aCtx = XSDPartialContext.builder ().xpathExpression (XE).noNodeCountConstraint ().build ();
    assertFalse (aCtx.hasMinNodeCount ());
    assertFalse (aCtx.hasMaxNodeCount ());
  }

  @Test
  public void testBuilderCompileXPath ()
  {
    final XSDPartialContext aCtx = XSDPartialContext.builder ()
                                                    .xpathExpression (XP, "/root/child")
                                                    .exactNodeCount (1)
                                                    .build ();
    assertNotNull (aCtx.getXPathExpression ());
    assertEquals (1, aCtx.getMinNodeCount ());
    assertEquals (1, aCtx.getMaxNodeCount ());
  }

  @Test (expected = IllegalArgumentException.class)
  public void testBuilderInvalidXPath ()
  {
    XSDPartialContext.builder ().xpathExpression (XP, "/root/[");
  }

  @Test
  public void testBuilderCopy ()
  {
    final XSDPartialContext aSrc = XSDPartialContext.builder ()
                                                    .xpathExpression (XE)
                                                    .minNodeCount (1)
                                                    .maxNodeCount (5)
                                                    .build ();
    final XSDPartialContext aCopy = XSDPartialContext.builder (aSrc).build ();
    assertSame (XE, aCopy.getXPathExpression ());
    assertEquals (1, aCopy.getMinNodeCount ());
    assertEquals (5, aCopy.getMaxNodeCount ());

    // Modify only the maximum
    final XSDPartialContext aModified = XSDPartialContext.builder (aSrc).maxNodeCount ((Integer) null).build ();
    assertEquals (1, aModified.getMinNodeCount ());
    assertFalse (aModified.hasMaxNodeCount ());
  }

  @Test (expected = IllegalStateException.class)
  public void testBuilderMissingXPath ()
  {
    XSDPartialContext.builder ().exactNodeCount (1).build ();
  }

  @Test (expected = IllegalStateException.class)
  public void testBuilderNegativeMinNodeCount ()
  {
    XSDPartialContext.builder ().xpathExpression (XE).minNodeCount (-1).build ();
  }

  @Test (expected = IllegalStateException.class)
  public void testBuilderNegativeMaxNodeCount ()
  {
    XSDPartialContext.builder ().xpathExpression (XE).maxNodeCount (-1).build ();
  }

  @Test (expected = IllegalStateException.class)
  public void testBuilderMinGreaterMax ()
  {
    XSDPartialContext.builder ().xpathExpression (XE).minNodeCount (3).maxNodeCount (2).build ();
  }
}
