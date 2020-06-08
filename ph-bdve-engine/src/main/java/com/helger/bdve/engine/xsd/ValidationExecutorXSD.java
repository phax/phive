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

import org.xml.sax.SAXParseException;

import com.helger.bdve.api.EValidationType;
import com.helger.bdve.api.artefact.IValidationArtefact;
import com.helger.bdve.api.artefact.ValidationArtefact;
import com.helger.bdve.api.execute.AbstractValidationExecutor;
import com.helger.bdve.api.execute.IValidationExecutor;
import com.helger.bdve.api.result.ValidationResult;
import com.helger.bdve.engine.source.IValidationSourceXML;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.functional.ISupplier;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.location.SimpleLocation;
import com.helger.jaxb.builder.IJAXBDocumentType;
import com.helger.xml.sax.AbstractSAXErrorHandler;
import com.helger.xml.schema.XMLSchemaCache;
import com.helger.xml.schema.XMLSchemaValidationHelper;

/**
 * Implementation of {@link IValidationExecutor} for XML Schema validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSD extends AbstractValidationExecutor <IValidationSourceXML, ValidationExecutorXSD>
{
  private final ISupplier <? extends Schema> m_aSchemaProvider;

  public ValidationExecutorXSD (@Nonnull final IValidationArtefact aValidationArtefact,
                                @Nonnull final ISupplier <? extends Schema> aSchemaProvider)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().isXSD (), "Artifact is not an XSD");
    ValueEnforcer.notNull (aSchemaProvider, "SchemaProvider");
    m_aSchemaProvider = aSchemaProvider;
  }

  @Nonnull
  public final ISupplier <? extends Schema> getSchemaProvider ()
  {
    return m_aSchemaProvider;
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull final IValidationSourceXML aSource, @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");
    final IValidationArtefact aVA = getValidationArtefact ();

    // Find the XML schema required for validation
    // as we don't have a node, we need to trust the implementation class
    final Schema aSchema = m_aSchemaProvider.get ();
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
        aErrorList.add (AbstractSAXErrorHandler.getSaxParseError (EErrorLevel.FATAL_ERROR, (SAXParseException) ex.getCause ()));
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

  @Nonnull
  public static ValidationExecutorXSD create (@Nonnull final IJAXBDocumentType aDocType)
  {
    ValueEnforcer.notNull (aDocType, "DocType");
    return new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, aDocType.getAllXSDResources ().getLast ()),
                                      aDocType::getSchema);
  }

  @Nonnull
  public static ValidationExecutorXSD create (@Nonnull final IReadableResource aXSDRes)
  {
    ValueEnforcer.notNull (aXSDRes, "XSDRes");
    return new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, aXSDRes),
                                      () -> XMLSchemaCache.getInstance ().getSchema (aXSDRes));
  }
}
