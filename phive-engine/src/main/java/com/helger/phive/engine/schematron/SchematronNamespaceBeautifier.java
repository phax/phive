/*
 * Copyright (C) 2014-2022 Philip Helger (www.helger.com)
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
package com.helger.phive.engine.schematron;

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
  private static final SimpleReadWriteLock RW_LOCK = new SimpleReadWriteLock ();
  @GuardedBy ("RW_LOCK")
  private static final MapBasedNamespaceContext NS_CTX = new MapBasedNamespaceContext ();

  private SchematronNamespaceBeautifier ()
  {}

  public static void addMapping (@Nonnull final String sPrefix, @Nonnull final String sNamespaceURI)
  {
    // Allow overwrite!
    RW_LOCK.writeLocked ( () -> NS_CTX.setMapping (sPrefix, sNamespaceURI));
  }

  public static void addMappings (@Nullable final IIterableNamespaceContext aOther)
  {
    // Allow overwrite!
    if (aOther != null)
      RW_LOCK.writeLockedGet ( () -> NS_CTX.setMappings (aOther));
  }

  @Nonnull
  public static EChange removeAllMappings ()
  {
    return RW_LOCK.writeLockedGet (NS_CTX::clear);
  }

  @Nullable
  public static String getMapping (@Nullable final String sNamespaceURI)
  {
    return RW_LOCK.readLockedGet ( () -> NS_CTX.getPrefix (sNamespaceURI));
  }
}
