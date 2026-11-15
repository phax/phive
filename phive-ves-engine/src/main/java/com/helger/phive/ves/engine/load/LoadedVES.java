/*
 * Copyright (C) 2023-2026 Philip Helger (www.helger.com)
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

import javax.xml.xpath.XPathExpression;

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
import com.helger.phive.xml.partial.ValidationExecutorPartial;
import com.helger.phive.xml.schematron.CustomErrorDetails;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.XSDPartialContext;
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

  /**
   * VES that is applied on parts of the validated document only
   *
   * @author Philip Helger
   * @since 12.3.0
   */
  @NotThreadSafe
  public static final class PartialRequiredVES
  {
    private final RequiredVES m_aRequiredVES;
    private final XSDPartialContext m_aPartialContext;
    private final XPathExpression m_aPrerequisiteXPath;
    private IVESSpecificDeferredLoader m_aLoader;
    private LoadedVES m_aLoaded;

    PartialRequiredVES (@NonNull final RequiredVES aRequiredVES,
                        @NonNull final XSDPartialContext aPartialContext,
                        @Nullable final XPathExpression aPrerequisiteXPath)
    {
      ValueEnforcer.notNull (aRequiredVES, "RequiredVES");
      ValueEnforcer.notNull (aPartialContext, "PartialContext");
      m_aRequiredVES = aRequiredVES;
      m_aPartialContext = aPartialContext;
      m_aPrerequisiteXPath = aPrerequisiteXPath;
    }

    /**
     * @return The details of the required VES. Never <code>null</code>.
     */
    @NonNull
    public RequiredVES getRequiredVES ()
    {
      return m_aRequiredVES;
    }

    /**
     * @return The partial context that selects the parts of the document. Never
     *         <code>null</code>.
     */
    @NonNull
    public XSDPartialContext getPartialContext ()
    {
      return m_aPartialContext;
    }

    /**
     * @return The optional prerequisite XPath expression that is evaluated on the complete
     *         document. May be <code>null</code>.
     */
    @Nullable
    public XPathExpression getPrerequisiteXPath ()
    {
      return m_aPrerequisiteXPath;
    }

    @NonNull
    private LoadedVES _getLoadedVESNotNull ()
    {
      LoadedVES ret = m_aLoaded;
      if (ret == null)
      {
        final ErrorList aErrorList = new ErrorList ();
        m_aLoaded = ret = m_aLoader.deferredLoad (aErrorList);
        if (ret == null)
          throw new VESLoadingException ("Failed to load partially required VES '" +
                                         m_aRequiredVES.getRequiredVESID ().getAsSingleID () +
                                         "': " +
                                         aErrorList.getAllFailures ());
      }
      if (ret.getHeader ().getVESSyntax () == EVESSyntax.EDIFACT)
        throw new VESLoadingException ("The partially required VES '" +
                                       m_aRequiredVES.getRequiredVESID ().getAsSingleID () +
                                       "' must be XML based");
      return ret;
    }
  }

  private final Header m_aHeader;
  private final IValidationExecutorSetStatus m_aStatus;
  private RequiredVES m_aRequires;
  private IVESSpecificDeferredLoader m_aRequiresLoader;
  private LoadedVES m_aLoadedRequires;
  private final ICommonsList <PartialRequiredVES> m_aPartialRequires = new CommonsArrayList <> ();
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

  void addLazyPartialRequires (@NonNull final PartialRequiredVES aRequirement,
                               @NonNull final IVESSpecificDeferredLoader aDeferredLoader)
  {
    ValueEnforcer.notNull (aRequirement, "Requirement");
    ValueEnforcer.notNull (aDeferredLoader, "DeferredLoader");
    aRequirement.m_aLoaded = null;
    aRequirement.m_aLoader = aDeferredLoader;
    m_aPartialRequires.add (aRequirement);
  }

  void addEagerPartialRequires (@NonNull final PartialRequiredVES aRequirement, @NonNull final LoadedVES aLoadedVES)
  {
    ValueEnforcer.notNull (aRequirement, "Requirement");
    ValueEnforcer.notNull (aLoadedVES, "LoadedVES");
    aRequirement.m_aLoaded = aLoadedVES;
    aRequirement.m_aLoader = null;
    m_aPartialRequires.add (aRequirement);
  }

  /**
   * @return A copy of all VES that are applied on parts of the validated document only. Never
   *         <code>null</code> but maybe empty.
   * @since 12.3.0
   */
  @NonNull
  @ReturnsMutableCopy
  public ICommonsList <PartialRequiredVES> getAllPartialRequires ()
  {
    return m_aPartialRequires.getClone ();
  }

  /**
   * @return <code>true</code> if a validation executor is present, <code>false</code> if not.
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

    // Add the executors of the partially required VES, applied on the parts only
    for (final PartialRequiredVES aPartialRequires : m_aPartialRequires)
      for (final IValidationExecutor <IValidationSource> aExecutor : aPartialRequires._getLoadedVESNotNull ()
                                                                                     ._getValidationExecutorsRecursive ())
      {
        final IValidationExecutor <IValidationSourceXML> aExecutorXML = GenericReflection.uncheckedCast (aExecutor);
        ret.add (GenericReflection.uncheckedCast (new ValidationExecutorPartial (aExecutorXML,
                                                                                 aPartialRequires.getPartialContext (),
                                                                                 aPartialRequires.getPrerequisiteXPath ())));
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

    // Requirement present
    if (m_aRequires != null)
    {
      final EValidationExecutorStatusType eRequires = _getLoadedVESRequiresNotNull ().getExecutorStatusType ();
      if (!eRequires.isValid ())
        return eRequires;
    }

    // Partial requirements present
    for (final PartialRequiredVES aPartialRequires : m_aPartialRequires)
    {
      final EValidationExecutorStatusType ePartialRequires = aPartialRequires._getLoadedVESNotNull ()
                                                                             .getExecutorStatusType ();
      if (!ePartialRequires.isValid ())
        return ePartialRequires;
    }

    return EValidationExecutorStatusType.VALID;
  }

  /**
   * @return A new {@link IValidationExecutorSet} that can be used to perform validation. Never
   *         <code>null</code>.
   * @since 12.1.0
   */
  @NonNull
  public IValidationExecutorSet <IValidationSource> createVES ()
  {
    if (!hasExecutor ())
      throw new VESLoadingException ("The loaded VES has no Executor and can therefore not be used for validating objects");

    // Build executors
    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = _getValidationExecutorsRecursive ();

    // Assemble VES
    return ValidationExecutorSet.create (m_aHeader.getVESID (), m_aHeader.getName (), m_aStatus, aExecutors);
  }

  public void applyValidation (@NonNull final IValidationSource aValidationSource,
                               @NonNull final ValidationResultList aValidationResultList,
                               @NonNull final Locale aLocale)
  {
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aLocale, "Locale");

    // Assemble VES
    final IValidationExecutorSet <IValidationSource> aVES = createVES ();

    // Validate
    ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                  GenericReflection.uncheckedCast (aVES),
                                                  aValidationSource,
                                                  aValidationResultList,
                                                  aLocale);
  }
}
