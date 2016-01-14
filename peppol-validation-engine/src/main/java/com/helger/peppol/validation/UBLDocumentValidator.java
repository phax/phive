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
package com.helger.peppol.validation;

import java.io.File;
import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.xpath.XPath;

import org.oclc.purl.dsdl.svrl.SchematronOutputType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.EErrorLevel;
import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.error.ResourceError;
import com.helger.commons.error.ResourceErrorGroup;
import com.helger.commons.error.ResourceLocation;
import com.helger.commons.io.IHasInputStream;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.stream.StreamHelper;
import com.helger.commons.xml.XMLHelper;
import com.helger.commons.xml.namespace.MapBasedNamespaceContext;
import com.helger.commons.xml.sax.AbstractSAXErrorHandler;
import com.helger.commons.xml.schema.XMLSchemaValidationHelper;
import com.helger.commons.xml.transform.TransformSourceFactory;
import com.helger.commons.xml.xpath.XPathExpressionHelper;
import com.helger.commons.xml.xpath.XPathHelper;
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
import com.helger.ubl21.UBL21NamespaceContext;

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

  private static final Logger s_aLogger = LoggerFactory.getLogger (UBLDocumentValidator.class);

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
  public ValidationLayerResult applyXSDValidation (@Nonnull @WillClose final Source aUBLDocument, @Nullable final ClassLoader aClassLoader)
  {
    ValueEnforcer.notNull (aUBLDocument, "UBLDocument");

    try
    {
      // Find the document type that is required for the configured
      // validation
      final EUBL21DocumentType eUBLDocumentType = m_aConfiguration.getValidationKey ().getTransaction ().getUBLDocumentType ();

      // Find the XML schema required for validation
      // as we don't have a node, we need to trust the implementation class
      final Schema aSchema = eUBLDocumentType.getSchema (aClassLoader);
      assert aSchema != null;

      final ResourceErrorGroup aErrors = new ResourceErrorGroup ();
      try
      {
        // Apply the XML schema validation
        final IResourceErrorGroup aXSDErrors = XMLSchemaValidationHelper.validate (aSchema, aUBLDocument);
        aErrors.addResourceErrorGroup (aXSDErrors);
      }
      catch (final IllegalArgumentException ex)
      {
        // Happens when non-XML document is trying to be parsed
        if (ex.getCause () instanceof SAXParseException)
          aErrors.addResourceError (AbstractSAXErrorHandler.getSaxParseError (EErrorLevel.FATAL_ERROR, (SAXParseException) ex.getCause ()));
        else
          aErrors.addResourceError (new ResourceError (new ResourceLocation (aUBLDocument.getSystemId ()), EErrorLevel.FATAL_ERROR, "The document to be validated is non an XML document", ex));
      }

      // Build result object
      return new ValidationLayerResult (new ValidationArtefact (EValidationArtefactType.XSD, eUBLDocumentType.getXSDResource (aClassLoader), m_aConfiguration.getValidationKey ()),
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
   */
  @Nonnull
  public ValidationLayerResultList applySchematronValidation (@Nonnull final File aUBLDocument)
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
  public ValidationLayerResultList applySchematronValidation (@Nonnull final IHasInputStream aUBLDocument)
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
  public ValidationLayerResultList applySchematronValidation (@Nonnull @WillClose final Source aUBLDocument)
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
   */
  public void applySchematronValidation (@Nonnull @WillClose final Source aUBLDocument, @Nonnull final ValidationLayerResultList aResultList)
  {
    ValueEnforcer.notNull (aUBLDocument, "UBLDocument");
    ValueEnforcer.notNull (aResultList, "ResultList");

    // Resource name of the document to be validated
    String sResourceName = aUBLDocument.getSystemId ();
    if (sResourceName == null)
      sResourceName = IN_MEMORY_RESOURCE_NAME;

    // Convert source to a Node only once - this closes any underlying stream
    Node aUBLDocumentNode;
    try
    {
      aUBLDocumentNode = SchematronResourceHelper.getNodeOfSource (aUBLDocument);
    }
    catch (final SAXException ex)
    {
      throw new IllegalArgumentException ("The provided UBL document Source is not supported!", ex);
    }

    XPath aXPathContext = null;
    for (final IValidationArtefact aArtefact : m_aConfiguration.getAllValidationArtefacts ())
    {
      // get the Schematron resource to be used for this validation artefact
      final IReadableResource aSCHRes = aArtefact.getRuleResource ();

      if (aArtefact.getValidationKey ().hasPrerequisiteXPath ())
      {
        // Check if the artefact can be applied on the given document by
        // checking the prerequisite XPath
        if (aXPathContext == null)
        {
          aXPathContext = XPathHelper.createNewXPath ();
          final MapBasedNamespaceContext aNSContext = new MapBasedNamespaceContext ();
          for (final Map.Entry <String, String> aEntry : UBL21NamespaceContext.getInstance ().getPrefixToNamespaceURIMap ().entrySet ())
            aNSContext.addMapping (aEntry.getKey (), aEntry.getValue ());

          // Add the "ubl" mapping for the root namespace
          final EUBL21DocumentType eUBLDocumentType = m_aConfiguration.getValidationKey ().getTransaction ().getUBLDocumentType ();
          aNSContext.addMapping ("ubl", eUBLDocumentType.getNamespaceURI ());

          aXPathContext.setNamespaceContext (aNSContext);
        }
        try
        {
          final Boolean aResult = XPathExpressionHelper.evalXPathToBoolean (aXPathContext, aArtefact.getValidationKey ().getPrerequisiteXPath (), XMLHelper.getOwnerDocument (aUBLDocumentNode));
          if (aResult != null && !aResult.booleanValue ())
          {
            s_aLogger.info ("Ignoring validation artefact " +
                            aSCHRes.getPath () +
                            " because the prerequisite XPath expression '" +
                            aArtefact.getValidationKey ().getPrerequisiteXPath () +
                            "' is not fulfilled.");
            aResultList.add (ValidationLayerResult.createIgnoredLayer (aArtefact));
            continue;
          }
        }
        catch (final IllegalArgumentException ex)
        {
          // Catch errors in prerequisite XPaths - most likely because of
          // missing namespace prefixes...
          s_aLogger.error ("Failed to verify if validation artefact " +
                           aSCHRes.getPath () +
                           " matches the prerequisite XPath expression '" +
                           aArtefact.getValidationKey ().getPrerequisiteXPath () +
                           "' - ignoring validation artefact.",
                           ex);
          aResultList.add (ValidationLayerResult.createIgnoredLayer (aArtefact));
          continue;
        }
      }

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
          final ResourceErrorGroup aREG = new ResourceErrorGroup ();
          for (final SVRLFailedAssert aFailedAssert : SVRLHelper.getAllFailedAssertions (aSVRL))
            aREG.addResourceError (aFailedAssert.getAsResourceError (sResourceName));
          for (final SVRLSuccessfulReport aSuccessfulReport : SVRLHelper.getAllSuccessfulReports (aSVRL))
            aREG.addResourceError (aSuccessfulReport.getAsResourceError (sResourceName));

          // Add one result element per layer
          aResultList.add (new ValidationLayerResult (aArtefact, aREG));
        }
      }
      catch (final Exception ex)
      {
        // Usually an error in the Schematron
        aResultList.add (new ValidationLayerResult (aArtefact, new ResourceError (new ResourceLocation (aSCHRes.getPath ()), EErrorLevel.ERROR, ex.getMessage (), ex)));
      }
    }
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source file
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull final File aUBLDocument)
  {
    return applyCompleteValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source input stream provider
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull final IHasInputStream aUBLDocument)
  {
    return applyCompleteValidation (TransformSourceFactory.create (aUBLDocument));
  }

  /**
   * Perform XSD and Schematron validation
   *
   * @param aUBLDocument
   *        Source
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull @WillClose final Source aUBLDocument)
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
   */
  @Nonnull
  public ValidationLayerResultList applyCompleteValidation (@Nonnull @WillClose final Source aUBLDocument, @Nullable final ClassLoader aClassLoader)
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
