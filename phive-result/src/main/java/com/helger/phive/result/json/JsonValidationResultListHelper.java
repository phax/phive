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

import java.util.List;
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
import com.helger.phive.api.EExtendedValidity;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.result.ValidationResult;

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
  private Function <IReadableResource, String> m_aArtifactPathTypeToJson = PhiveJsonHelper::getArtifactPathType;
  private Function <IErrorLevel, String> m_aErrorLevelToJson = PhiveJsonHelper::getJsonErrorLevel;
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
    *     "success" : string,  // as defined by {@link PhiveJsonHelper#getJsonTriState(ETriState)}
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
                       @Nonnull final List <? extends ValidationResult> aValidationResultList,
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
      switch (aVR.getValidity ())
      {
        case IGNORED:
          bValidationInterrupted = true;
          aVRT.add (PhiveJsonHelper.JSON_SUCCESS, PhiveJsonHelper.getJsonTriState (ETriState.UNDEFINED));
          break;
        case VALID:
          aVRT.add (PhiveJsonHelper.JSON_SUCCESS, PhiveJsonHelper.getJsonTriState (true));
          break;
        case INVALID:
          aVRT.add (PhiveJsonHelper.JSON_SUCCESS, PhiveJsonHelper.getJsonTriState (false));
          eWorstValidity = EExtendedValidity.INVALID;
          break;
        case UNCLEAR:
          aVRT.add (PhiveJsonHelper.JSON_SUCCESS, PhiveJsonHelper.getJsonTriState (ETriState.UNDEFINED));
          if (eWorstValidity.isValid ())
            eWorstValidity = EExtendedValidity.UNCLEAR;
          break;
      }
      aVRT.add (PhiveJsonHelper.JSON_VALIDITY, aVR.getValidity ().getID ());
      aVRT.add (PhiveJsonHelper.JSON_ARTIFACT_TYPE, aVR.getValidationArtefact ().getValidationArtefactType ().getID ());
      if (m_aArtifactPathTypeToJson != null)
        aVRT.addIfNotNull (PhiveJsonHelper.JSON_ARTIFACT_PATH_TYPE,
                           m_aArtifactPathTypeToJson.apply (aVR.getValidationArtefact ().getRuleResource ()));
      aVRT.add (PhiveJsonHelper.JSON_ARTIFACT_PATH, aVR.getValidationArtefact ().getRuleResourcePath ());

      final IJsonArray aItemArray = new JsonArray ();
      for (final IError aError : aVR.getErrorList ())
      {
        if (aError.getErrorLevel ().isGT (aMostSevere))
          aMostSevere = aError.getErrorLevel ();

        if (PhiveJsonHelper.isConsideredError (aError.getErrorLevel ()))
          nErrors++;
        else
          if (PhiveJsonHelper.isConsideredWarning (aError.getErrorLevel ()))
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
    aResponse.add (PhiveJsonHelper.JSON_VALIDITY, eWorstValidity.getID ());
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
