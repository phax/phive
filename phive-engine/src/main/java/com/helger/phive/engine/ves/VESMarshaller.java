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
import com.helger.phive.engine.ves.v10_new.ObjectFactory;
import com.helger.phive.engine.ves.v10_new.VesType;

/**
 * A marshaller to read Validation E Model v1 declarations.
 *
 * @author Philip Helger
 */
public class VESMarshaller extends GenericJAXBMarshaller <VesType>
{
  /**
   * The XML Schema path to validate against.
   */
  public static final ClassPathResource XSD = new ClassPathResource ("schemas/ves/ves-1.0-new-approach.xsd",
                                                                     VESMarshaller.class.getClassLoader ());

  public VESMarshaller()
  {
    super (VesType.class, new CommonsArrayList <> (XSD), new ObjectFactory()::createVes);
  }
}
