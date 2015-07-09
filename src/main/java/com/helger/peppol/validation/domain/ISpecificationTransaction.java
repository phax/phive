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
package com.helger.peppol.validation.domain;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasName;
import com.helger.ubl21.EUBL21DocumentType;

/**
 * Represents a single transaction within a specification.
 *
 * @author Philip Helger
 */
public interface ISpecificationTransaction extends IHasID <String>, IHasName
{
  /**
   * @return The pseudo name of this transaction. Does not require translation.
   *         Neither <code>null</code> nor empty.
   */
  @Nonnull
  @Nonempty
  String getName ();

  /**
   * @return The number of this transaction. This is only unique in combination
   *         with the "sub number", since e.g. in BII2 the number 64 is used 3
   *         times but with the sub numbers A, B and C!
   */
  @Nonnegative
  int getNumber ();

  /**
   * @return The sub number. This is e.g. relevant for BII2 transaction 64 which
   *         is split into A, B, and C. For all others this methods returns an
   *         empty string.
   */
  @Nonnull
  String getSubNumber ();

  /**
   * @return The underlying specification group to which this transaction
   *         belongs.
   */
  @Nonnull
  ISpecificationGroup getGroup ();

  /**
   * @return The complete transaction ID. For BII2 e.g.
   *         <code>urn:www.cenbii.eu:transaction:biitrns040:ver1.0</code>
   */
  @Nonnull
  @Nonempty
  String getTransactionID ();

  /**
   * @return The unique key. For BII2 e.g. "T064A" or "T004".
   */
  @Nonnull
  @Nonempty
  String getTransactionKey ();

  /**
   * @return The version of the transaction. For BII2 e.g. "1.0" or "2.0".
   */
  @Nonnull
  @Nonempty
  String getVersionNumber ();

  /**
   * @return The expected UBL 2.1 document type for this transaction. Never
   *         <code>null</code>.
   */
  @Nonnull
  EUBL21DocumentType getUBLDocumentType ();
}
