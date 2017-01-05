/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.engine;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import org.w3c.dom.Node;

import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutionManager;
import com.helger.bdve.result.ValidationResultList;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.ext.ICommonsList;

/**
 * This is the main validation class to validate e.g. PEPPOL UBL 2.1 documents
 * according to a passed {@link ValidationExecutionManager} object.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class UBLDocumentValidator
{
  private final ValidationExecutionManager m_aExecMgr;

  /**
   * Constructor
   *
   * @param aExecutors
   *        The configuration to be used. May not be <code>null</code>.
   */
  public UBLDocumentValidator (@Nonnull final ICommonsList <IValidationExecutor> aExecutors)
  {
    m_aExecMgr = new ValidationExecutionManager (aExecutors);
  }

  /**
   * @return The validation configuration as passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public ValidationExecutionManager getExecutionMgr ()
  {
    return m_aExecMgr;
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source
   * @return The result list to be filled. May not be <code>null</code>.
   */
  public ValidationResultList applyCompleteValidation (@Nonnull final Node aUBLDocument)
  {
    ValueEnforcer.notNull (aUBLDocument, "UBLDocument");

    return m_aExecMgr.executeValidation (aUBLDocument);
  }
}
