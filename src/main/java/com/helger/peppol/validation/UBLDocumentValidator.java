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
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.schematron.SchematronResourceHelper;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.pure.errorhandler.CollectingPSErrorHandler;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLSuccessfulReport;
import com.helger.ubl21.UBL21DocumentTypes;

/**
 * This is the main validation class to validate e.g. PEPPOL UBL 2.1 documents
 * according to a passed {@link ValidationConfiguration} object.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class UBLDocumentValidator
{
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
  public IResourceErrorGroup applyXSDValidation (@Nonnull final File aUBLDocument)
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
  public IResourceErrorGroup applyXSDValidation (@Nonnull final InputStream aUBLDocument)
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
  public IResourceErrorGroup applyXSDValidation (@Nonnull final IHasInputStream aUBLDocument)
  {
    return applyXSDValidation (TransformSourceFactory.create (aUBLDocument));
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
   * @return Never <code>null</code>.
   */
  @Nonnull
  public IResourceErrorGroup applyXSDValidation (@Nonnull @WillClose final Source aUBLDocument)
  {
    ValueEnforcer.notNull (aUBLDocument, "UBLDocument");

    try
    {
      // Find the implementation class that is required for the configured
      // validation
      final Class <?> aUBLImplementationClass = m_aConfiguration.getValidationKey ().getUBLDocumentType ().getImplementationClass ();

      final ResourceErrorGroup aErrors = new ResourceErrorGroup ();

      // Find the XML schema required for validation
      // as we don't have a node, we need to trust the implementation class
      final Schema aSchema = UBL21DocumentTypes.getSchemaOfImplementationClass (aUBLImplementationClass);
      if (aSchema == null)
      {
        // Failed to resolve schema
        aErrors.addResourceError (new ResourceError (new ResourceLocation (aUBLDocument.getSystemId ()),
                                                     EErrorLevel.ERROR,
                                                     "Don't know how to read UBL object of class " +
                                                                        aUBLImplementationClass.getName () +
                                                                        " because no XML schema class is available."));
      }
      else
      {
        // Apply the XML schema validation
        final IResourceErrorGroup aXSDErrors = XMLSchemaValidationHelper.validate (aSchema, aUBLDocument);
        aErrors.addResourceErrorGroup (aXSDErrors);
      }
      return aErrors.getAllFailures ();
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
   */
  @Nonnull
  public IResourceErrorGroup applySchematronValidation (@Nonnull final File aUBLDocument) throws SAXException
  {
    return applySchematronValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source input stream
   * @return Never <code>null</code>.
   */
  @Nonnull
  public IResourceErrorGroup applySchematronValidation (@Nonnull @WillClose final InputStream aUBLDocument) throws SAXException
  {
    return applySchematronValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source input stream provider
   * @return Never <code>null</code>.
   */
  @Nonnull
  public IResourceErrorGroup applySchematronValidation (@Nonnull final IHasInputStream aUBLDocument) throws SAXException
  {
    return applySchematronValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform only Schematron validation
   *
   * @param aUBLDocument
   *        Source
   * @return Never <code>null</code>.
   */
  @Nonnull
  public IResourceErrorGroup applySchematronValidation (@Nonnull @WillClose final Source aUBLDocument) throws SAXException
  {
    // Resource name
    String sResourceName = aUBLDocument.getSystemId ();
    if (sResourceName == null)
      sResourceName = "in-memory-data";

    // Convert source to a Node only once - this closes any underlying stream
    final Node aUBLDocumentNode = SchematronResourceHelper.getNodeOfSource (aUBLDocument);

    final ResourceErrorGroup ret = new ResourceErrorGroup ();
    for (final IValidationArtefact aArtefact : m_aConfiguration.getAllValidationArtefacts ())
    {
      // get the Schematron resource to be used for this validation artefact
      final IReadableResource aSCHRes = aArtefact.getSchematronResource ();

      final CollectingPSErrorHandler aErrorHandler = new CollectingPSErrorHandler ();
      final SchematronResourcePure aSCH = new SchematronResourcePure (aSCHRes).setErrorHandler (aErrorHandler);
      try
      {
        // Main application of Schematron
        final SchematronOutputType aSVRL = aSCH.applySchematronValidationToSVRL (aUBLDocumentNode);
        if (aSVRL == null)
        {
          // Invalid Schematron - unexpected
          ret.addResourceErrors (aErrorHandler.getAllResourceErrors ());
        }
        else
        {
          // Conversion was successful
          if (!aErrorHandler.isEmpty ())
            throw new IllegalStateException ("Expected no error but got: " + aErrorHandler.getAllResourceErrors ());

          // Convert failed asserts and successful reports to resource errors
          for (final SVRLFailedAssert aFailedAssert : SVRLHelper.getAllFailedAssertions (aSVRL))
            ret.addResourceError (aFailedAssert.getAsResourceError (sResourceName));
          for (final SVRLSuccessfulReport aSuccessfulReport : SVRLHelper.getAllSuccessfulReports (aSVRL))
            ret.addResourceError (aSuccessfulReport.getAsResourceError (sResourceName));
        }
      }
      catch (final Exception ex)
      {
        // Usually an error in the Schematron
        ret.addResourceError (new ResourceError (new ResourceLocation (aSCHRes.getPath ()), EErrorLevel.ERROR, ex.getMessage (), ex));
      }
    }
    return ret;
  }
}
