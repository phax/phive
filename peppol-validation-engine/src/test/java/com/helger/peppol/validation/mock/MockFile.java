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
package com.helger.peppol.validation.mock;

import java.util.Set;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.peppol.validation.domain.ValidationKey;

/**
 * This class describes a simple test file: the path where it resides and the
 * transaction key to be used.
 *
 * @author Philip Helger
 */
@Immutable
public class MockFile
{
  private final IReadableResource m_aResource;
  private final ValidationKey m_aTransactionKey;
  private final Set <String> m_aExpectedErrorIDs;

  public MockFile (@Nonnull final IReadableResource aResource,
                   @Nonnull final ValidationKey aTransactionKey,
                   @Nullable final Set <String> aExpectedErrorIDs)
  {
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aTransactionKey = ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
    m_aExpectedErrorIDs = CollectionHelper.newSet (aExpectedErrorIDs);
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
   * @return The transaction key passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public ValidationKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  public boolean isGoodCase ()
  {
    return CollectionHelper.isEmpty (m_aExpectedErrorIDs);
  }

  public boolean isBadCase ()
  {
    return CollectionHelper.isNotEmpty (m_aExpectedErrorIDs);
  }

  @Nonnull
  @ReturnsMutableCopy
  public Set <String> getAllExpectedErrorIDs ()
  {
    return CollectionHelper.newSet (m_aExpectedErrorIDs);
  }
}
