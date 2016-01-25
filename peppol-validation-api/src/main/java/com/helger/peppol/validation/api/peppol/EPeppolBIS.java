/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.api.peppol;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.Nonempty;
import com.helger.peppol.validation.api.IBusinessSpecification;

/**
 * Enumeration with all OpenPEPPOL BIS
 *
 * @author Philip Helger
 */
public enum EPeppolBIS implements IBusinessSpecification
{
  CATALOGUE_01 ("OpenPEPPOL BIS 1, Catalogue", 1),
  ORDER_03 ("OpenPEPPOL BIS 3, Order", 3),
  INVOICE_04 ("OpenPEPPOL BIS 4, Invoice", 4),
  BILLING_05 ("OpenPEPPOL BIS 5, Billing", 5),
  ORDERING_28 ("OpenPEPPOL BIS 28, Ordering", 28),
  DESPATCH_ADVICE_30 ("OpenPEPPOL BIS 30, Despatch advice", 30),
  MLR_36 ("OpenPEPPOL BIS 36, MLR", 36);

  private final String m_sDisplayName;
  private final int m_nNumber;

  private EPeppolBIS (@Nonnull @Nonempty final String sDisplayName, final int nNumber)
  {
    m_sDisplayName = sDisplayName;
    m_nNumber = nNumber;
  }

  /**
   * @return The OpenPEPPOL internal number.
   */
  public int getNumber ()
  {
    return m_nNumber;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return "openpeppol-bis-" + m_nNumber;
  }

  @Nonnull
  @Nonempty
  public String getDisplayName ()
  {
    return m_sDisplayName;
  }
}
