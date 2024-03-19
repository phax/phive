package com.helger.phive.api.executorset;

import java.time.OffsetDateTime;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.string.ToStringGenerator;
import com.helger.diver.api.version.VESID;

/**
 * Defines the status of a VES.
 *
 * @author Philip Helger
 * @since 9.2.0
 */
public class ValidationExecutorSetStatus implements IValidationExecutorSetStatus
{
  private final EValidationExecutorStatusType m_eType;
  private final OffsetDateTime m_aValidFrom;
  private final OffsetDateTime m_aValidTo;
  private final VESID m_aReplacementVESID;

  public ValidationExecutorSetStatus (@Nonnull final EValidationExecutorStatusType eType,
                                      @Nullable final OffsetDateTime aValidFrom,
                                      @Nullable final OffsetDateTime aValidTo,
                                      @Nullable final VESID aReplacementVESID)
  {
    ValueEnforcer.notNull (eType, "Type");
    m_eType = eType;
    m_aValidFrom = aValidFrom;
    m_aValidTo = aValidTo;
    m_aReplacementVESID = aReplacementVESID;
  }

  @Nonnull
  public final EValidationExecutorStatusType getType ()
  {
    return m_eType;
  }

  @Nullable
  public final OffsetDateTime getValidFrom ()
  {
    return m_aValidFrom;
  }

  @Nullable
  public final OffsetDateTime getValidTo ()
  {
    return m_aValidTo;
  }

  @Nullable
  public VESID getReplacementVESID ()
  {
    return m_aReplacementVESID;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Type", m_eType)
                                       .append ("ValidFrom", m_aValidFrom)
                                       .append ("ValidTo", m_aValidTo)
                                       .append ("ReplacementVESID", m_aReplacementVESID)
                                       .getToString ();
  }

  @Nonnull
  public static ValidationExecutorSetStatus createValid ()
  {
    return createDeprecated (false);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createDeprecated (final boolean bDeprecated)
  {
    return new ValidationExecutorSetStatus (bDeprecated ? EValidationExecutorStatusType.DEPRECATED
                                                        : EValidationExecutorStatusType.VALID, null, null, null);
  }
}
