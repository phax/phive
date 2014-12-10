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
package com.helger.peppol.validation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.collections.ContainerHelper;
import com.helger.peppol.validation.artefact.EExtendedValidationArtefact;
import com.helger.peppol.validation.artefact.EStandardValidationArtefact;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.domain.ExtendedTransactionKey;

/**
 * This class contains the configuration to run a PEPPOL document validation. An
 * instance of this class can be used to validate multiple documents.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class PeppolValidationConfiguration
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (PeppolValidationConfiguration.class);

  private final ExtendedTransactionKey m_aExtendedTransactionKey;
  private final List <IValidationArtefact> m_aValidationArtefacts = new ArrayList <IValidationArtefact> ();

  public PeppolValidationConfiguration (@Nonnull final ExtendedTransactionKey aExtendedTransactionKey)
  {
    m_aExtendedTransactionKey = ValueEnforcer.notNull (aExtendedTransactionKey, "ExtendedTransactionKey");

    // Get all standard artefacts
    m_aValidationArtefacts.addAll (EStandardValidationArtefact.getAllMatchingValidationArtefacts (aExtendedTransactionKey.getTransactionKey ()));
    if (m_aValidationArtefacts.isEmpty ())
      s_aLogger.warn ("No standard validation artefact supports BIS " +
                      aExtendedTransactionKey.getBIS ().getID () +
                      " and transaction " +
                      aExtendedTransactionKey.getTransaction ().getTransactionKey ());
    m_aValidationArtefacts.addAll (EExtendedValidationArtefact.getAllMatchingValidationArtefacts (aExtendedTransactionKey));
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
   * @return All validation artefacts to be applied in the order specified by
   *         the returned list.
   */
  @Nonnull
  @ReturnsMutableCopy
  public List <IValidationArtefact> getAllValidationArtefacts ()
  {
    return ContainerHelper.newList (m_aValidationArtefacts);
  }
}
