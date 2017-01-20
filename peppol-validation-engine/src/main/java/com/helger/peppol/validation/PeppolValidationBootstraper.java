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
package com.helger.peppol.validation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.bdve.ValidationArtefactKey;
import com.helger.commons.timing.StopWatch;
import com.helger.schematron.pure.SchematronResourcePure;

/**
 * The purpose of this class is to bootstrap the whole validation process so
 * that all caches are pre-filled for the PEPPOL validation artefacts.
 *
 * @author Philip Helger
 */
public final class PeppolValidationBootstraper
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (PeppolValidationBootstraper.class);

  private PeppolValidationBootstraper ()
  {}

  /**
   * Pre-cache all XSD and SCH resources that are required for PEPPOL
   * validation.
   */
  public static void run ()
  {
    s_aLogger.info ("Bootstrapping PEPPOL validation resources");
    final StopWatch aSW = StopWatch.createdStarted ();

    // Bootstrap Peppol SCH artefacts
    for (final EPeppolStandardValidationSchematronArtefact e : EPeppolStandardValidationSchematronArtefact.values ())
    {
      // Only relevant XSDs
      for (final ValidationArtefactKey aVK : e.getValidationKeys ())
        aVK.getJAXBDocumentType ().getSchema ();
      new SchematronResourcePure (e.getRuleResource ()).isValidSchematron ();
    }

    // Bootstrap Peppol third-party SCH artefacts
    for (final EPeppolThirdPartyValidationSchematronArtefact e : EPeppolThirdPartyValidationSchematronArtefact.values ())
    {
      // Only relevant XSDs
      e.getValidationKey ().getJAXBDocumentType ().getSchema ();
      new SchematronResourcePure (e.getRuleResource ()).isValidSchematron ();
    }

    s_aLogger.info ("Finished bootstrapping PEPPOL validation resources in " + aSW.stopAndGetMillis () + "ms");
  }
}
