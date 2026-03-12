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

import com.helger.annotation.concurrent.Immutable;

/**
 * XML constants for phive serialization and deserialization
 *
 * @author Philip Helger
 * @since 12.0.0
 */
@Immutable
public final class CPhiveXML
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

  // Added in 12.0.0
  public static final String XML_VALIDATION_DATETIME = "validationDateTime";

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
  // Since 12.0.0
  @Deprecated (forRemoval = true, since = "12.0.1")
  public static final String XML_STATUS_DISPLAY_NAME = "displayName";
  public static final String XML_STATUS_VALID_FROM = "validFrom";
  public static final String XML_STATUS_VALID_TO = "validTo";
  public static final String XML_STATUS_DEPRECATION_REASON = "deprecationReason";
  public static final String XML_STATUS_REPLACEMENT_VESID = "replacementVesid";

  public static final String XML_SUCCESS = "success";
  // Since 12.0.0
  public static final String XML_VALIDITY = "validity";
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

  private CPhiveXML ()
  {}
}
