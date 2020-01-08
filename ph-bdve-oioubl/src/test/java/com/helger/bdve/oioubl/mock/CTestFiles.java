/**
 * Copyright (C) 2018-2020 Philip Helger (www.helger.com)
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
import com.helger.collection.multimap.MultiHashMapArrayListBased;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

@Immutable
public final class CTestFiles
{
  public static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
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
                                            OIOUBLValidation.VID_OIOUBL_ORDER_CHANGE,
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

    final MultiHashMapArrayListBased <VESID, IReadableResource> aMap = new MultiHashMapArrayListBased <> ();
    // List created by MainAssignTestFilesToDocTypes
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_01_01_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_CHANGE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_01_01_00_OrderChange_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_01_01_00_OrderResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_02_02_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_CHANGE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_02_02_00_OrderChange_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_02_02_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_02_02_00_OrderResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_03_03_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_03_03_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_03_03_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_04_04_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_CHANGE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_04_04_00_OrderChange_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_04_04_00_OrderResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_04_04_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_CANCELLATION,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_05_04_01_OrderCancellation_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_05_04_01_OrderResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_05_04_01_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_06_05_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/ADVORD_06_05_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/ApplicationResponseStor_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_01_01_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_01_01_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_01_01_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_02_01_02_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_02_01_02_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_03_01_06_ApplicationResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CREDIT_NOTE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_03_01_06_CreditNote_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_03_01_06_Invoice_B_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_03_01_06_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_03_01_06_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_03_01_06_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_04_01_08_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_04_01_08_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_04_01_08_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_REMINDER,
                    new ClassPathResource ("/oioubl/2.0.2/BASPRO_04_01_08_Reminder_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_01_01_00_ApplicationResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE_REQUEST,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_01_01_00_CatalogueRequest_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE,
                      new ClassPathResource ("/oioubl/2.0.2/CATEXE_01_01_00_Catalogue_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_02_02_07_ApplicationResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE_REQUEST,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_02_02_07_CatalogueRequest_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE,
                      new ClassPathResource ("/oioubl/2.0.2/CATEXE_02_02_07_Catalogue_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_03_03_00_CatalogueItemSpecificationUpdate_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE_REQUEST,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_03_03_00_CatalogueRequest_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_04_04_00_ApplicationResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE_PRICING_UPDATE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_04_04_00_CataloguePricingUpdate_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_05_05_00_ApplicationResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE_REQUEST,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_05_05_00_CatalogueRequest_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_05_05_00_Catalogue_A_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_05_05_00_Catalogue_B_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CATALOGUE_DELETION,
                    new ClassPathResource ("/oioubl/2.0.2/CATEXE_06_06_00_CatalogueDeletion_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_01_01_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_01_01_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_01_01_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_02_02_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_02_02_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_02_02_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_03_01_04_ApplicationResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_03_01_04_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_03_01_04_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_03_01_04_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_APPLICATION_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_04_02_04_ApplicationResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_04_02_04_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_04_02_04_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMDEL_04_02_04_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_01_01_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_01_01_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_01_01_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_02_02_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_02_02_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_02_02_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_03_03_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_03_03_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMORG_03_03_00_Order_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                      new ClassPathResource ("/oioubl/2.0.2/COMPAY_01_01_00_Invoice_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE,
                      new ClassPathResource ("/oioubl/2.0.2/COMPAY_01_01_00_OrderResponse_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMPAY_03_03_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMPAY_03_03_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMPAY_03_03_00_Order_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_REMINDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMPAY_03_03_00_Reminder_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                    new ClassPathResource ("/oioubl/2.0.2/COMPAY_04_04_00_Invoice_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/COMPAY_04_04_00_OrderResponseSimple_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER,
                    new ClassPathResource ("/oioubl/2.0.2/COMPAY_04_04_00_Order_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_CREDIT_NOTE,
                      new ClassPathResource ("/oioubl/2.0.2/CreditNoteStor_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_INVOICE,
                      new ClassPathResource ("/oioubl/2.0.2/InvoiceStor_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_CANCELLATION,
                    new ClassPathResource ("/oioubl/2.0.2/OrderCancellationStor_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_CHANGE,
                    new ClassPathResource ("/oioubl/2.0.2/OrderChangeStor_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                    new ClassPathResource ("/oioubl/2.0.2/OrderResponseSimpleStor_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER_RESPONSE,
                    new ClassPathResource ("/oioubl/2.0.2/OrderResponseStor_v2p2.xml"));
    aMap.putSingle (OIOUBLValidation.VID_OIOUBL_ORDER, new ClassPathResource ("/oioubl/2.0.2/OrderStor_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_REMINDER,
                      new ClassPathResource ("/oioubl/2.0.2/ReminderStor_v2p2.xml"));
    if (false)
      aMap.putSingle (OIOUBLValidation.VID_OIOUBL_STATEMENT,
                      new ClassPathResource ("/oioubl/2.0.2/StatementStor_v2p2.xml"));

    final ICommonsList <IReadableResource> ret = aMap.get (aVESID);
    if (ret != null)
      return ret;

    // There is currently no valid test file for "Statement"
    if (true)
      return new CommonsArrayList <> ();

    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
  }
}
