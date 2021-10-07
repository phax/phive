/*
 * Copyright (C) 2014-2021 Philip Helger (www.helger.com)
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
package com.helger.phive.engine.vom;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.validation.Schema;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.collection.attr.StringMap;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.engine.schematron.ValidationExecutorSchematron;
import com.helger.phive.engine.source.IValidationSourceXML;
import com.helger.phive.engine.vom.VOM1ComplianceSettings.IEdifactValidationExecutorProviderXML;
import com.helger.phive.engine.vom.v10.VOMCoordinatesType;
import com.helger.phive.engine.vom.v10.VOMCustomError;
import com.helger.phive.engine.vom.v10.VOMEdifactType;
import com.helger.phive.engine.vom.v10.VOMErrorLevel;
import com.helger.phive.engine.vom.v10.VOMNamespaceMappingType;
import com.helger.phive.engine.vom.v10.VOMNamespacesType;
import com.helger.phive.engine.vom.v10.VOMOptionType;
import com.helger.phive.engine.vom.v10.VOMSchematronType;
import com.helger.phive.engine.vom.v10.VOMType;
import com.helger.phive.engine.vom.v10.VOMXSDType;
import com.helger.phive.engine.xsd.ValidationExecutorXSD;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * A converter from the XML based VOM to the executable
 * {@link ValidationExecutorSet}.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class VOM1Converter
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VOM1Converter.class);

  private IVOMXmlSchemaResolver m_aXmlSchemaResolver = x -> null;
  private IVOMNamespaceContextResolver m_aNamespaceContextResolver = x -> null;
  private IVOMResourceResolver m_aResourceResolver = x -> null;
  private IVOMArtifactResolver m_aArtifactResolver = x -> null;
  private boolean m_bPerformValidation = true;
  private VOM1ComplianceSettings m_aComplianceSettings = VOM1ComplianceSettings.builder ().allowEdifact (false).build ();

  public VOM1Converter ()
  {}

  @Nonnull
  public VOM1Converter xmlSchemaResolver (@Nonnull final IVOMXmlSchemaResolver a)
  {
    ValueEnforcer.notNull (a, "XmlSchemaResolver");
    m_aXmlSchemaResolver = a;
    return this;
  }

  @Nonnull
  public VOM1Converter namespaceContextResolver (@Nonnull final IVOMNamespaceContextResolver a)
  {
    ValueEnforcer.notNull (a, "NamespaceContextResolver");
    m_aNamespaceContextResolver = a;
    return this;
  }

  @Nonnull
  public VOM1Converter resourceResolver (@Nonnull final IVOMResourceResolver a)
  {
    ValueEnforcer.notNull (a, "ResourceResolver");
    m_aResourceResolver = a;
    return this;
  }

  @Nonnull
  public VOM1Converter artifactResolver (@Nonnull final IVOMArtifactResolver a)
  {
    ValueEnforcer.notNull (a, "ArtifactResolver");
    m_aArtifactResolver = a;
    return this;
  }

  @Nonnull
  public VOM1Converter validationEnabled (final boolean b)
  {
    m_bPerformValidation = b;
    return this;
  }

  @Nonnull
  public VOM1Converter complianceSettings (@Nonnull final VOM1ComplianceSettings a)
  {
    ValueEnforcer.notNull (a, "ComplianceSettings");
    m_aComplianceSettings = a;
    return this;
  }

  @Nonnull
  private static VESID _createVESID (@Nonnull final VOMCoordinatesType a)
  {
    return new VESID (a.getGroupId (), a.getArtifactId (), a.getVersion (), a.getClassifier ());
  }

  @Nonnull
  private IValidationExecutor <IValidationSourceXML> _createExecutorEdifact (@Nonnull final VOMEdifactType aEdifact)
  {
    final IEdifactValidationExecutorProviderXML aProvider = m_aComplianceSettings.getEdifactValidationExecutorProviderXML ();
    final StringMap aOptions = new StringMap ();
    for (final VOMOptionType aOption : aEdifact.getOption ())
      aOptions.put (aOption.getName (), aOption.getValue ());
    LOGGER.info ("Trying to resolve Edifact artifact '" + aEdifact.getDirectory () + '/' + aEdifact.getMessage () + "'");
    final IValidationExecutor <IValidationSourceXML> aVES = aProvider.createValidationExecutor (aEdifact.getDirectory (),
                                                                                                aEdifact.getMessage (),
                                                                                                aOptions);
    if (aVES == null)
      throw new IllegalStateException ("Failed to resolve Edifact artifact '" +
                                       aEdifact.getDirectory () +
                                       '/' +
                                       aEdifact.getMessage () +
                                       "'");
    return aVES;
  }

  @Nonnull
  private ValidationExecutorXSD _createExecutorXSD (@Nonnull final VOMXSDType aXsd)
  {
    final ValidationExecutorXSD ret;
    final String sBuiltIn = aXsd.getBuiltIn ();
    if (StringHelper.hasText (sBuiltIn))
    {
      LOGGER.info ("Trying to resolve built-in XSD artifact '" + sBuiltIn + "'");
      final Schema aSchema = m_aXmlSchemaResolver.getXmlSchemaOfID (sBuiltIn);
      if (aSchema == null)
        throw new IllegalStateException ("Failed to resolve built-in XSD artifact '" + sBuiltIn + "'");
      ret = new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD,
                                                               new ReadableResourceByteArray ("built-in-" + sBuiltIn,
                                                                                              ArrayHelper.EMPTY_BYTE_ARRAY)),
                                       () -> aSchema);
    }
    else
    {
      // External resource
      final VESID aVESID = _createVESID (aXsd.getResource ());
      LOGGER.info ("Trying to resolve XSD artifact with ID '" + aVESID.getAsSingleID () + "'");
      final IReadableResource aRes = m_aArtifactResolver.getArtifactOfID (aVESID);
      if (aRes == null)
        throw new IllegalStateException ("Failed to resolve XSD artifact with ID '" + aVESID.getAsSingleID () + "'");

      ret = ValidationExecutorXSD.create (aRes);
    }
    if (aXsd.hasOptionEntries ())
      LOGGER.warn ("Ignoring all XSD options");
    return ret;
  }

  @Nonnull
  public static EErrorLevel getAsErrorLevel (@Nonnull final VOMErrorLevel level)
  {
    switch (level)
    {
      case INFO:
        return EErrorLevel.INFO;
      case WARN:
        return EErrorLevel.WARN;
      case ERROR:
        return EErrorLevel.ERROR;
      default:
        throw new IllegalStateException ("Unsupported error level in VOM: " + level);
    }
  }

  @Nonnull
  private ValidationExecutorSchematron _createExecutorSchematron (@Nonnull final VOMSchematronType aSchematron)
  {
    final IReadableResource aRes;
    {
      final String sBuiltIn = aSchematron.getBuiltIn ();
      if (StringHelper.hasText (sBuiltIn))
      {
        LOGGER.info ("Trying to resolve built-in Schematron artifact '" + sBuiltIn + "'");
        aRes = m_aResourceResolver.getResourceOfID (sBuiltIn);
        if (aRes == null)
          throw new IllegalStateException ("Failed to resolve built-in Schematron artifact '" + sBuiltIn + "'");
      }
      else
      {
        // External resource
        final VESID aVESID = _createVESID (aSchematron.getResource ());
        LOGGER.info ("Trying to resolve Schematron artifact with ID '" + aVESID.getAsSingleID () + "'");
        aRes = m_aArtifactResolver.getArtifactOfID (aVESID);
        if (aRes == null)
          throw new IllegalStateException ("Failed to resolve Schematron artifact with ID '" + aVESID.getAsSingleID () + "'");
      }
    }

    final EValidationType eValidationType;
    if (StringHelper.hasNoText (aSchematron.getType ()))
      eValidationType = EValidationType.SCHEMATRON_SCH;
    else
      switch (aSchematron.getType ())
      {
        case "pure":
          eValidationType = EValidationType.SCHEMATRON_PURE;
          break;
        case "sch":
          eValidationType = EValidationType.SCHEMATRON_SCH;
          break;
        case "xslt":
          eValidationType = EValidationType.SCHEMATRON_XSLT;
          break;
        case "schxslt":
          eValidationType = EValidationType.SCHEMATRON_SCHXSLT;
          break;
        case "oioubl":
          eValidationType = EValidationType.SCHEMATRON_OIOUBL;
          break;
        default:
          throw new IllegalStateException ("The Schematron type '" + aSchematron.getType () + "' is unsupported.");
      }

    if (aSchematron.getPrerequisiteCount () > 1)
      throw new IllegalStateException ("Currently only 1 prerequsite path is supported");

    final MapBasedNamespaceContext aNamespaceContext = new MapBasedNamespaceContext ();
    final VOMNamespacesType aNamespaces = aSchematron.getNamespaces ();
    if (aNamespaces != null)
    {
      final String sBuiltIn = aNamespaces.getBuiltIn ();
      if (sBuiltIn != null)
      {
        // Built-in
        LOGGER.info ("Trying to resolve built-in namespace context '" + sBuiltIn + "'");
        final MapBasedNamespaceContext ret = m_aNamespaceContextResolver.getNamespaceContextOfID (sBuiltIn);
        if (ret == null)
          throw new IllegalStateException ("Failed to resolve built-in namespace context with ID '" + sBuiltIn + "'");
        aNamespaceContext.addMappings (ret);
      }
      else
      {
        // Start empty
      }

      for (final VOMNamespaceMappingType aMapping : aNamespaces.getMapping ())
      {
        // Default to the default namespace prefix
        final String sPrefix = StringHelper.getNotNull (aMapping.getPrefix (), "");
        aNamespaceContext.setMapping (sPrefix, aMapping.getNamespace ());
      }
    }

    final ValidationExecutorSchematron ret = new ValidationExecutorSchematron (new ValidationArtefact (eValidationType, aRes),
                                                                               aSchematron.hasPrerequisiteEntries () ? aSchematron.getPrerequisiteAtIndex (0)
                                                                                                                     : null,
                                                                               aNamespaceContext.hasAnyMapping () ? aNamespaceContext
                                                                                                                  : null);

    // Custom errors afterwards (optional)
    for (final VOMCustomError aCE : aSchematron.getCustomError ())
      ret.addCustomErrorLevel (aCE.getId (), getAsErrorLevel (aCE.getLevel ()));

    if (aSchematron.hasOptionEntries ())
      LOGGER.warn ("Ignoring all Schematron options");

    return ret;
  }

  @Nullable
  public ValidationExecutorSet <IValidationSourceXML> convertToVES_XML (@Nonnull final VOMType aVOM, @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aVOM, "VOM");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    if (m_bPerformValidation)
    {
      VOM1Validator.validate (aVOM,
                              m_aXmlSchemaResolver,
                              m_aNamespaceContextResolver,
                              m_aResourceResolver,
                              m_aComplianceSettings,
                              aErrorList);
      if (aErrorList.containsAtLeastOneError ())
        return null;
    }

    // Create stub
    final ValidationExecutorSet <IValidationSourceXML> ret = new ValidationExecutorSet <> (_createVESID (aVOM.getId ()),
                                                                                           aVOM.getName (),
                                                                                           false);

    if (m_aComplianceSettings.isAllowEdifact () && aVOM.getValidation ().hasEdifactEntries ())
    {
      if (aVOM.getValidation ().hasXsdEntries ())
        throw new IllegalStateException ("If Edifact is enabled and present, than no XSD can be present!");

      // Add all Edifacts
      for (final VOMEdifactType aEdifact : aVOM.getValidation ().getEdifact ())
        ret.addExecutor (_createExecutorEdifact (aEdifact));
    }
    else
    {
      // Add all XSDs
      for (final VOMXSDType aXsd : aVOM.getValidation ().getXsd ())
        ret.addExecutor (_createExecutorXSD (aXsd));
    }

    // Add all XSDs
    for (final VOMSchematronType aSchematron : aVOM.getValidation ().getSchematron ())
      ret.addExecutor (_createExecutorSchematron (aSchematron));

    return ret;
  }
}
