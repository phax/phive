/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.xsd;

import java.util.List;
import java.util.Locale;
import java.util.function.Supplier;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.validation.Schema;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.NodeList;
import org.xml.sax.SAXParseException;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.executor.AbstractValidationExecutor;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.xml.sax.AbstractSAXErrorHandler;
import com.helger.xml.schema.XMLSchemaCache;
import com.helger.xml.schema.XMLSchemaValidationHelper;

/**
 * Implementation of {@link AbstractValidationExecutor} for XML Schema
 * validation of parts of a source document.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSDPartial extends
                                          AbstractValidationExecutor <IValidationSourceXML, ValidationExecutorXSDPartial>
{
  private final Supplier <? extends Schema> m_aSchemaProvider;
  private final XSDPartialContext m_aPartialContext;

  /**
   * Constructor
   *
   * @param aValidationArtefact
   *        The validation artefact to use. May not be <code>null</code>.
   * @param aSchemaProvider
   *        The XML Schema provider to use. May not be <code>null</code>.
   * @param aPartialContext
   *        The partial context that defines the rules for finding the correct
   *        nodes to validate. May not be <code>null</code>.
   * @since 6.0.4
   */
  public ValidationExecutorXSDPartial (@Nonnull final IValidationArtefact aValidationArtefact,
                                       @Nonnull final Supplier <? extends Schema> aSchemaProvider,
                                       @Nonnull final XSDPartialContext aPartialContext)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue ( () -> aValidationArtefact.getValidationType ().getBaseType ().isXSD (),
                           "Artifact is not an XSD");
    ValueEnforcer.isTrue ( () -> aValidationArtefact.getValidationType ().isContextRequired (),
                           "Artifact must require a validation context");
    ValueEnforcer.notNull (aSchemaProvider, "SchemaProvider");
    ValueEnforcer.notNull (aPartialContext, "PartialContext");

    m_aSchemaProvider = aSchemaProvider;
    m_aPartialContext = aPartialContext;

    // By default, if an error occurs in an XSD, we don't continue with further
    // validation layers
    setStopValidationOnError (true);
  }

  /**
   * @return The partial execution context as provided in the constructor. May
   *         not be <code>null</code>.
   */
  @Nonnull
  public final XSDPartialContext getContext ()
  {
    return m_aPartialContext;
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull final IValidationSourceXML aSource, @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");

    final IValidationArtefact aVA = getValidationArtefact ();

    NodeList aNodeSet;
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
                                   .errorLocation (aVA.getRuleResourcePath ())
                                   .errorText ("The minimum number of result nodes (" +
                                               m_aPartialContext.getMinNodeCount () +
                                               ") is not met")
                                   .build ());
      }
    if (m_aPartialContext.hasMaxNodeCount ())
      if (nMatchingNodes > m_aPartialContext.getMaxNodeCount ())
      {
        // Too little matches found
        aErrorList.add (SingleError.builderFatalError ()
                                   .errorLocation (aVA.getRuleResourcePath ())
                                   .errorText ("The maximum number of result nodes (" +
                                               m_aPartialContext.getMaxNodeCount () +
                                               ") is not met")
                                   .build ());
      }

    if (nMatchingNodes == 0)
    {
      // No match found - nothing to do
      return createValidationResult (aErrorList);
    }
    // Find the XML schema required for validation
    // as we don't have a node, we need to trust the implementation class
    final Schema aSchema = m_aSchemaProvider.get ();
    assert aSchema != null;

    for (int i = 0; i < aNodeSet.getLength (); ++i)
    {
      // Build a partial source
      final IValidationSourceXML aRealSource = new ValidationSourceXML (aSource.getSystemID (),
                                                                        aNodeSet.item (i),
                                                                        true);

      try
      {
        // Apply the XML schema validation
        XMLSchemaValidationHelper.validate (aSchema, aRealSource.getAsTransformSource (), aErrorList, aLocale);
      }
      catch (final IllegalArgumentException ex)
      {
        // Happens when non-XML document is trying to be parsed
        if (ex.getCause () instanceof SAXParseException)
        {
          aErrorList.add (AbstractSAXErrorHandler.getSaxParseError (EErrorLevel.FATAL_ERROR,
                                                                    (SAXParseException) ex.getCause ()));
        }
        else
        {
          aErrorList.add (SingleError.builderFatalError ()
                                     .errorLocation (aVA.getRuleResourcePath ())
                                     .errorFieldName ("Context[" + i + "]")
                                     .errorText ("The document to be validated is not an XML document")
                                     .linkedException (ex)
                                     .build ());
        }
      }
    }
    // Build result object
    return createValidationResult (aErrorList.getAllFailures ());
  }

  @Nonnull
  @ReturnsMutableCopy
  public ValidationExecutorXSDPartial getClone ()
  {
    final ValidationExecutorXSDPartial ret = new ValidationExecutorXSDPartial (getValidationArtefact (),
                                                                               m_aSchemaProvider,
                                                                               m_aPartialContext);
    ret.setStopValidationOnError (isStopValidationOnError ());
    return ret;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    return super.equals (o);
  }

  @Override
  public int hashCode ()
  {
    return super.hashCode ();
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ())
                            .append ("SchemaProvider", m_aSchemaProvider)
                            .append ("PartialContext", m_aPartialContext)
                            .getToString ();
  }

  /**
   * Create a new instance based on a single standalone XSD
   *
   * @param aXSDRes
   *        The XSD resource to use. May not be <code>null</code>.
   * @param aPartialContext
   *        The partial context that defines the rules for finding the correct
   *        nodes to validate. May not be <code>null</code>.
   * @return A new validator that uses the supplied resource for the filename
   *         and uses {@link XMLSchemaCache} to resolve the XML Schema object.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorXSDPartial create (@Nonnull final IReadableResource aXSDRes,
                                                     @Nonnull final XSDPartialContext aPartialContext)
  {
    ValueEnforcer.notNull (aXSDRes, "XSDRes");
    return new ValidationExecutorXSDPartial (new ValidationArtefact (EValidationType.XSD, aXSDRes),
                                             () -> XMLSchemaCache.getInstance ().getSchema (aXSDRes),
                                             aPartialContext);
  }

  /**
   * Create a new instance based on one or more XSDs
   *
   * @param aXSDRes
   *        The XSD resources to use. May neither be <code>null</code> nor
   *        empty.
   * @param aPartialContext
   *        The partial context that defines the rules for finding the correct
   *        nodes to validate. May not be <code>null</code>.
   * @return A new validator that uses the last resource for the filename uses
   *         {@link XMLSchemaCache} to resolve the XML Schema object.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorXSDPartial create (@Nonnull @Nonempty final List <? extends IReadableResource> aXSDRes,
                                                     @Nonnull final XSDPartialContext aPartialContext)
  {
    ValueEnforcer.notEmptyNoNullValue (aXSDRes, "XSDRes");

    // The last one is the important one for the name
    return new ValidationExecutorXSDPartial (new ValidationArtefact (EValidationType.PARTIAL_XSD,
                                                                     aXSDRes.get (aXSDRes.size () - 1)),
                                             () -> XMLSchemaCache.getInstance ().getSchema (aXSDRes),
                                             aPartialContext);
  }
}
