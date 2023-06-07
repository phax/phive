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
package com.helger.phive.engine.ves;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.jaxb.GenericJAXBMarshaller;
import com.helger.phive.engine.ves.v10.ObjectFactory;
import com.helger.phive.engine.ves.v10.VOMType;

/**
 * A marshaller to read Validation Object Model v1 declarations.
 *
 * @author Philip Helger
 * @since 7.2.1
 */
public class VOM1Marshaller extends GenericJAXBMarshaller <VOMType>
{
  /**
   * The XML Schema path to validate against.
   */
  public static final ClassPathResource XSD = new ClassPathResource ("schemas/vom/vom-1.0.xsd", VOM1Marshaller.class.getClassLoader ());

  public VOM1Marshaller ()
  {
    super (VOMType.class, new CommonsArrayList <> (XSD), new ObjectFactory ()::createVes);
  }
}
