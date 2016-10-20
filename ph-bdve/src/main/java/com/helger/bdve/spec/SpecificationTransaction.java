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
package com.helger.bdve.spec;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.string.ToStringGenerator;
import com.helger.jaxb.builder.IJAXBDocumentType;

/**
 * Standalone implementation of {@link ISpecificationTransaction}.
 *
 * @author Philip Helger
 */
@Immutable
public class SpecificationTransaction implements ISpecificationTransaction
{
  private final String m_sID;
  private final String m_sName;
  private final IJAXBDocumentType m_aDocType;

  public SpecificationTransaction (@Nonnull @Nonempty final String sID,
                                   @Nonnull @Nonempty final String sName,
                                   @Nonnull final IJAXBDocumentType aDocumentType)
  {
    m_sID = ValueEnforcer.notEmpty (sID, "ID");
    m_sName = ValueEnforcer.notEmpty (sName, "Name");
    m_aDocType = ValueEnforcer.notNull (aDocumentType, "DocType");
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  @Nonempty
  public String getName ()
  {
    return m_sName;
  }

  @Nonnull
  public IJAXBDocumentType getJAXBDocumentType ()
  {
    return m_aDocType;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ID", m_sID)
                                       .append ("Name", m_sName)
                                       .append ("DocType", m_aDocType)
                                       .toString ();
  }
}
