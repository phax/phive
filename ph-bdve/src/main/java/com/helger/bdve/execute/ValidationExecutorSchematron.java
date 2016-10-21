package com.helger.bdve.execute;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;
import javax.xml.XMLConstants;
import javax.xml.xpath.XPath;

import org.oclc.purl.dsdl.svrl.SchematronOutputType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Node;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.result.ValidationResult;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.error.location.ErrorLocation;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.jaxb.builder.IJAXBDocumentType;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.pure.errorhandler.CollectingPSErrorHandler;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLSuccessfulReport;
import com.helger.xml.XMLHelper;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.xpath.XPathExpressionHelper;
import com.helger.xml.xpath.XPathHelper;

/**
 * Implementation of {@link IValidationExecutor} for Schematron validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSchematron extends AbstractValidationExecutor
{
  public static final String IN_MEMORY_RESOURCE_NAME = "in-memory-data";

  private static final Logger s_aLogger = LoggerFactory.getLogger (ValidationExecutorSchematron.class);

  public ValidationExecutorSchematron (@Nonnull final IValidationArtefact aValidationArtefact)
  {
    super (EValidationType.SCHEMATRON, aValidationArtefact);
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull @WillClose final Node aNode,
                                           @Nullable final ClassLoader aClassLoader)
  {
    ValueEnforcer.notNull (aNode, "Node");

    final IValidationArtefact aArtefact = getValidationArtefact ();

    // get the Schematron resource to be used for this validation artefact
    final IReadableResource aSCHRes = aArtefact.getRuleResource ();

    if (aArtefact.getValidationKey ().hasPrerequisiteXPath ())
    {
      // Check if the artefact can be applied on the given document by
      // checking the prerequisite XPath
      final XPath aXPathContext = XPathHelper.createNewXPath ();

      {
        final MapBasedNamespaceContext aNSContext = new MapBasedNamespaceContext (aArtefact.getValidationKey ()
                                                                                           .getTransaction ()
                                                                                           .getNamespaceContext ());

        // Add the default mapping for the root namespace
        final IJAXBDocumentType eUBLDocumentType = aArtefact.getValidationKey ()
                                                            .getTransaction ()
                                                            .getJAXBDocumentType ();
        aNSContext.addMapping (XMLConstants.DEFAULT_NS_PREFIX, eUBLDocumentType.getNamespaceURI ());

        aXPathContext.setNamespaceContext (aNSContext);
      }

      try
      {
        final Boolean aResult = XPathExpressionHelper.evalXPathToBoolean (aXPathContext,
                                                                          aArtefact.getValidationKey ()
                                                                                   .getPrerequisiteXPath (),
                                                                          XMLHelper.getOwnerDocument (aNode));
        if (aResult != null && !aResult.booleanValue ())
        {
          s_aLogger.info ("Ignoring validation artefact " +
                          aSCHRes.getPath () +
                          " because the prerequisite XPath expression '" +
                          aArtefact.getValidationKey ().getPrerequisiteXPath () +
                          "' is not fulfilled.");
          return ValidationResult.createIgnoredResult (aArtefact);
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
        return ValidationResult.createIgnoredResult (aArtefact);
      }
    }

    // No prerequisite or prerequisite matched
    final CollectingPSErrorHandler aErrorHandler = new CollectingPSErrorHandler ();
    final SchematronResourcePure aSCH = new SchematronResourcePure (aSCHRes).setErrorHandler (aErrorHandler);
    try
    {
      // Main application of Schematron
      final SchematronOutputType aSVRL = aSCH.applySchematronValidationToSVRL (aNode);
      if (aSVRL == null)
      {
        // Invalid Schematron - unexpected
        return new ValidationResult (aArtefact, aErrorHandler.getResourceErrors ());
      }

      // Conversion was successful
      if (!aErrorHandler.isEmpty ())
        throw new IllegalStateException ("Expected no error but got: " + aErrorHandler.getAllResourceErrors ());

      // Convert failed asserts and successful reports to resource errors
      final ErrorList aErrorList = new ErrorList ();
      for (final SVRLFailedAssert aFailedAssert : SVRLHelper.getAllFailedAssertions (aSVRL))
        aErrorList.add (aFailedAssert.getAsResourceError (aSCHRes.getPath ()));
      for (final SVRLSuccessfulReport aSuccessfulReport : SVRLHelper.getAllSuccessfulReports (aSVRL))
        aErrorList.add (aSuccessfulReport.getAsResourceError (aSCHRes.getPath ()));

      // Add one result element per layer
      return new ValidationResult (aArtefact, aErrorList);
    }
    catch (final Exception ex)
    {
      // Usually an error in the Schematron
      return new ValidationResult (aArtefact,
                                   new ErrorList (SingleError.builderError ()
                                                             .setErrorLocation (new ErrorLocation (aSCHRes.getPath ()))
                                                             .setErrorText (ex.getMessage ())
                                                             .setLinkedException (ex)
                                                             .build ()));
    }
  }
}
