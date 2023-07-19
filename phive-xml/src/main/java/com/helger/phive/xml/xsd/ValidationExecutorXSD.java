/*
 * Copyright (C) 2014-2023 Philip Helger (www.helger.com)
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

import org.xml.sax.SAXParseException;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.location.SimpleLocation;
import com.helger.commons.string.ToStringGenerator;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.execute.AbstractValidationExecutor;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.xml.sax.AbstractSAXErrorHandler;
import com.helger.xml.schema.XMLSchemaCache;
import com.helger.xml.schema.XMLSchemaValidationHelper;

/**
 * Implementation of {@link AbstractValidationExecutor} for XML Schema
 * validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSD extends AbstractValidationExecutor <IValidationSourceXML, ValidationExecutorXSD>
{
  private final Supplier <? extends Schema> m_aSchemaProvider;

  public ValidationExecutorXSD (@Nonnull final IValidationArtefact aValidationArtefact,
                                @Nonnull final Supplier <? extends Schema> aSchemaProvider)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().isXSD (), "Artifact is not an XSD");
    ValueEnforcer.notNull (aSchemaProvider, "SchemaProvider");
    m_aSchemaProvider = aSchemaProvider;

    // By default, if an error occurs in an XSD, we don't continue with further
    // validation layers
    setStopValidationOnError (true);
  }

  @Nonnull
  public final Supplier <? extends Schema> getSchemaProvider ()
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
        aErrorList.add (AbstractSAXErrorHandler.getSaxParseError (EErrorLevel.FATAL_ERROR,
                                                                  (SAXParseException) ex.getCause ()));
      }
      else
      {
        aErrorList.add (SingleError.builderFatalError ()
                                   .errorLocation (new SimpleLocation (aVA.getRuleResourcePath ()))
                                   .errorText ("The document to be validated is not an XML document")
                                   .linkedException (ex)
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

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ()).append ("SchemaProvider", m_aSchemaProvider).getToString ();
  }

  /**
   * Create a new instance based on a single standalone XSD
   *
   * @param aXSDRes
   *        The XSD resource to use. May not be <code>null</code>.
   * @return A new validator that uses the supplied resource for the filename
   *         and uses {@link XMLSchemaCache} to resolve the XML Schema object.
   */
  @Nonnull
  public static ValidationExecutorXSD create (@Nonnull final IReadableResource aXSDRes)
  {
    ValueEnforcer.notNull (aXSDRes, "XSDRes");
    return new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, aXSDRes),
                                      () -> XMLSchemaCache.getInstance ().getSchema (aXSDRes));
  }

  /**
   * Create a new instance based on one or more XSDs
   *
   * @param aXSDRes
   *        The XSD resources to use. May neither be <code>null</code> nor
   *        empty.
   * @return A new validator that uses the last resource for the filename uses
   *         {@link XMLSchemaCache} to resolve the XML Schema object.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorXSD create (@Nonnull @Nonempty final IReadableResource... aXSDRes)
  {
    ValueEnforcer.notEmptyNoNullValue (aXSDRes, "XSDRes");

    // The last one is the important one for the name
    return new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, ArrayHelper.getLast (aXSDRes)),
                                      () -> XMLSchemaCache.getInstance ().getSchema (aXSDRes));
  }

  /**
   * Create a new instance based on one or more XSDs
   *
   * @param aXSDRes
   *        The XSD resources to use. May neither be <code>null</code> nor
   *        empty.
   * @return A new validator that uses the last resource for the filename uses
   *         {@link XMLSchemaCache} to resolve the XML Schema object.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorXSD create (@Nonnull @Nonempty final List <? extends IReadableResource> aXSDRes)
  {
    ValueEnforcer.notEmptyNoNullValue (aXSDRes, "XSDRes");

    // The last one is the important one for the name
    return new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, aXSDRes.get (aXSDRes.size () - 1)),
                                      () -> XMLSchemaCache.getInstance ().getSchema (aXSDRes));
  }
}
