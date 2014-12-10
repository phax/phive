/**
 * Copyright (C) 2014 Philip Helger (www.helger.com)
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

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.io.IInputStreamProvider;
import com.helger.commons.jaxb.validation.CollectingValidationEventHandler;
import com.helger.commons.xml.transform.TransformSourceFactory;
import com.helger.ubl.UBL21Marshaller;

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
    final Class <?> aUBLImplementationClass = m_aConfiguration.getExtendedTransactionKey ()
                                                              .getUBLDocumentType ()
                                                              .getImplementationClass ();
    final CollectingValidationEventHandler aEventHandler = new CollectingValidationEventHandler ();
    final Object aUBLObject = UBL21Marshaller.readUBLDocument (TransformSourceFactory.create (aUBLDocument),
                                                               aUBLImplementationClass,
                                                               aEventHandler);
    final IResourceErrorGroup aXSDErrors = aEventHandler.getResourceErrors ();
    if (!aXSDErrors.containsAtLeastOneFailure () && aUBLObject == null)
      throw new IllegalStateException ("Internal inconsistency");

    return aXSDErrors.getAllFailures ();
  }
}
