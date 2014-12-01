/**
 * Copyright (C) 2014 Philip Helger (www.helger.com)
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

public enum EBIS
{
  BILLING (5),
  CATALOGUE (1),
  DESPATCH_ADVICE (30),
  INVOICE (4),
  MLR (36),
  ORDER (3),
  ORDERING (28);

  private final int m_nID;

  private EBIS (final int nID)
  {
    m_nID = nID;
  }

  public int getID ()
  {
    return m_nID;
  }
}
