/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.Locale;
import java.util.function.Function;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.annotation.Nonempty;
import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.Immutable;
import com.helger.base.codec.base64.Base64;
import com.helger.base.codec.base64.Base64OutputStream;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.location.ILocation;
import com.helger.base.location.SimpleLocation;
import com.helger.base.numeric.mutable.MutableInt;
import com.helger.base.rt.StackTraceHelper;
import com.helger.base.state.ETriState;
import com.helger.base.string.StringHelper;
import com.helger.base.string.StringParser;
import com.helger.datetime.web.PDTWebDateHelper;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.level.IErrorLevel;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diagnostics.error.text.ConstantHasErrorText;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.io.resource.IReadableResource;
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
import com.helger.phive.result.IValidationSourceRestorer;
import com.helger.phive.result.PhiveResultHelper;
import com.helger.phive.result.exception.PhiveRestoredException;
import com.helger.schematron.svrl.SVRLResourceError;
import com.helger.typeconvert.impl.TypeConverter;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroElement;
import com.helger.xml.microdom.util.MicroHelper;

/**
 * A utility class to create a common XML representation of a PHIVE result. Use
 * {@link #applyGlobalError(IMicroElement, String, long)} or
 * {@link #applyValidationResultList(IMicroElement, IValidationExecutorSet, ValidationResultList, Locale, long, MutableInt, MutableInt)}
 * to add the result to an arbitrary {@link IMicroElement}.
 *
 * @author Philip Helger
 * @since 10.0.3
 */
@Immutable
public final class PhiveXMLHelper
{
  public static final String XML_RESOURCE_ID = "resource";
  public static final String XML_LINE_NUM = "line";
  public static final String XML_COLUMN_NUM = "col";

  public static final String XML_ERROR_DATETIME = "errorDateTime";
  public static final String XML_ERROR_LEVEL = "errorLevel";
  public static final String XML_ERROR_ID = "errorID";
  public static final String XML_ERROR_FIELD_NAME = "errorFieldName";
  public static final String XML_ERROR_LOCATION_OBJ = "errorLocationObj";
  public static final String XML_ERROR_LOCATION_STR = "errorLocation";
  public static final String XML_ERROR_TEXT = "errorText";
  public static final String XML_EXCEPTION = "exception";
  public static final String XML_TEST = "test";

  // Added in 10.1.0
  public static final String XML_VALIDATION_SOURCE = "validationSource";
  public static final String XML_SOURCE_TYPE_ID = "sourceTypeID";
  public static final String XML_SYSTEM_ID = "systemID";
  public static final String XML_PARTIAL_SOURCE = "partialSource";
  public static final String XML_PAYLOAD_BASE64 = "payloadBase64";

  public static final String XML_VESID = "vesid";
  public static final String XML_NAME = "name";
  public static final String XML_DEPRECATED = "deprecated";
  public static final String XML_STATUS = "status";
  public static final String XML_STATUS_LAST_MODIFICATION = "lastModification";
  public static final String XML_STATUS_TYPE = "type";
  public static final String XML_STATUS_VALID_FROM = "validFrom";
  public static final String XML_STATUS_VALID_TO = "validTo";
  public static final String XML_STATUS_DEPRECATION_REASON = "deprecationReason";
  public static final String XML_STATUS_REPLACEMENT_VESID = "replacementVesid";

  public static final String XML_SUCCESS = "success";
  public static final String XML_ARTIFACT_TYPE = "artifactType";
  public static final String XML_ARTIFACT_PATH_TYPE = "artifactPathType";
  public static final String XML_ARTIFACT_PATH = "artifactPath";
  public static final String XML_ITEM = "item";
  public static final String XML_INTERRUPTED = "interrupted";
  public static final String XML_MOST_SEVERE_ERROR_LEVEL = "mostSevereErrorLevel";
  public static final String XML_RESULT = "result";
  public static final String XML_DURATION_MS = "durationMS";
  public static final String XML_VES = "ves";

  public static final String ARTIFACT_TYPE_INPUT_PARAMETER = "input-parameter";
  public static final String ARTIFACT_PATH_NONE = "none";

  private static final Logger LOGGER = LoggerFactory.getLogger (PhiveXMLHelper.class);

  private PhiveXMLHelper ()
  {}

  /**
   * Get the XML representation of a stack trace.<br>
   *
   * <pre>
   * &lt;element&gt;
   *   &lt;class&gt;string&lt;/class&gt;
   *   &lt;message&gt;string&lt;/message&gt;?,
   *   &lt;stackTrace&gt;string&lt;/stackTrace&gt;
   * &lt;/element&gt;
   * </pre>
   *
   * @param t
   *        The exception to convert to a XML object. May be <code>null</code>.
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return <code>null</code> if the parameter is <code>null</code>, the XML object otherwise.
   * @see PhiveRestoredException for a representation after reading
   */
  @Nullable
  public static IMicroElement getXMLStackTrace (@Nullable final Throwable t,
                                                @NonNull @Nonempty final String sElementName)
  {
    if (t == null)
      return null;
    if (t instanceof PhiveRestoredException)
      return ((PhiveRestoredException) t).getAsXML (sElementName);
    return PhiveRestoredException.getAsXML (sElementName,
                                            t.getClass ().getName (),
                                            t.getMessage (),
                                            StackTraceHelper.getStackAsString (t));
  }

  /**
   * Get the XML representation of a location.<br>
   *
   * <pre>
   * &lt;element&gt;
   *   &lt;resource&gt;string&lt;/resource&gt;?
   *   &lt;line&gt;number&lt;/line&gt;?
   *   &lt;col&gt;number&lt;/col&gt;?
   * &lt;/element&gt;
   * </pre>
   *
   * @param aLocation
   *        The location to convert to a XML object. May be <code>null</code>.
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return <code>null</code> if the parameter is <code>null</code>, the XML object otherwise.
   */
  @Nullable
  public static IMicroElement getXMLErrorLocation (@Nullable final ILocation aLocation,
                                                   @NonNull @Nonempty final String sElementName)
  {
    if (aLocation == null || !aLocation.isAnyInformationPresent ())
      return null;
    final IMicroElement ret = new MicroElement (sElementName);
    if (aLocation.hasResourceID ())
      ret.addElement (XML_RESOURCE_ID).addText (aLocation.getResourceID ());
    if (aLocation.hasLineNumber ())
      ret.addElement (XML_LINE_NUM).addText (aLocation.getLineNumber ());
    if (aLocation.hasColumnNumber ())
      ret.addElement (XML_COLUMN_NUM).addText (aLocation.getColumnNumber ());
    return ret;
  }

  @Nullable
  public static ILocation getAsErrorLocation (@Nullable final IMicroElement aObj)
  {
    if (aObj == null)
      return null;

    final String sResourceID = MicroHelper.getChildTextContentTrimmed (aObj, XML_RESOURCE_ID);
    final int nLineNumber = StringParser.parseInt (MicroHelper.getChildTextContentTrimmed (aObj, XML_LINE_NUM),
                                                   ILocation.ILLEGAL_NUMBER);
    final int nColumnNumber = StringParser.parseInt (MicroHelper.getChildTextContentTrimmed (aObj, XML_COLUMN_NUM),
                                                     ILocation.ILLEGAL_NUMBER);

    if (StringHelper.isEmpty (sResourceID) && nLineNumber < 0 && nColumnNumber < 0)
      return null;

    return new SimpleLocation (sResourceID, nLineNumber, nColumnNumber);
  }

  /**
   * Get the XML representation of an error.<br>
   *
   * <pre>
   * &lt;error&gt;
   *   &lt;errorLevel&gt;string&lt;/errorLevel&gt;?
   *   &lt;errorID&gt;string&lt;/errorID&gt;?
   *   &lt;errorFieldName&gt;string&lt;/errorFieldName&gt;?
   *   &lt;errorLocation&gt;object&lt;/errorLocation&gt;?
   *   &lt;test&gt;string&lt;/test&gt;?
   *   &lt;errorText&gt;string&lt;/errorText&gt;
   *   &lt;exception&gt;object&lt;/exception&gt;?
   * &lt;/error&gt;
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
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return The XML object with the error. Never <code>null</code>.
   * @see #getXMLErrorLocation(ILocation, String)
   * @see #getXMLStackTrace(Throwable, String)
   * @see #getXMLError(IError, Locale,String)
   */
  @NonNull
  public static IMicroElement getXMLError (@NonNull final IErrorLevel aErrorLevel,
                                           @Nullable final String sErrorID,
                                           @Nullable final String sErrorFieldName,
                                           @Nullable final ILocation aErrorLocation,
                                           @Nullable final String sTest,
                                           @NonNull final String sErrorText,
                                           @Nullable final Throwable t,
                                           @NonNull @Nonempty final String sElementName)
  {
    ValueEnforcer.notNull (aErrorLevel, "ErrorLevel");
    ValueEnforcer.notNull (sErrorText, "ErrorText");

    return new XMLErrorBuilder (sElementName).errorLevel (aErrorLevel)
                                             .errorID (sErrorID)
                                             .errorFieldName (sErrorFieldName)
                                             .errorLocation (aErrorLocation)
                                             .test (sTest)
                                             .errorText (sErrorText)
                                             .exception (t)
                                             .build ();
  }

  /**
   * Get the XML representation of an error.<br>
   *
   * <pre>
   * &lt;error&gt;
   *   &lt;errorLevel&gt;string&lt;/errorLevel&gt;?
   *   &lt;errorID&gt;string&lt;/errorID&gt;?
   *   &lt;errorFieldName&gt;string&lt;/errorFieldName&gt;?
   *   &lt;errorLocation&gt;object&lt;/errorLocation&gt;?
   *   &lt;test&gt;string&lt;/test&gt;?
   *   &lt;errorText&gt;string&lt;/errorText&gt;
   *   &lt;exception&gt;object&lt;/exception&gt;?
   * &lt;/error&gt;
   * </pre>
   *
   * @param aError
   *        The structured error. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to resolve the error text. May not be <code>null</code>.
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return The XML object with the error. Never <code>null</code>.
   * @see #getXMLStackTrace(Throwable, String)
   * @see #getXMLError(IErrorLevel, String, String, ILocation, String, String, Throwable, String)
   */
  @NonNull
  public static IMicroElement getXMLError (@NonNull final IError aError,
                                           @NonNull final Locale aDisplayLocale,
                                           @NonNull @Nonempty final String sElementName)
  {
    return xmlErrorBuilder (aError, aDisplayLocale, sElementName).build ();
  }

  /**
   * Create an empty builder
   *
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return Never <code>null</code>.
   */
  @NonNull
  public static XMLErrorBuilder xmlErrorBuilder (@NonNull @Nonempty final String sElementName)
  {
    return new XMLErrorBuilder (sElementName);
  }

  /**
   * Create a builder that is pre-filled with the error details.
   *
   * @param aError
   *        The structured error. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to resolve the error text. May not be <code>null</code>.
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return Never <code>null</code>.
   */
  @NonNull
  public static XMLErrorBuilder xmlErrorBuilder (@NonNull final IError aError,
                                                 @NonNull final Locale aDisplayLocale,
                                                 @NonNull @Nonempty final String sElementName)
  {
    ValueEnforcer.notNull (aError, "Error");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");

    return new XMLErrorBuilder (sElementName).errorDateTime (aError.getErrorDateTime ())
                                             .errorLevel (aError.getErrorLevel ())
                                             .errorID (aError.getErrorID ())
                                             .errorFieldName (aError.getErrorFieldName ())
                                             .errorLocation (aError.hasErrorLocation () ? aError.getErrorLocation ()
                                                                                        : null)
                                             .test (aError instanceof SVRLResourceError ? ((SVRLResourceError) aError).getTest ()
                                                                                        : null)
                                             .errorText (aError.getErrorText (aDisplayLocale))
                                             .exception (aError.getLinkedException ());
  }

  @NonNull
  public static IError getAsIError (@NonNull final IMicroElement aObj)
  {
    final LocalDateTime aErrorDT = PDTWebDateHelper.getLocalDateTimeFromXSD (MicroHelper.getChildTextContentTrimmed (aObj,
                                                                                                                     XML_ERROR_DATETIME));
    final IErrorLevel aErrorLevel = PhiveResultHelper.getAsErrorLevel (MicroHelper.getChildTextContentTrimmed (aObj,
                                                                                                               XML_ERROR_LEVEL));
    final String sErrorID = MicroHelper.getChildTextContentTrimmed (aObj, XML_ERROR_ID);
    final String sErrorFieldName = MicroHelper.getChildTextContentTrimmed (aObj, XML_ERROR_FIELD_NAME);
    // Try new structured version
    final ILocation aErrorLocation = getAsErrorLocation (aObj.getFirstChildElement (XML_ERROR_LOCATION_OBJ));
    final String sErrorText = MicroHelper.getChildTextContentTrimmed (aObj, XML_ERROR_TEXT);
    final String sTest = MicroHelper.getChildTextContent (aObj, XML_TEST);
    final PhiveRestoredException aLinkedException = PhiveRestoredException.createFromXML (aObj.getFirstChildElement (XML_EXCEPTION));

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
   * Create the Validation Source details as an XML Object.<br>
   *
   * <pre>
   * &lt;validationSource&gt;
   *   &lt;implementation&gt;string&lt;/implementation&gt;
   *   &lt;systemID&gt;string&lt;/systemID&gt;?
   *   &lt;partialSource&gt;boolean&lt;/partialSource&gt;
   *   &lt;payload&gt;base64Binary&lt;/payload&gt;?
   * &lt;/validationSource&gt;
   * </pre>
   *
   * @param aSource
   *        The validation source to use. May not be <code>null</code>.
   * @param bWithPayload
   *        <code>true</code> to include the payload, or <code>false</code> to omit it.
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return The created XML object.
   * @since 10.1.0
   */
  @NonNull
  public static IMicroElement getXMLValidationSource (@NonNull final IValidationSource aSource,
                                                      final boolean bWithPayload,
                                                      @NonNull @Nonempty final String sElementName)
  {
    ValueEnforcer.notNull (aSource, "Source");

    final IMicroElement ret = new MicroElement (sElementName);
    ret.addElement (XML_SOURCE_TYPE_ID).addText (aSource.getValidationSourceTypeID ());
    if (aSource.hasSystemID ())
      ret.addElement (XML_SYSTEM_ID).addText (aSource.getSystemID ());
    ret.addElement (XML_PARTIAL_SOURCE).addText (aSource.isPartialSource ());
    if (bWithPayload)
    {
      try (final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ();
           final Base64OutputStream aB64OS = new Base64OutputStream (aBAOS))
      {
        aSource.writeTo (aB64OS);
        aB64OS.flushBase64 ();
        ret.addElement (XML_PAYLOAD_BASE64).addText (aBAOS.getAsString (StandardCharsets.ISO_8859_1));
      }
      catch (final IOException ex)
      {
        LOGGER.error ("Failed to write Base64 encoded payload to XML", ex);
      }
    }
    return ret;
  }

  /**
   * Create the VES status details as an XML Object.<br>
   *
   * <pre>
   * &lt;status&gt;
   *   &lt;lastModification&gt;dateTime&lt;/lastModification&gt;
   *   &lt;type&gt;string&lt;/type&gt;
   *   &lt;validFrom&gt;string&lt;/validFrom&gt;?
   *   &lt;validTo&gt;string&lt;/validTo&gt;?
   *   &lt;deprecationReason&gt;string&lt;/deprecationReason&gt;?
   *   &lt;replacementVesid&gt;string&lt;/replacementVesid&gt;?
   * &lt;/status&gt;
   * </pre>
   *
   * @param aStatus
   *        The VES status to use. May not be <code>null</code>.
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return The created XML object.
   * @since 10.1.0
   */
  @NonNull
  public static IMicroElement getXMLVESStatus (@NonNull final IValidationExecutorSetStatus aStatus,
                                               @NonNull @Nonempty final String sElementName)
  {
    ValueEnforcer.notNull (aStatus, "Status");

    final IMicroElement ret = new MicroElement (sElementName);
    ret.addElement (XML_STATUS_LAST_MODIFICATION)
       .addText (PDTWebDateHelper.getAsStringXSD (aStatus.getStatusLastModification ()));
    ret.addElement (XML_STATUS_TYPE).addText (aStatus.getType ().getID ());
    if (aStatus.hasValidFrom ())
      ret.addElement (XML_STATUS_VALID_FROM).addText (PDTWebDateHelper.getAsStringXSD (aStatus.getValidFrom ()));
    if (aStatus.hasValidTo ())
      ret.addElement (XML_STATUS_VALID_TO).addText (PDTWebDateHelper.getAsStringXSD (aStatus.getValidTo ()));
    if (aStatus.hasDeprecationReason ())
      ret.addElement (XML_STATUS_DEPRECATION_REASON).addText (aStatus.getDeprecationReason ());
    if (aStatus.hasReplacementVESID ())
      ret.addElement (XML_STATUS_REPLACEMENT_VESID).addText (aStatus.getReplacementVESID ().getAsSingleID ());
    return ret;
  }

  /**
   * Create the VES details as an XML Object.<br>
   *
   * <pre>
   * &lt;ves&gt;
   *   &lt;vesid&gt;string&lt;/vesid&gt;
   *   &lt;name&gt;string&lt;/name&gt;
   *   &lt;deprecated&gt;boolean&lt;/deprecated&gt;
   *   &lt;status&gt;
   *     &lt;lastModification&gt;dateTime&lt;/lastModification&gt;
   *     &lt;type&gt;string&lt;/type&gt;
   *     &lt;validFrom&gt;string&lt;/validFrom&gt;?
   *     &lt;validTo&gt;string&lt;/validTo&gt;?
   *     &lt;deprecationReason&gt;string&lt;/deprecationReason&gt;?
   *     &lt;replacementVesid&gt;string&lt;/replacementVesid&gt;?
   *   &lt;/status&gt;
   * &lt;/ves&gt;
   * </pre>
   *
   * @param aVES
   *        The VES to use. May not be <code>null</code>.
   * @param sElementName
   *        The XML element name to use. May neither be <code>null</code> nor empty.
   * @return The created XML object.
   */
  @NonNull
  public static IMicroElement getXMLVES (@NonNull final IValidationExecutorSet <?> aVES,
                                         @NonNull @Nonempty final String sElementName)
  {
    ValueEnforcer.notNull (aVES, "VES");

    final IValidationExecutorSetStatus aStatus = aVES.getStatus ();

    final IMicroElement ret = new MicroElement (sElementName);
    ret.addElement (XML_VESID).addText (aVES.getID ().getAsSingleID ());
    ret.addElement (XML_NAME).addText (aVES.getDisplayName ());
    ret.addElement (XML_DEPRECATED).addText (aStatus.isDeprecated ());
    ret.addChild (getXMLVESStatus (aStatus, XML_STATUS));
    return ret;
  }

  /**
   * Add one global error to the response. Afterwards no validation results should be added. The
   * layout of the response object is very similar to the one created by
   * {@link #applyValidationResultList(IMicroElement, IValidationExecutorSet, ValidationResultList, Locale, long, MutableInt, MutableInt)}.
   * <br>
   *
   * <pre>
   * &lt;item&gt;
   *   &lt;success&gt;boolean&lt;/success&gt;
   *   &lt;interrupted&gt;boolean&lt;/interrupted&gt;
   *   &lt;mostSevereErrorLevel&gt;string&lt;/mostSevereErrorLevel&gt;
   *   &lt;result&gt;
   *     &lt;success&gt;string&lt;/success&gt;  // as defined by {@link PhiveResultHelper#getTriStateValue(ETriState)}
   *     &lt;artifactType&gt;string&lt;/artifactType&gt;
   *     &lt;artifactPath&gt;string&lt;/artifactPath&gt;
   *     &lt;item&gt;
   *       // error structure as in {@link #getXMLError(IError, Locale, String)}
   *     &lt;/item&gt;+
   *   &lt;/result&gt;+
   *   &lt;durationMS&gt;number&lt;/durationMS&gt;
   * &lt;/item&gt;
   * </pre>
   *
   * @param aResponse
   *        The response XML object to add to. May not be <code>null</code>.
   * @param sErrorMsg
   *        The error message to use. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   */
  public static void applyGlobalError (@NonNull final IMicroElement aResponse,
                                       @NonNull final String sErrorMsg,
                                       @Nonnegative final long nDurationMilliseconds)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (sErrorMsg, "ErrorMsg");
    ValueEnforcer.isGE0 (nDurationMilliseconds, "DurationMilliseconds");

    aResponse.addElement (XML_SUCCESS).addText (false);
    aResponse.addElement (XML_INTERRUPTED).addText (false);
    aResponse.addElement (XML_MOST_SEVERE_ERROR_LEVEL)
             .addText (PhiveResultHelper.getErrorLevelValue (EErrorLevel.ERROR));

    {
      final IMicroElement aResult = aResponse.addElement (XML_RESULT);
      aResult.addElement (XML_SUCCESS).addText (PhiveResultHelper.getTriStateValue (false));
      aResult.addElement (XML_ARTIFACT_TYPE).addText (ARTIFACT_TYPE_INPUT_PARAMETER);
      aResult.addElement (XML_ARTIFACT_PATH).addText (ARTIFACT_PATH_NONE);
      aResult.addChild (xmlErrorBuilder (XML_ITEM).errorLevel (EErrorLevel.ERROR).errorText (sErrorMsg).build ());
      aResult.addElement (XML_DURATION_MS).addText (nDurationMilliseconds);
    }

    aResponse.addElement (XML_DURATION_MS).addText (nDurationMilliseconds);
  }

  /**
   * Apply the results of a full validation onto a XML object.The layout of the response object is
   * very similar to the one created by {@link #applyGlobalError(IMicroElement, String, long)}.<br>
   *
   * <pre>
   * &lt;resultList&gt;
   *   &lt;ves&gt;
   *     // object as defined by {@link #getXMLVES(IValidationExecutorSet,String)}
   *   &lt;/ves&gt;
   *   &lt;success&gt;boolean&lt;/success&gt;
   *   &lt;interrupted&gt;boolean&lt;/interrupted&gt;
   *   &lt;mostSevereErrorLevel&gt;string&lt;/mostSevereErrorLevel&gt;
   *   &lt;result&gt;
   *     &lt;success&gt;string&lt;/success&gt;  // as defined by {@link PhiveResultHelper#getTriStateValue(ETriState)}
   *     &lt;artifactType&gt;string&lt;/artifactType&gt;
   *     &lt;artifactPathType&gt;string&lt;/artifactPathType&gt;
   *     &lt;artifactPath&gt;string&lt;/artifactPath&gt;
   *     &lt;item&gt;
   *       // error structure as in {@link #getXMLError(IError, Locale, String)}
   *     &lt;/item&gt;+
   *   &lt;/result&gt;+
   *   &lt;durationMS&gt;number&lt;/durationMS&gt;
   * &lt;/resultList&gt;
   * </pre>
   *
   * @param aResponse
   *        The response XML object to add to. May not be <code>null</code>.
   * @param aVES
   *        The Validation executor set that was used to perform validation. May be
   *        <code>null</code>.
   * @param aValidationResultList
   *        The validation result list containing the validation results per layer. May not be
   *        <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to be used. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   * @param aWarningCount
   *        Optional callback value to store the overall warnings. If not <code>null</code> if will
   *        contain a &ge; 0 value afterwards.
   * @param aErrorCount
   *        Optional callback value to store the overall errors. If not <code>null</code> if will
   *        contain a &ge; 0 value afterwards.
   */
  public static void applyValidationResultList (@NonNull final IMicroElement aResponse,
                                                @Nullable final IValidationExecutorSet <?> aVES,
                                                @NonNull final ValidationResultList aValidationResultList,
                                                @NonNull final Locale aDisplayLocale,
                                                @Nonnegative final long nDurationMilliseconds,
                                                @Nullable final MutableInt aWarningCount,
                                                @Nullable final MutableInt aErrorCount)
  {
    new XMLValidationResultListHelper ().ves (aVES)
                                        .warningCount (aWarningCount)
                                        .errorCount (aErrorCount)
                                        .applyTo (aResponse,
                                                  aValidationResultList,
                                                  aDisplayLocale,
                                                  nDurationMilliseconds);
  }

  @Nullable
  public static <T extends IValidationSource> IValidationExecutorSet <T> getAsVES (@NonNull final ValidationExecutorSetRegistry <T> aRegistry,
                                                                                   @Nullable final IMicroElement aXML)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");
    if (aXML != null)
    {
      final IMicroElement eVes = aXML.getFirstChildElement (XML_VES);
      if (eVes != null)
      {
        final String sVESID = MicroHelper.getChildTextContentTrimmed (eVes, XML_VESID);
        if (StringHelper.isNotEmpty (sVESID))
        {
          final DVRCoordinate aVESID = DVRCoordinate.parseOrNull (sVESID);
          if (aVESID != null)
            return aRegistry.getOfID (aVESID);
        }
      }
    }
    return null;
  }

  @Nullable
  public static ValidationResultList getAsValidationResultList (@Nullable final IMicroElement aXML)
  {
    // By default we're only resolving in the enum
    return getAsValidationResultList (aXML,
                                      EValidationType::getFromIDOrNull,
                                      PhiveResultHelper::createValidationSource);
  }

  /**
   * Try to parse the default XML structure and convert it back to a {@link ValidationResultList}.
   *
   * @param aXML
   *        The XML to be read. May be <code>null</code>.
   * @param aValidationTypeResolver
   *        The validation type resolver to be used. May not be <code>null</code>.
   * @param aValidationSourceRestorer
   *        The function to restore {@link IValidationSource} objects. May not be <code>null</code>.
   * @return <code>null</code> in case reverse operation fails.
   */
  @Nullable
  public static ValidationResultList getAsValidationResultList (@Nullable final IMicroElement aXML,
                                                                @NonNull final Function <String, IValidationType> aValidationTypeResolver,
                                                                @NonNull final IValidationSourceRestorer aValidationSourceRestorer)
  {
    ValueEnforcer.notNull (aValidationTypeResolver, "ValidationTypeResolver");

    if (aXML == null)
      return null;

    final IValidationSource aValidationSource;
    {
      final IMicroElement eVS = aXML.getFirstChildElement (XML_VALIDATION_SOURCE);
      if (eVS != null)
      {
        final String sBase64EncodedPayload = MicroHelper.getChildTextContentTrimmed (eVS, XML_PAYLOAD_BASE64);
        final byte [] aPayloadBytes = Base64.safeDecode (sBase64EncodedPayload);
        if (aPayloadBytes == null)
        {
          // Error in base64 decoding
          LOGGER.warn ("Failed to Base64 decode the provided payload");
          aValidationSource = null;
        }
        else
        {
          aValidationSource = aValidationSourceRestorer.restoreValidationSource (MicroHelper.getChildTextContentTrimmed (eVS,
                                                                                                                         XML_SOURCE_TYPE_ID),
                                                                                 MicroHelper.getChildTextContentTrimmed (eVS,
                                                                                                                         XML_SYSTEM_ID),
                                                                                 TypeConverter.convertToBoolean (MicroHelper.getChildTextContentTrimmed (eVS,
                                                                                                                                                         XML_PARTIAL_SOURCE),
                                                                                                                 false),
                                                                                 aPayloadBytes);
        }
      }
      else
        aValidationSource = null;
    }

    final ValidationResultList ret = new ValidationResultList (aValidationSource);
    for (final IMicroElement eResult : aXML.getAllChildElements (XML_RESULT))
    {
      // Fall back to previous status
      final String sSuccess = MicroHelper.getChildTextContentTrimmed (eResult, XML_SUCCESS);
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

      final String sValidationType = MicroHelper.getChildTextContentTrimmed (eResult, XML_ARTIFACT_TYPE);
      final IValidationType aValidationType = aValidationTypeResolver.apply (sValidationType);
      if (aValidationType == null)
      {
        if (LOGGER.isDebugEnabled ())
          LOGGER.debug ("Failed to resolve ValidationType '" + sValidationType + "'");
        continue;
      }
      final String sArtefactPathType = MicroHelper.getChildTextContentTrimmed (eResult, XML_ARTIFACT_PATH_TYPE);
      final String sArtefactPath = MicroHelper.getChildTextContentTrimmed (eResult, XML_ARTIFACT_PATH);
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
        final ErrorList aErrorList = new ErrorList ();
        for (final IMicroElement eItem : eResult.getAllChildElements (XML_ITEM))
        {
          final IError aError = getAsIError (eItem);
          aErrorList.add (aError);
        }

        final long nDurationMS = TypeConverter.convertToLong (MicroHelper.getChildTextContentTrimmed (eResult,
                                                                                                      XML_DURATION_MS),
                                                              0);

        final ValidationResult aVR = new ValidationResult (aVA, aErrorList, nDurationMS);
        ret.add (aVR);
      }
    }
    return ret;
  }
}
