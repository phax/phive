package com.helger.phive.engine.vom;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.validation.Schema;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.engine.source.IValidationSourceXML;
import com.helger.phive.engine.vom.v10.VOMType;
import com.helger.phive.engine.vom.v10.VOMXSDType;
import com.helger.phive.engine.xsd.ValidationExecutorXSD;

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
  private VOM1ComplianceSettings m_aComplianceSettings = new VOM1ComplianceSettings (false);

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
  private ValidationExecutorXSD _createExecutorXSD (@Nonnull final VOMXSDType aXsd)
  {
    final String sBuiltIn = aXsd.getBuiltIn ();
    if (StringHelper.hasText (sBuiltIn))
    {
      LOGGER.info ("Trying to resolve built-in XSD artifact '" + sBuiltIn + "'");
      final Schema aSchema = m_aXmlSchemaResolver.getXmlSchemaOfID (sBuiltIn);
      if (aSchema == null)
        throw new IllegalStateException ("Failed to resolve XML Schema '" + sBuiltIn + "'");
      return new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD,
                                                                new ReadableResourceByteArray ("built-in-" + sBuiltIn,
                                                                                               ArrayHelper.EMPTY_BYTE_ARRAY)),
                                        () -> aSchema);
    }

    final VESID aVESID = new VESID (aXsd.getResource ().getGroupId (),
                                    aXsd.getResource ().getArtifactId (),
                                    aXsd.getResource ().getVersion (),
                                    aXsd.getResource ().getClassifier ());
    LOGGER.info ("Trying to resolve XSD artifact '" + aVESID.getAsSingleID () + "'");
    final IReadableResource aRes = m_aArtifactResolver.getArtifactOfID (aVESID);
    if (aRes == null)
      throw new IllegalStateException ("Failed to resolve artifact with ID '" + aVESID.getAsSingleID () + "'");

    return ValidationExecutorXSD.create (aRes);
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
      if (aErrorList.isNotEmpty ())
        return null;
    }

    // Create stub
    final ValidationExecutorSet <IValidationSourceXML> ret = new ValidationExecutorSet <> (new VESID (aVOM.getId ().getGroupId (),
                                                                                                      aVOM.getId ().getArtifactId (),
                                                                                                      aVOM.getId ().getVersion (),
                                                                                                      aVOM.getId ().getClassifier ()),
                                                                                           aVOM.getName (),
                                                                                           false);

    for (final VOMXSDType aXsd : aVOM.getValidation ().getXsd ())
      ret.addExecutor (_createExecutorXSD (aXsd));

    if (m_aComplianceSettings.isAllowEdifact () && aVOM.getValidation ().hasEdifactEntries ())
      throw new IllegalStateException ("Edifact is allowed, Edifact entries are provided, but this method can only handle XML validations");

    return ret;
  }
}
