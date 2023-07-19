/*
 * Copyright (C) 2014-2023 Philip Helger (www.helger.com)
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
package com.helger.phive.json;

import java.time.LocalDateTime;
import java.util.function.Function;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.builder.IBuilder;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.datetime.PDTWebDateHelper;
import com.helger.commons.error.IError;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.location.ILocation;
import com.helger.json.IJsonObject;
import com.helger.json.JsonObject;

/**
 * A flexible builder that can be used to convert data from an {@link IError}
 * object to a JSON representation with high degrees of freedom.
 *
 * @author Philip Helger
 * @since 7.2.3
 */
public class JsonErrorBuilder implements IBuilder <IJsonObject>
{
  private LocalDateTime m_aErrorDateTime;
  private IErrorLevel m_aErrorLevel;
  private Function <IErrorLevel, String> m_aErrorLevelToJson = PhiveJsonHelper::getJsonErrorLevel;
  private String m_sErrorID;
  private String m_sErrorFieldName;
  private ILocation m_aErrorLocation;
  private Function <ILocation, IJsonObject> m_aErrorLocationToJson = PhiveJsonHelper::getJsonErrorLocation;
  private String m_sTest;
  private String m_sErrorText;
  private Throwable m_aException;
  private Function <Throwable, IJsonObject> m_aExceptionToJson = PhiveJsonHelper::getJsonStackTrace;

  public JsonErrorBuilder ()
  {}

  @Nonnull
  public JsonErrorBuilder errorDateTimeNow ()
  {
    return errorDateTime (PDTFactory.getCurrentLocalDateTime ());
  }

  @Nonnull
  public JsonErrorBuilder errorDateTime (@Nullable final LocalDateTime a)
  {
    m_aErrorDateTime = a;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder errorLevel (@Nullable final IErrorLevel a)
  {
    m_aErrorLevel = a;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder errorLevelToJson (@Nullable final Function <IErrorLevel, String> a)
  {
    m_aErrorLevelToJson = a;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder errorID (@Nullable final String s)
  {
    m_sErrorID = s;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder errorFieldName (@Nullable final String s)
  {
    m_sErrorFieldName = s;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder errorLocation (@Nullable final ILocation a)
  {
    m_aErrorLocation = a;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder errorLocationToJson (@Nullable final Function <ILocation, IJsonObject> a)
  {
    m_aErrorLocationToJson = a;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder test (@Nullable final String s)
  {
    m_sTest = s;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder errorText (@Nullable final String s)
  {
    m_sErrorText = s;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder exception (@Nullable final Throwable a)
  {
    m_aException = a;
    return this;
  }

  @Nonnull
  public JsonErrorBuilder exceptionToJson (@Nullable final Function <Throwable, IJsonObject> a)
  {
    m_aExceptionToJson = a;
    return this;
  }

  @Nonnull
  public IJsonObject build ()
  {
    final JsonObject ret = new JsonObject ();
    if (m_aErrorDateTime != null)
      ret.add (PhiveJsonHelper.JSON_ERROR_DATETIME, PDTWebDateHelper.getAsStringXSD (m_aErrorDateTime));
    if (m_aErrorLevel != null && m_aErrorLevelToJson != null)
      ret.addIfNotNull (PhiveJsonHelper.JSON_ERROR_LEVEL, m_aErrorLevelToJson.apply (m_aErrorLevel));
    if (m_sErrorID != null)
      ret.add (PhiveJsonHelper.JSON_ERROR_ID, m_sErrorID);
    if (m_sErrorFieldName != null)
      ret.add (PhiveJsonHelper.JSON_ERROR_FIELD_NAME, m_sErrorFieldName);
    if (m_aErrorLocation != null && m_aErrorLocationToJson != null)
      ret.addIfNotNull (PhiveJsonHelper.JSON_ERROR_LOCATION_OBJ, m_aErrorLocationToJson.apply (m_aErrorLocation));
    if (m_sTest != null)
      ret.add (PhiveJsonHelper.JSON_TEST, m_sTest);
    if (m_sErrorText != null)
      ret.add (PhiveJsonHelper.JSON_ERROR_TEXT, m_sErrorText);
    if (m_aException != null && m_aExceptionToJson != null)
      ret.addIfNotNull (PhiveJsonHelper.JSON_EXCEPTION, m_aExceptionToJson.apply (m_aException));
    return ret;
  }
}
