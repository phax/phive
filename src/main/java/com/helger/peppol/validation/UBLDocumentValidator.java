/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation;

import java.io.File;
import java.io.InputStream;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;

import org.oclc.purl.dsdl.svrl.SchematronOutputType;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.EErrorLevel;
import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.error.ResourceError;
import com.helger.commons.error.ResourceErrorGroup;
import com.helger.commons.error.ResourceLocation;
import com.helger.commons.io.IHasInputStream;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.stream.StreamHelper;
import com.helger.commons.xml.schema.XMLSchemaValidationHelper;
import com.helger.commons.xml.transform.TransformSourceFactory;
import com.helger.peppol.validation.artefact.EValidationArtefactType;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.artefact.ValidationArtefact;
import com.helger.schematron.SchematronResourceHelper;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.pure.errorhandler.CollectingPSErrorHandler;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLSuccessfulReport;
import com.helger.ubl21.EUBL21DocumentType;

/**
 * This is the main validation class to validate e.g. PEPPOL UBL 2.1 documents
 * according to a passed {@link ValidationConfiguration} object.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class UBLDocumentValidator
{
  public static final String IN_MEMORY_RESOURCE_NAME = "in-memory-data";

  private final ValidationConfiguration m_aConfiguration;

  /**
   * Constructor
   *
   * @param aConfiguration
   *        The configuration to be used. May not be <code>null</code>.
   */
  public UBLDocumentValidator (@Nonnull final ValidationConfiguration aConfiguration)
  {
    m_aConfiguration = ValueEnforcer.notNull (aConfiguration, "Configuration");
  }

  /**
   * @return The validation configuration as passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public ValidationConfiguration getValidationConfiguration ()
  {
    return m_aConfiguration;
  }

  /**
   * Perform only XSD validation
   *
   * @param aUBLDocument
   *        Source file
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResult applyXSDValidation (@Nonnull final File aUBLDocument)
  {
    return applyXSDValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only XSD validation
   *
   * @param aUBLDocument
   *        Source inpu stream
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResult applyXSDValidation (@Nonnull final InputStream aUBLDocument)
  {
    return applyXSDValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only XSD validation
   *
   * @param aUBLDocument
   *        Source input stream provider
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResult applyXSDValidation (@Nonnull final IHasInputStream aUBLDocument)
  {
    return applyXSDValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only XSD validation
   *
   * @param aUBLDocument
   *        Source to be validated
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResult applyXSDValidation (@Nonnull @WillClose final Source aUBLDocument)
  {
    return applyXSDValidation (aUBLDocument, (ClassLoader) null);
  }

  private static void _closeSource (@Nonnull final Source aSource)
  {
    if (aSource instanceof StreamSource)
    {
      // Close both because we don't know which one is used
      StreamHelper.close (((StreamSource) aSource).getInputStream ());
      StreamHelper.close (((StreamSource) aSource).getReader ());
    }
  }

  /**
   * Perform only XSD validation
   *
   * @param aUBLDocument
   *        Source to be validated
   * @param aClassLoader
   *        Optional class loader to use. May be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResult applyXSDValidation (@Nonnull @WillClose final Source aUBLDocument,
                                                   @Nullable final ClassLoader aClassLoader)
  {
    ValueEnforcer.notNull (aUBLDocument, "UBLDocument");

    try
    {
      // Find the implementation class that is required for the configured
      // validation
      final EUBL21DocumentType eUBLDocumentType = m_aConfiguration.getValidationKey ()
                                                                  .getTransaction ()
                                                                  .getUBLDocumentType ();

      final ResourceErrorGroup aErrors = new ResourceErrorGroup ();

      // Find the XML schema required for validation
      // as we don't have a node, we need to trust the implementation class
      final Schema aSchema = eUBLDocumentType.getSchema (aClassLoader);
      assert aSchema != null;

      // Apply the XML schema validation
      final IResourceErrorGroup aXSDErrors = XMLSchemaValidationHelper.validate (aSchema, aUBLDocument);
      aErrors.addResourceErrorGroup (aXSDErrors);

      return new ValidationLayerResult (new ValidationArtefact (EValidationArtefactType.XSD,
                                                                eUBLDocumentType.getXSDResource (aClassLoader),
                                                                m_aConfiguration.getValidationKey ()),
                                        aErrors.getAllFailures ());
    }
    finally
    {
      _closeSource (aUBLDocument);
    }
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source file
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applySchematronValidation (@Nonnull final File aUBLDocument) throws SAXException
  {
    return applySchematronValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source input stream
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applySchematronValidation (@Nonnull @WillClose final InputStream aUBLDocument) throws SAXException
  {
    return applySchematronValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source input stream provider
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applySchematronValidation (@Nonnull final IHasInputStream aUBLDocument) throws SAXException
  {
    return applySchematronValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applySchematronValidation (@Nonnull @WillClose final Source aUBLDocument) throws SAXException
  {
    final ValidationLayerResultList ret = new ValidationLayerResultList ();
    applySchematronValidation (aUBLDocument, ret);
    return ret;
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source
   * @param aResultList
   *        The result list to be filled. May not be <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  public void applySchematronValidation (@Nonnull @WillClose final Source aUBLDocument,
                                         @Nonnull final ValidationLayerResultList aResultList) throws SAXException
  {
    ValueEnforcer.notNull (aUBLDocument, "UBLDocument");
    ValueEnforcer.notNull (aResultList, "ResultList");

    // Resource name of the document to be validated
    String sResourceName = aUBLDocument.getSystemId ();
    if (sResourceName == null)
      sResourceName = IN_MEMORY_RESOURCE_NAME;

    // Convert source to a Node only once - this closes any underlying stream
    final Node aUBLDocumentNode = SchematronResourceHelper.getNodeOfSource (aUBLDocument);

    for (final IValidationArtefact aArtefact : m_aConfiguration.getAllValidationArtefacts ())
    {
      // get the Schematron resource to be used for this validation artefact
      final IReadableResource aSCHRes = aArtefact.getRuleResource ();

      final CollectingPSErrorHandler aErrorHandler = new CollectingPSErrorHandler ();
      final SchematronResourcePure aSCH = new SchematronResourcePure (aSCHRes).setErrorHandler (aErrorHandler);
      try
      {
        // Main application of Schematron
        final SchematronOutputType aSVRL = aSCH.applySchematronValidationToSVRL (aUBLDocumentNode);
        if (aSVRL == null)
        {
          // Invalid Schematron - unexpected
          aResultList.add (new ValidationLayerResult (aArtefact, aErrorHandler.getAllResourceErrors ()));
        }
        else
        {
          // Conversion was successful
          if (!aErrorHandler.isEmpty ())
            throw new IllegalStateException ("Expected no error but got: " + aErrorHandler.getAllResourceErrors ());

          // Convert failed asserts and successful reports to resource errors
          for (final SVRLFailedAssert aFailedAssert : SVRLHelper.getAllFailedAssertions (aSVRL))
            aResultList.add (new ValidationLayerResult (aArtefact, aFailedAssert.getAsResourceError (sResourceName)));
          for (final SVRLSuccessfulReport aSuccessfulReport : SVRLHelper.getAllSuccessfulReports (aSVRL))
            aResultList.add (new ValidationLayerResult (aArtefact,
                                                        aSuccessfulReport.getAsResourceError (sResourceName)));
        }
      }
      catch (final Exception ex)
      {
        // Usually an error in the Schematron
        aResultList.add (new ValidationLayerResult (aArtefact,
                                                    new ResourceError (new ResourceLocation (aSCHRes.getPath ()),
                                                                       EErrorLevel.ERROR,
                                                                       ex.getMessage (),
                                                                       ex)));
      }
    }
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source file
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull final File aUBLDocument) throws SAXException
  {
    return applyCompleteValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source input stream
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull @WillClose final InputStream aUBLDocument) throws SAXException
  {
    return applyCompleteValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source input stream provider
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull final IHasInputStream aUBLDocument) throws SAXException
  {
    return applyCompleteValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull @WillClose final Source aUBLDocument) throws SAXException
  {
    return applyCompleteValidation (aUBLDocument, (ClassLoader) null);
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source
   * @param aClassLoader
   *        Optional class loader to use. May be <code>null</code>.
   * @return Never <code>null</code>.
   * @throws SAXException
   *         In case the conversion from source to a node fails.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull @WillClose final Source aUBLDocument,
                                                            @Nullable final ClassLoader aClassLoader) throws SAXException
  {
    final ValidationLayerResultList ret = new ValidationLayerResultList ();
    // XSD validation
    final ValidationLayerResult aXSDResult = applyXSDValidation (aUBLDocument, aClassLoader);
    ret.add (aXSDResult);
    if (aXSDResult.isSuccess ())
    {
      // Schematron only if XSD is okay
      applySchematronValidation (aUBLDocument, ret);
    }
    return ret;
  }
}
