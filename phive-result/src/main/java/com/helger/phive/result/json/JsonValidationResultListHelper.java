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
package com.helger.phive.result.json;

import java.util.Locale;
import java.util.function.BiFunction;
import java.util.function.Function;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.state.ETriState;
import com.helger.datetime.web.PDTWebDateHelper;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.level.IErrorLevel;
import com.helger.io.resource.IReadableResource;
import com.helger.json.IJsonArray;
import com.helger.json.IJsonObject;
import com.helger.json.JsonArray;
import com.helger.json.JsonObject;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.result.ValidationSummary;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.phive.result.PhiveResultHelper;

/**
 * A helper class that allows to heavily customize the creation of validation result list JSONs
 *
 * @author Philip Helger
 * @since 7.2.3
 */
public class JsonValidationResultListHelper
{
  // By default, include source content
  private Function <IValidationSource, IJsonObject> m_aSourceToJson = vs -> PhiveJsonHelper.getJsonValidationSource (vs,
                                                                                                                     true);
  private IValidationExecutorSet <?> m_aVES;
  private Function <IValidationExecutorSet <?>, IJsonObject> m_aVESToJson = PhiveJsonHelper::getJsonVES;
  private Function <IReadableResource, String> m_aArtifactPathTypeToJson = PhiveResultHelper::getArtifactPathType;
  private Function <IErrorLevel, String> m_aErrorLevelToJson = PhiveResultHelper::getErrorLevelValue;
  private BiFunction <IError, Locale, IJsonObject> m_aErrorToJson = PhiveJsonHelper::getJsonError;

  public JsonValidationResultListHelper ()
  {}

  @NonNull
  public JsonValidationResultListHelper sourceToJson (@Nullable final Function <IValidationSource, IJsonObject> a)
  {
    m_aSourceToJson = a;
    return this;
  }

  @NonNull
  public JsonValidationResultListHelper ves (@Nullable final IValidationExecutorSet <?> a)
  {
    m_aVES = a;
    return this;
  }

  @NonNull
  public JsonValidationResultListHelper vesToJson (@Nullable final Function <IValidationExecutorSet <?>, IJsonObject> a)
  {
    m_aVESToJson = a;
    return this;
  }

  @NonNull
  public JsonValidationResultListHelper artifactPathTypeToJson (@Nullable final Function <IReadableResource, String> a)
  {
    m_aArtifactPathTypeToJson = a;
    return this;
  }

  @NonNull
  public JsonValidationResultListHelper errorLevelToJson (@Nullable final Function <IErrorLevel, String> a)
  {
    m_aErrorLevelToJson = a;
    return this;
  }

  @NonNull
  public JsonValidationResultListHelper errorToJson (@Nullable final BiFunction <IError, Locale, IJsonObject> a)
  {
    m_aErrorToJson = a;
    return this;
  }

  /**
   * Apply the results of a full validation onto a JSON object.The layout of the response object is
   * very similar to the one created by
   * {@link PhiveJsonHelper#applyGlobalError(IJsonObject, String, long)}.<br>
   *
   * <pre>
    * {
    *   "ves" : object as defined by {@link PhiveJsonHelper#getJsonVES(IValidationExecutorSet)}
    *   "success" : boolean,
    *   "interrupted" : boolean,
    *   "mostSevereErrorLevel" : string,
    *   "results" : array {
    *     "success" : string,  // as defined by {@link PhiveResultHelper#getTriStateValue(ETriState)}
    *     "artifactType" : string,
    *     "artifactPathType" : string?,
    *     "artifactPath" : string,
    *     "items" : array {
    *       error structure as in {@link PhiveJsonHelper#getJsonError(IError, Locale)}
    *     }
    *   },
    *   "durationMS" : number
    * }
   * </pre>
   *
   * @param aResponse
   *        The response JSON object to add to. May not be <code>null</code>.
   * @param aValidationResultList
   *        The validation result list containing the validation results per layer. May not be
   *        <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to be used. May not be <code>null</code>.
   */
  public void applyTo (@NonNull final IJsonObject aResponse,
                       @NonNull final ValidationResultList aValidationResultList,
                       @NonNull final Locale aDisplayLocale)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");

    // Added in 12.0.0
    aResponse.add (PhiveJsonHelper.JSON_VALIDATION_DATETIME,
                   PDTWebDateHelper.getAsStringXSD (aValidationResultList.getValidationDateTime ()));

    // Added in 10.1.0
    if (aValidationResultList.hasValidationSource () && m_aSourceToJson != null)
    {
      aResponse.addIfNotNull (PhiveJsonHelper.JSON_VALIDATION_SOURCE,
                              m_aSourceToJson.apply (aValidationResultList.getValidationSource ()));
    }

    if (m_aVES != null && m_aVESToJson != null)
      aResponse.addIfNotNull (PhiveJsonHelper.JSON_VES, m_aVESToJson.apply (m_aVES));

    final IJsonArray aResultArray = new JsonArray ();
    for (final ValidationResult aVR : aValidationResultList)
    {
      final IValidationArtefact aVA = aVR.getValidationArtefact ();
      final EExtendedValidity eValidity = aVR.getValidity ();

      final IJsonObject aVRT = new JsonObject ();
      // Success is only contained for backwards compatibility reasons. Validity
      // now does the trick
      aVRT.add (PhiveJsonHelper.JSON_SUCCESS, PhiveResultHelper.getTriStateValue (eValidity));
      aVRT.add (PhiveJsonHelper.JSON_VALIDITY, eValidity.getID ());
      aVRT.add (PhiveJsonHelper.JSON_ARTIFACT_TYPE, aVA.getValidationType ().getID ());
      if (m_aArtifactPathTypeToJson != null)
        aVRT.addIfNotNull (PhiveJsonHelper.JSON_ARTIFACT_PATH_TYPE,
                           m_aArtifactPathTypeToJson.apply (aVA.getRuleResource ()));
      aVRT.add (PhiveJsonHelper.JSON_ARTIFACT_PATH, aVA.getRuleResourcePath ());

      final IJsonArray aItemArray = new JsonArray ();
      for (final IError aError : aVR.getErrorList ())
      {
        if (m_aErrorToJson != null)
          aItemArray.add (m_aErrorToJson.apply (aError, aDisplayLocale));
      }
      aVRT.add (PhiveJsonHelper.JSON_ITEMS, aItemArray);
      aVRT.add (PhiveJsonHelper.JSON_DURATION_MS, aVR.getDurationMS ());
      aResultArray.add (aVRT);
    }

    // Create the summary elements
    final ValidationSummary aSummary = ValidationSummary.create (aValidationResultList);
    aResponse.add (PhiveJsonHelper.JSON_SUCCESS, aValidationResultList.getOverallValidity ().isValid ());
    aResponse.add (PhiveJsonHelper.JSON_INTERRUPTED, aSummary.isValidationInterrupted ());
    if (m_aErrorLevelToJson != null)
      aResponse.addIfNotNull (PhiveJsonHelper.JSON_MOST_SEVERE_ERROR_LEVEL,
                              m_aErrorLevelToJson.apply (aSummary.getMostSevereErrorLevel ()));
    aResponse.add (PhiveJsonHelper.JSON_RESULTS, aResultArray);

    if (aValidationResultList.hasValidationDuration ())
      aResponse.add (PhiveJsonHelper.JSON_DURATION_MS, aValidationResultList.getValidationDuration ().toMillis ());
  }
}
