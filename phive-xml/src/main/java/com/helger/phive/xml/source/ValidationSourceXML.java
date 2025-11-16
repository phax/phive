/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.source;

import java.io.IOException;
import java.io.OutputStream;
import java.util.function.Supplier;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.w3c.dom.Node;

import com.helger.annotation.Nonempty;
import com.helger.annotation.WillNotClose;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.io.resource.IReadableResource;
import com.helger.xml.XMLHelper;
import com.helger.xml.serialize.write.XMLWriter;

/**
 * Default implementation of {@link IValidationSourceXML}.
 *
 * @author Philip Helger
 */
public class ValidationSourceXML implements IValidationSourceXML
{
  private final String m_sSystemID;
  private final Supplier <Node> m_aNodeFactory;
  private final boolean m_bPartialSource;
  // Status vars
  private Node m_aNode;

  public ValidationSourceXML (@Nullable final String sSystemID,
                              @NonNull final Node aFixedNode,
                              final boolean bPartialSource)
  {
    this (sSystemID, () -> aFixedNode, bPartialSource);
    m_aNode = aFixedNode;
  }

  public ValidationSourceXML (@Nullable final String sSystemID,
                              @NonNull final Supplier <Node> aNodeFactory,
                              final boolean bPartialSource)
  {
    ValueEnforcer.notNull (aNodeFactory, "NodeFactory");
    m_sSystemID = sSystemID;
    m_aNodeFactory = aNodeFactory;
    m_bPartialSource = bPartialSource;
  }

  @NonNull
  @Nonempty
  public String getValidationSourceTypeID ()
  {
    return VALIDATION_SOURCE_TYPE;
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

  public void writeTo (@NonNull @WillNotClose final OutputStream aOS) throws IOException
  {
    if (XMLWriter.writeToStream (getNode (), aOS).isFailure ())
      throw new IOException ("Failed write XML node to OutputStream");
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
  @NonNull
  public static ValidationSourceXML create (@Nullable final String sSystemID, @NonNull final Node aNode)
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
  @NonNull
  public static ValidationSourceXML createPartial (@Nullable final String sSystemID, @NonNull final Node aNode)
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
  @NonNull
  public static ValidationSourceXML create (@NonNull final IReadableResource aResource)
  {
    return new ValidationSourceXMLReadableResource (aResource);
  }
}
