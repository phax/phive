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

import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;
import java.util.function.Function;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.datetime.PDTWebDateHelper;
import com.helger.commons.error.IError;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.error.text.ConstantHasErrorText;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.lang.StackTraceHelper;
import com.helger.commons.location.ILocation;
import com.helger.commons.location.SimpleLocation;
import com.helger.commons.mutable.MutableInt;
import com.helger.commons.state.ETriState;
import com.helger.commons.string.StringHelper;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.json.IJson;
import com.helger.json.IJsonArray;
import com.helger.json.IJsonObject;
import com.helger.json.IJsonValue;
import com.helger.json.JsonArray;
import com.helger.json.JsonObject;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSetRegistry;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.phive.result.PhiveResultHelper;
import com.helger.phive.result.exception.PhiveRestoredException;
import com.helger.schematron.svrl.SVRLResourceError;

/**
 * A utility class to create a common JSON representation of a PHIVE result. Use
 * {@link #applyGlobalError(IJsonObject, String, long)} or
 * {@link #applyValidationResultList(IJsonObject, IValidationExecutorSet, List, Locale, long, MutableInt, MutableInt)}
 * to add the result to an arbitrary {@link IJsonObject}.
 *
 * @author Philip Helger
 * @since 5.2.5
 */
@Immutable
public final class PhiveJsonHelper
{
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_ERRORLEVEL_SUCCESS = PhiveResultHelper.VALUE_ERRORLEVEL_SUCCESS;
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_ERRORLEVEL_WARN = PhiveResultHelper.VALUE_ERRORLEVEL_WARN;
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_ERRORLEVEL_ERROR = PhiveResultHelper.VALUE_ERRORLEVEL_ERROR;

  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_TRISTATE_TRUE = PhiveResultHelper.VALUE_TRISTATE_TRUE;
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_TRISTATE_FALSE = PhiveResultHelper.VALUE_TRISTATE_FALSE;
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static final String JSON_TRISTATE_UNDEFINED = PhiveResultHelper.VALUE_TRISTATE_UNDEFINED;

  public static final String JSON_RESOURCE_ID = "resource";
  public static final String JSON_LINE_NUM = "line";
  public static final String JSON_COLUMN_NUM = "col";

  public static final String JSON_ERROR_DATETIME = "errorDateTime";
  public static final String JSON_ERROR_LEVEL = "errorLevel";
  public static final String JSON_ERROR_ID = "errorID";
  public static final String JSON_ERROR_FIELD_NAME = "errorFieldName";
  public static final String JSON_ERROR_LOCATION_OBJ = "errorLocationObj";
  public static final String JSON_ERROR_LOCATION_STR = "errorLocation";
  public static final String JSON_ERROR_TEXT = "errorText";
  public static final String JSON_EXCEPTION = "exception";
  public static final String JSON_TEST = "test";

  public static final String JSON_VESID = "vesid";
  public static final String JSON_NAME = "name";
  public static final String JSON_DEPRECATED = "deprecated";
  public static final String JSON_STATUS = "status";
  public static final String JSON_STATUS_LAST_MODIFICATION = "lastModification";
  public static final String JSON_STATUS_TYPE = "type";
  public static final String JSON_STATUS_VALID_FROM = "validFrom";
  public static final String JSON_STATUS_VALID_TO = "validTo";
  public static final String JSON_STATUS_DEPRECATION_REASON = "deprecationReason";
  public static final String JSON_STATUS_REPLACEMENT_VESID = "replacementVesid";

  public static final String JSON_SUCCESS = "success";
  public static final String JSON_ARTIFACT_TYPE = "artifactType";
  public static final String JSON_ARTIFACT_PATH_TYPE = "artifactPathType";
  public static final String JSON_ARTIFACT_PATH = "artifactPath";
  public static final String JSON_ITEMS = "items";
  public static final String JSON_INTERRUPTED = "interrupted";
  public static final String JSON_MOST_SEVERE_ERROR_LEVEL = "mostSevereErrorLevel";
  public static final String JSON_RESULTS = "results";
  public static final String JSON_DURATION_MS = "durationMS";
  public static final String JSON_VES = "ves";

  public static final String ARTIFACT_TYPE_INPUT_PARAMETER = "input-parameter";
  public static final String ARTIFACT_PATH_NONE = "none";

  private static final Logger LOGGER = LoggerFactory.getLogger (PhiveJsonHelper.class);

  private PhiveJsonHelper ()
  {}

  @Deprecated (forRemoval = true, since = "10.0.3")
  public static boolean isConsideredError (@Nonnull final IErrorLevel aErrorLevel)
  {
    return PhiveResultHelper.isConsideredError (aErrorLevel);
  }

  @Deprecated (forRemoval = true, since = "10.0.3")
  public static boolean isConsideredWarning (@Nonnull final IErrorLevel aErrorLevel)
  {
    return PhiveResultHelper.isConsideredWarning (aErrorLevel);
  }

  /**
   * Get the JSON string of the error level. One of <code>"ERROR"</code>,
   * <code>"WARN"</code> or <code>"SUCCESS"</code>.<br>
   * See {@link #JSON_ERRORLEVEL_SUCCESS}, {@link #JSON_ERRORLEVEL_WARN},
   * {@link #JSON_ERRORLEVEL_ERROR}
   *
   * @param aErrorLevel
   *        The error level to convert. May not be <code>null</code>.
   * @return A non-<code>null</code> JSON value string.
   */
  @Nonnull
  @Nonempty
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static String getJsonErrorLevel (@Nonnull final IErrorLevel aErrorLevel)
  {
    return PhiveResultHelper.getErrorLevelValue (aErrorLevel);
  }

  @Nullable
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static IErrorLevel getAsErrorLevel (@Nullable final String sErrorLevel)
  {
    return PhiveResultHelper.getAsErrorLevel (sErrorLevel);
  }

  /**
   * Get the tri-state representation of the provided value. Either
   * {@link #JSON_TRISTATE_TRUE} or {@link #JSON_TRISTATE_FALSE}.
   *
   * @param b
   *        boolean value to get converted.
   * @return A non-<code>null</code> JSON value string.
   * @see #getJsonTriState(ETriState)
   */
  @Nonnull
  @Nonempty
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static String getJsonTriState (final boolean b)
  {
    return PhiveResultHelper.getTriStateValue (b);
  }

  /**
   * Get the tri-state representation of the provided value. Either
   * {@link #JSON_TRISTATE_TRUE}, {@link #JSON_TRISTATE_FALSE} or
   * {@link #JSON_TRISTATE_UNDEFINED}.
   *
   * @param eTriState
   *        Tri-state value to get converted. May not be <code>null</code>.
   * @return A non-<code>null</code> JSON value string.
   * @see #getJsonTriState(boolean)
   */
  @Nonnull
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static String getJsonTriState (@Nonnull final ETriState eTriState)
  {
    return PhiveResultHelper.getTriStateValue (eTriState);
  }

  /**
   * Convert the provided value into a tri-state value. Must be one of
   * {@link #JSON_TRISTATE_TRUE}, {@link #JSON_TRISTATE_FALSE} or
   * {@link #JSON_TRISTATE_UNDEFINED}.
   *
   * @param sTriState
   *        Source value. May be <code>null</code>.
   * @return <code>null</code> if the provided value is unknown.
   */
  @Nullable
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static ETriState getAsTriState (@Nullable final String sTriState)
  {
    return PhiveResultHelper.getAsTriState (sTriState);
  }

  /**
   * Get the JSON representation of a stack trace.<br>
   *
   * <pre>
   * {
   *   "class" : string,
   *   "message" : string?,
   *   "stackTrace" : string
   * }
   * </pre>
   *
   * @param t
   *        The exception to convert to a JSON object. May be <code>null</code>.
   * @return <code>null</code> if the parameter is <code>null</code>, the JSON
   *         object otherwise.
   * @see PhiveRestoredException for a representation after reading
   */
  @Nullable
  public static IJsonObject getJsonStackTrace (@Nullable final Throwable t)
  {
    if (t == null)
      return null;
    if (t instanceof PhiveRestoredException)
      return ((PhiveRestoredException) t).getAsJson ();
    return PhiveRestoredException.getAsJson (t.getClass ().getName (),
                                             t.getMessage (),
                                             StackTraceHelper.getStackAsString (t));
  }

  /**
   * Get the JSON representation of a location.<br>
   *
   * <pre>
   * {
   *   "resource" : string?,
   *   "line" : number?,
   *   "col" : number?
   * }
   * </pre>
   *
   * @param aLocation
   *        The location to convert to a JSON object. May be <code>null</code>.
   * @return <code>null</code> if the parameter is <code>null</code>, the JSON
   *         object otherwise.
   */
  @Nullable
  public static IJsonObject getJsonErrorLocation (@Nullable final ILocation aLocation)
  {
    if (aLocation == null || !aLocation.isAnyInformationPresent ())
      return null;
    final IJsonObject ret = new JsonObject ();
    if (aLocation.hasResourceID ())
      ret.add (JSON_RESOURCE_ID, aLocation.getResourceID ());
    if (aLocation.hasLineNumber ())
      ret.add (JSON_LINE_NUM, aLocation.getLineNumber ());
    if (aLocation.hasColumnNumber ())
      ret.add (JSON_COLUMN_NUM, aLocation.getColumnNumber ());
    return ret;
  }

  @Nullable
  public static ILocation getAsErrorLocation (@Nullable final IJsonObject aObj)
  {
    if (aObj == null)
      return null;

    final String sResourceID = aObj.getAsString (JSON_RESOURCE_ID);
    final int nLineNumber = aObj.getAsInt (JSON_LINE_NUM, -1);
    final int nColumnNumber = aObj.getAsInt (JSON_COLUMN_NUM, -1);
    if (StringHelper.hasNoText (sResourceID) && nLineNumber < 0 && nColumnNumber < 0)
      return null;

    return new SimpleLocation (sResourceID, nLineNumber, nColumnNumber);
  }

  /**
   * Get the JSON representation of an error.<br>
   *
   * <pre>
   * {
   *   "errorLevel" : string,
   *   "errorID" : string?,
   *   "errorFieldName" : string?,
   *   "errorLocation" : object?,
   *   "test" : string?,
   *   "errorText" : string,
   *   "exception : object?
   * }
   * </pre>
   *
   * @param aErrorLevel
   *        The error level to use. May not be <code>null</code>.
   * @param sErrorID
   *        The ID of the error. May be <code>null</code>.
   * @param sErrorFieldName
   *        The field name of the error. May be <code>null</code>.
   * @param aErrorLocation
   *        The location of the error. May be <code>null</code>.
   * @param sTest
   *        The performed test (e.g. for Schematrons). May be <code>null</code>.
   * @param sErrorText
   *        The main error text. May not be <code>null</code>.
   * @param t
   *        The optional stack trace of the error. May be <code>null</code>.
   * @return The JSON object with the error. Never <code>null</code>.
   * @see #getJsonErrorLocation(ILocation)
   * @see #getJsonStackTrace(Throwable)
   * @see #getJsonError(IError, Locale)
   */
  @Nonnull
  public static IJsonObject getJsonError (@Nonnull final IErrorLevel aErrorLevel,
                                          @Nullable final String sErrorID,
                                          @Nullable final String sErrorFieldName,
                                          @Nullable final ILocation aErrorLocation,
                                          @Nullable final String sTest,
                                          @Nonnull final String sErrorText,
                                          @Nullable final Throwable t)
  {
    ValueEnforcer.notNull (aErrorLevel, "ErrorLevel");
    ValueEnforcer.notNull (sErrorText, "ErrorText");

    return new JsonErrorBuilder ().errorLevel (aErrorLevel)
                                  .errorID (sErrorID)
                                  .errorFieldName (sErrorFieldName)
                                  .errorLocation (aErrorLocation)
                                  .test (sTest)
                                  .errorText (sErrorText)
                                  .exception (t)
                                  .build ();
  }

  /**
   * Get the JSON representation of an error.<br>
   *
   * <pre>
   * {
   *   "errorLevel" : string,
   *   "errorID" : string?,
   *   "errorFieldName" : string?,
   *   "errorLocation" : object?,
   *   "test" : string?,
   *   "errorText" : string,
   *   "exception : object?
   * }
   * </pre>
   *
   * @param aError
   *        The structured error. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to resolve the error text. May not be
   *        <code>null</code>.
   * @return The JSON object with the error. Never <code>null</code>.
   * @see #getJsonStackTrace(Throwable)
   * @see #getJsonError(IErrorLevel, String, String, ILocation, String, String,
   *      Throwable)
   */
  @Nonnull
  public static IJsonObject getJsonError (@Nonnull final IError aError, @Nonnull final Locale aDisplayLocale)
  {
    return jsonErrorBuilder (aError, aDisplayLocale).build ();
  }

  /**
   * Create an empty builder
   *
   * @return Never <code>null</code>.
   * @since 7.2.3
   */
  @Nonnull
  public static JsonErrorBuilder jsonErrorBuilder ()
  {
    return new JsonErrorBuilder ();
  }

  /**
   * Create a builder that is pre-filled with the error details.
   *
   * @param aError
   *        The structured error. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to resolve the error text. May not be
   *        <code>null</code>.
   * @return Never <code>null</code>.
   * @since 7.2.3
   */
  @Nonnull
  public static JsonErrorBuilder jsonErrorBuilder (@Nonnull final IError aError, @Nonnull final Locale aDisplayLocale)
  {
    ValueEnforcer.notNull (aError, "Error");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");

    return new JsonErrorBuilder ().errorDateTime (aError.getErrorDateTime ())
                                  .errorLevel (aError.getErrorLevel ())
                                  .errorID (aError.getErrorID ())
                                  .errorFieldName (aError.getErrorFieldName ())
                                  .errorLocation (aError.hasErrorLocation () ? aError.getErrorLocation () : null)
                                  .test (aError instanceof SVRLResourceError ? ((SVRLResourceError) aError).getTest ()
                                                                             : null)
                                  .errorText (aError.getErrorText (aDisplayLocale))
                                  .exception (aError.getLinkedException ());
  }

  @Nonnull
  public static IError getAsIError (@Nonnull final IJsonObject aObj)
  {
    final LocalDateTime aErrorDT = PDTWebDateHelper.getLocalDateTimeFromXSD (aObj.getAsString (JSON_ERROR_DATETIME));
    final IErrorLevel aErrorLevel = PhiveResultHelper.getAsErrorLevel (aObj.getAsString (JSON_ERROR_LEVEL));
    final String sErrorID = aObj.getAsString (JSON_ERROR_ID);
    final String sErrorFieldName = aObj.getAsString (JSON_ERROR_FIELD_NAME);
    // Try new structured version
    ILocation aErrorLocation = getAsErrorLocation (aObj.getAsObject (JSON_ERROR_LOCATION_OBJ));
    if (aErrorLocation == null)
    {
      final IJsonValue aErrorLocationValue = aObj.getAsValue (JSON_ERROR_LOCATION_STR);
      if (aErrorLocationValue != null)
      {
        // It's a string - old version
        aErrorLocation = new SimpleLocation (aErrorLocationValue.getAsString ());
      }
    }
    final String sErrorText = aObj.getAsString (JSON_ERROR_TEXT);
    final String sTest = aObj.getAsString (JSON_TEST);
    final PhiveRestoredException aLinkedException = PhiveRestoredException.createFromJson (aObj.getAsObject (JSON_EXCEPTION));

    if (sTest != null)
      return new SVRLResourceError (aErrorDT,
                                    aErrorLevel,
                                    sErrorID,
                                    sErrorFieldName,
                                    aErrorLocation,
                                    new ConstantHasErrorText (sErrorText),
                                    aLinkedException,
                                    sTest);

    return new SingleError (aErrorDT,
                            aErrorLevel,
                            sErrorID,
                            sErrorFieldName,
                            aErrorLocation,
                            new ConstantHasErrorText (sErrorText),
                            aLinkedException);
  }

  /**
   * Create the VES status as a JSON Object.<br>
   *
   * <pre>
   * {
   *   "lastModification" : dateTime
   *   "type" : string,
   *   "validFrom" : string?,
   *   "validTo" : string?,
   *   "deprecationReason" : string?
   *   "replacementVesid" : string?
   * }
   * </pre>
   *
   * @param aStatus
   *        The VES status to use. May not be <code>null</code>.
   * @return The created JSON object.
   * @since 10.1.0
   */
  @Nonnull
  public static IJsonObject getJsonVESStatus (@Nonnull final IValidationExecutorSetStatus aStatus)
  {
    ValueEnforcer.notNull (aStatus, "Status");

    final IJsonObject aStatusJson = new JsonObject ().add (JSON_STATUS_LAST_MODIFICATION,
                                                           PDTWebDateHelper.getAsStringXSD (aStatus.getStatusLastModification ()))
                                                     .add (JSON_STATUS_TYPE, aStatus.getType ().getID ())
                                                     .addIfNotNull (JSON_STATUS_VALID_FROM,
                                                                    PDTWebDateHelper.getAsStringXSD (aStatus.getValidFrom ()))
                                                     .addIfNotNull (JSON_STATUS_VALID_TO,
                                                                    PDTWebDateHelper.getAsStringXSD (aStatus.getValidTo ()))
                                                     .addIfNotEmpty (JSON_STATUS_DEPRECATION_REASON,
                                                                     aStatus.getDeprecationReason ());
    if (aStatus.hasReplacementVESID ())
      aStatusJson.add (JSON_STATUS_REPLACEMENT_VESID, aStatus.getReplacementVESID ().getAsSingleID ());

    return aStatusJson;
  }

  /**
   * Create the VES details as a JSON Object.<br>
   *
   * <pre>
   * {
   *   "vesid" : string,
   *   "name" : string,
   *   "deprecated" : boolean,
   *   "status" : {
   *     "lastModification" : dateTime
   *     "type" : string,
   *     "validFrom" : string?,
   *     "validTo" : string?,
   *     "deprecationReason" : string?
   *     "replacementVesid" : string?
   *   }
   * }
   * </pre>
   *
   * @param aVES
   *        The VES to use. May not be <code>null</code>.
   * @return The created JSON object.
   */
  @Nonnull
  public static IJsonObject getJsonVES (@Nonnull final IValidationExecutorSet <?> aVES)
  {
    ValueEnforcer.notNull (aVES, "VES");

    final IValidationExecutorSetStatus aStatus = aVES.getStatus ();
    return new JsonObject ().add (JSON_VESID, aVES.getID ().getAsSingleID ())
                            .add (JSON_NAME, aVES.getDisplayName ())
                            .add (JSON_DEPRECATED, aStatus.isDeprecated ())
                            .addJson (JSON_STATUS, getJsonVESStatus (aStatus));
  }

  /**
   * Add one global error to the response. Afterwards no validation results
   * should be added. The layout of the response object is very similar to the
   * one created by
   * {@link #applyValidationResultList(IJsonObject, IValidationExecutorSet, List, Locale, long, MutableInt, MutableInt)}.
   * <br>
   *
   * <pre>
   * {
   *   "success" : boolean,
   *   "interrupted" : boolean,
   *   "mostSevereErrorLevel" : string,
   *   "results" : array {
   *     "success" : string,  // as defined by {@link PhiveResultHelper#getTriStateValue(ETriState)}
   *     "artifactType" : string,
   *     "artifactPath" : string,
   *     "items" : array {
   *       error structure as in {@link #getJsonError(IError, Locale)}
   *     }
   *   },
   *   "durationMS" : number
   * }
   * </pre>
   *
   * @param aResponse
   *        The response JSON object to add to. May not be <code>null</code>.
   * @param sErrorMsg
   *        The error message to use. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   */
  public static void applyGlobalError (@Nonnull final IJsonObject aResponse,
                                       @Nonnull final String sErrorMsg,
                                       @Nonnegative final long nDurationMilliseconds)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (sErrorMsg, "ErrorMsg");
    ValueEnforcer.isGE0 (nDurationMilliseconds, "DurationMilliseconds");

    final IJsonArray aResultArray = new JsonArray ();
    aResultArray.add (new JsonObject ().add (JSON_SUCCESS, PhiveResultHelper.getTriStateValue (false))
                                       .add (JSON_ARTIFACT_TYPE, ARTIFACT_TYPE_INPUT_PARAMETER)
                                       .add (JSON_ARTIFACT_PATH, ARTIFACT_PATH_NONE)
                                       .addJson (JSON_ITEMS,
                                                 new JsonArray (jsonErrorBuilder ().errorLevel (EErrorLevel.ERROR)
                                                                                   .errorText (sErrorMsg)
                                                                                   .build ())));

    aResponse.add (JSON_SUCCESS, false);
    aResponse.add (JSON_INTERRUPTED, false);
    aResponse.add (JSON_MOST_SEVERE_ERROR_LEVEL, PhiveResultHelper.getErrorLevelValue (EErrorLevel.ERROR));
    aResponse.addJson (JSON_RESULTS, aResultArray);
    aResponse.add (JSON_DURATION_MS, nDurationMilliseconds);
  }

  @Nonnull
  @Nonempty
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static String getArtifactPathType (@Nonnull final IReadableResource aRes)
  {
    return PhiveResultHelper.getArtifactPathType (aRes);
  }

  /**
   * Apply the results of a full validation onto a JSON object.The layout of the
   * response object is very similar to the one created by
   * {@link #applyGlobalError(IJsonObject, String, long)}.<br>
   *
   * <pre>
    * {
    *   "ves" : object as defined by {@link #getJsonVES(IValidationExecutorSet)}
    *   "success" : boolean,
    *   "interrupted" : boolean,
    *   "mostSevereErrorLevel" : string,
    *   "results" : array {
    *     "success" : string,  // as defined by {@link PhiveResultHelper#getTriStateValue(ETriState)}
    *     "artifactType" : string,
    *     "artifactPathType" : string?,
    *     "artifactPath" : string,
    *     "items" : array {
    *       error structure as in {@link #getJsonError(IError, Locale)}
    *     }
    *   },
    *   "durationMS" : number
    * }
   * </pre>
   *
   * @param aResponse
   *        The response JSON object to add to. May not be <code>null</code>.
   * @param aVES
   *        The Validation executor set that was used to perform validation. May
   *        be <code>null</code>.
   * @param aValidationResultList
   *        The validation result list containing the validation results per
   *        layer. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to be used. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   * @param aWarningCount
   *        Optional callback value to store the overall warnings. If not
   *        <code>null</code> if will contain a &ge; 0 value afterwards.
   * @param aErrorCount
   *        Optional callback value to store the overall errors. If not
   *        <code>null</code> if will contain a &ge; 0 value afterwards.
   */
  public static void applyValidationResultList (@Nonnull final IJsonObject aResponse,
                                                @Nullable final IValidationExecutorSet <?> aVES,
                                                @Nonnull final ValidationResultList aValidationResultList,
                                                @Nonnull final Locale aDisplayLocale,
                                                @Nonnegative final long nDurationMilliseconds,
                                                @Nullable final MutableInt aWarningCount,
                                                @Nullable final MutableInt aErrorCount)
  {
    new JsonValidationResultListHelper ().ves (aVES)
                                         .warningCount (aWarningCount)
                                         .errorCount (aErrorCount)
                                         .applyTo (aResponse,
                                                   aValidationResultList,
                                                   aDisplayLocale,
                                                   nDurationMilliseconds);
  }

  @Nullable
  public static <T extends IValidationSource> IValidationExecutorSet <T> getAsVES (@Nonnull final ValidationExecutorSetRegistry <T> aRegistry,
                                                                                   @Nullable final IJsonObject aJson)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");
    if (aJson != null)
    {
      IJsonObject aObj = aJson.getAsObject (JSON_VES);
      if (aObj == null)
        aObj = aJson;

      final String sVESID = aObj.getAsString (JSON_VESID);
      if (StringHelper.hasText (sVESID))
      {
        final DVRCoordinate aVESID = DVRCoordinate.parseOrNull (sVESID);
        if (aVESID != null)
          return aRegistry.getOfID (aVESID);
      }
    }
    return null;
  }

  @Nullable
  @Deprecated (forRemoval = true, since = "10.0.3")
  public static IReadableResource getAsValidationResource (@Nullable final String sArtefactPathType,
                                                           @Nullable final String sArtefactPath)
  {
    return PhiveResultHelper.getAsValidationResource (sArtefactPathType, sArtefactPath);
  }

  @Nullable
  public static ValidationResultList getAsValidationResultList (@Nullable final IJsonObject aJson)
  {
    // By default we're only resolving in the enum
    return getAsValidationResultList (aJson, EValidationType::getFromIDOrNull);
  }

  /**
   * Try to parse a JSON structure and convert it back to a
   * {@link ValidationResultList}.
   *
   * @param aJson
   *        The JSON to be read. May be <code>null</code>.
   * @param aValidationTypeResolver
   *        The validation type resolver to be used. May not be
   *        <code>null</code>.
   * @return <code>null</code> in case reverse operation fails.
   */
  @Nullable
  public static ValidationResultList getAsValidationResultList (@Nullable final IJsonObject aJson,
                                                                @Nonnull final Function <String, IValidationType> aValidationTypeResolver)
  {
    ValueEnforcer.notNull (aValidationTypeResolver, "ValidationTypeResolver");

    if (aJson == null)
      return null;

    final IJsonArray aResults = aJson.getAsArray (JSON_RESULTS);
    if (aResults == null)
      return null;

    final ValidationResultList ret = new ValidationResultList ();
    for (final IJson aResult : aResults)
    {
      final IJsonObject aResultObj = aResult.getAsObject ();
      if (aResultObj != null)
      {
        // Fall back to previous status
        final String sSuccess = aResultObj.getAsString (JSON_SUCCESS);
        final ETriState eSuccess = PhiveResultHelper.getAsTriState (sSuccess);
        if (eSuccess == null)
        {
          if (LOGGER.isDebugEnabled ())
            LOGGER.debug ("Failed to resolve TriState '" + sSuccess + "'");
          continue;
        }
        final EExtendedValidity eValidity;
        switch (eSuccess)
        {
          case TRUE:
            eValidity = EExtendedValidity.VALID;
            break;
          case FALSE:
            eValidity = EExtendedValidity.INVALID;
            break;
          case UNDEFINED:
            eValidity = EExtendedValidity.SKIPPED;
            break;
          default:
            throw new IllegalStateException ("Oops");
        }

        final String sValidationType = aResultObj.getAsString (JSON_ARTIFACT_TYPE);
        final IValidationType aValidationType = aValidationTypeResolver.apply (sValidationType);
        if (aValidationType == null)
        {
          if (LOGGER.isDebugEnabled ())
            LOGGER.debug ("Failed to resolve ValidationType '" + sValidationType + "'");
          continue;
        }
        final String sArtefactPathType = aResultObj.getAsString (JSON_ARTIFACT_PATH_TYPE);
        final String sArtefactPath = aResultObj.getAsString (JSON_ARTIFACT_PATH);
        final IReadableResource aRes = PhiveResultHelper.getAsValidationResource (sArtefactPathType, sArtefactPath);
        if (aRes == null)
        {
          if (LOGGER.isDebugEnabled ())
            LOGGER.debug ("Failed to resolve ValidationArtefact '" +
                          sArtefactPathType +
                          "' with path '" +
                          sArtefactPath +
                          "'");
          continue;
        }
        final ValidationArtefact aVA = new ValidationArtefact (aValidationType, aRes);

        if (eValidity.isSkipped ())
        {
          // Ignored level
          ret.add (ValidationResult.createSkippedResult (aVA));
        }
        else
        {
          // We have results
          final IJsonArray aItems = aResultObj.getAsArray (JSON_ITEMS);
          final ErrorList aErrorList = new ErrorList ();
          for (final IJson aItem : aItems)
          {
            final IJsonObject aItemObj = aItem.getAsObject ();
            if (aItemObj != null)
            {
              final IError aError = getAsIError (aItemObj);
              aErrorList.add (aError);
            }
          }

          final ValidationResult aVR = new ValidationResult (aVA, aErrorList);
          ret.add (aVR);
        }
      }
    }
    return ret;
  }
}
