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
import javax.xml.XMLConstants;
import javax.xml.transform.dom.DOMSource;
import javax.xml.xpath.XPath;

import org.oclc.purl.dsdl.svrl.SchematronOutputType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.result.ValidationResult;
import com.helger.bdve.source.IValidationSource;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.location.SimpleLocation;
import com.helger.commons.string.StringHelper;
import com.helger.jaxb.builder.IJAXBDocumentType;
import com.helger.schematron.AbstractSchematronResource;
import com.helger.schematron.SchematronResourceHelper;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.pure.errorhandler.WrappedCollectingPSErrorHandler;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLMarshaller;
import com.helger.schematron.svrl.SVRLResourceError.SVRLErrorBuilder;
import com.helger.schematron.svrl.SVRLSuccessfulReport;
import com.helger.schematron.xslt.SchematronResourceSCH;
import com.helger.schematron.xslt.SchematronResourceXSLT;
import com.helger.xml.XMLHelper;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.read.DOMReaderSettings;
import com.helger.xml.serialize.write.XMLWriter;
import com.helger.xml.transform.WrappedCollectingTransformErrorListener;
import com.helger.xml.xpath.XPathExpressionHelper;
import com.helger.xml.xpath.XPathHelper;

/**
 * Implementation of {@link IValidationExecutor} for Schematron validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSchematron extends AbstractValidationExecutor implements
                                          IValidationExecutor.ICacheSupport
{
  private static enum ESchematronOutput
  {
    SVRL,
    OIOUBL
  }

  public static final String IN_MEMORY_RESOURCE_NAME = "in-memory-data";

  private static final Logger s_aLogger = LoggerFactory.getLogger (ValidationExecutorSchematron.class);

  private boolean m_bCacheSchematron = DEFAULT_CACHE;

  public ValidationExecutorSchematron (@Nonnull final IValidationArtefact aValidationArtefact)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().isSchematronBased (),
                          "Artifact is not Schematron");
  }

  public boolean isCacheArtefact ()
  {
    return m_bCacheSchematron;
  }

  @Nonnull
  public ValidationExecutorSchematron setCacheArtefact (final boolean bCacheArtefact)
  {
    m_bCacheSchematron = bCacheArtefact;
    return this;
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull final IValidationSource aSource,
                                           @Nullable final ClassLoader aClassLoader,
                                           @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");

    final IValidationArtefact aArtefact = getValidationArtefact ();
    final ValidationArtefactKey aVAK = aArtefact.getValidationKey ();

    // get the Schematron resource to be used for this validation artefact
    final IReadableResource aSCHRes = aArtefact.getRuleResource ();

    // Get source as XML DOM Node
    Node aNode = null;
    try
    {
      aNode = SchematronResourceHelper.getNodeOfSource (aSource.getAsTransformSource (), new DOMReaderSettings ());
    }
    catch (final Exception ex)
    {
      throw new IllegalStateException ("For Schematron validation to work, the source must be valid XML which it is not.",
                                       ex);
    }

    if (aVAK.hasPrerequisiteXPath ())
    {
      // Check if the artefact can be applied on the given document by
      // checking the prerequisite XPath
      final XPath aXPathContext = XPathHelper.createNewXPath ();

      {
        // Get all from the transaction
        final MapBasedNamespaceContext aNSContext = new MapBasedNamespaceContext (aVAK.getTransaction ()
                                                                                      .getNamespaceContext ());

        // Add the default mapping for the root namespace
        final IJAXBDocumentType aDocumentType = aVAK.getJAXBDocumentType ();
        aNSContext.addMapping (XMLConstants.DEFAULT_NS_PREFIX, aDocumentType.getNamespaceURI ());
        // For historical reasons, the "ubl" prefix is also mapped to this
        // namespace URI
        aNSContext.addMapping ("ubl", aDocumentType.getNamespaceURI ());

        aXPathContext.setNamespaceContext (aNSContext);
      }

      try
      {
        final Boolean aResult = XPathExpressionHelper.evalXPathToBoolean (aXPathContext,
                                                                          aVAK.getPrerequisiteXPath (),
                                                                          XMLHelper.getOwnerDocument (aNode));
        if (aResult != null && !aResult.booleanValue ())
        {
          s_aLogger.info ("Ignoring validation artefact " +
                          aSCHRes.getPath () +
                          " because the prerequisite XPath expression '" +
                          aVAK.getPrerequisiteXPath () +
                          "' is not fulfilled.");
          return ValidationResult.createIgnoredResult (aArtefact);
        }
      }
      catch (final IllegalArgumentException ex)
      {
        // Catch errors in prerequisite XPaths - most likely because of
        // missing namespace prefixes...
        final String sErrorMsg = "Failed to verify if validation artefact " +
                                 aSCHRes.getPath () +
                                 " matches the prerequisite XPath expression '" +
                                 aVAK.getPrerequisiteXPath () +
                                 "' - ignoring validation artefact.";
        s_aLogger.error (sErrorMsg, ex);
        return new ValidationResult (aArtefact,
                                     new ErrorList (SingleError.builderError ()
                                                               .setErrorText (sErrorMsg)
                                                               .setLinkedException (ex)
                                                               .build ()));
      }
    }

    // No prerequisite or prerequisite matched
    final ErrorList aErrorList = new ErrorList ();
    AbstractSchematronResource aSCH;
    ESchematronOutput eOutput = ESchematronOutput.SVRL;
    switch (getValidationType ())
    {
      case SCHEMATRON_PURE:
      {
        final SchematronResourcePure aPureSCH = new SchematronResourcePure (aSCHRes);
        aPureSCH.setErrorHandler (new WrappedCollectingPSErrorHandler (aErrorList));
        // Don't cache to avoid that errors in the Schematron are hidden on
        // consecutive calls!
        aSCH = aPureSCH;
        break;
      }
      case SCHEMATRON_SCH:
      {
        final SchematronResourceSCH aSCHSCH = new SchematronResourceSCH (aSCHRes);
        aSCHSCH.setErrorListener (new WrappedCollectingTransformErrorListener (aErrorList));
        if (aLocale != null && StringHelper.hasText (aLocale.getLanguage ()))
          aSCHSCH.setLanguageCode (aLocale.getLanguage ());
        aSCH = aSCHSCH;
        break;
      }
      case SCHEMATRON_XSLT:
      {
        final SchematronResourceXSLT aSCHXSLT = new SchematronResourceXSLT (aSCHRes);
        aSCHXSLT.setErrorListener (new WrappedCollectingTransformErrorListener (aErrorList));
        aSCH = aSCHXSLT;
        break;
      }
      case SCHEMATRON_OIOUBL:
      {
        final SchematronResourceXSLT aSCHXSLT = new SchematronResourceXSLT (aSCHRes);
        aSCHXSLT.setErrorListener (new WrappedCollectingTransformErrorListener (aErrorList));
        aSCH = aSCHXSLT;
        eOutput = ESchematronOutput.OIOUBL;
        break;
      }
      default:
        throw new IllegalStateException ("Unsupported validation type: " + getValidationType ());
    }
    // Don't cache to avoid that errors in the Schematron are hidden on
    // consecutive calls!
    aSCH.setUseCache (m_bCacheSchematron);

    try
    {
      // Main application of Schematron
      final Document aDoc = aSCH.applySchematronValidation (new DOMSource (aNode));

      if (s_aLogger.isDebugEnabled ())
        s_aLogger.debug ("SVRL: " + XMLWriter.getNodeAsString (aDoc));

      switch (eOutput)
      {
        case SVRL:
        {
          final SchematronOutputType aSVRL = aDoc == null ? null : new SVRLMarshaller ().read (aDoc);
          if (aSVRL != null)
          {
            // Valid Schematron - interpret result

            // Convert failed asserts and successful reports to error objects
            for (final SVRLFailedAssert aFailedAssert : SVRLHelper.getAllFailedAssertions (aSVRL))
              aErrorList.add (aFailedAssert.getAsResourceError (aSource.getSystemID ()));
            for (final SVRLSuccessfulReport aSuccessfulReport : SVRLHelper.getAllSuccessfulReports (aSVRL))
              aErrorList.add (aSuccessfulReport.getAsResourceError (aSource.getSystemID ()));
          }
          else
          {
            // Schematron does not create SVRL!
            aErrorList.add (SingleError.builderError ()
                                       .setErrorLocation (new SimpleLocation (aSCHRes.getPath ()))
                                       .setErrorText ("Internal error interpreting Schematron result")
                                       .setErrorFieldName (XMLWriter.getNodeAsString (aDoc))
                                       .build ());
          }
          break;
        }
        case OIOUBL:
        {
          if (aDoc != null && aDoc.getDocumentElement () != null)
          {
            // interpret result
            /**
             * <pre>
             * <Schematron>
             *   <Information>Checking OIOUBL-2.02 Invoice, 2017-09-15, Version 1.9.0.34429</Information>
             *   <Error context="/Invoice">
             *     <Pattern>cbc:UBLVersionID = '2.0'</Pattern>
             *     <Description>[F-LIB001] Invalid UBLVersionID. Must be '2.0'</Description>
             *     <Xpath>/Invoice[1]</Xpath>
             *   </Error>
             * </Schematron>
             * </pre>
             */

            for (final Element eError : XMLHelper.getChildElementIterator (aDoc.getDocumentElement (), "Error"))
            {
              // final String sContext = eError.getAttribute ("context");
              final String sPattern = XMLHelper.getFirstChildElementOfName (eError, "Pattern").getTextContent ();
              final String sDescription = XMLHelper.getFirstChildElementOfName (eError, "Description")
                                                   .getTextContent ();
              final String sXPath = XMLHelper.getFirstChildElementOfName (eError, "Xpath").getTextContent ();
              aErrorList.add (new SVRLErrorBuilder (sPattern).setErrorLocation (new SimpleLocation (aSource.getSystemID ()))
                                                             .setErrorText (sDescription)
                                                             .setErrorFieldName (sXPath)
                                                             .build ());
            }
          }
          else
          {
            // Schematron does not create SVRL!
            aErrorList.add (SingleError.builderError ()
                                       .setErrorLocation (new SimpleLocation (aSCHRes.getPath ()))
                                       .setErrorText ("Internal error - no Schematron output created for OIOUBL")
                                       .build ());
          }
          break;
        }
        default:
          throw new IllegalStateException ("Unsupported output type");
      }
    }
    catch (final Exception ex)
    {
      // Usually an error in the Schematron
      aErrorList.add (SingleError.builderError ()
                                 .setErrorLocation (new SimpleLocation (aSCHRes.getPath ()))
                                 .setErrorText (ex.getMessage ())
                                 .setLinkedException (ex)
                                 .build ());
    }

    return new ValidationResult (aArtefact, aErrorList);
  }
}
