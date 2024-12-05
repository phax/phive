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
package com.helger.phive.result.json;

import java.util.Locale;
import java.util.function.BiFunction;
import java.util.function.Function;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.IError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.mutable.MutableInt;
import com.helger.commons.state.ETriState;
import com.helger.json.IJsonArray;
import com.helger.json.IJsonObject;
import com.helger.json.JsonArray;
import com.helger.json.JsonObject;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.phive.result.PhiveResultHelper;

/**
 * A helper class that allows to heavily customize the creation of validation
 * result list JSONs
 *
 * @author Philip Helger
 * @since 7.2.3
 */
public class JsonValidationResultListHelper
{
  private IValidationExecutorSet <?> m_aVES;
  private Function <IValidationExecutorSet <?>, IJsonObject> m_aVESToJson = PhiveJsonHelper::getJsonVES;
  private Function <IReadableResource, String> m_aArtifactPathTypeToJson = PhiveResultHelper::getArtifactPathType;
  private Function <IErrorLevel, String> m_aErrorLevelToJson = PhiveResultHelper::getErrorLevelValue;
  private BiFunction <IError, Locale, IJsonObject> m_aErrorToJson = PhiveJsonHelper::getJsonError;
  private MutableInt m_aWarningCount;
  private MutableInt m_aErrorCount;

  public JsonValidationResultListHelper ()
  {}

  @Nonnull
  public JsonValidationResultListHelper ves (@Nullable final IValidationExecutorSet <?> a)
  {
    m_aVES = a;
    return this;
  }

  @Nonnull
  public JsonValidationResultListHelper vesToJson (@Nullable final Function <IValidationExecutorSet <?>, IJsonObject> a)
  {
    m_aVESToJson = a;
    return this;
  }

  @Nonnull
  public JsonValidationResultListHelper artifactPathTypeToJson (@Nullable final Function <IReadableResource, String> a)
  {
    m_aArtifactPathTypeToJson = a;
    return this;
  }

  @Nonnull
  public JsonValidationResultListHelper errorLevelToJson (@Nullable final Function <IErrorLevel, String> a)
  {
    m_aErrorLevelToJson = a;
    return this;
  }

  @Nonnull
  public JsonValidationResultListHelper errorToJson (@Nullable final BiFunction <IError, Locale, IJsonObject> a)
  {
    m_aErrorToJson = a;
    return this;
  }

  @Nonnull
  public JsonValidationResultListHelper warningCount (@Nullable final MutableInt a)
  {
    m_aWarningCount = a;
    return this;
  }

  @Nonnull
  public JsonValidationResultListHelper errorCount (@Nullable final MutableInt a)
  {
    m_aErrorCount = a;
    return this;
  }

  /**
   * Apply the results of a full validation onto a JSON object.The layout of the
   * response object is very similar to the one created by
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
   *        The validation result list containing the validation results per
   *        layer. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to be used. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   */
  public void applyTo (@Nonnull final IJsonObject aResponse,
                       @Nonnull final ValidationResultList aValidationResultList,
                       @Nonnull final Locale aDisplayLocale,
                       @Nonnegative final long nDurationMilliseconds)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");
    ValueEnforcer.isGE0 (nDurationMilliseconds, "DurationMilliseconds");

    if (m_aVES != null && m_aVESToJson != null)
      aResponse.addIfNotNull (PhiveJsonHelper.JSON_VES, m_aVESToJson.apply (m_aVES));

    int nWarnings = 0;
    int nErrors = 0;
    boolean bValidationInterrupted = false;
    IErrorLevel aMostSevere = EErrorLevel.LOWEST;
    EExtendedValidity eWorstValidity = EExtendedValidity.VALID;

    final IJsonArray aResultArray = new JsonArray ();
    for (final ValidationResult aVR : aValidationResultList)
    {
      final IJsonObject aVRT = new JsonObject ();
      // Success is only contained for backwards compatibility reasons. Validity
      // now does the trick
      if (aVR.isSkipped ())
      {
        bValidationInterrupted = true;
        aVRT.add (PhiveJsonHelper.JSON_SUCCESS, PhiveResultHelper.getTriStateValue (ETriState.UNDEFINED));
      }
      else
      {
        // Backwards compatible decision
        final boolean bIsValid = aVR.getErrorList ().containsNoError ();
        aVRT.add (PhiveJsonHelper.JSON_SUCCESS, PhiveResultHelper.getTriStateValue (bIsValid));
        if (!bIsValid)
          eWorstValidity = EExtendedValidity.INVALID;
      }
      aVRT.add (PhiveJsonHelper.JSON_ARTIFACT_TYPE, aVR.getValidationArtefact ().getValidationType ().getID ());
      if (m_aArtifactPathTypeToJson != null)
        aVRT.addIfNotNull (PhiveJsonHelper.JSON_ARTIFACT_PATH_TYPE,
                           m_aArtifactPathTypeToJson.apply (aVR.getValidationArtefact ().getRuleResource ()));
      aVRT.add (PhiveJsonHelper.JSON_ARTIFACT_PATH, aVR.getValidationArtefact ().getRuleResourcePath ());

      final IJsonArray aItemArray = new JsonArray ();
      for (final IError aError : aVR.getErrorList ())
      {
        if (aError.getErrorLevel ().isGT (aMostSevere))
          aMostSevere = aError.getErrorLevel ();

        if (PhiveResultHelper.isConsideredError (aError.getErrorLevel ()))
          nErrors++;
        else
          if (PhiveResultHelper.isConsideredWarning (aError.getErrorLevel ()))
            nWarnings++;

        if (m_aErrorToJson != null)
          aItemArray.add (m_aErrorToJson.apply (aError, aDisplayLocale));
      }
      aVRT.addJson (PhiveJsonHelper.JSON_ITEMS, aItemArray);
      aResultArray.add (aVRT);
    }
    // Success if the worst that happened is a warning
    // This is an assumption atm
    aResponse.add (PhiveJsonHelper.JSON_SUCCESS, eWorstValidity.isValid ());
    aResponse.add (PhiveJsonHelper.JSON_INTERRUPTED, bValidationInterrupted);
    if (m_aErrorLevelToJson != null)
      aResponse.addIfNotNull (PhiveJsonHelper.JSON_MOST_SEVERE_ERROR_LEVEL, m_aErrorLevelToJson.apply (aMostSevere));
    aResponse.addJson (PhiveJsonHelper.JSON_RESULTS, aResultArray);
    aResponse.add (PhiveJsonHelper.JSON_DURATION_MS, nDurationMilliseconds);

    // Set consumer values
    if (m_aWarningCount != null)
      m_aWarningCount.set (nWarnings);
    if (m_aErrorCount != null)
      m_aErrorCount.set (nErrors);
  }
}
