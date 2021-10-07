/*
 * Copyright (C) 2014-2021 Philip Helger (www.helger.com)
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
package com.helger.phive.api;

import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasName;

/**
 * Interface for a validation type. That basically is a combination of syntax,
 * rule language and result layout.
 *
 * @author Philip Helger
 * @since 7.1.0
 */
@MustImplementEqualsAndHashcode
public interface IValidationType extends IHasID <String>, IHasName
{
  /**
   * @return <code>true</code> if this is an XML Schema validation.
   */
  default boolean isXSD ()
  {
    return false;
  }

  /**
   * @return <code>true</code> if this is a Schematron validation.
   */
  default boolean isSchematron ()
  {
    return false;
  }

  /**
   * @return <code>true</code> to stop validation if an error occurs when using
   *         this validation type. This is helpful to avoid running Schematron
   *         validations when the XML/XSD validations already failed.
   */
  boolean isStopValidationOnError ();

  /**
   * @return <code>true</code> if the application of this validation type
   *         requires additional context parameters.
   */
  boolean isContextRequired ();
}
