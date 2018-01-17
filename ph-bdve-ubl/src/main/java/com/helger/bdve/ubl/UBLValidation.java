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
package com.helger.bdve.ubl;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.spec.BusinessSpecification;
import com.helger.bdve.spec.BusinessSpecificationRegistry;
import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.bdve.spec.ISpecificationTransaction;
import com.helger.bdve.spec.SpecificationTransaction;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * Generic UBL validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class UBLValidation
{
  @Nonnull
  private static BusinessSpecification _createBusinessSpec (@Nonnull @Nonempty final String sGroupID,
                                                            @Nonnull @Nonempty final String sSpecID,
                                                            @Nonnull @Nonempty final String sDisplayName)
  {
    final BusinessSpecification ret = new BusinessSpecification (sGroupID, sSpecID, sDisplayName);
    BusinessSpecificationRegistry.INSTANCE.registerBusinessSpecification (ret);
    return ret;
  }

  public static final String GROUP_ID = "org.oasis-open";
  public static final String VERSION_21 = "2.1";
  public static final IBusinessSpecification UBL_21 = _createBusinessSpec (GROUP_ID, "ubl", "UBL " + VERSION_21);

  public static final VESID VID_UBL_21_APPLICATIONRESPONSE = new VESID (GROUP_ID, "applicationresponse", VERSION_21);
  public static final VESID VID_UBL_21_ATTACHEDDOCUMENT = new VESID (GROUP_ID, "attacheddocument", VERSION_21);
  public static final VESID VID_UBL_21_AWARDEDNOTIFICATION = new VESID (GROUP_ID, "awardednotification", VERSION_21);
  public static final VESID VID_UBL_21_BILLOFLADING = new VESID (GROUP_ID, "billoflading", VERSION_21);
  public static final VESID VID_UBL_21_CALLFORTENDERS = new VESID (GROUP_ID, "callfortenders", VERSION_21);
  public static final VESID VID_UBL_21_CATALOGUE = new VESID (GROUP_ID, "catalogue", VERSION_21);
  public static final VESID VID_UBL_21_CATALOGUEDELETION = new VESID (GROUP_ID, "cataloguedeletion", VERSION_21);
  public static final VESID VID_UBL_21_CATALOGUEITEMSPECIFICATIONUPDATE = new VESID (GROUP_ID,
                                                                                     "catalogueitemspecificationupdate",
                                                                                     VERSION_21);
  public static final VESID VID_UBL_21_CATALOGUEPRICINGUPDATE = new VESID (GROUP_ID,
                                                                           "cataloguepricingupdate",
                                                                           VERSION_21);
  public static final VESID VID_UBL_21_CATALOGUEREQUEST = new VESID (GROUP_ID, "cataloguerequest", VERSION_21);
  public static final VESID VID_UBL_21_CERTIFICATEOFORIGIN = new VESID (GROUP_ID, "certificateoforigin", VERSION_21);
  public static final VESID VID_UBL_21_CONTRACTAWARDNOTICE = new VESID (GROUP_ID, "contractawardnotice", VERSION_21);
  public static final VESID VID_UBL_21_CONTRACTNOTICE = new VESID (GROUP_ID, "contractnotice", VERSION_21);
  public static final VESID VID_UBL_21_CREDITNOTE = new VESID (GROUP_ID, "creditnote", VERSION_21);
  public static final VESID VID_UBL_21_DEBITNOTE = new VESID (GROUP_ID, "debitnote", VERSION_21);
  public static final VESID VID_UBL_21_DESPATCHADVICE = new VESID (GROUP_ID, "despatchadvice", VERSION_21);
  public static final VESID VID_UBL_21_DOCUMENTSTATUS = new VESID (GROUP_ID, "documentstatus", VERSION_21);
  public static final VESID VID_UBL_21_DOCUMENTSTATUSREQUEST = new VESID (GROUP_ID,
                                                                          "documentstatusrequest",
                                                                          VERSION_21);
  public static final VESID VID_UBL_21_EXCEPTIONCRITERIA = new VESID (GROUP_ID, "exceptioncriteria", VERSION_21);
  public static final VESID VID_UBL_21_EXCEPTIONNOTIFICATION = new VESID (GROUP_ID,
                                                                          "exceptionnotification",
                                                                          VERSION_21);
  public static final VESID VID_UBL_21_FORECAST = new VESID (GROUP_ID, "forecast", VERSION_21);
  public static final VESID VID_UBL_21_FORECASTREVISION = new VESID (GROUP_ID, "forecastrevision", VERSION_21);
  public static final VESID VID_UBL_21_FORWARDINGINSTRUCTIONS = new VESID (GROUP_ID,
                                                                           "forwardinginstructions",
                                                                           VERSION_21);
  public static final VESID VID_UBL_21_FREIGHTINVOICE = new VESID (GROUP_ID, "freightinvoice", VERSION_21);
  public static final VESID VID_UBL_21_FULFILMENTCANCELLATION = new VESID (GROUP_ID,
                                                                           "fulfilmentcancellation",
                                                                           VERSION_21);
  public static final VESID VID_UBL_21_GOODSITEMITINERARY = new VESID (GROUP_ID, "goodsitemitinerary", VERSION_21);
  public static final VESID VID_UBL_21_GUARANTEECERTIFICATE = new VESID (GROUP_ID, "guaranteecertificate", VERSION_21);
  public static final VESID VID_UBL_21_INSTRUCTIONFORRETURNS = new VESID (GROUP_ID,
                                                                          "instructionforreturns",
                                                                          VERSION_21);
  public static final VESID VID_UBL_21_INVENTORYREPORT = new VESID (GROUP_ID, "inventoryreport", VERSION_21);
  public static final VESID VID_UBL_21_INVOICE = new VESID (GROUP_ID, "invoice", VERSION_21);
  public static final VESID VID_UBL_21_ITEMINFORMATIONREQUEST = new VESID (GROUP_ID,
                                                                           "iteminformationrequest",
                                                                           VERSION_21);
  public static final VESID VID_UBL_21_ORDER = new VESID (GROUP_ID, "order", VERSION_21);
  public static final VESID VID_UBL_21_ORDERCANCELLATION = new VESID (GROUP_ID, "ordercancellation", VERSION_21);
  public static final VESID VID_UBL_21_ORDERCHANGE = new VESID (GROUP_ID, "orderchange", VERSION_21);
  public static final VESID VID_UBL_21_ORDERRESPONSE = new VESID (GROUP_ID, "orderresponse", VERSION_21);
  public static final VESID VID_UBL_21_ORDERRESPONSESIMPLE = new VESID (GROUP_ID, "orderresponsesimple", VERSION_21);
  public static final VESID VID_UBL_21_PACKINGLIST = new VESID (GROUP_ID, "packinglist", VERSION_21);
  public static final VESID VID_UBL_21_PRIORINFORMATIONNOTICE = new VESID (GROUP_ID,
                                                                           "priorinformationnotice",
                                                                           VERSION_21);
  public static final VESID VID_UBL_21_PRODUCTACTIVITY = new VESID (GROUP_ID, "productactivity", VERSION_21);
  public static final VESID VID_UBL_21_QUOTATION = new VESID (GROUP_ID, "quotation", VERSION_21);
  public static final VESID VID_UBL_21_RECEIPTADVICE = new VESID (GROUP_ID, "receiptadvice", VERSION_21);
  public static final VESID VID_UBL_21_REMINDER = new VESID (GROUP_ID, "reminder", VERSION_21);
  public static final VESID VID_UBL_21_REMITTANCEADVICE = new VESID (GROUP_ID, "remittanceadvice", VERSION_21);
  public static final VESID VID_UBL_21_REQUESTFORQUOTATION = new VESID (GROUP_ID, "requestforquotation", VERSION_21);
  public static final VESID VID_UBL_21_RETAILEVENT = new VESID (GROUP_ID, "retailevent", VERSION_21);
  public static final VESID VID_UBL_21_SELFBILLEDCREDITNOTE = new VESID (GROUP_ID, "selfbilledcreditnote", VERSION_21);
  public static final VESID VID_UBL_21_SELFBILLEDINVOICE = new VESID (GROUP_ID, "selfbilledinvoice", VERSION_21);
  public static final VESID VID_UBL_21_STATEMENT = new VESID (GROUP_ID, "statement", VERSION_21);
  public static final VESID VID_UBL_21_STOCKAVAILABILITYREPORT = new VESID (GROUP_ID,
                                                                            "stockavailabilityreport",
                                                                            VERSION_21);
  public static final VESID VID_UBL_21_TENDER = new VESID (GROUP_ID, "tender", VERSION_21);
  public static final VESID VID_UBL_21_TENDERERQUALIFICATION = new VESID (GROUP_ID,
                                                                          "tendererqualification",
                                                                          VERSION_21);
  public static final VESID VID_UBL_21_TENDERERQUALIFICATIONRESPONSE = new VESID (GROUP_ID,
                                                                                  "tendererqualificationresponse",
                                                                                  VERSION_21);
  public static final VESID VID_UBL_21_TENDERRECEIPT = new VESID (GROUP_ID, "tenderreceipt", VERSION_21);
  public static final VESID VID_UBL_21_TRADEITEMLOCATIONPROFILE = new VESID (GROUP_ID,
                                                                             "tradeitemlocationprofile",
                                                                             VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTATIONSTATUS = new VESID (GROUP_ID, "transportationstatus", VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTATIONSTATUSREQUEST = new VESID (GROUP_ID,
                                                                                "transportationstatusrequest",
                                                                                VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTEXECUTIONPLAN = new VESID (GROUP_ID,
                                                                           "transportexecutionplan",
                                                                           VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTEXECUTIONPLANREQUEST = new VESID (GROUP_ID,
                                                                                  "transportexecutionplanrequest",
                                                                                  VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTPROGRESSSTATUS = new VESID (GROUP_ID,
                                                                            "transportprogressstatus",
                                                                            VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTPROGRESSSTATUSREQUEST = new VESID (GROUP_ID,
                                                                                   "transportprogressstatusrequest",
                                                                                   VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTSERVICEDESCRIPTION = new VESID (GROUP_ID,
                                                                                "transportservicedescription",
                                                                                VERSION_21);
  public static final VESID VID_UBL_21_TRANSPORTSERVICEDESCRIPTIONREQUEST = new VESID (GROUP_ID,
                                                                                       "transportservicedescriptionrequest",
                                                                                       VERSION_21);
  public static final VESID VID_UBL_21_UNAWARDEDNOTIFICATION = new VESID (GROUP_ID,
                                                                          "unawardednotification",
                                                                          VERSION_21);
  public static final VESID VID_UBL_21_UTILITYSTATEMENT = new VESID (GROUP_ID, "utilitystatement", VERSION_21);
  public static final VESID VID_UBL_21_WAYBILL = new VESID (GROUP_ID, "waybill", VERSION_21);

  private UBLValidation ()
  {}

  /**
   * Register all standard UBL 2.1 validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initUBL21 (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final boolean bDeprecated = false;
    for (final EUBL21DocumentType e : EUBL21DocumentType.values ())
    {
      final String sName = e.getLocalName ();
      final VESID aVESID = new VESID (GROUP_ID, sName.toLowerCase (Locale.US), VERSION_21);
      final ISpecificationTransaction aTransaction = new SpecificationTransaction (sName.toLowerCase (Locale.US),
                                                                                   "UBL " + sName + " " + VERSION_21,
                                                                                   e,
                                                                                   UBL21NamespaceContext.getInstance ());

      // No Schematrons here
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                             "UBL " + sName + " " + VERSION_21,
                                                                             new ValidationArtefactKey.Builder ().setBusinessSpecification (UBL_21)
                                                                                                                 .setTransaction (aTransaction)
                                                                                                                 .build (),
                                                                             bDeprecated));
    }
  }

  // public static void main (final String [] args)
  // {
  // for (final EUBL21DocumentType e : EUBL21DocumentType.values ())
  // {
  // final String sName = e.getLocalName ();
  // System.out.println ("public static final VESID VID_UBL_21_" +
  // sName.toUpperCase (Locale.US) +
  // " = new VESID (GROUP_ID, \"" +
  // sName.toLowerCase (Locale.US) +
  // "\", VERSION_21);");
  // }
  // }
}
