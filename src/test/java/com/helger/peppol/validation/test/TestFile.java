/**
 * Copyright (C) 2014 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.IReadableResource;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.ubl.EUBL21DocumentType;

@Immutable
public class TestFile
{
  private final IReadableResource m_aResource;
  private final TransactionKey m_aTransactionKey;

  public TestFile (@Nonnull final IReadableResource aResource, @Nonnull final TransactionKey aTransactionKey)
  {
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aTransactionKey = ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
  }

  @Nonnull
  public IReadableResource getResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return m_aTransactionKey.getTransaction ().getUBLDocumentType ();
  }
}
