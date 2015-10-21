package com.helger.peppol.validation.peppol;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.timing.StopWatch;
import com.helger.peppol.validation.artefact.peppol.EPeppolStandardValidationSchematronArtefact;
import com.helger.peppol.validation.artefact.peppol.EPeppolThirdPartyValidationSchematronArtefact;
import com.helger.schematron.pure.SchematronResourcePure;

/**
 * The purpose of this class is to bootstrap the whole validation process so
 * that all caches are pre-filled for the PEPPOL validation artefacts.
 *
 * @author Philip Helger
 */
public final class ValidationBootstraper
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (ValidationBootstraper.class);

  private ValidationBootstraper ()
  {}

  /**
   * Pre-cache all XSD and SCH resources that are required for PEPPOL
   * validation.
   */
  public static void run ()
  {
    s_aLogger.info ("Bootstrapping validation resources");
    final StopWatch aSW = StopWatch.createdStarted ();

    // Bootstrap Peppol SCH artefacts
    for (final EPeppolStandardValidationSchematronArtefact e : EPeppolStandardValidationSchematronArtefact.values ())
    {
      // Only relevant XSDs
      e.getValidationKey ().getTransaction ().getUBLDocumentType ().getSchema ();
      new SchematronResourcePure (e.getRuleResource ()).isValidSchematron ();
    }

    // Bootstrap Peppol third-party SCH artefacts
    for (final EPeppolThirdPartyValidationSchematronArtefact e : EPeppolThirdPartyValidationSchematronArtefact.values ())
    {
      // Only relevant XSDs
      e.getValidationKey ().getTransaction ().getUBLDocumentType ().getSchema ();
      new SchematronResourcePure (e.getRuleResource ()).isValidSchematron ();
    }

    s_aLogger.info ("Finished bootstrapping validation resources in " + aSW.stopAndGetMillis () + "ms");
  }
}
