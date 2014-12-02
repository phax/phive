package com.helger.peppol.validation;

import javax.annotation.Nonnull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.peppol.validation.domain.EStandardValidationArtecfact;
import com.helger.peppol.validation.domain.TransactionKey;

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

  public PeppolValidationConfiguration (@Nonnull final TransactionKey aTransactionKey)
  {
    m_aTransactionKey = ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
    if (!EStandardValidationArtecfact.containsMatchingValidationArtefacts (aTransactionKey))
      s_aLogger.warn ("No standard validation artefact supports BIS " +
                      aTransactionKey.getBIS ().getID () +
                      " and transaction " +
                      aTransactionKey.getTransaction ().getTransactionKey ());
  }
}
