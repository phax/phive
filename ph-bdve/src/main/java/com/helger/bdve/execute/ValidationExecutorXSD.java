/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;
import javax.xml.transform.dom.DOMSource;
import javax.xml.validation.Schema;

import org.w3c.dom.Node;
import org.xml.sax.SAXParseException;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.result.ValidationResult;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.error.list.IErrorList;
import com.helger.commons.error.location.ErrorLocation;
import com.helger.jaxb.builder.IJAXBDocumentType;
import com.helger.xml.sax.AbstractSAXErrorHandler;
import com.helger.xml.schema.XMLSchemaValidationHelper;

/**
 * Implementation of {@link IValidationExecutor} for XML Schema validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSD extends AbstractValidationExecutor
{
  public ValidationExecutorXSD (@Nonnull final IValidationArtefact aValidationArtefact)
  {
    super (EValidationType.XSD, aValidationArtefact);
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull @WillClose final Node aNode,
                                           @Nullable final ClassLoader aClassLoader)
  {
    ValueEnforcer.notNull (aNode, "Node");

    final IValidationArtefact aVA = getValidationArtefact ();

    // Find the document type that is required for the configured
    // validation
    final IJAXBDocumentType aJAXBDocumentType = aVA.getValidationKey ().getTransaction ().getJAXBDocumentType ();

    // Find the XML schema required for validation
    // as we don't have a node, we need to trust the implementation class
    final Schema aSchema = aJAXBDocumentType.getSchema (aClassLoader);
    assert aSchema != null;

    final ErrorList aErrorList = new ErrorList ();
    try
    {
      // Apply the XML schema validation
      final IErrorList aXSDErrors = XMLSchemaValidationHelper.validate (aSchema, new DOMSource (aNode));
      aErrorList.addAll (aXSDErrors);
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
                                   .setErrorLocation (new ErrorLocation (aVA.getRuleResource ().getPath ()))
                                   .setErrorText ("The document to be validated is not an XML document")
                                   .setLinkedException (ex)
                                   .build ());
      }
    }

    // Build result object
    return new ValidationResult (aVA, aErrorList.getAllFailures ());
  }
}
