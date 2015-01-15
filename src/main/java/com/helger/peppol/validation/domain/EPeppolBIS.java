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

import javax.annotation.Nullable;

import com.helger.commons.id.IHasSimpleIntID;
import com.helger.commons.lang.EnumHelper;

/**
 * Enumeration with all OpenPEPPOL BIS
 *
 * @author Philip Helger
 */
public enum EPeppolBIS implements IHasSimpleIntID
{
  CATALOGUE_01 (1),
  ORDER_03 (3),
  INVOICE_04 (4),
  BILLING_05 (5),
  ORDERING_28 (28),
  DESPATCH_ADVICE_30 (30),
  MLR_36 (36);

  private final int m_nID;

  private EPeppolBIS (final int nID)
  {
    m_nID = nID;
  }

  /**
   * @return The OpenPEPPOL internal number.
   */
  public int getID ()
  {
    return m_nID;
  }

  @Nullable
  public static EPeppolBIS getFromIDOrNull (final int nID)
  {
    return EnumHelper.getFromIDOrNull (EPeppolBIS.class, nID);
  }
}
