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
package com.helger.bdve.engine.mock;

import java.util.Set;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.api.executorset.VESID;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsHashSet;
import com.helger.commons.collection.impl.ICommonsSet;
import com.helger.commons.io.resource.IReadableResource;

/**
 * This class describes a simple test file: the path where it resides and the
 * validation ID to be used.
 *
 * @author Philip Helger
 */
@Immutable
public class MockFile
{
  private final IReadableResource m_aResource;
  private final VESID m_aVESID;
  private final ICommonsSet <String> m_aExpectedErrorIDs;

  public MockFile (@Nonnull final IReadableResource aResource,
                   @Nonnull final VESID aVESID,
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
  public VESID getVESID ()
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
  public static MockFile createGoodCase (@Nonnull final IReadableResource aResource, @Nonnull final VESID aVESID)
  {
    return new MockFile (aResource, aVESID, null);
  }
}
