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
package com.helger.bdve.spi;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

import com.helger.commons.annotation.IsSPIImplementation;
import com.helger.commons.annotation.UsedViaReflection;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.state.EChange;
import com.helger.schematron.svrl.ISVRLLocationBeautifierSPI;
import com.helger.xml.namespace.IIterableNamespaceContext;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * This is a {@link MapBasedNamespaceContext} implementation of the
 * {@link ISVRLLocationBeautifierSPI} implementation.
 *
 * @author Philip Helger
 */
@IsSPIImplementation
public class LocationBeautifierSPI implements ISVRLLocationBeautifierSPI
{
  private static final SimpleReadWriteLock s_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("s_aRWLock")
  private static final MapBasedNamespaceContext s_aCtx = new MapBasedNamespaceContext ();

  public static void addMapping (@Nonnull final String sPrefix, @Nonnull final String sNamespaceURI)
  {
    // Allow overwrite!
    s_aRWLock.writeLocked ( () -> s_aCtx.setMapping (sPrefix, sNamespaceURI));
  }

  public static void addMappings (@Nullable final IIterableNamespaceContext aOther)
  {
    // Allow overwrite!
    if (aOther != null)
      s_aRWLock.writeLocked ( () -> s_aCtx.setMappings (aOther));
  }

  @Nonnull
  public static EChange removeAllMappings ()
  {
    return s_aRWLock.writeLocked (s_aCtx::clear);
  }

  @Deprecated
  @UsedViaReflection
  public LocationBeautifierSPI ()
  {}

  @Nullable
  public String getReplacementText (@Nonnull final String sNamespaceURI, @Nonnull final String sLocalName)
  {
    final String sPrefix = s_aRWLock.readLocked ( () -> s_aCtx.getPrefix (sNamespaceURI));
    if (sPrefix == null)
      return null;

    return sPrefix + ":" + sLocalName;
  }
}
