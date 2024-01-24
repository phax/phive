/*
 * Copyright (C) 2023-2024 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.model.v1;

import javax.annotation.concurrent.Immutable;

import com.helger.commons.io.resource.ClassPathResource;

/**
 * Constants for the VES1 data model
 *
 * @author Philip Helger
 */
@Immutable
public final class CVES1
{
  /**
   * The namespace URI of the VES1 XML data model
   */
  public static final String NAMESPACE_URI = "urn:com:helger:phive:ves:v1.0";

  /**
   * The XML Schema path to validate against.
   */
  public static final ClassPathResource XSD_RES = new ClassPathResource ("schemas/ves/ves-1.0.xsd",
                                                                         CVES1.class.getClassLoader ());

  private CVES1 ()
  {}
}
