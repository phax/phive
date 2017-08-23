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
package com.helger.bdve.executorset;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;

/**
 * A pair of a resource and a validation type.
 *
 * @author Philip Helger
 */
@Immutable
public final class TypedValidationResource
{
  private final EValidationType m_eType;
  private final ClassLoader m_aClassLoader;
  private final IReadableResource m_aRes;

  /**
   * Constructor with a custom class loader.
   *
   * @param eType
   *        The validation type. May not be <code>null</code>.
   * @param aClassLoader
   *        The special class loader to be used to load the resource. May be
   *        <code>null</code>.
   * @param aRes
   *        The resource. May not be <code>null</code>.
   */
  public TypedValidationResource (@Nonnull final EValidationType eType,
                                  @Nonnull final ClassLoader aClassLoader,
                                  @Nonnull final IReadableResource aRes)
  {
    m_eType = ValueEnforcer.notNull (eType, "Type");
    m_aClassLoader = ValueEnforcer.notNull (aClassLoader, "ClassLoader");
    m_aRes = ValueEnforcer.notNull (aRes, "Res");
  }

  /**
   * @return The validation type passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public EValidationType getValidationType ()
  {
    return m_eType;
  }

  /**
   * @return The class loader passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public ClassLoader getClassLoader ()
  {
    return m_aClassLoader;
  }

  /**
   * @return The resource passed in the constructor. Never <code>null</code>.
   */
  @Nonnull
  public IReadableResource getResource ()
  {
    return m_aRes;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final TypedValidationResource rhs = (TypedValidationResource) o;
    return m_eType.equals (rhs.m_eType) && m_aClassLoader.equals (rhs.m_aClassLoader) && m_aRes.equals (rhs.m_aRes);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_eType).append (m_aClassLoader).append (m_aRes).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Type", m_eType)
                                       .append ("ClassLoader", m_aClassLoader)
                                       .append ("Res", m_aRes)
                                       .getToString ();
  }
}
