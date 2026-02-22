/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.result.xml;

import java.util.Locale;
import java.util.function.BiFunction;
import java.util.function.Function;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.state.ETriState;
import com.helger.base.string.StringHelper;
import com.helger.datetime.web.PDTWebDateHelper;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.level.IErrorLevel;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.result.ValidationSummary;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.phive.result.PhiveResultHelper;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroElement;

/**
 * A helper class that allows to heavily customize the creation of validation result list XMLs
 *
 * @author Philip Helger
 * @since 10.0.3
 */
public class XMLValidationResultListHelper
{
  private static final Logger LOGGER = LoggerFactory.getLogger (XMLValidationResultListHelper.class);

  private Function <IValidationSource, IMicroElement> m_aSourceToXML = src -> PhiveXMLHelper.getXMLValidationSource (src,
                                                                                                                     true,
                                                                                                                     CPhiveXML.XML_VALIDATION_SOURCE);
  private IValidationExecutorSet <?> m_aVES;
  private Function <IValidationExecutorSet <?>, IMicroElement> m_aVESToXML = ves -> PhiveXMLHelper.getXMLVES (ves,
                                                                                                              CPhiveXML.XML_VES);
  private Function <IReadableResource, String> m_aArtifactPathTypeToXML = PhiveResultHelper::getArtifactPathType;
  private Function <IErrorLevel, String> m_aErrorLevelToXML = PhiveResultHelper::getErrorLevelValue;
  private BiFunction <IError, Locale, IMicroElement> m_aErrorToXML = (err, loc) -> PhiveXMLHelper.getXMLError (err,
                                                                                                               loc,
                                                                                                               CPhiveXML.XML_ITEM);

  public XMLValidationResultListHelper ()
  {}

  @NonNull
  public XMLValidationResultListHelper sourceToXML (@Nullable final Function <IValidationSource, IMicroElement> a)
  {
    m_aSourceToXML = a;
    return this;
  }

  @NonNull
  public XMLValidationResultListHelper ves (@Nullable final IValidationExecutorSet <?> a)
  {
    m_aVES = a;
    return this;
  }

  @NonNull
  public XMLValidationResultListHelper vesToXML (@Nullable final Function <IValidationExecutorSet <?>, IMicroElement> a)
  {
    m_aVESToXML = a;
    return this;
  }

  @NonNull
  public XMLValidationResultListHelper artifactPathTypeToXML (@Nullable final Function <IReadableResource, String> a)
  {
    m_aArtifactPathTypeToXML = a;
    return this;
  }

  @NonNull
  public XMLValidationResultListHelper errorLevelToXML (@Nullable final Function <IErrorLevel, String> a)
  {
    m_aErrorLevelToXML = a;
    return this;
  }

  @NonNull
  public XMLValidationResultListHelper errorToXML (@Nullable final BiFunction <IError, Locale, IMicroElement> a)
  {
    m_aErrorToXML = a;
    return this;
  }

  /**
   * Apply the results of a full validation onto a XML object.The layout of the response object is
   * very similar to the one created by
   * {@link PhiveXMLHelper#applyGlobalError(IMicroElement, String, long)}.<br>
   *
   * <pre>
    * {
    *   "ves" : object as defined by {@link PhiveXMLHelper#getXMLVES(IValidationExecutorSet, String)}
    *   "success" : boolean,
    *   "interrupted" : boolean,
    *   "mostSevereErrorLevel" : string,
    *   "results" : array {
    *     "success" : string,  // as defined by {@link PhiveResultHelper#getTriStateValue(ETriState)}
    *     "artifactType" : string,
    *     "artifactPathType" : string?,
    *     "artifactPath" : string,
    *     "items" : array {
    *       error structure as in {@link PhiveXMLHelper#getXMLError(IError, Locale,String)}
    *     }
    *   },
    *   "durationMS" : number
    * }
   * </pre>
   *
   * @param aResponse
   *        The response XML object to add to. May not be <code>null</code>.
   * @param aValidationResultList
   *        The validation result list containing the validation results per layer. May not be
   *        <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to be used. May not be <code>null</code>.
   */
  public void applyTo (@NonNull final IMicroElement aResponse,
                       @NonNull final ValidationResultList aValidationResultList,
                       @NonNull final Locale aDisplayLocale)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");

    // Added in 12.0.0
    aResponse.addElement (CPhiveXML.XML_VALIDATION_DATETIME)
             .addText (PDTWebDateHelper.getAsStringXSD (aValidationResultList.getValidationDateTime ()));

    // Added in 10.1.0
    if (aValidationResultList.hasValidationSource () && m_aSourceToXML != null)
    {
      final IMicroElement eSource = m_aSourceToXML.apply (aValidationResultList.getValidationSource ());
      if (eSource != null)
        aResponse.addChild (eSource);
    }

    if (m_aVES != null && m_aVESToXML != null)
    {
      final IMicroElement eVES = m_aVESToXML.apply (m_aVES);
      if (eVES != null)
        aResponse.addChild (eVES);
    }

    // Create summary
    final ValidationSummary aSummary = ValidationSummary.create (aValidationResultList);

    // Serialize
    {
      aResponse.addElement (CPhiveXML.XML_SUCCESS).addText (aValidationResultList.getOverallValidity ().isValid ());
      aResponse.addElement (CPhiveXML.XML_INTERRUPTED).addText (aSummary.isValidationInterrupted ());
      if (m_aErrorLevelToXML != null)
      {
        final String sErrorLevel = m_aErrorLevelToXML.apply (aSummary.getMostSevereErrorLevel ());
        if (StringHelper.isNotEmpty (sErrorLevel))
          aResponse.addElement (CPhiveXML.XML_MOST_SEVERE_ERROR_LEVEL).addText (sErrorLevel);
      }
    }

    // Add the items afterwards
    for (final ValidationResult aVR : aValidationResultList)
    {
      final IValidationArtefact aVA = aVR.getValidationArtefact ();
      final EExtendedValidity eValidity = aVR.getValidity ();

      final IMicroElement aVRT = new MicroElement (CPhiveXML.XML_RESULT);
      // Success is only contained for backwards compatibility reasons. Validity
      // now does the trick
      aVRT.addElement (CPhiveXML.XML_SUCCESS).addText (PhiveResultHelper.getTriStateValue (eValidity));
      // Added in 12.0.0
      aVRT.addElement (CPhiveXML.XML_VALIDITY).addText (eValidity.getID ());
      aVRT.addElement (CPhiveXML.XML_ARTIFACT_TYPE).addText (aVA.getValidationType ().getID ());
      if (m_aArtifactPathTypeToXML != null)
      {
        final String sPathType = m_aArtifactPathTypeToXML.apply (aVA.getRuleResource ());
        if (StringHelper.isNotEmpty (sPathType))
          aVRT.addElement (CPhiveXML.XML_ARTIFACT_PATH_TYPE).addText (sPathType);
      }
      aVRT.addElement (CPhiveXML.XML_ARTIFACT_PATH).addText (aVA.getRuleResourcePath ());

      for (final IError aError : aVR.getErrorList ())
      {
        final IMicroElement eError = m_aErrorToXML != null ? m_aErrorToXML.apply (aError, aDisplayLocale) : null;
        if (eError != null)
          aVRT.addChild (eError);
        else
          LOGGER.warn ("Failed to convert IError to XML");
      }
      aVRT.addElement (CPhiveXML.XML_DURATION_MS).addText (aVR.getDurationMS ());

      aResponse.addChild (aVRT);
    }

    // This is the end of the XML
    if (aValidationResultList.hasValidationDuration ())
      aResponse.addElement (CPhiveXML.XML_DURATION_MS)
               .addText (aValidationResultList.getValidationDuration ().toMillis ());
  }
}
