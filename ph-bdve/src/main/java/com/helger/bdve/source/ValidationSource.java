/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.source;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;
import com.helger.xml.XMLHelper;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Default implementation of {@link IValidationSource}.
 *
 * @author Philip Helger
 */
public class ValidationSource implements IValidationSource
{
  private final String m_sSystemID;
  private final Node m_aNode;
  private final boolean m_bPartialSource;

  public ValidationSource (@Nullable final String sSystemID, @Nullable final Node aNode, final boolean bPartialSource)
  {
    m_sSystemID = sSystemID;
    m_aNode = aNode;
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
    return m_aNode;
  }

  public boolean isPartialSource ()
  {
    return m_bPartialSource;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("SystemID", m_sSystemID)
                                       .append ("Node", m_aNode)
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
  public static ValidationSource create (@Nullable final String sSystemID, @Nonnull final Node aNode)
  {
    ValueEnforcer.notNull (aNode, "Node");
    // Use the owner Document
    return new ValidationSource (sSystemID, XMLHelper.getOwnerDocument (aNode), false);
  }

  /**
   * Assume the provided resource as an XML file, parse it and use the contained
   * DOM Node as the basis for validation.
   *
   * @param aResource
   *        The original resource. May not be <code>null</code>.
   * @return The validation source to be used. Never <code>null</code>.
   * @throws SAXException
   *         In case XML parsing failed.
   */
  @Nonnull
  public static ValidationSource createXMLSource (@Nonnull final IReadableResource aResource) throws SAXException
  {
    final Document aXMLDoc = DOMReader.readXMLDOM (aResource);
    return create (aResource.getPath (), aXMLDoc);
  }
}
