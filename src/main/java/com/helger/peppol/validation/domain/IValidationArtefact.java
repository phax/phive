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
package com.helger.peppol.validation.domain;

import javax.annotation.Nonnull;

import com.helger.commons.io.IReadableResource;
import com.helger.ubl.EUBL21DocumentType;

/**
 * Base interface for a single validation artefact.
 *
 * @author Philip Helger
 */
public interface IValidationArtefact
{
  /**
   * @return The Schematron resource descriptor. Never <code>null</code>.
   */
  @Nonnull
  IReadableResource getSchematronResource ();

  /**
   * @return The transaction key for this standard validation artefact. Never
   *         <code>null</code>.
   */
  @Nonnull
  TransactionKey getTransactionKey ();

  /**
   * @return The BIS to which the validation artefact belongs. Never
   *         <code>null</code>. This is a shortcut for
   *         <code>getTransactionKey().getBIS()</code>.
   */
  @Nonnull
  EBIS getBIS ();

  /**
   * @return The transaction to which the validation artefact belongs. Never
   *         <code>null</code>. This is a shortcut for
   *         <code>getTransactionKey().getTransaction()</code>.
   */
  @Nonnull
  ETransaction getTransaction ();

  /**
   * @return The UBL document type required for this validation artefact. Never
   *         <code>null</code>. This is a shortcut for
   *         <code>getTransaction().getUBLDocumentType ()</code>.
   */
  @Nonnull
  EUBL21DocumentType getUBLDocumentType ();
}
