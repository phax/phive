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

import org.xml.sax.SAXParseException;

import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.result.ValidationResult;
import com.helger.bdve.source.IValidationSource;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.functional.IFunction;
import com.helger.commons.location.SimpleLocation;
import com.helger.xml.sax.AbstractSAXErrorHandler;
import com.helger.xml.schema.XMLSchemaValidationHelper;

/**
 * Implementation of {@link IValidationExecutor} for XML Schema validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSD extends AbstractValidationExecutor
{
  private final IFunction <? super ClassLoader, ? extends Schema> m_aSchemaProvider;

  public ValidationExecutorXSD (@Nonnull final IValidationArtefact aValidationArtefact,
                                @Nonnull final IFunction <? super ClassLoader, ? extends Schema> aSchemaProvider)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().isXSDBased (), "Artifact is not XSD");
    ValueEnforcer.notNull (aSchemaProvider, "SchemaProvider");
    m_aSchemaProvider = aSchemaProvider;
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull final IValidationSource aSource,
                                           @Nullable final ClassLoader aClassLoader,
                                           @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");
    final IValidationArtefact aVA = getValidationArtefact ();

    // Find the XML schema required for validation
    // as we don't have a node, we need to trust the implementation class
    final Schema aSchema = m_aSchemaProvider.apply (aClassLoader);
    assert aSchema != null;

    final ErrorList aErrorList = new ErrorList ();
    try
    {
      // Apply the XML schema validation
      XMLSchemaValidationHelper.validate (aSchema, aSource.getAsTransformSource (), aErrorList, aLocale);
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
                                   .setErrorText ("The document to be validated is not an XML document")
                                   .setLinkedException (ex)
                                   .build ());
      }
    }

    // Build result object
    return new ValidationResult (aVA, aErrorList.getAllFailures ());
  }
}
