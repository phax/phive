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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.Nonempty;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.collections.CollectionHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.artefact.peppol.EPeppolExtendedValidationArtefact;
import com.helger.peppol.validation.artefact.peppol.EPeppolStandardValidationArtefact;
import com.helger.peppol.validation.domain.ExtendedTransactionKey;

/**
 * This class contains the configuration to run a single UBL document
 * validation. An instance of this class can be used to validate multiple
 * documents.
 *
 * @author Philip Helger
 */
@Immutable
public class ValidationConfiguration
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (ValidationConfiguration.class);

  private final ExtendedTransactionKey m_aExtendedTransactionKey;
  private final List <IValidationArtefact> m_aValidationArtefacts;

  /**
   * @param aExtendedTransactionKey
   *        The extended transaction key to be used. May not be
   *        <code>null</code>.
   * @param aValidationArtefacts
   *        The validation artefacts to be used in this particular order. May
   *        neither be <code>null</code> nor empty nor may it contain
   *        <code>null</code> elements.
   */
  public ValidationConfiguration (@Nonnull final ExtendedTransactionKey aExtendedTransactionKey,
                                  @Nonnull @Nonempty final List <IValidationArtefact> aValidationArtefacts)
  {
    ValueEnforcer.notNull (aExtendedTransactionKey, "ExtendedTransactionKey");
    ValueEnforcer.notEmptyNoNullValue (aValidationArtefacts, "ValidationArtefacts");
    m_aExtendedTransactionKey = aExtendedTransactionKey;
    m_aValidationArtefacts = CollectionHelper.newList (aValidationArtefacts);
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
   *         the returned list. Never <code>null</code> nor empty nor does it
   *         contain <code>null</code> documents.
   */
  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  public List <IValidationArtefact> getAllValidationArtefacts ()
  {
    return CollectionHelper.newList (m_aValidationArtefacts);
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("extendedTransactionKey", m_aExtendedTransactionKey)
                                       .append ("validationArtefacts", m_aValidationArtefacts)
                                       .toString ();
  }

  @Nonnull
  public static ValidationConfiguration createForPeppol (@Nonnull final ExtendedTransactionKey aExtendedTransactionKey)
  {
    final List <IValidationArtefact> aValidationArtefacts = new ArrayList <IValidationArtefact> ();

    // Get all PEPPOL standard artefacts
    aValidationArtefacts.addAll (EPeppolStandardValidationArtefact.getAllMatchingValidationArtefacts (aExtendedTransactionKey.getTransactionKey ()));
    if (aValidationArtefacts.isEmpty ())
      s_aLogger.warn ("No standard validation artefact supports BIS '" +
                      aExtendedTransactionKey.getBusinessSpecification ().getDisplayName () +
                      "' and transaction " +
                      aExtendedTransactionKey.getTransaction ().getTransactionKey ());

    // Get all PEPPOL extended artefacts
    aValidationArtefacts.addAll (EPeppolExtendedValidationArtefact.getAllMatchingValidationArtefacts (aExtendedTransactionKey));

    return new ValidationConfiguration (aExtendedTransactionKey, aValidationArtefacts);
  }
}
