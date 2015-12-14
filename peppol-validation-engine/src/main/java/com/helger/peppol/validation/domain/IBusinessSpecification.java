/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.domain;

import java.io.Serializable;

import com.helger.commons.annotation.MustImplementComparable;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasDisplayName;

/**
 * The base interface for business specifications (e.g. PEPPOL BIS)
 *
 * @author Philip Helger
 */
@MustImplementComparable
public interface IBusinessSpecification extends IHasID <String>, IHasDisplayName, Serializable
{
  /**
   * @return The internal number of the business specification. Used for
   *         ordering.
   */
  int getNumber ();
}
