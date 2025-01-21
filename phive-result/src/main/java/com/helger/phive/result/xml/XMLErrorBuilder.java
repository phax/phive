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

import java.time.LocalDateTime;
import java.util.function.Function;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.builder.IBuilder;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.datetime.PDTWebDateHelper;
import com.helger.commons.error.IError;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.location.ILocation;
import com.helger.commons.string.StringHelper;
import com.helger.phive.result.PhiveResultHelper;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroElement;

/**
 * A flexible builder that can be used to convert data from an {@link IError}
 * object to a XML representation with high degrees of freedom.
 *
 * @author Philip Helger
 * @since 10.0.3
 */
public class XMLErrorBuilder implements IBuilder <IMicroElement>
{
  private final String m_sElementName;
  private LocalDateTime m_aErrorDateTime;
  private IErrorLevel m_aErrorLevel;
  private Function <IErrorLevel, String> m_aErrorLevelToXML = PhiveResultHelper::getErrorLevelValue;
  private String m_sErrorID;
  private String m_sErrorFieldName;
  private ILocation m_aErrorLocation;
  private Function <ILocation, IMicroElement> m_aErrorLocationToXML = x -> PhiveXMLHelper.getXMLErrorLocation (x,
                                                                                                               PhiveXMLHelper.XML_ERROR_LOCATION_OBJ);
  private String m_sTest;
  private String m_sErrorText;
  private Throwable m_aException;
  private Function <Throwable, IMicroElement> m_aExceptionToXML = t -> PhiveXMLHelper.getXMLStackTrace (t,
                                                                                                        PhiveXMLHelper.XML_EXCEPTION);

  public XMLErrorBuilder (@Nonnull @Nonempty final String sElementName)
  {
    m_sElementName = sElementName;
  }

  @Nonnull
  public XMLErrorBuilder errorDateTimeNow ()
  {
    return errorDateTime (PDTFactory.getCurrentLocalDateTime ());
  }

  @Nonnull
  public XMLErrorBuilder errorDateTime (@Nullable final LocalDateTime a)
  {
    m_aErrorDateTime = a;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder errorLevel (@Nullable final IErrorLevel a)
  {
    m_aErrorLevel = a;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder errorLevelToXML (@Nullable final Function <IErrorLevel, String> a)
  {
    m_aErrorLevelToXML = a;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder errorID (@Nullable final String s)
  {
    m_sErrorID = s;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder errorFieldName (@Nullable final String s)
  {
    m_sErrorFieldName = s;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder errorLocation (@Nullable final ILocation a)
  {
    m_aErrorLocation = a;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder errorLocationToXML (@Nullable final Function <ILocation, IMicroElement> a)
  {
    m_aErrorLocationToXML = a;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder test (@Nullable final String s)
  {
    m_sTest = s;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder errorText (@Nullable final String s)
  {
    m_sErrorText = s;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder exception (@Nullable final Throwable a)
  {
    m_aException = a;
    return this;
  }

  @Nonnull
  public XMLErrorBuilder exceptionToXML (@Nullable final Function <Throwable, IMicroElement> a)
  {
    m_aExceptionToXML = a;
    return this;
  }

  @Nonnull
  public IMicroElement build ()
  {
    final IMicroElement ret = new MicroElement (m_sElementName);
    if (m_aErrorDateTime != null)
      ret.appendElement (PhiveXMLHelper.XML_ERROR_DATETIME)
         .appendText (PDTWebDateHelper.getAsStringXSD (m_aErrorDateTime));
    if (m_aErrorLevel != null && m_aErrorLevelToXML != null)
    {
      final String sErrorLevel = m_aErrorLevelToXML.apply (m_aErrorLevel);
      if (StringHelper.hasText (sErrorLevel))
        ret.appendElement (PhiveXMLHelper.XML_ERROR_LEVEL).appendText (sErrorLevel);
    }
    if (m_sErrorID != null)
      ret.appendElement (PhiveXMLHelper.XML_ERROR_ID).appendText (m_sErrorID);
    if (m_sErrorFieldName != null)
      ret.appendElement (PhiveXMLHelper.XML_ERROR_FIELD_NAME).appendText (m_sErrorFieldName);
    if (m_aErrorLocation != null && m_aErrorLocationToXML != null)
    {
      final IMicroElement eErrorLocation = m_aErrorLocationToXML.apply (m_aErrorLocation);
      if (eErrorLocation != null)
        ret.appendChild (eErrorLocation);
    }
    if (m_sTest != null)
      ret.appendElement (PhiveXMLHelper.XML_TEST).appendText (m_sTest);
    if (m_sErrorText != null)
      ret.appendElement (PhiveXMLHelper.XML_ERROR_TEXT).appendText (m_sErrorText);
    if (m_aException != null && m_aExceptionToXML != null)
    {
      final IMicroElement eEx = m_aExceptionToXML.apply (m_aException);
      if (eEx != null)
        ret.appendChild (eEx);
    }
    return ret;
  }
}
