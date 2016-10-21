package com.helger.bdve.execute;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.string.ToStringGenerator;

/**
 * Abstract base implementation of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 */
@Immutable
public abstract class AbstractValidationExecutor implements IValidationExecutor
{
  private final IValidationArtefact m_aValidationArtefact;

  public AbstractValidationExecutor (@Nonnull final EValidationType eType,
                                     @Nonnull final IValidationArtefact aValidationArtefact)
  {
    ValueEnforcer.notNull (eType, "Type");
    m_aValidationArtefact = ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().equals (eType),
                          () -> "The validation artefact is of type " +
                                aValidationArtefact.getValidationArtefactType () +
                                " but needs to have type " +
                                eType);
  }

  /**
   * @return The type of validation performed by this executor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public EValidationType getValidationType ()
  {
    return m_aValidationArtefact.getValidationArtefactType ();
  }

  /**
   * @return The validation key passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public final IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact).toString ();
  }
}
