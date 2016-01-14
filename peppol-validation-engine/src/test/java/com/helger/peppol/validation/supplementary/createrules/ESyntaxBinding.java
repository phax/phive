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
package com.helger.peppol.validation.supplementary.createrules;

import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.id.IHasID;
import com.helger.commons.lang.EnumHelper;
import com.helger.commons.url.SMap;
import com.helger.ubl21.CUBL21;

public enum ESyntaxBinding implements IHasID <String>
{
 UBL ("UBL")
 {
   @Override
   @Nonnull
   @ReturnsMutableCopy
   public Map <String, String> getAllNamespaces ()
   {
     return new SMap ().add ("cac", CUBL21.XML_SCHEMA_CAC_NAMESPACE_URL)
                       .add ("cbc", CUBL21.XML_SCHEMA_CBC_NAMESPACE_URL)
                       .add ("cec", CUBL21.XML_SCHEMA_CEC_NAMESPACE_URL)
                       .add ("xs", "http://www.w3.org/2001/XMLSchema");
   }
 },
 CEFACT ("CEFACT")
 {
   @Override
   @Nonnull
   @ReturnsMutableCopy
   public Map <String, String> getAllNamespaces ()
   {
     return new SMap ().add ("udt", "urn:un:unece:uncefact:data:standard:UnqualifiedDataType:10")
                       .add ("ram", "urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:10")
                       .add ("rsm", "urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:4")
                       .add ("xs", "http://www.w3.org/2001/XMLSchema");
   }
 };

  private final String m_sID;

  private ESyntaxBinding (@Nonnull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  /**
   * @return All namespaces as map from prefix to URL. Never <code>null</code>.
   */
  @Nonnull
  @ReturnsMutableCopy
  public abstract Map <String, String> getAllNamespaces ();

  @Nullable
  public static ESyntaxBinding getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (ESyntaxBinding.class, sID);
  }
}
