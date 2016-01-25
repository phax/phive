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
package com.helger.peppol.validation.api.artefact;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;
import com.helger.peppol.validation.api.ValidationKey;

/**
 * Stand-alone implementation of {@link IValidationArtefact}
 *
 * @author Philip Helger
 */
@Immutable
public class ValidationArtefact implements IValidationArtefact
{
  private final EValidationArtefactType m_eValidationArtefactType;
  private final IReadableResource m_aResource;
  private final ValidationKey m_aValidationKey;

  public ValidationArtefact (@Nonnull final EValidationArtefactType eValidationArtefactType,
                             @Nonnull final IReadableResource aResource,
                             @Nonnull final ValidationKey aValidationKey)
  {
    m_eValidationArtefactType = ValueEnforcer.notNull (eValidationArtefactType, "ValidationArtefactType");
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aValidationKey = ValueEnforcer.notNull (aValidationKey, "ValidationKey");
  }

  @Nonnull
  public EValidationArtefactType getValidationArtefactType ()
  {
    return m_eValidationArtefactType;
  }

  @Nonnull
  public IReadableResource getRuleResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public ValidationKey getValidationKey ()
  {
    return m_aValidationKey;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationArtefact rhs = (ValidationArtefact) o;
    return m_eValidationArtefactType.equals (rhs.m_eValidationArtefactType) &&
           m_aResource.equals (rhs.m_aResource) &&
           m_aValidationKey.equals (rhs.m_aValidationKey);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_eValidationArtefactType)
                                       .append (m_aResource)
                                       .append (m_aValidationKey)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefactType", m_eValidationArtefactType)
                                       .append ("Resource", m_aResource)
                                       .append ("ValidationKey", m_aValidationKey)
                                       .toString ();
  }
}
