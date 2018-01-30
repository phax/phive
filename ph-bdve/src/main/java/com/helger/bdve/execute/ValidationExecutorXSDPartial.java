/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.execute;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.validation.Schema;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.NodeList;
import org.xml.sax.SAXParseException;

import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.result.ValidationResult;
import com.helger.bdve.source.IValidationSource;
import com.helger.bdve.source.ValidationSource;
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
public class ValidationExecutorXSDPartial extends AbstractValidationExecutor
{
  public static final class ContextData
  {
    private final XPathExpression m_aXE;
    private final Integer m_aMinNodeCount;
    private final Integer m_aMaxNodeCount;

    public ContextData (@Nonnull final XPathExpression aXE,
                        @Nullable final Integer aMinNodeCount,
                        @Nullable final Integer aMaxNodeCount)
    {
      ValueEnforcer.notNull (aXE, "XPathExpression");
      m_aXE = aXE;
      m_aMinNodeCount = aMinNodeCount;
      m_aMaxNodeCount = aMaxNodeCount;
    }
  }

  private final ContextData m_aContext;

  public ValidationExecutorXSDPartial (@Nonnull final IValidationArtefact aValidationArtefact,
                                       @Nonnull final ContextData aContext)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().isXSDBased (), "Artifact is not XSD");
    m_aContext = ValueEnforcer.notNull (aContext, "Context");
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull final IValidationSource aSource,
                                           @Nullable final ClassLoader aClassLoader,
                                           @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");

    final IValidationArtefact aVA = getValidationArtefact ();

    NodeList aNodeSet;
    try
    {
      aNodeSet = (NodeList) m_aContext.m_aXE.evaluate (aSource.getNode (), XPathConstants.NODESET);
    }
    catch (final XPathExpressionException ex)
    {
      throw new IllegalStateException (ex);
    }

    final ErrorList aErrorList = new ErrorList ();
    final int nMatchingNodes = aNodeSet.getLength ();

    if (m_aContext.m_aMinNodeCount != null)
      if (nMatchingNodes < m_aContext.m_aMinNodeCount.intValue ())
      {
        // Too little matches found
        aErrorList.add (SingleError.builderFatalError ()
                                   .setErrorLocation (new SimpleLocation (aVA.getRuleResource ().getPath ()))
                                   .setErrorText ("The minimum number of result nodes (" +
                                                  m_aContext.m_aMinNodeCount +
                                                  ") is not met")
                                   .build ());
      }
    if (m_aContext.m_aMaxNodeCount != null)
      if (nMatchingNodes > m_aContext.m_aMaxNodeCount.intValue ())
      {
        // Too little matches found
        aErrorList.add (SingleError.builderFatalError ()
                                   .setErrorLocation (new SimpleLocation (aVA.getRuleResource ().getPath ()))
                                   .setErrorText ("The maximum number of result nodes (" +
                                                  m_aContext.m_aMaxNodeCount +
                                                  ") is not met")
                                   .build ());
      }

    if (nMatchingNodes == 0)
    {
      // No match found - nothing to do
      return new ValidationResult (aVA, aErrorList);
    }

    // Find the XML schema required for validation
    // as we don't have a node, we need to trust the implementation class
    final Schema aSchema = XMLSchemaCache.getInstanceOfClassLoader (aClassLoader).getSchema (aVA.getRuleResource ());
    assert aSchema != null;

    for (int i = 0; i < aNodeSet.getLength (); ++i)
    {
      // Build a partial source
      final IValidationSource aRealSource = new ValidationSource (aSource.getSystemID (), aNodeSet.item (i), true);

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
}
