/*
 * Copyright (C) 2023-2025 Philip Helger (www.helger.com)
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

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.jaxb.GenericJAXBMarshaller;
import com.helger.phive.ves.v10.ObjectFactory;
import com.helger.phive.ves.v10.VesStatusType;

/**
 * A marshaller to read VES Status v1 declarations.
 *
 * @author Philip Helger
 */
public class VESStatus1Marshaller extends GenericJAXBMarshaller <VesStatusType>
{
  public VESStatus1Marshaller ()
  {
    super (VesStatusType.class, new CommonsArrayList <> (CVES1.XSD_RES), new ObjectFactory ()::createStatus);
  }
}
