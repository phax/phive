package com.helger.phive.api.executorset;

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
  private final VESID m_aReplacementVESID;

  public ValidationExecutorSetStatus (@Nonnull final EValidationExecutorStatusType eType,
                                      @Nullable final VESID aReplacementVESID)
  {
    ValueEnforcer.notNull (eType, "Type");
    m_eType = eType;
    m_aReplacementVESID = aReplacementVESID;
  }

  @Nonnull
  public EValidationExecutorStatusType getType ()
  {
    return m_eType;
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
                                       .append ("ReplacementVESID", m_aReplacementVESID)
                                       .getToString ();
  }

  @Nonnull
  public static ValidationExecutorSetStatus createValid ()
  {
    return new ValidationExecutorSetStatus (EValidationExecutorStatusType.VALID, null);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createDeprecated (final boolean bDeprecated)
  {
    return new ValidationExecutorSetStatus (bDeprecated ? EValidationExecutorStatusType.DEPRECATED
                                                        : EValidationExecutorStatusType.VALID, null);
  }
}
