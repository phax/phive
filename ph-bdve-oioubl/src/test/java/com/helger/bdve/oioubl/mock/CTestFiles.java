/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.oioubl.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.oioubl.OIOUBLValidation;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.IReadableResource;

@Immutable
public final class CTestFiles
{
  private static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    OIOUBLValidation.initOIOUBL (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aESID : new VESID [] { OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                                            OIOUBLValidation.VID_OIOUBL_CATALOGUE,
                                            OIOUBLValidation.VID_OIOUBL_CATALOGUE_DELETION,
                                            OIOUBLValidation.VID_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE,
                                            OIOUBLValidation.VID_OIOUBL_CATALOGUE_PRICING_UPDATE,
                                            OIOUBLValidation.VID_OIOUBL_CATALOGUE_REQUEST,
                                            OIOUBLValidation.VID_OIOUBL_CREDIT_NOTE,
                                            OIOUBLValidation.VID_OIOUBL_INVOICE,
                                            OIOUBLValidation.VID_OIOUBL_ORDER,
                                            OIOUBLValidation.VID_OIOUBL_ORDER_CANCELLATION,
                                            OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE,
                                            OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                                            OIOUBLValidation.VID_OIOUBL_REMINDER,
                                            OIOUBLValidation.VID_OIOUBL_STATEMENT })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aESID))
        ret.add (MockFile.createGoodCase (aRes, aESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    final String sPrefix = "/oioubl/2.0.2/";
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_CATALOGUE))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_CATALOGUE_DELETION))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_CATALOGUE_PRICING_UPDATE))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_CATALOGUE_REQUEST))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_CREDIT_NOTE))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_INVOICE))
    {
      // return new CommonsArrayList <> (new ClassPathResource (sPrefix +
      // "ADVORD_01_01_00_Invoice_v2p1.xml"));
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_ORDER))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_ORDER_CANCELLATION))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_REMINDER))
    {
      return new CommonsArrayList <> ();
    }
    if (aVESID.equals (OIOUBLValidation.VID_OIOUBL_STATEMENT))
    {
      return new CommonsArrayList <> ();
    }

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
