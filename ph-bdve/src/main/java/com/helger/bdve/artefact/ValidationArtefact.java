/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve.artefact;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.lang.ClassLoaderHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * Stand-alone implementation of {@link IValidationArtefact}
 *
 * @author Philip Helger
 */
@Immutable
public class ValidationArtefact implements IValidationArtefact
{
  private final EValidationType m_eValidationArtefactType;
  private final ClassLoader m_aClassLoader;
  private final IReadableResource m_aResource;
  private final ValidationArtefactKey m_aValidationKey;

  public ValidationArtefact (@Nonnull final EValidationType eValidationArtefactType,
                             @Nullable final ClassLoader aClassLoader,
                             @Nonnull final IReadableResource aResource,
                             @Nonnull final ValidationArtefactKey aValidationKey)
  {
    m_eValidationArtefactType = ValueEnforcer.notNull (eValidationArtefactType, "ValidationArtefactType");
    m_aClassLoader = aClassLoader;
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aValidationKey = ValueEnforcer.notNull (aValidationKey, "ValidationKey");
  }

  @Nonnull
  public EValidationType getValidationArtefactType ()
  {
    return m_eValidationArtefactType;
  }

  @Nullable
  public ClassLoader getClassLoader ()
  {
    return m_aClassLoader;
  }

  @Nonnull
  public IReadableResource getRuleResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public ValidationArtefactKey getValidationKey ()
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
           EqualsHelper.equals (m_aClassLoader, rhs.m_aClassLoader) &&
           m_aResource.equals (rhs.m_aResource) &&
           m_aValidationKey.equals (rhs.m_aValidationKey);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_eValidationArtefactType)
                                       .append (m_aClassLoader)
                                       .append (m_aResource)
                                       .append (m_aValidationKey)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefactType", m_eValidationArtefactType)
                                       .append ("ClassLoader", m_aClassLoader)
                                       .append ("Resource", m_aResource)
                                       .append ("ValidationKey", m_aValidationKey)
                                       .getToString ();
  }

  /**
   * Create a validation artefact for XML resources, using the default context
   * class loader.
   *
   * @param aResource
   *        The XML resource. May not be <code>null</code>.
   * @param aValidationKey
   *        The validation artefact key to use. May not be <code>null</code>.
   * @return A non-<code>null</code> validation artefact.
   */
  @Nonnull
  public static ValidationArtefact createXML (@Nonnull final IReadableResource aResource,
                                              @Nonnull final ValidationArtefactKey aValidationKey)
  {
    return new ValidationArtefact (EValidationType.XML,
                                   ClassLoaderHelper.getDefaultClassLoader (),
                                   aResource,
                                   aValidationKey);
  }

  /**
   * Create a validation artefact for XSD resources, using the default context
   * class loader.
   *
   * @param aResource
   *        The XSD resource. May not be <code>null</code>.
   * @param aValidationKey
   *        The validation artefact key to use. May not be <code>null</code>.
   * @return A non-<code>null</code> validation artefact.
   */
  @Nonnull
  public static ValidationArtefact createXSD (@Nonnull final IReadableResource aResource,
                                              @Nonnull final ValidationArtefactKey aValidationKey)
  {
    return new ValidationArtefact (EValidationType.XSD,
                                   ClassLoaderHelper.getDefaultClassLoader (),
                                   aResource,
                                   aValidationKey);
  }
}
