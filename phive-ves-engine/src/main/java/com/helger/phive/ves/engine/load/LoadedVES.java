/*
 * Copyright (C) 2023-2025 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.phive.ves.engine.load;

import java.util.Collection;
import java.util.Locale;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.annotation.concurrent.Immutable;
import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.annotation.style.ReturnsMutableObject;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.reflection.GenericReflection;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.CommonsTreeMap;
import com.helger.collection.commons.ICommonsList;
import com.helger.collection.commons.ICommonsMap;
import com.helger.datetime.xml.XMLOffsetDate;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.status.EValidationExecutorStatusType;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.validity.IValidityDeterminator;
import com.helger.phive.ves.model.v1.EVESSyntax;
import com.helger.phive.xml.schematron.CustomErrorDetails;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * This class represents a single Loaded VES.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public final class LoadedVES
{
  @Immutable
  public static final class Header
  {
    private final DVRCoordinate m_aVESID;
    private final String m_sName;
    private final XMLOffsetDate m_aReleased;
    private final EVESSyntax m_eVESSyntax;

    Header (@NonNull final DVRCoordinate aVESID,
            @NonNull @Nonempty final String sName,
            @Nullable final XMLOffsetDate aReleased,
            @NonNull final EVESSyntax eVESSyntax)
    {
      ValueEnforcer.notNull (aVESID, "VESID");
      ValueEnforcer.notEmpty (sName, "Name");
      ValueEnforcer.notNull (eVESSyntax, "VESSyntax");
      m_aVESID = aVESID;
      m_sName = sName;
      m_aReleased = aReleased;
      m_eVESSyntax = eVESSyntax;
    }

    @NonNull
    public DVRCoordinate getVESID ()
    {
      return m_aVESID;
    }

    @NonNull
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

    @NonNull
    public EVESSyntax getVESSyntax ()
    {
      return m_eVESSyntax;
    }
  }

  /**
   * Output processing specific settings
   *
   * @author Philip Helger
   */
  @NotThreadSafe
  public static final class OutputType
  {
    private final ICommonsMap <String, CustomErrorDetails> m_aCustomErrorDetails = new CommonsTreeMap <> ();

    public void addCustomErrorLevel (@NonNull final String sID, @NonNull final CustomErrorDetails aErrorDetail)
    {
      ValueEnforcer.notNull (sID, "ID");
      ValueEnforcer.notNull (aErrorDetail, "ErrorDetail");

      m_aCustomErrorDetails.put (sID, aErrorDetail);
    }

    @NonNull
    @ReturnsMutableCopy
    public ICommonsMap <String, CustomErrorDetails> getAllCustomErrorDetails ()
    {
      return m_aCustomErrorDetails.getClone ();
    }

    @NonNull
    @ReturnsMutableObject
    public ICommonsMap <String, CustomErrorDetails> customErrorDetails ()
    {
      return m_aCustomErrorDetails;
    }
  }

  /**
   * Required VES for this VES
   *
   * @author Philip Helger
   */
  @NotThreadSafe
  public static final class RequiredVES
  {
    private final DVRCoordinate m_aRequiredVESID;
    private final MapBasedNamespaceContext m_aNSCtx;
    private final OutputType m_aOutput;
    private final boolean m_bStopOnError;

    RequiredVES (@NonNull final DVRCoordinate aRequiredVESID,
                 @NonNull final MapBasedNamespaceContext aNSCtx,
                 @NonNull final OutputType aOutput,
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

    @NonNull
    public DVRCoordinate getRequiredVESID ()
    {
      return m_aRequiredVESID;
    }

    @NonNull
    public MapBasedNamespaceContext getNamespaceContext ()
    {
      return m_aNSCtx;
    }

    @NonNull
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
  private final IValidationExecutorSetStatus m_aStatus;
  private RequiredVES m_aRequires;
  private IVESSpecificDeferredLoader m_aRequiresLoader;
  private LoadedVES m_aLoadedRequires;
  private final ICommonsList <IValidationExecutor <? extends IValidationSource>> m_aExecutors = new CommonsArrayList <> ();

  LoadedVES (@NonNull final Header aHeader, @NonNull final IValidationExecutorSetStatus aStatus)
  {
    ValueEnforcer.notNull (aHeader, "Header");
    ValueEnforcer.notNull (aStatus, "Status");
    m_aHeader = aHeader;
    m_aStatus = aStatus;
  }

  /**
   * @return The header of the loaded VES. Never <code>null</code>.
   */
  @NonNull
  public Header getHeader ()
  {
    return m_aHeader;
  }

  /**
   * @return The status information of the loaded VES. Never <code>null</code>.
   */
  @NonNull
  public IValidationExecutorSetStatus getStatus ()
  {
    return m_aStatus;
  }

  void setLazyRequires (@NonNull final RequiredVES aRequirement,
                        @NonNull final IVESSpecificDeferredLoader aDeferredLoader)
  {
    ValueEnforcer.notNull (aRequirement, "Requirement");
    ValueEnforcer.notNull (aDeferredLoader, "DeferredLoader");
    if (m_aRequires != null)
      throw new IllegalStateException ("You can only set on Requires element");
    m_aRequires = aRequirement;
    m_aLoadedRequires = null;
    m_aRequiresLoader = aDeferredLoader;
  }

  void setEagerRequires (@NonNull final RequiredVES aRequirement, @NonNull final LoadedVES aLoadedVES)
  {
    ValueEnforcer.notNull (aRequirement, "Requirement");
    ValueEnforcer.notNull (aLoadedVES, "LoadedVES");
    if (m_aRequires != null)
      throw new IllegalStateException ("You can only set on Requires element");
    m_aRequires = aRequirement;
    m_aLoadedRequires = aLoadedVES;
    m_aRequiresLoader = null;
  }

  /**
   * @return <code>true</code> if a validation executor is present,
   *         <code>false</code> if not.
   */
  public boolean hasExecutor ()
  {
    return m_aExecutors.isNotEmpty ();
  }

  void addExecutor (@Nullable final IValidationExecutor <? extends IValidationSource> aExecutor)
  {
    if (aExecutor != null)
      m_aExecutors.add (aExecutor);
  }

  void addExecutors (@Nullable final Collection <? extends IValidationExecutor <? extends IValidationSource>> aExecutors)
  {
    if (aExecutors != null)
      for (final IValidationExecutor <? extends IValidationSource> aExecutor : aExecutors)
        addExecutor (aExecutor);
  }

  @NonNull
  private LoadedVES _getLoadedVESRequiresNotNull ()
  {
    LoadedVES ret = m_aLoadedRequires;
    if (ret == null)
    {
      // TODO do something better with the error list
      final ErrorList aErrorList = new ErrorList ();
      m_aLoadedRequires = ret = m_aRequiresLoader.deferredLoad (aErrorList);
      if (ret == null)
        throw new VESLoadingException ("Failed to load required VES '" +
                                       m_aRequires.getRequiredVESID ().getAsSingleID () +
                                       "': " +
                                       aErrorList.getAllFailures ());
    }
    return ret;
  }

  @NonNull
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

    // Add our executors
    for (final IValidationExecutor <?> aExecutor : m_aExecutors)
      ret.add (GenericReflection.uncheckedCast (aExecutor));
    return ret;
  }

  @NonNull
  public EValidationExecutorStatusType getExecutorStatusType ()
  {
    // Local status first, because in case of failure, this is a quicker break
    final EValidationExecutorStatusType ret = m_aStatus.getType ();
    if (!ret.isValid ())
      return ret;

    // No requirement
    if (m_aRequires == null)
      return EValidationExecutorStatusType.VALID;

    // Requirement present
    return _getLoadedVESRequiresNotNull ().getExecutorStatusType ();
  }

  public void applyValidation (@NonNull final IValidationSource aValidationSource,
                               @NonNull final ValidationResultList aValidationResultList,
                               @NonNull final Locale aLocale)
  {
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aLocale, "Locale");

    if (!hasExecutor ())
      throw new VESLoadingException ("The loaded VES has no Executor and can therefore not be used for validating objects");

    // Build executors
    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = _getValidationExecutorsRecursive ();

    // Assemble VES
    final IValidationExecutorSet <IValidationSource> aVES = ValidationExecutorSet.create (m_aHeader.getVESID (),
                                                                                          m_aHeader.getName (),
                                                                                          m_aStatus,
                                                                                          aExecutors);

    // Validate
    ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                  GenericReflection.uncheckedCast (aVES),
                                                  aValidationSource,
                                                  aValidationResultList,
                                                  aLocale);
  }
}
