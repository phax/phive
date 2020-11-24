/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.api.source;

import javax.annotation.Nullable;

/**
 * Abstract validation source interface. This represents an object to be
 * validated.
 *
 * @author Philip Helger
 */
public interface IValidationSource
{
  /**
   * @return The system ID (e.g. filename) of the source to be validated. May be
   *         <code>null</code>.
   */
  @Nullable
  String getSystemID ();

  /**
   * @return <code>true</code> if this source is partial and <code>false</code>
   *         if the whole Document should be used. If it is partial there must
   *         be a way to define the necessary part(s) in the implementation.
   */
  boolean isPartialSource ();
}
