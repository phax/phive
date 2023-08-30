package com.helger.phive.ves.engine.load;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.datetime.XMLOffsetDate;
import com.helger.commons.datetime.XMLOffsetDateTime;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.lang.GenericReflection;
import com.helger.commons.state.ETriState;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * This class represents a single Loaded VES.
 *
 * @author Philip Helger
 */
public final class LoadedVES
{
  public enum EVESSyntax
  {
    XSD,
    SCHEMATRON,
    EDIFACT
  }

  public static final class Header
  {
    private final VESID m_aVESID;
    private final String m_sName;
    private final XMLOffsetDate m_aReleased;
    private final EVESSyntax m_eVESSyntax;

    Header (@Nonnull final VESID aVESID,
            @Nonnull @Nonempty final String sName,
            @Nullable final XMLOffsetDate aReleased,
            @Nonnull final EVESSyntax eVESSyntax)
    {
      ValueEnforcer.notNull (aVESID, "VESID");
      ValueEnforcer.notEmpty (sName, "Name");
      ValueEnforcer.notNull (eVESSyntax, "VESSyntax");
      m_aVESID = aVESID;
      m_sName = sName;
      m_aReleased = aReleased;
      m_eVESSyntax = eVESSyntax;
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

    @Nonnull
    public EVESSyntax getVESSyntax ()
    {
      return m_eVESSyntax;
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
    public ETriState getExplicitlyDeprecated ()
    {
      return m_eDeprecated;
    }

    public boolean isExplicitlyDeprecated ()
    {
      return m_eDeprecated.getAsBooleanValue (false);
    }

    public boolean isOverallValid ()
    {
      return isDTValidNow () && !isExplicitlyDeprecated ();
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

    @Nonnull
    public VESID getRequiredVESID ()
    {
      return m_aRequiredVESID;
    }

    @Nonnull
    public MapBasedNamespaceContext getNamespaceContext ()
    {
      return m_aNSCtx;
    }

    @Nonnull
    public OutputType getOutput ()
    {
      return m_aOutput;
    }

    public boolean isStopOnError ()
    {
      return m_bStopOnError;
    }
  }

  private final Header m_aHeader;
  private final Status m_aStatus;
  private Requirement m_aRequires;
  private IVESSpecificDeferredLoader m_aRequiresLoader;
  private LoadedVES m_aLoadedRequires;
  private IValidationExecutor <? extends IValidationSource> m_aExecutor;

  LoadedVES (@Nonnull final Header aHeader, @Nonnull final Status aStatus)
  {
    ValueEnforcer.notNull (aHeader, "Header");
    ValueEnforcer.notNull (aStatus, "Status");
    m_aHeader = aHeader;
    m_aStatus = aStatus;
  }

  @Nonnull
  public Header getHeader ()
  {
    return m_aHeader;
  }

  @Nonnull
  public Status getStatus ()
  {
    return m_aStatus;
  }

  void setLazyRequires (@Nonnull final Requirement aRequirement, @Nonnull final IVESSpecificDeferredLoader aDeferredLoader)
  {
    ValueEnforcer.notNull (aRequirement, "Requirement");
    ValueEnforcer.notNull (aDeferredLoader, "DeferredLoader");
    if (m_aRequires != null)
      throw new IllegalStateException ("You can only set on Requires element");
    m_aRequires = aRequirement;
    m_aLoadedRequires = null;
    m_aRequiresLoader = aDeferredLoader;
  }

  void setEagerRequires (@Nonnull final Requirement aRequirement, @Nonnull final LoadedVES aLoadedVES)
  {
    ValueEnforcer.notNull (aRequirement, "Requirement");
    ValueEnforcer.notNull (aLoadedVES, "LoadedVES");
    if (m_aRequires != null)
      throw new IllegalStateException ("You can only set on Requires element");
    m_aRequires = aRequirement;
    m_aLoadedRequires = aLoadedVES;
    m_aRequiresLoader = null;
  }

  public boolean hasExecutor ()
  {
    return m_aExecutor != null;
  }

  @Nullable
  public IValidationExecutor <? extends IValidationSource> getExecutor ()
  {
    return m_aExecutor;
  }

  void setExecutor (@Nullable final IValidationExecutor <? extends IValidationSource> aExecutor)
  {
    m_aExecutor = aExecutor;
  }

  @Nonnull
  private LoadedVES _getLoadedVESRequiresNotNull ()
  {
    LoadedVES ret = m_aLoadedRequires;
    if (ret == null)
    {
      // TODO do something with the error list
      final ErrorList aErrorList = new ErrorList ();
      m_aLoadedRequires = ret = m_aRequiresLoader.deferredLoad (aErrorList);
      if (ret == null)
        throw new IllegalStateException ("Failed to load required VES '" +
                                         m_aRequires.getRequiredVESID ().getAsSingleID () +
                                         "': " +
                                         aErrorList.getAllFailures ());
    }
    return ret;
  }

  @Nonnull
  @ReturnsMutableObject
  private ICommonsList <IValidationExecutor <IValidationSource>> _getValidationExecutorsRecursive ()
  {
    final ICommonsList <IValidationExecutor <IValidationSource>> ret;
    if (m_aRequires == null)
    {
      // We don't have a required, so we're the root
      ret = new CommonsArrayList <> ();
    }
    else
    {
      // Take the one from required
      ret = _getLoadedVESRequiresNotNull ()._getValidationExecutorsRecursive ();
    }
    // Add ours
    ret.add (GenericReflection.uncheckedCast (m_aExecutor));
    return ret;
  }

  private boolean _isRecursivelyValid ()
  {
    // No requirement
    if (m_aRequires == null)
      return m_aStatus.isOverallValid ();

    // Requirement present
    return _getLoadedVESRequiresNotNull ()._isRecursivelyValid () && m_aStatus.isOverallValid ();
  }

  public void applyValidation (@Nonnull final IValidationSource aValidationSource,
                               @Nonnull final ValidationResultList aValidationResultList,
                               @Nonnull final Locale aLocale)
  {
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aLocale, "Locale");

    if (m_aExecutor == null)
      throw new IllegalStateException ("The loaded VES has no Executor Set and can therefore not be used for validating objects");

    final boolean bIsValid = _isRecursivelyValid ();
    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = _getValidationExecutorsRecursive ();

    final IValidationExecutorSet <IValidationSource> aVES = ValidationExecutorSet.create (m_aHeader.getVESID (),
                                                                                          m_aHeader.getName (),
                                                                                          !bIsValid,
                                                                                          aExecutors);

    // Validate
    ValidationExecutionManager.executeValidation (GenericReflection.uncheckedCast (aVES),
                                                  aValidationSource,
                                                  aValidationResultList,
                                                  aLocale);
  }
}
