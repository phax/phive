/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.schematron;

import java.util.Map;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.base.builder.IBuilder;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.collection.commons.CommonsHashMap;
import com.helger.collection.commons.ICommonsMap;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.execute.IValidationExecutorCacheSupport;
import com.helger.xml.namespace.IIterableNamespaceContext;

/**
 * Builder class for {@link ValidationExecutorSchematron}. This builder provides a fluent API to
 * configure all parameters including those for the underlying {@link ValidationArtefact}.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSchematronBuilder implements IBuilder <ValidationExecutorSchematron>
{
  private IValidationType m_aValidationType;
  private IReadableResource m_aResource;
  private String m_sPrerequisiteXPath;
  private IIterableNamespaceContext m_aNamespaceContext;
  private boolean m_bCacheSchematron = IValidationExecutorCacheSupport.DEFAULT_CACHE;
  private boolean m_bStopValidationOnError;
  private boolean m_bStopValidationOnErrorSet;
  private ICommonsMap <String, CustomErrorDetails> m_aCustomErrorDetails;

  public ValidationExecutorSchematronBuilder ()
  {}

  /**
   * Copy constructor from an existing {@link ValidationExecutorSchematron}.
   *
   * @param aSrc
   *        The source executor to copy from. May not be <code>null</code>.
   */
  public ValidationExecutorSchematronBuilder (@NonNull final ValidationExecutorSchematron aSrc)
  {
    ValueEnforcer.notNull (aSrc, "Src");
    m_aValidationType = aSrc.getValidationArtefact ().getValidationType ();
    m_aResource = aSrc.getValidationArtefact ().getRuleResource ();
    m_sPrerequisiteXPath = aSrc.getPrerequisiteXPath ();
    m_aNamespaceContext = aSrc.getNamespaceContext ();
    m_bCacheSchematron = aSrc.isCacheArtefact ();
    m_bStopValidationOnError = aSrc.isStopValidationOnError ();
    m_bStopValidationOnErrorSet = true;
  }

  /**
   * Set the validation type. Must be a Schematron-based type.
   *
   * @param a
   *        The validation type to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder validationType (@NonNull final IValidationType a)
  {
    ValueEnforcer.notNull (a, "ValidationType");
    m_aValidationType = a;
    return this;
  }

  /**
   * Set the resource containing the Schematron rules.
   *
   * @param a
   *        The resource to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder resource (@NonNull final IReadableResource a)
  {
    ValueEnforcer.notNull (a, "Resource");
    m_aResource = a;
    return this;
  }

  /**
   * Set the optional prerequisite XPath expression that needs to evaluate to <code>true</code>
   * before the Schematron is applied.
   *
   * @param s
   *        The XPath expression. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder prerequisiteXPath (@Nullable final String s)
  {
    m_sPrerequisiteXPath = s;
    return this;
  }

  /**
   * Set the optional namespace context for nice error messages.
   *
   * @param a
   *        The namespace context. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder namespaceContext (@Nullable final IIterableNamespaceContext a)
  {
    m_aNamespaceContext = a;
    return this;
  }

  /**
   * Set whether to cache the compiled Schematron. Defaults to
   * {@link IValidationExecutorCacheSupport#DEFAULT_CACHE}.
   *
   * @param b
   *        <code>true</code> to cache, <code>false</code> to not cache.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder cacheSchematron (final boolean b)
  {
    m_bCacheSchematron = b;
    return this;
  }

  /**
   * Set whether to stop validation on error. If not explicitly set, the default from the validation
   * type is used.
   *
   * @param b
   *        <code>true</code> to stop on error, <code>false</code> to continue.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder stopValidationOnError (final boolean b)
  {
    m_bStopValidationOnError = b;
    m_bStopValidationOnErrorSet = true;
    return this;
  }

  /**
   * Add a single custom error detail that overrides the error level defined in the Schematron.
   *
   * @param sErrorID
   *        The error ID, must match the Schematron assertion ID. May neither be <code>null</code>
   *        nor empty.
   * @param aErrorDetails
   *        The new error details to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder customErrorDetail (@NonNull @Nonempty final String sErrorID,
                                                                @NonNull final CustomErrorDetails aErrorDetails)
  {
    ValueEnforcer.notEmpty (sErrorID, "ErrorID");
    ValueEnforcer.notNull (aErrorDetails, "ErrorDetails");
    if (m_aCustomErrorDetails == null)
      m_aCustomErrorDetails = new CommonsHashMap <> ();
    m_aCustomErrorDetails.put (sErrorID, aErrorDetails);
    return this;
  }

  /**
   * Add multiple custom error details that override the error levels defined in the Schematron.
   *
   * @param aCustomErrorDetails
   *        The map from error ID to error details. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorSchematronBuilder customErrorDetails (@Nullable final Map <String, ? extends CustomErrorDetails> aCustomErrorDetails)
  {
    if (aCustomErrorDetails != null && !aCustomErrorDetails.isEmpty ())
    {
      if (m_aCustomErrorDetails == null)
        m_aCustomErrorDetails = new CommonsHashMap <> ();
      m_aCustomErrorDetails.putAll (aCustomErrorDetails);
    }
    return this;
  }

  @NonNull
  public ValidationExecutorSchematron build ()
  {
    if (m_aValidationType == null)
      throw new IllegalStateException ("Validation type is missing");
    if (m_aResource == null)
      throw new IllegalStateException ("Resource is missing");

    final ValidationExecutorSchematron ret = new ValidationExecutorSchematron (new ValidationArtefact (m_aValidationType,
                                                                                                       m_aResource),
                                                                               m_sPrerequisiteXPath,
                                                                               m_aNamespaceContext);
    ret.setCacheArtefact (m_bCacheSchematron);
    if (m_bStopValidationOnErrorSet)
      ret.setStopValidationOnError (m_bStopValidationOnError);
    if (m_aCustomErrorDetails != null)
      ret.addCustomErrorDetails (m_aCustomErrorDetails);
    return ret;
  }

  /**
   * Create a new builder with the validation type set to {@link EValidationType#SCHEMATRON_PURE}.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be <code>null</code>.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorSchematronBuilder pure (@NonNull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_PURE).resource (aRes);
  }

  /**
   * Create a new builder with the validation type set to
   * {@link EValidationType#SCHEMATRON_SCH_ISO_XSLT2}.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be <code>null</code>.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorSchematronBuilder schIso (@NonNull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_SCH_ISO_XSLT2)
                                                     .resource (aRes);
  }

  /**
   * Create a new builder with the validation type set to
   * {@link EValidationType#SCHEMATRON_SCHXSLT1_XSLT2}.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be <code>null</code>.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorSchematronBuilder schXslt1 (@NonNull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_SCHXSLT1_XSLT2)
                                                     .resource (aRes);
  }

  /**
   * Create a new builder with the validation type set to
   * {@link EValidationType#SCHEMATRON_SCHXSLT2_XSLT3}.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be <code>null</code>.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorSchematronBuilder schXslt2 (@NonNull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_SCHXSLT2_XSLT3)
                                                     .resource (aRes);
  }

  /**
   * Create a new builder with the validation type set to {@link EValidationType#SCHEMATRON_XSLT2}.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be <code>null</code>.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorSchematronBuilder xslt2 (@NonNull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_XSLT2).resource (aRes);
  }

  /**
   * Create a new builder with the validation type set to {@link EValidationType#SCHEMATRON_OIOUBL}.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be <code>null</code>.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorSchematronBuilder oioubl (@NonNull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematronBuilder ().validationType (EValidationType.SCHEMATRON_OIOUBL)
                                                     .resource (aRes);
  }
}
