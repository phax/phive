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

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.validation.Schema;

import org.oclc.purl.dsdl.svrl.SchematronOutputType;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.EErrorLevel;
import com.helger.commons.error.IResourceError;
import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.error.ResourceError;
import com.helger.commons.error.ResourceErrorGroup;
import com.helger.commons.error.ResourceLocation;
import com.helger.commons.io.IInputStreamProvider;
import com.helger.commons.io.IReadableResource;
import com.helger.commons.xml.schema.XMLSchemaValidationHelper;
import com.helger.commons.xml.transform.TransformSourceFactory;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.pure.errorhandler.CollectingPSErrorHandler;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLSuccessfulReport;
import com.helger.schematron.svrl.SVRLUtils;
import com.helger.ubl.UBL21DocumentTypes;

/**
 * This is the main validation class to validate PEPPOL UBL 2.1 documents
 * according to a passed validation configuration.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class PeppolValidator
{
  private final PeppolValidationConfiguration m_aConfiguration;

  public PeppolValidator (@Nonnull final PeppolValidationConfiguration aConfiguration)
  {
    m_aConfiguration = ValueEnforcer.notNull (aConfiguration, "Configuration");
  }

  @Nonnull
  public PeppolValidationConfiguration getValidationConfiguration ()
  {
    return m_aConfiguration;
  }

  @Nonnull
  public IResourceErrorGroup applyXSDValidation (@Nonnull final IInputStreamProvider aUBLDocument)
  {
    // Find the implementation class that is required for the configured
    // transaction
    final Class <?> aUBLImplementationClass = m_aConfiguration.getExtendedTransactionKey ()
                                                              .getUBLDocumentType ()
                                                              .getImplementationClass ();

    final ResourceErrorGroup aErrors = new ResourceErrorGroup ();

    // Find the XML schema required for validation
    // as we don't have a node, we need to trust the implementation class
    final Schema aSchema = UBL21DocumentTypes.getSchemaOfImplementationClass (aUBLImplementationClass);
    if (aSchema == null)
    {
      aErrors.addResourceError (new ResourceError (null,
                                                   EErrorLevel.ERROR,
                                                   "Don't know how to read UBL object of class " +
                                                       aUBLImplementationClass.getName ()));
    }
    else
    {
      // Apply the XML schema validation
      final IResourceErrorGroup aXSDErrors = XMLSchemaValidationHelper.validate (aSchema,
                                                                                 TransformSourceFactory.create (aUBLDocument));
      aErrors.addResourceErrorGroup (aXSDErrors);
    }
    return aErrors.getAllFailures ();
  }

  @Nonnull
  public IResourceErrorGroup applySchematronValidation (@Nonnull final IInputStreamProvider aUBLDocument)
  {
    final String sResourceName = aUBLDocument instanceof IReadableResource ? ((IReadableResource) aUBLDocument).getPath ()
                                                                          : "in-memory-data";

    final ResourceErrorGroup ret = new ResourceErrorGroup ();
    for (final IValidationArtefact aArtefact : m_aConfiguration.getAllValidationArtefacts ())
    {
      final IReadableResource aSCHRes = aArtefact.getSchematronResource ();
      final CollectingPSErrorHandler aErrorHandler = new CollectingPSErrorHandler ();
      final SchematronResourcePure aSCH = new SchematronResourcePure (aSCHRes).setErrorHandler (aErrorHandler);
      try
      {
        final SchematronOutputType aSVRL = aSCH.applySchematronValidationToSVRL (aUBLDocument);
        if (aSVRL == null)
        {
          // Invalid Schematron - unexpected
          for (final IResourceError aErr : aErrorHandler.getAllResourceErrors ())
            ret.addResourceError (aErr);
        }
        else
        {
          if (!aErrorHandler.getAllResourceErrors ().isEmpty ())
            throw new IllegalStateException ("Expected no error");

          for (final SVRLFailedAssert aFailedAssert : SVRLUtils.getAllFailedAssertions (aSVRL))
            ret.addResourceError (aFailedAssert.getAsResourceError (sResourceName));
          for (final SVRLSuccessfulReport aSuccessfulReport : SVRLUtils.getAllSuccesssfulReports (aSVRL))
            ret.addResourceError (aSuccessfulReport.getAsResourceError (sResourceName));
        }
      }
      catch (final Exception ex)
      {
        // Usually an error in the Schematron
        ret.addResourceError (new ResourceError (new ResourceLocation (aSCHRes.getPath ()),
                                                 EErrorLevel.ERROR,
                                                 ex.getMessage (),
                                                 ex));
      }
    }
    return ret;
  }
}
