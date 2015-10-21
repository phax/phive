package com.helger.peppol.validation;

import java.io.Serializable;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.IResourceError;
import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.error.ResourceErrorGroup;
import com.helger.commons.state.ISuccessIndicator;
import com.helger.commons.string.ToStringGenerator;
import com.helger.peppol.validation.artefact.IValidationArtefact;

/**
 * This class captures the validation result of a single validation layer. It
 * contains the validation type and the errors occurred.
 *
 * @author Philip Helger
 */
public class ValidationLayerResult implements ISuccessIndicator, Serializable
{
  private final IValidationArtefact m_aValidationArtefact;
  private final IResourceErrorGroup m_aResourceErrors;

  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IResourceError aResourceError)
  {
    this (aValidationArtefact, new ResourceErrorGroup (aResourceError));
  }

  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact,
                                @Nonnull final Iterable <? extends IResourceError> aResourceErrors)
  {
    this (aValidationArtefact, new ResourceErrorGroup (aResourceErrors));
  }

  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IResourceErrorGroup aResourceErrors)
  {
    m_aValidationArtefact = ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");
    m_aResourceErrors = ValueEnforcer.notNull (aResourceErrors, "ResourceErrors");
  }

  /**
   * @return The validation artefact used to perform validation. Never
   *         <code>null</code>.
   */
  @Nonnull
  public IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  /**
   * @return The errors occurred during the validation. Never <code>null</code>
   *         but maybe empty.
   */
  @Nonnull
  public IResourceErrorGroup getResourceErrorGroup ()
  {
    return m_aResourceErrors;
  }

  public boolean isSuccess ()
  {
    return m_aResourceErrors.containsNoFailure ();
  }

  public boolean isFailure ()
  {
    return m_aResourceErrors.containsAtLeastOneFailure ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact)
                                       .append ("ResourceErrorGroup", m_aResourceErrors)
                                       .toString ();
  }
}
