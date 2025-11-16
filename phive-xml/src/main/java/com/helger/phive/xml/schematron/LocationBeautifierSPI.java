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
package com.helger.phive.xml.schematron;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.style.IsSPIImplementation;
import com.helger.annotation.style.UsedViaReflection;
import com.helger.schematron.svrl.ISVRLLocationBeautifierSPI;

/**
 * This is a {@link SchematronNamespaceBeautifier} implementation of the
 * {@link ISVRLLocationBeautifierSPI} implementation.
 *
 * @author Philip Helger
 */
@IsSPIImplementation
public class LocationBeautifierSPI implements ISVRLLocationBeautifierSPI
{
  @Deprecated (forRemoval = false)
  @UsedViaReflection
  public LocationBeautifierSPI ()
  {}

  @Nullable
  public String getReplacementText (@NonNull final String sNamespaceURI, @NonNull final String sLocalName)
  {
    final String sPrefix = SchematronNamespaceBeautifier.getMapping (sNamespaceURI);
    if (sPrefix == null)
      return null;

    return sPrefix + ":" + sLocalName;
  }
}
