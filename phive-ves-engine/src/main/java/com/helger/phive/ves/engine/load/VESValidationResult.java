package com.helger.phive.ves.engine.load;

import java.time.Duration;
import java.time.OffsetDateTime;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.diver.api.version.VESID;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;

/**
 * This class contains the collected validation results, including metadata on
 * the execution.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public final class VESValidationResult
{
  private final VESID m_aVESID;
  private final IValidationSource m_aValidationSource;
  private final OffsetDateTime m_aStartDateTime;
  private final Duration m_aLoadingDuration;
  private final Duration m_aValidationDuration;
  private final ValidationResultList m_aValidationResultList;

  /**
   * Constructor
   *
   * @param aVESID
   *        The VESID that was validated. May not be <code>null</code>.
   * @param aValidationSource
   *        The source that was validated. May not be <code>null</code>.
   * @param aStartDateTime
   *        When did it all start. This is the timestamp when loading begins.
   *        May not be <code>null</code>.
   * @param aLoadingDuration
   *        The loading duration. May not be <code>null</code>.
   * @param aValidationDuration
   *        The duration of the validation itself. May not be <code>null</code>.
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   */
  public VESValidationResult (@Nonnull final VESID aVESID,
                              @Nonnull final IValidationSource aValidationSource,
                              @Nonnull final OffsetDateTime aStartDateTime,
                              @Nonnull final Duration aLoadingDuration,
                              @Nonnull final Duration aValidationDuration,
                              @Nonnull final ValidationResultList aValidationResultList)
  {
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aStartDateTime, "StartDateTime");
    ValueEnforcer.notNull (aLoadingDuration, "LoadingDuration");
    ValueEnforcer.notNull (aValidationDuration, "ValidationDuration");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    m_aVESID = aVESID;
    m_aValidationSource = aValidationSource;
    m_aStartDateTime = aStartDateTime;
    m_aLoadingDuration = aLoadingDuration;
    m_aValidationDuration = aValidationDuration;
    m_aValidationResultList = aValidationResultList;
  }

  @Nonnull
  public VESID getVESID ()
  {
    return m_aVESID;
  }

  @Nonnull
  public IValidationSource getValidationSource ()
  {
    return m_aValidationSource;
  }

  @Nonnull
  public OffsetDateTime getStartDateTime ()
  {
    return m_aStartDateTime;
  }

  @Nonnull
  public Duration getLoadingDuration ()
  {
    return m_aLoadingDuration;
  }

  @Nonnull
  public Duration getValidationDuration ()
  {
    return m_aValidationDuration;
  }

  @Nonnull
  @ReturnsMutableObject
  public ValidationResultList getValidationResultList ()
  {
    return m_aValidationResultList;
  }
}
