/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.engine.xsd;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.validation.Schema;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.NodeList;
import org.xml.sax.SAXParseException;

import com.helger.bdve.api.artefact.IValidationArtefact;
import com.helger.bdve.api.execute.AbstractValidationExecutor;
import com.helger.bdve.api.execute.IValidationExecutor;
import com.helger.bdve.api.result.ValidationResult;
import com.helger.bdve.engine.source.IValidationSourceXML;
import com.helger.bdve.engine.source.ValidationSourceXML;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.location.SimpleLocation;
import com.helger.xml.sax.AbstractSAXErrorHandler;
import com.helger.xml.schema.XMLSchemaCache;
import com.helger.xml.schema.XMLSchemaValidationHelper;

/**
 * Implementation of {@link IValidationExecutor} for XML Schema validation of
 * parts of a source document.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSDPartial extends AbstractValidationExecutor <IValidationSourceXML, ValidationExecutorXSDPartial>
{
  private final XSDPartialContext m_aContext;

  public ValidationExecutorXSDPartial (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final XSDPartialContext aContext)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().isXSD (), "Artifact is not an XSD");
    m_aContext = ValueEnforcer.notNull (aContext, "Context");
  }

  @Nonnull
  public final XSDPartialContext getContext ()
  {
    return m_aContext;
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull final IValidationSourceXML aSource, @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");

    final IValidationArtefact aVA = getValidationArtefact ();

    NodeList aNodeSet;
    try
    {
      aNodeSet = (NodeList) m_aContext.getXPathExpression ().evaluate (aSource.getNode (), XPathConstants.NODESET);
    }
    catch (final XPathExpressionException ex)
    {
      throw new IllegalStateException (ex);
    }

    final ErrorList aErrorList = new ErrorList ();
    final int nMatchingNodes = aNodeSet.getLength ();

    if (m_aContext.hasMinNodeCount ())
      if (nMatchingNodes < m_aContext.getMinNodeCount ())
      {
        // Too little matches found
        aErrorList.add (SingleError.builderFatalError ()
                                   .setErrorLocation (new SimpleLocation (aVA.getRuleResource ().getPath ()))
                                   .setErrorText ("The minimum number of result nodes (" + m_aContext.getMinNodeCount () + ") is not met")
                                   .build ());
      }
    if (m_aContext.hasMaxNodeCount ())
      if (nMatchingNodes > m_aContext.getMaxNodeCount ())
      {
        // Too little matches found
        aErrorList.add (SingleError.builderFatalError ()
                                   .setErrorLocation (new SimpleLocation (aVA.getRuleResource ().getPath ()))
                                   .setErrorText ("The maximum number of result nodes (" + m_aContext.getMaxNodeCount () + ") is not met")
                                   .build ());
      }

    if (nMatchingNodes == 0)
    {
      // No match found - nothing to do
      return new ValidationResult (aVA, aErrorList);
    }

    // Find the XML schema required for validation
    // as we don't have a node, we need to trust the implementation class
    final Schema aSchema = XMLSchemaCache.getInstance ().getSchema (aVA.getRuleResource ());
    assert aSchema != null;

    for (int i = 0; i < aNodeSet.getLength (); ++i)
    {
      // Build a partial source
      final IValidationSourceXML aRealSource = new ValidationSourceXML (aSource.getSystemID (), aNodeSet.item (i), true);

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
          aErrorList.add (AbstractSAXErrorHandler.getSaxParseError (EErrorLevel.FATAL_ERROR, (SAXParseException) ex.getCause ()));
        }
        else
        {
          aErrorList.add (SingleError.builderFatalError ()
                                     .setErrorLocation (new SimpleLocation (aVA.getRuleResource ().getPath ()))
                                     .setErrorFieldName ("Context[" + i + "]")
                                     .setErrorText ("The document to be validated is not an XML document")
                                     .setLinkedException (ex)
                                     .build ());
        }
      }
    }

    // Build result object
    return new ValidationResult (aVA, aErrorList.getAllFailures ());
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
}
