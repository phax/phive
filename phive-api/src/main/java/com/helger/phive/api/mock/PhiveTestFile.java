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
package com.helger.phive.api.mock;

import java.util.Set;

import com.helger.annotation.concurrent.Immutable;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.collection.commons.CommonsHashSet;
import com.helger.collection.commons.ICommonsSet;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.io.resource.IReadableResource;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;

/**
 * This class describes a simple test file: the path where it resides and the
 * validation ID to be used.
 *
 * @author Philip Helger
 */
@Immutable
public class PhiveTestFile
{
  private final IReadableResource m_aResource;
  private final DVRCoordinate m_aVESID;
  private final ICommonsSet <String> m_aExpectedErrorIDs;

  public PhiveTestFile (@Nonnull final IReadableResource aResource,
                        @Nonnull final DVRCoordinate aVESID,
                        @Nullable final Set <String> aExpectedErrorIDs)
  {
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aVESID = ValueEnforcer.notNull (aVESID, "VESID");
    m_aExpectedErrorIDs = new CommonsHashSet <> (aExpectedErrorIDs);
  }

  /**
   * @return The readable resource as passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public IReadableResource getResource ()
  {
    return m_aResource;
  }

  /**
   * @return The VES ID passed in the constructor. Never <code>null</code>.
   */
  @Nonnull
  public DVRCoordinate getVESID ()
  {
    return m_aVESID;
  }

  public boolean isGoodCase ()
  {
    return m_aExpectedErrorIDs.isEmpty ();
  }

  public boolean isBadCase ()
  {
    return m_aExpectedErrorIDs.isNotEmpty ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsSet <String> getAllExpectedErrorIDs ()
  {
    return m_aExpectedErrorIDs.getClone ();
  }

  @Nonnull
  public static PhiveTestFile createGoodCase (@Nonnull final IReadableResource aResource,
                                              @Nonnull final DVRCoordinate aVESID)
  {
    // Good case: no error
    return new PhiveTestFile (aResource, aVESID, null);
  }
}
