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
package com.helger.bdve.engine.schematron;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.state.EChange;
import com.helger.xml.namespace.IIterableNamespaceContext;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * This class contains namespace prefixes for Schematron error messages
 *
 * @author Philip Helger
 */
@ThreadSafe
public final class SchematronNamespaceBeautifier
{
  private static final SimpleReadWriteLock s_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("s_aRWLock")
  private static final MapBasedNamespaceContext s_aCtx = new MapBasedNamespaceContext ();

  private SchematronNamespaceBeautifier ()
  {}

  public static void addMapping (@Nonnull final String sPrefix, @Nonnull final String sNamespaceURI)
  {
    // Allow overwrite!
    s_aRWLock.writeLockedGet ( () -> s_aCtx.setMapping (sPrefix, sNamespaceURI));
  }

  public static void addMappings (@Nullable final IIterableNamespaceContext aOther)
  {
    // Allow overwrite!
    if (aOther != null)
      s_aRWLock.writeLockedGet ( () -> s_aCtx.setMappings (aOther));
  }

  @Nonnull
  public static EChange removeAllMappings ()
  {
    return s_aRWLock.writeLockedGet (s_aCtx::clear);
  }

  @Nullable
  public static String getMapping (@Nullable final String sNamespaceURI)
  {
    return s_aRWLock.readLockedGet ( () -> s_aCtx.getPrefix (sNamespaceURI));
  }
}
