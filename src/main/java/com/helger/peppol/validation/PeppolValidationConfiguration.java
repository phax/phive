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
import javax.annotation.Nullable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.peppol.validation.domain.EExtendedValidationArtefact;
import com.helger.peppol.validation.domain.EStandardValidationArtefact;
import com.helger.peppol.validation.domain.CountryKey;
import com.helger.peppol.validation.domain.IValidationArtefact;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.ubl.EUBL21DocumentType;

/**
 * This class contains the configuration to run a PEPPOL document validation. An
 * instance of this class can be used to validate multiple documents.
 *
 * @author Philip Helger
 */
public class PeppolValidationConfiguration
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (PeppolValidationConfiguration.class);

  private final TransactionKey m_aTransactionKey;
  private final CountryKey m_aExtendedTransactionKey;
  private final List <IValidationArtefact> m_aValidationArtefacts = new ArrayList <IValidationArtefact> ();

  public PeppolValidationConfiguration (@Nonnull final TransactionKey aTransactionKey)
  {
    this (aTransactionKey, null);
  }

  public PeppolValidationConfiguration (@Nonnull final TransactionKey aTransactionKey,
                                        @Nullable final CountryKey aExtendedTransactionKey)
  {
    m_aTransactionKey = ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
    m_aExtendedTransactionKey = aExtendedTransactionKey;

    // Get all standard artefacts
    m_aValidationArtefacts.addAll (EStandardValidationArtefact.getAllMatchingValidationArtefacts (aTransactionKey));
    if (m_aValidationArtefacts.isEmpty ())
      s_aLogger.warn ("No standard validation artefact supports BIS " +
                      aTransactionKey.getBIS ().getID () +
                      " and transaction " +
                      aTransactionKey.getTransaction ().getTransactionKey ());
    if (aExtendedTransactionKey != null)
      m_aValidationArtefacts.addAll (EExtendedValidationArtefact.getAllMatchingValidationArtefacts (aTransactionKey,
                                                                                                    aExtendedTransactionKey));
  }

  /**
   * @return The transaction key passed in the constructor. Never
   *         <code>null</code>.
   */
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

  @Nullable
  public CountryKey getExtendedTransactionKey ()
  {
    return m_aExtendedTransactionKey;
  }
}
