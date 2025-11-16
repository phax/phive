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
package com.helger.phive.xml.schematron;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.concurrent.GuardedBy;
import com.helger.annotation.concurrent.ThreadSafe;
import com.helger.base.concurrent.SimpleReadWriteLock;
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

  public static void addMapping (@NonNull final String sPrefix, @NonNull final String sNamespaceURI)
  {
    // Allow overwrite!
    RW_LOCK.writeLocked ( () -> NS_CTX.setMapping (sPrefix, sNamespaceURI));
  }

  public static void addMappings (@Nullable final IIterableNamespaceContext aOther)
  {
    // Allow overwrite!
    if (aOther != null)
      RW_LOCK.writeLocked ( () -> NS_CTX.setMappings (aOther));
  }

  public static void removeAllMappings ()
  {
    RW_LOCK.writeLocked (NS_CTX::clear);
  }

  @Nullable
  public static String getMapping (@Nullable final String sNamespaceURI)
  {
    return RW_LOCK.readLockedGet ( () -> NS_CTX.getPrefix (sNamespaceURI));
  }
}
