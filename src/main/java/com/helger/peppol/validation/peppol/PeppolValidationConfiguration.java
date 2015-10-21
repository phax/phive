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
package com.helger.peppol.validation.peppol;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.peppol.validation.ValidationConfiguration;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.artefact.peppol.EPeppolStandardValidationSchematronArtefact;
import com.helger.peppol.validation.artefact.peppol.EPeppolThirdPartyValidationSchematronArtefact;
import com.helger.peppol.validation.domain.ValidationKey;

/**
 * This class contains the configuration to run a single UBL document
 * validation. An instance of this class can be used to validate multiple
 * documents.
 *
 * @author Philip Helger
 */
@Immutable
public final class PeppolValidationConfiguration
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (PeppolValidationConfiguration.class);

  private PeppolValidationConfiguration ()
  {}

  /**
   * Create a validation configuration for the specified validation key. It adds
   * the PEPPOL standard validation artefacts and - if possible - the PEPPOL
   * third party validation artefacts
   *
   * @param aValidationKey
   *        The validation key to be used.
   * @return The {@link PeppolValidationConfiguration} to be used. Never
   *         <code>null</code>.
   */
  @Nonnull
  public static ValidationConfiguration createDefault (@Nonnull final ValidationKey aValidationKey)
  {
    ValueEnforcer.notNull (aValidationKey, "ValidationKey");

    final List <IValidationArtefact> aValidationArtefacts = new ArrayList <IValidationArtefact> ();

    // Note: no need to add the XSD artefacts here. They are determined by the
    // validation key automatically.

    // Get all PEPPOL standard artefacts
    aValidationArtefacts.addAll (EPeppolStandardValidationSchematronArtefact.getAllMatchingValidationArtefacts (aValidationKey));
    if (aValidationArtefacts.isEmpty ())
      s_aLogger.warn ("No standard validation artefact supports BIS '" +
                      aValidationKey.getBusinessSpecification ().getDisplayName () +
                      "' and transaction " +
                      aValidationKey.getTransaction ().getTransactionKey ());

    // Get all PEPPOL third party artefacts (if any)
    aValidationArtefacts.addAll (EPeppolThirdPartyValidationSchematronArtefact.getAllMatchingValidationArtefacts (aValidationKey));

    return new ValidationConfiguration (aValidationKey, aValidationArtefacts);
  }
}
