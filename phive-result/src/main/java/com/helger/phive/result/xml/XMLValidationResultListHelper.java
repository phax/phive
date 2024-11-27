/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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

import java.util.List;
import java.util.Locale;
import java.util.function.BiFunction;
import java.util.function.Function;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.IError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.mutable.MutableInt;
import com.helger.commons.state.ETriState;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.phive.result.PhiveResultHelper;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroElement;

/**
 * A helper class that allows to heavily customize the creation of validation
 * result list JSONs
 *
 * @author Philip Helger
 * @since 7.2.3
 */
public class XMLValidationResultListHelper
{
  private static final Logger LOGGER = LoggerFactory.getLogger (XMLValidationResultListHelper.class);

  private IValidationExecutorSet <?> m_aVES;
  private Function <IValidationExecutorSet <?>, IMicroElement> m_aVESToXML = ves -> PhiveXMLHelper.getXMLVES (ves,
                                                                                                              PhiveXMLHelper.XML_VES);
  private Function <IReadableResource, String> m_aArtifactPathTypeToXML = PhiveResultHelper::getArtifactPathType;
  private Function <IErrorLevel, String> m_aErrorLevelToXML = PhiveResultHelper::getErrorLevelValue;
  private BiFunction <IError, Locale, IMicroElement> m_aErrorToXML = (err,
                                                                      loc) -> PhiveXMLHelper.getXMLError (err,
                                                                                                          loc,
                                                                                                          PhiveXMLHelper.XML_ITEM);
  private MutableInt m_aWarningCount;
  private MutableInt m_aErrorCount;

  public XMLValidationResultListHelper ()
  {}

  @Nonnull
  public XMLValidationResultListHelper ves (@Nullable final IValidationExecutorSet <?> a)
  {
    m_aVES = a;
    return this;
  }

  @Nonnull
  public XMLValidationResultListHelper vesToXML (@Nullable final Function <IValidationExecutorSet <?>, IMicroElement> a)
  {
    m_aVESToXML = a;
    return this;
  }

  @Nonnull
  public XMLValidationResultListHelper artifactPathTypeToXML (@Nullable final Function <IReadableResource, String> a)
  {
    m_aArtifactPathTypeToXML = a;
    return this;
  }

  @Nonnull
  public XMLValidationResultListHelper errorLevelToXML (@Nullable final Function <IErrorLevel, String> a)
  {
    m_aErrorLevelToXML = a;
    return this;
  }

  @Nonnull
  public XMLValidationResultListHelper errorToXML (@Nullable final BiFunction <IError, Locale, IMicroElement> a)
  {
    m_aErrorToXML = a;
    return this;
  }

  @Nonnull
  public XMLValidationResultListHelper warningCount (@Nullable final MutableInt a)
  {
    m_aWarningCount = a;
    return this;
  }

  @Nonnull
  public XMLValidationResultListHelper errorCount (@Nullable final MutableInt a)
  {
    m_aErrorCount = a;
    return this;
  }

  /**
   * Apply the results of a full validation onto a XML object.The layout of the
   * response object is very similar to the one created by
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
   *        The response JSON object to add to. May not be <code>null</code>.
   * @param aValidationResultList
   *        The validation result list containing the validation results per
   *        layer. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to be used. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   */
  public void applyTo (@Nonnull final IMicroElement aResponse,
                       @Nonnull final List <? extends ValidationResult> aValidationResultList,
                       @Nonnull final Locale aDisplayLocale,
                       @Nonnegative final long nDurationMilliseconds)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");
    ValueEnforcer.isGE0 (nDurationMilliseconds, "DurationMilliseconds");

    if (m_aVES != null && m_aVESToXML != null)
    {
      final IMicroElement eVES = m_aVESToXML.apply (m_aVES);
      if (eVES != null)
        aResponse.appendChild (eVES);
    }

    int nWarnings = 0;
    int nErrors = 0;
    {
      boolean bValidationInterrupted = false;
      IErrorLevel aMostSevere = EErrorLevel.LOWEST;
      EExtendedValidity eWorstValidity = EExtendedValidity.VALID;

      // Calculate overalls
      for (final ValidationResult aVR : aValidationResultList)
      {
        if (aVR.isSkipped ())
        {
          bValidationInterrupted = true;
        }
        else
        {
          // Backwards compatible decision
          final boolean bIsValid = aVR.getErrorList ().containsNoError ();
          if (!bIsValid)
            eWorstValidity = EExtendedValidity.INVALID;
        }

        for (final IError aError : aVR.getErrorList ())
        {
          if (aError.getErrorLevel ().isGT (aMostSevere))
            aMostSevere = aError.getErrorLevel ();

          if (PhiveResultHelper.isConsideredError (aError.getErrorLevel ()))
            nErrors++;
          else
            if (PhiveResultHelper.isConsideredWarning (aError.getErrorLevel ()))
              nWarnings++;
        }
      }

      // Success if the worst that happened is a warning
      // This is an assumption atm
      aResponse.appendElement (PhiveXMLHelper.XML_SUCCESS).appendText (Boolean.toString (eWorstValidity.isValid ()));
      aResponse.appendElement (PhiveXMLHelper.XML_INTERRUPTED).appendText (Boolean.toString (bValidationInterrupted));
      if (m_aErrorLevelToXML != null)
      {
        final String sErrorLevel = m_aErrorLevelToXML.apply (aMostSevere);
        if (StringHelper.hasText (sErrorLevel))
          aResponse.appendElement (PhiveXMLHelper.XML_MOST_SEVERE_ERROR_LEVEL).appendText (sErrorLevel);
      }
    }

    for (final ValidationResult aVR : aValidationResultList)
    {
      final IMicroElement aVRT = new MicroElement (PhiveXMLHelper.XML_RESULT);
      // Success is only contained for backwards compatibility reasons. Validity
      // now does the trick
      if (aVR.isSkipped ())
      {
        aVRT.appendElement (PhiveXMLHelper.XML_SUCCESS)
            .appendText (PhiveResultHelper.getTriStateValue (ETriState.UNDEFINED));
      }
      else
      {
        // Backwards compatible decision
        final boolean bIsValid = aVR.getErrorList ().containsNoError ();
        aVRT.appendElement (PhiveXMLHelper.XML_SUCCESS).appendText (PhiveResultHelper.getTriStateValue (bIsValid));
      }
      aVRT.appendElement (PhiveXMLHelper.XML_ARTIFACT_TYPE)
          .appendText (aVR.getValidationArtefact ().getValidationType ().getID ());
      if (m_aArtifactPathTypeToXML != null)
      {
        final String sPathType = m_aArtifactPathTypeToXML.apply (aVR.getValidationArtefact ().getRuleResource ());
        if (StringHelper.hasText (sPathType))
          aVRT.appendElement (PhiveXMLHelper.XML_ARTIFACT_PATH_TYPE).appendText (sPathType);
      }
      aVRT.appendElement (PhiveXMLHelper.XML_ARTIFACT_PATH)
          .appendText (aVR.getValidationArtefact ().getRuleResourcePath ());

      for (final IError aError : aVR.getErrorList ())
      {
        final IMicroElement eError = m_aErrorToXML != null ? m_aErrorToXML.apply (aError, aDisplayLocale) : null;
        if (eError != null)
          aVRT.appendChild (eError);
        else
          LOGGER.warn ("Failed to convert IError to XML");
      }
      aResponse.appendChild (aVRT);
    }
    aResponse.appendElement (PhiveXMLHelper.XML_DURATION_MS).appendText (Long.toString (nDurationMilliseconds));

    // Set consumer values
    if (m_aWarningCount != null)
      m_aWarningCount.set (nWarnings);
    if (m_aErrorCount != null)
      m_aErrorCount.set (nErrors);
  }
}
