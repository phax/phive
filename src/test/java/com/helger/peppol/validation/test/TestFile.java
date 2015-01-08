/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.test;

import java.util.Set;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.collections.ContainerHelper;
import com.helger.commons.io.IReadableResource;
import com.helger.peppol.validation.domain.ExtendedTransactionKey;
import com.helger.peppol.validation.domain.TransactionKey;

/**
 * This class describes a simple test file: the path where it resides and the
 * transaction key to be used.
 *
 * @author Philip Helger
 */
@Immutable
public class TestFile
{
  private final IReadableResource m_aResource;
  private final ExtendedTransactionKey m_aExtendedTransactionKey;
  private final Set <String> m_aExpectedErrorIDs;

  public TestFile (@Nonnull final IReadableResource aResource,
                   @Nonnull final ExtendedTransactionKey aExtendedTransactionKey,
                   @Nullable final Set <String> aExpectedErrorIDs)
  {
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aExtendedTransactionKey = ValueEnforcer.notNull (aExtendedTransactionKey, "ExtendedTransactionKey");
    m_aExpectedErrorIDs = ContainerHelper.newSet (aExpectedErrorIDs);
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
  public ExtendedTransactionKey getExtendedTransactionKey ()
  {
    return m_aExtendedTransactionKey;
  }

  /**
   * @return The basic transaction key. Never <code>null</code>.
   */
  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aExtendedTransactionKey.getTransactionKey ();
  }

  public boolean isGoodCase ()
  {
    return ContainerHelper.isEmpty (m_aExpectedErrorIDs);
  }

  public boolean isBadCase ()
  {
    return ContainerHelper.isNotEmpty (m_aExpectedErrorIDs);
  }

  @Nonnull
  @ReturnsMutableCopy
  public Set <String> getAllExpectedErrorIDs ()
  {
    return ContainerHelper.newSet (m_aExpectedErrorIDs);
  }
}
