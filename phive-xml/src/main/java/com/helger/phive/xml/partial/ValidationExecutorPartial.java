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
package com.helger.phive.xml.partial;

import java.util.Locale;

import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.w3c.dom.NodeList;

import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.hashcode.HashCodeGenerator;
import com.helger.base.timing.StopWatch;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.phive.api.executor.AbstractValidationExecutor;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.validity.IValidityDeterminator;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.phive.xml.xsd.XSDPartialContext;

/**
 * A generic validation executor that applies another (wrapped) executor not on the source document
 * itself, but on parts of it. The parts are selected via the XPath expression of a
 * {@link XSDPartialContext} and each matching node is passed as a partial source (see
 * {@link ValidationSourceXML#createPartial(String, org.w3c.dom.Node)}) to the wrapped executor.
 * Partial sources are converted into a standalone document before XSLT based validation, so that
 * Schematron rules with absolute contexts (like <code>/ubl:Invoice</code>) work on the selected
 * part as if it was the document root.
 * <p>
 * Typical use case: validate the business document contained in an envelope (like the SBDH) with
 * the existing XML Schema and Schematron executors of that business document.
 * <p>
 * Optionally a prerequisite XPath expression can be provided, that is evaluated against the
 * complete source document. If it does not evaluate to <code>true</code>, the validation is
 * skipped.
 * <p>
 * The validation artefact and the "stop validation on error" setting are taken from the wrapped
 * executor, so that the validation results look like the ones of the wrapped executor.
 *
 * @author Philip Helger
 * @since 12.3.0
 */
public class ValidationExecutorPartial extends
                                       AbstractValidationExecutor <IValidationSourceXML, ValidationExecutorPartial>
{
  private final IValidationExecutor <IValidationSourceXML> m_aWrappedExecutor;
  private final XSDPartialContext m_aPartialContext;
  private final XPathExpression m_aPrerequisiteXPath;

  /**
   * Constructor
   *
   * @param aWrappedExecutor
   *        The executor to be applied on each matching part. May not be <code>null</code>.
   * @param aPartialContext
   *        The partial context that defines the rules for finding the parts to validate. May not be
   *        <code>null</code>.
   * @param aPrerequisiteXPath
   *        The optional prerequisite XPath expression that must evaluate to <code>true</code> on
   *        the complete source document for the validation to be performed. May be
   *        <code>null</code>.
   */
  public ValidationExecutorPartial (@NonNull final IValidationExecutor <IValidationSourceXML> aWrappedExecutor,
                                    @NonNull final XSDPartialContext aPartialContext,
                                    @Nullable final XPathExpression aPrerequisiteXPath)
  {
    super (ValueEnforcer.notNull (aWrappedExecutor, "WrappedExecutor").getValidationArtefact ());
    ValueEnforcer.notNull (aPartialContext, "PartialContext");

    m_aWrappedExecutor = aWrappedExecutor;
    m_aPartialContext = aPartialContext;
    m_aPrerequisiteXPath = aPrerequisiteXPath;
    setStopValidationOnError (aWrappedExecutor.isStopValidationOnError ());
  }

  /**
   * @return The executor applied on each matching part. Never <code>null</code>.
   */
  @NonNull
  public final IValidationExecutor <IValidationSourceXML> getWrappedExecutor ()
  {
    return m_aWrappedExecutor;
  }

  /**
   * @return The partial context used to select the parts. Never <code>null</code>.
   */
  @NonNull
  public final XSDPartialContext getContext ()
  {
    return m_aPartialContext;
  }

  /**
   * @return The optional prerequisite XPath expression. May be <code>null</code>.
   */
  @Nullable
  public final XPathExpression getPrerequisiteXPath ()
  {
    return m_aPrerequisiteXPath;
  }

  @NonNull
  public ValidationResult applyValidation (@NonNull final IValidationSourceXML aSource,
                                           @NonNull final IValidityDeterminator <IValidationSourceXML> aValidityDeterminator,
                                           @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");

    final StopWatch aSW = StopWatch.createdStarted ();

    if (m_aPrerequisiteXPath != null)
    {
      final Boolean aPrereqResult;
      try
      {
        aPrereqResult = (Boolean) m_aPrerequisiteXPath.evaluate (aSource.getNode (), XPathConstants.BOOLEAN);
      }
      catch (final XPathExpressionException ex)
      {
        throw new IllegalStateException (ex);
      }
      if (!aPrereqResult.booleanValue ())
      {
        // Prerequisite not fulfilled - nothing to validate
        return ValidationResult.createSkippedResult (getValidationArtefact ());
      }
    }

    final NodeList aNodeSet;
    try
    {
      aNodeSet = (NodeList) m_aPartialContext.getXPathExpression ()
                                             .evaluate (aSource.getNode (), XPathConstants.NODESET);
    }
    catch (final XPathExpressionException ex)
    {
      throw new IllegalStateException (ex);
    }
    final ErrorList aErrorList = new ErrorList ();
    final int nMatchingNodes = aNodeSet.getLength ();

    if (m_aPartialContext.hasMinNodeCount ())
      if (nMatchingNodes < m_aPartialContext.getMinNodeCount ())
      {
        // Too little matches found
        aErrorList.add (SingleError.builderFatalError ()
                                   .errorLocation (getValidationArtefact ().getRuleResourcePath ())
                                   .errorText ("The minimum number of result nodes (" +
                                               m_aPartialContext.getMinNodeCount () +
                                               ") is not met")
                                   .build ());
      }
    if (m_aPartialContext.hasMaxNodeCount ())
      if (nMatchingNodes > m_aPartialContext.getMaxNodeCount ())
      {
        // Too many matches found
        aErrorList.add (SingleError.builderFatalError ()
                                   .errorLocation (getValidationArtefact ().getRuleResourcePath ())
                                   .errorText ("The maximum number of result nodes (" +
                                               m_aPartialContext.getMaxNodeCount () +
                                               ") is not met")
                                   .build ());
      }

    for (int i = 0; i < nMatchingNodes; ++i)
    {
      // Apply the wrapped executor on each part separately
      final IValidationSourceXML aPartialSource = ValidationSourceXML.createPartial (aSource.getSystemID (),
                                                                                     aNodeSet.item (i));
      final ValidationResult aPartialResult = m_aWrappedExecutor.applyValidation (aPartialSource,
                                                                                  aValidityDeterminator,
                                                                                  aLocale);
      aErrorList.addAll (aPartialResult.getErrorList ());
    }

    // Build result object
    return createValidationResult (aErrorList,
                                   aValidityDeterminator.getValidity (this, aErrorList),
                                   aSW.stopAndGetDuration ());
  }

  @NonNull
  @ReturnsMutableCopy
  public ValidationExecutorPartial getClone ()
  {
    final ValidationExecutorPartial ret = new ValidationExecutorPartial (m_aWrappedExecutor.getClone (),
                                                                         m_aPartialContext,
                                                                         m_aPrerequisiteXPath);
    ret.setStopValidationOnError (isStopValidationOnError ());
    return ret;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (!super.equals (o))
      return false;
    final ValidationExecutorPartial rhs = (ValidationExecutorPartial) o;
    return m_aWrappedExecutor.equals (rhs.m_aWrappedExecutor);
  }

  @Override
  public int hashCode ()
  {
    return HashCodeGenerator.getDerived (super.hashCode ()).append (m_aWrappedExecutor).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ())
                            .append ("WrappedExecutor", m_aWrappedExecutor)
                            .append ("PartialContext", m_aPartialContext)
                            .append ("PrerequisiteXPath", m_aPrerequisiteXPath)
                            .getToString ();
  }

  /**
   * Create a new instance without a prerequisite.
   *
   * @param aWrappedExecutor
   *        The executor to be applied on each matching part. May not be <code>null</code>.
   * @param aPartialContext
   *        The partial context that defines the rules for finding the parts to validate. May not be
   *        <code>null</code>.
   * @return The new executor and never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorPartial create (@NonNull final IValidationExecutor <IValidationSourceXML> aWrappedExecutor,
                                                  @NonNull final XSDPartialContext aPartialContext)
  {
    return new ValidationExecutorPartial (aWrappedExecutor, aPartialContext, null);
  }
}
