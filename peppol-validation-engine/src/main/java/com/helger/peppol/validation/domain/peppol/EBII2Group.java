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
package com.helger.peppol.validation.domain.peppol;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.lang.EnumHelper;
import com.helger.peppol.validation.domain.ISpecificationGroup;

/**
 * Represents the grouping of CEN BII2 transactions.<br>
 * Source: http://www.cenbii.eu/deliverables/cen-bii-2/
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public enum EBII2Group implements ISpecificationGroup
{
 ARCHITECTURE ("architecture"),
 NOTIFICATION ("notification"),
 TENDERING ("tendering"),
 CATALOGUE ("catalogue"),
 POST_AWARD ("post-award");

  private final String m_sID;

  private EBII2Group (@Nonnull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nullable
  public static EBII2Group getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (EBII2Group.class, sID);
  }
}
