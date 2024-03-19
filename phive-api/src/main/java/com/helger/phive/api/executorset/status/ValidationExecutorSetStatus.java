package com.helger.phive.api.executorset.status;

import java.time.OffsetDateTime;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
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
  private final OffsetDateTime m_aStatusLastModDT;
  private final EValidationExecutorStatusType m_eType;
  private final OffsetDateTime m_aValidFrom;
  private final OffsetDateTime m_aValidTo;
  private final String m_sDeprecationReason;
  private final VESID m_aReplacementVESID;

  public ValidationExecutorSetStatus (@Nonnull final OffsetDateTime aStatusLastModDT,
                                      @Nonnull final EValidationExecutorStatusType eType,
                                      @Nullable final OffsetDateTime aValidFrom,
                                      @Nullable final OffsetDateTime aValidTo,
                                      @Nullable final String sDeprecationReason,
                                      @Nullable final VESID aReplacementVESID)
  {
    ValueEnforcer.notNull (aStatusLastModDT, "StatusLastModDT");
    ValueEnforcer.notNull (eType, "Type");

    m_aStatusLastModDT = PDTFactory.getWithMillisOnly (aStatusLastModDT);
    m_eType = eType;
    m_aValidFrom = PDTFactory.getWithMillisOnly (aValidFrom);
    m_aValidTo = PDTFactory.getWithMillisOnly (aValidTo);
    m_sDeprecationReason = sDeprecationReason;
    m_aReplacementVESID = aReplacementVESID;
  }

  @Nonnull
  public final OffsetDateTime getStatusLastModification ()
  {
    return m_aStatusLastModDT;
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
  public final String getDeprecationReason ()
  {
    return m_sDeprecationReason;
  }

  @Nullable
  public VESID getReplacementVESID ()
  {
    return m_aReplacementVESID;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;

    final ValidationExecutorSetStatus rhs = (ValidationExecutorSetStatus) o;
    return m_aStatusLastModDT.equals (rhs.m_aStatusLastModDT) &&
           m_eType.equals (rhs.m_eType) &&
           EqualsHelper.equals (m_aValidFrom, rhs.m_aValidFrom) &&
           EqualsHelper.equals (m_aValidTo, rhs.m_aValidTo) &&
           EqualsHelper.equals (m_sDeprecationReason, rhs.m_sDeprecationReason) &&
           EqualsHelper.equals (m_aReplacementVESID, rhs.m_aReplacementVESID);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aStatusLastModDT)
                                       .append (m_eType)
                                       .append (m_aValidFrom)
                                       .append (m_aValidTo)
                                       .append (m_sDeprecationReason)
                                       .append (m_aReplacementVESID)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("StatusLastModDT", m_aStatusLastModDT)
                                       .append ("Type", m_eType)
                                       .append ("ValidFrom", m_aValidFrom)
                                       .append ("ValidTo", m_aValidTo)
                                       .append ("DeprecationReason", m_sDeprecationReason)
                                       .append ("ReplacementVESID", m_aReplacementVESID)
                                       .getToString ();
  }

  @Nonnull
  public static ValidationExecutorSetStatus createValidNow ()
  {
    return createDeprecatedNow (false);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createValidAt (@Nonnull final OffsetDateTime aStatusLastModDT)
  {
    return createDeprecated (aStatusLastModDT, false);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createDeprecatedNow (final boolean bDeprecated)
  {
    return createDeprecated (PDTFactory.getCurrentOffsetDateTime (), bDeprecated);
  }

  @Nonnull
  public static ValidationExecutorSetStatus createDeprecated (@Nonnull final OffsetDateTime aStatusLastModDT,
                                                              final boolean bDeprecated)
  {
    return new ValidationExecutorSetStatus (aStatusLastModDT,
                                            bDeprecated ? EValidationExecutorStatusType.DEPRECATED
                                                        : EValidationExecutorStatusType.VALID,
                                            (OffsetDateTime) null,
                                            (OffsetDateTime) null,
                                            (String) null,
                                            (VESID) null);
  }
}
