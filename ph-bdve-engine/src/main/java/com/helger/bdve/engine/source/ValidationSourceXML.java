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
package com.helger.bdve.engine.source;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.transform.Source;

import org.w3c.dom.Node;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.functional.ISupplier;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;
import com.helger.xml.XMLHelper;
import com.helger.xml.serialize.read.DOMReader;
import com.helger.xml.transform.TransformSourceFactory;

/**
 * Default implementation of {@link IValidationSourceXML}.
 *
 * @author Philip Helger
 */
public class ValidationSourceXML implements IValidationSourceXML
{
  private final String m_sSystemID;
  private final ISupplier <Node> m_aNodeFactory;
  private final boolean m_bPartialSource;
  // Status vars
  private transient Node m_aNode;

  public ValidationSourceXML (@Nullable final String sSystemID, @Nonnull final Node aFixedNode, final boolean bPartialSource)
  {
    this (sSystemID, () -> aFixedNode, bPartialSource);
    m_aNode = aFixedNode;
  }

  public ValidationSourceXML (@Nullable final String sSystemID, @Nonnull final ISupplier <Node> aNodeFactory, final boolean bPartialSource)
  {
    ValueEnforcer.notNull (aNodeFactory, "NodeFactory");
    m_sSystemID = sSystemID;
    m_aNodeFactory = aNodeFactory;
    m_bPartialSource = bPartialSource;
  }

  @Nullable
  public String getSystemID ()
  {
    return m_sSystemID;
  }

  @Nullable
  public Node getNode ()
  {
    Node ret = m_aNode;
    if (ret == null)
    {
      // Invoke only if necessary
      ret = m_aNode = m_aNodeFactory.get ();
    }
    return ret;
  }

  public boolean isPartialSource ()
  {
    return m_bPartialSource;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("SystemID", m_sSystemID)
                                       .append ("NodeFactory", m_aNodeFactory)
                                       .append ("PartialSource", m_bPartialSource)
                                       .getToString ();
  }

  /**
   * Create a complete validation source from an existing DOM node.
   *
   * @param sSystemID
   *        System ID to use. May be <code>null</code>.
   * @param aNode
   *        The node to use. May not be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  public static ValidationSourceXML create (@Nullable final String sSystemID, @Nonnull final Node aNode)
  {
    ValueEnforcer.notNull (aNode, "Node");
    // Use the owner Document as fixed node
    return new ValidationSourceXML (sSystemID, XMLHelper.getOwnerDocument (aNode), false);
  }

  /**
   * Create a partial validation source from an existing DOM node.
   *
   * @param sSystemID
   *        System ID to use. May be <code>null</code>.
   * @param aNode
   *        The node to use. May not be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  public static ValidationSourceXML createPartial (@Nullable final String sSystemID, @Nonnull final Node aNode)
  {
    ValueEnforcer.notNull (aNode, "Node");
    return new ValidationSourceXML (sSystemID, aNode, true);
  }

  /**
   * Assume the provided resource as an XML file, parse it and use the contained
   * DOM Node as the basis for validation.
   *
   * @param aResource
   *        The original resource. May not be <code>null</code>.
   * @return The validation source to be used. Never <code>null</code>.
   */
  @Nonnull
  public static ValidationSourceXML create (@Nonnull final IReadableResource aResource)
  {
    // Read on demand only
    return new ValidationSourceXML (aResource.getPath (), () -> DOMReader.readXMLDOM (aResource), false)
    {
      @Override
      @Nonnull
      public Source getAsTransformSource ()
      {
        // Use resource as TransformSource to get error line and column
        return TransformSourceFactory.create (aResource);
      }
    };
  }
}
