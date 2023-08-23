package com.helger.phive.ves.engine.load;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.datetime.XMLOffsetDate;
import com.helger.commons.datetime.XMLOffsetDateTime;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.lang.GenericReflection;
import com.helger.commons.state.ETriState;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.xml.namespace.MapBasedNamespaceContext;

public final class LoadedVES
{
  public static final class Header
  {
    private final VESID m_aVESID;
    private final String m_sName;
    private final XMLOffsetDate m_aReleased;

    Header (@Nonnull final VESID aVESID, @Nonnull @Nonempty final String sName, @Nullable final XMLOffsetDate aReleased)
    {
      ValueEnforcer.notNull (aVESID, "VESID");
      ValueEnforcer.notEmpty (sName, "Name");
      m_aVESID = aVESID;
      m_sName = sName;
      m_aReleased = aReleased;
    }

    @Nonnull
    public VESID getVESID ()
    {
      return m_aVESID;
    }

    @Nonnull
    @Nonempty
    public String getName ()
    {
      return m_sName;
    }

    @Nullable
    public XMLOffsetDate getReleaseDate ()
    {
      return m_aReleased;
    }
  }

  /**
   * The potentially mutable part of a loaded VES.
   *
   * @author Philip Helger
   */
  public static final class Status
  {
    private final XMLOffsetDateTime m_aValidFrom;
    private final XMLOffsetDateTime m_aValidTo;
    private final ETriState m_eDeprecated;

    Status (@Nullable final XMLOffsetDateTime aValidFrom,
            @Nullable final XMLOffsetDateTime aValidTo,
            @Nonnull final ETriState eDeprecated)
    {
      ValueEnforcer.notNull (eDeprecated, "Deprecated");
      m_aValidFrom = aValidFrom;
      m_aValidTo = aValidTo;
      m_eDeprecated = eDeprecated;
    }

    public boolean isDTValidNow ()
    {
      return isDTValidAt (PDTFactory.getCurrentXMLOffsetDateTime ());
    }

    public boolean isDTValidAt (@Nonnull final XMLOffsetDateTime aDT)
    {
      if (m_aValidFrom != null)
      {
        // Already valid?
        if (aDT.isBefore (m_aValidFrom))
          return false;
      }
      if (m_aValidTo != null)
      {
        // Not yet valid?
        if (aDT.isAfter (m_aValidTo))
          return false;
      }
      return true;
    }

    @Nonnull
    public ETriState getDeprecated ()
    {
      return m_eDeprecated;
    }

    public boolean isDeprecated ()
    {
      return m_eDeprecated.getAsBooleanValue (false);
    }

    @Nonnull
    public static Status createUndefined ()
    {
      return new Status (null, null, ETriState.UNDEFINED);
    }
  }

  /**
   * Output processing specific settings
   *
   * @author Philip Helger
   */
  public static final class OutputType
  {
    private final ICommonsMap <String, EErrorLevel> m_aCustomErrorLevels = new CommonsHashMap <> ();

    public void addCustomErrorLevel (@Nonnull final String sID, @Nonnull final EErrorLevel eErrorLevel)
    {
      m_aCustomErrorLevels.put (sID, eErrorLevel);
    }
  }

  /**
   * Required VES for this VES
   *
   * @author Philip Helger
   */
  public static final class Requirement
  {
    private final VESID m_aRequiredVESID;
    private final MapBasedNamespaceContext m_aNSCtx;
    private final OutputType m_aOutput;
    private final boolean m_bStopOnError;

    Requirement (@Nonnull final VESID aRequiredVESID,
                 @Nonnull final MapBasedNamespaceContext aNSCtx,
                 @Nonnull final OutputType aOutput,
                 final boolean bStopOnError)
    {
      ValueEnforcer.notNull (aRequiredVESID, "RequiredVESID");
      ValueEnforcer.notNull (aNSCtx, "NSCtx");
      ValueEnforcer.notNull (aOutput, "Output");
      m_aRequiredVESID = aRequiredVESID;
      m_aNSCtx = aNSCtx;
      m_aOutput = aOutput;
      m_bStopOnError = bStopOnError;
    }

  }

  private final Header m_aHeader;
  private final Status m_aStatus;
  private Requirement m_aRequires;
  private IValidationExecutorSet <? extends IValidationSource> m_aExecutorSet;

  LoadedVES (@Nonnull final Header aHeader, @Nonnull final Status aStatus)
  {
    ValueEnforcer.notNull (aHeader, "Header");
    ValueEnforcer.notNull (aStatus, "Status");
    m_aHeader = aHeader;
    m_aStatus = aStatus;
  }

  void setRequires (@Nonnull final Requirement aRequirement)
  {
    ValueEnforcer.notNull (aRequirement, "Requirement");
    if (m_aRequires != null)
      throw new IllegalStateException ("You can only set on Requires element");
    m_aRequires = aRequirement;
  }

  void setExecutorSet (@Nonnull final IValidationExecutorSet <? extends IValidationSource> aExecutorser)
  {
    ValueEnforcer.notNull (aExecutorser, "Executor");
    m_aExecutorSet = aExecutorser;
  }

  public boolean hasExecutorSet ()
  {
    return m_aExecutorSet != null;
  }

  public void applyValidation (@Nonnull final IValidationSource aValidationSource,
                               @Nonnull final ValidationResultList aValidationResultList,
                               @Nonnull final Locale aLocale)
  {
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aLocale, "Locale");

    // Validate
    ValidationExecutionManager.executeValidation (GenericReflection.uncheckedCast (m_aExecutorSet),
                                                  aValidationSource,
                                                  aValidationResultList,
                                                  aLocale);
  }
}
