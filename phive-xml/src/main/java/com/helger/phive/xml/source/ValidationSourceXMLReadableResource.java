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

import javax.annotation.Nonnull;
import javax.xml.transform.Source;

import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;
import com.helger.xml.serialize.read.DOMReader;
import com.helger.xml.transform.TransformSourceFactory;

/**
 * Special ValidationSourceXML based on a complete {@link IReadableResource}.
 *
 * @author Philip Helger
 * @since 10.1.0
 */
public class ValidationSourceXMLReadableResource extends ValidationSourceXML
{
  private final IReadableResource m_aResource;

  public ValidationSourceXMLReadableResource (@Nonnull final IReadableResource aResource)
  {
    // Read on demand only
    super (aResource.getPath (), () -> DOMReader.readXMLDOM (aResource), false);
    m_aResource = aResource;
  }

  @Nonnull
  public final IReadableResource getResource ()
  {
    return m_aResource;
  }

  @Override
  @Nonnull
  public Source getAsTransformSource ()
  {
    // Use resource as TransformSource to get error line and column
    return TransformSourceFactory.create (m_aResource);
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ()).append ("Resource", m_aResource).getToString ();
  }
}
