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
package com.helger.peppol.validation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.collections.CollectionHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.artefact.peppol.EPeppolExtendedValidationArtefact;
import com.helger.peppol.validation.artefact.peppol.EPeppolStandardValidationArtefact;
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
  private final int m_nStandardArtefactCount;
  private final int m_nExtendedArtefactCount;

  /**
   * @param aExtendedTransactionKey
   *        The extended transaction key to be used. May not be
   *        <code>null</code>.
   */
  public PeppolValidationConfiguration (@Nonnull final ExtendedTransactionKey aExtendedTransactionKey)
  {
    m_aExtendedTransactionKey = ValueEnforcer.notNull (aExtendedTransactionKey, "ExtendedTransactionKey");

    // Get all standard artefacts
    m_aValidationArtefacts.addAll (EPeppolStandardValidationArtefact.getAllMatchingValidationArtefacts (aExtendedTransactionKey.getTransactionKey ()));
    if (m_aValidationArtefacts.isEmpty ())
      s_aLogger.warn ("No standard validation artefact supports BIS '" +
                      aExtendedTransactionKey.getBIS ().getDisplayName () +
                      "' and transaction " +
                      aExtendedTransactionKey.getTransaction ().getTransactionKey ());
    m_nStandardArtefactCount = m_aValidationArtefacts.size ();

    // Get all extended artefacts
    m_aValidationArtefacts.addAll (EPeppolExtendedValidationArtefact.getAllMatchingValidationArtefacts (aExtendedTransactionKey));
    m_nExtendedArtefactCount = m_aValidationArtefacts.size () - m_nStandardArtefactCount;
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
   *         the returned list. Never <code>null</code>. This list contains both
   *         the standard validation artefacts as well as the extended
   *         artefacts.
   */
  @Nonnull
  @ReturnsMutableCopy
  public List <IValidationArtefact> getAllValidationArtefacts ()
  {
    return CollectionHelper.newList (m_aValidationArtefacts);
  }

  /**
   * @return How many of the provided artefacts are standard artefacts? Always
   *         &ge; 0.
   */
  @Nonnegative
  public int getStandardArtefactCount ()
  {
    return m_nStandardArtefactCount;
  }

  /**
   * @return How many of the provided artefacts are extended artefacts? Always
   *         &ge; 0.
   */
  @Nonnegative
  public int getExtendedArtefactCount ()
  {
    return m_nExtendedArtefactCount;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("extendedTransactionKey", m_aExtendedTransactionKey)
                                       .append ("validationArtefacts", m_aValidationArtefacts)
                                       .append ("standardArtefactCount", m_nStandardArtefactCount)
                                       .append ("extendedArtefactCount", m_nExtendedArtefactCount)
                                       .toString ();
  }
}
