package com.helger.bdve.execute;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;
import javax.xml.transform.Source;
import javax.xml.validation.Schema;

import org.xml.sax.SAXParseException;

import com.helger.bdve.EValidationType;
import com.helger.bdve.ValidationKey;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.result.ValidationResult;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.error.list.IErrorList;
import com.helger.commons.error.location.ErrorLocation;
import com.helger.jaxb.builder.IJAXBDocumentType;
import com.helger.xml.sax.AbstractSAXErrorHandler;
import com.helger.xml.schema.XMLSchemaValidationHelper;

/**
 * Implementation of {@link IValidationExecutor} for XML Schema validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorXSD extends AbstractValidationExecutor
{
  public ValidationExecutorXSD (@Nonnull final ValidationKey aVK)
  {
    super (EValidationType.XSD, aVK);
  }

  /**
   * Perform only XSD validation
   *
   * @param aSourceDocument
   *        Source to be validated
   * @param aClassLoader
   *        Optional class loader to use. May be <code>null</code>.
   * @return Never <code>null</code>.
   */
  @Nonnull
  public ValidationResult applyValidation (@Nonnull @WillClose final Source aSourceDocument,
                                           @Nullable final ClassLoader aClassLoader)
  {
    ValueEnforcer.notNull (aSourceDocument, "SourceDocument");

    final ValidationKey aVK = getValidationKey ();
    try
    {
      // Find the document type that is required for the configured
      // validation
      final IJAXBDocumentType aJAXBDocumentType = aVK.getTransaction ().getJAXBDocumentType ();

      // Find the XML schema required for validation
      // as we don't have a node, we need to trust the implementation class
      final Schema aSchema = aJAXBDocumentType.getSchema (aClassLoader);
      assert aSchema != null;

      final ErrorList aErrors = new ErrorList ();
      try
      {
        // Apply the XML schema validation
        final IErrorList aXSDErrors = XMLSchemaValidationHelper.validate (aSchema, aSourceDocument);
        aErrors.addAll (aXSDErrors);
      }
      catch (final IllegalArgumentException ex)
      {
        // Happens when non-XML document is trying to be parsed
        if (ex.getCause () instanceof SAXParseException)
          aErrors.add (AbstractSAXErrorHandler.getSaxParseError (EErrorLevel.FATAL_ERROR,
                                                                 (SAXParseException) ex.getCause ()));
        else
          aErrors.add (SingleError.builderFatalError ()
                                  .setErrorLocation (new ErrorLocation (aSourceDocument.getSystemId ()))
                                  .setErrorText ("The document to be validated is not an XML document")
                                  .setLinkedException (ex)
                                  .build ());
      }

      // Build result object
      // UBL always uses exactly one XSD
      return new ValidationResult (new ValidationArtefact (EValidationType.XSD,
                                                           aJAXBDocumentType.getAllXSDResources (aClassLoader)
                                                                            .getFirst (),
                                                           aVK),
                                   aErrors.getAllFailures ());
    }
    finally
    {
      closeSource (aSourceDocument);
    }
  }
}
