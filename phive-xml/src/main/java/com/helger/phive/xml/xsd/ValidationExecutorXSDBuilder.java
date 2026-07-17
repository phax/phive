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
package com.helger.phive.xml.xsd;

import java.util.List;
import java.util.function.Supplier;

import javax.xml.validation.Schema;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.base.builder.IBuilder;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.ICommonsList;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.xml.schema.XMLSchemaCache;

/**
 * Builder class for {@link ValidationExecutorXSD}. This builder provides a fluent API to configure
 * all parameters including those for the underlying {@link ValidationArtefact}.
 *
 * @author Philip Helger
 * @since 12.1.0
 */
public class ValidationExecutorXSDBuilder implements IBuilder <ValidationExecutorXSD>
{
  private IValidationType m_aValidationType = EValidationType.XSD;
  private final ICommonsList <IReadableResource> m_aXSDResources = new CommonsArrayList <> ();
  private IReadableResource m_aArtefactResource;
  private Supplier <? extends Schema> m_aSchemaProvider;
  private boolean m_bStopValidationOnError;
  private boolean m_bStopValidationOnErrorSet;

  public ValidationExecutorXSDBuilder ()
  {}

  /**
   * Copy constructor from an existing {@link ValidationExecutorXSD}.
   *
   * @param aSrc
   *        The source executor to copy from. May not be <code>null</code>.
   */
  public ValidationExecutorXSDBuilder (@NonNull final ValidationExecutorXSD aSrc)
  {
    ValueEnforcer.notNull (aSrc, "Src");
    m_aValidationType = aSrc.getValidationArtefact ().getValidationType ();
    m_aArtefactResource = aSrc.getValidationArtefact ().getRuleResource ();
    m_aSchemaProvider = aSrc.getSchemaProvider ();
    m_bStopValidationOnError = aSrc.isStopValidationOnError ();
    m_bStopValidationOnErrorSet = true;
  }

  /**
   * Set the validation type. Must be an XSD-based type. Defaults to {@link EValidationType#XSD}.
   *
   * @param a
   *        The validation type to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorXSDBuilder validationType (@NonNull final IValidationType a)
  {
    ValueEnforcer.notNull (a, "ValidationType");
    m_aValidationType = a;
    return this;
  }

  /**
   * Set the single resource containing the XML Schema, replacing all previously contained
   * resources.
   *
   * @param a
   *        The resource to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorXSDBuilder resource (@NonNull final IReadableResource a)
  {
    ValueEnforcer.notNull (a, "Resource");
    m_aXSDResources.set (a);
    return this;
  }

  /**
   * Set the resources containing the XML Schema, replacing all previously contained resources. If
   * more than one resource is provided, the last one is used for the resulting validation artefact
   * name.
   *
   * @param a
   *        The resources to use. May neither be <code>null</code> nor empty.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorXSDBuilder resources (@NonNull @Nonempty final IReadableResource... a)
  {
    ValueEnforcer.notEmptyNoNullValue (a, "Resources");
    m_aXSDResources.setAll (a);
    return this;
  }

  /**
   * Set the resources containing the XML Schema, replacing all previously contained resources. If
   * more than one resource is provided, the last one is used for the resulting validation artefact
   * name.
   *
   * @param a
   *        The resources to use. May neither be <code>null</code> nor empty.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorXSDBuilder resources (@NonNull @Nonempty final List <? extends IReadableResource> a)
  {
    ValueEnforcer.notEmptyNoNullValue (a, "Resources");
    m_aXSDResources.setAll (a);
    return this;
  }

  /**
   * Add a single resource containing (part of) the XML Schema.
   *
   * @param a
   *        The resource to add. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorXSDBuilder addResource (@NonNull final IReadableResource a)
  {
    ValueEnforcer.notNull (a, "Resource");
    m_aXSDResources.add (a);
    return this;
  }

  /**
   * Set the resource to be used for the resulting validation artefact name. If none is set
   * explicitly, the last of the provided XSD resources is used.
   *
   * @param a
   *        The artefact resource. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorXSDBuilder artefactResource (@Nullable final IReadableResource a)
  {
    m_aArtefactResource = a;
    return this;
  }

  /**
   * Set an explicit XML Schema provider. If none is set explicitly, an {@link XMLSchemaCache} based
   * provider using the provided XSD resources is used.
   *
   * @param a
   *        The schema provider to use. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public ValidationExecutorXSDBuilder schemaProvider (@Nullable final Supplier <? extends Schema> a)
  {
    m_aSchemaProvider = a;
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
  public ValidationExecutorXSDBuilder stopValidationOnError (final boolean b)
  {
    m_bStopValidationOnError = b;
    m_bStopValidationOnErrorSet = true;
    return this;
  }

  @NonNull
  public ValidationExecutorXSD build ()
  {
    if (m_aValidationType == null)
      throw new IllegalStateException ("Validation type is missing");

    // Determine the resource to be used for the artefact name
    final IReadableResource aArtefactResource;
    if (m_aArtefactResource != null)
      aArtefactResource = m_aArtefactResource;
    else
    {
      if (m_aXSDResources.isEmpty ())
        throw new IllegalStateException ("Resource is missing");
      // The last one is the important one for the name
      aArtefactResource = m_aXSDResources.getLastOrNull ();
    }

    // Determine the XML Schema provider
    final Supplier <? extends Schema> aSchemaProvider;
    if (m_aSchemaProvider != null)
      aSchemaProvider = m_aSchemaProvider;
    else
    {
      if (m_aXSDResources.isEmpty ())
        throw new IllegalStateException ("Neither a schema provider nor a resource is present");
      final ICommonsList <IReadableResource> aResources = m_aXSDResources.getClone ();
      aSchemaProvider = () -> XMLSchemaCache.getInstance ().getSchema (aResources);
    }

    final ValidationExecutorXSD ret = new ValidationExecutorXSD (new ValidationArtefact (m_aValidationType,
                                                                                         aArtefactResource),
                                                                 aSchemaProvider);
    if (m_bStopValidationOnErrorSet)
      ret.setStopValidationOnError (m_bStopValidationOnError);
    return ret;
  }

  /**
   * Create a new builder with the provided XSD resources set.
   *
   * @param aXSDRes
   *        The resources pointing to the XML Schema. May neither be <code>null</code> nor empty.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorXSDBuilder create (@NonNull @Nonempty final IReadableResource... aXSDRes)
  {
    return new ValidationExecutorXSDBuilder ().resources (aXSDRes);
  }

  /**
   * Create a new builder with the provided XSD resources set.
   *
   * @param aXSDRes
   *        The resources pointing to the XML Schema. May neither be <code>null</code> nor empty.
   * @return A new builder instance. Never <code>null</code>.
   */
  @NonNull
  public static ValidationExecutorXSDBuilder create (@NonNull @Nonempty final List <? extends IReadableResource> aXSDRes)
  {
    return new ValidationExecutorXSDBuilder ().resources (aXSDRes);
  }
}
