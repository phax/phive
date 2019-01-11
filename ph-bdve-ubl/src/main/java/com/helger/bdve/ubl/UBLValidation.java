/**
 * Copyright (C) 2014-2019 Philip Helger (www.helger.com)
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

import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.ubl20.EUBL20DocumentType;
import com.helger.ubl20.UBL20NamespaceContext;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;
import com.helger.ubl22.EUBL22DocumentType;
import com.helger.ubl22.UBL22NamespaceContext;

/**
 * Generic UBL validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class UBLValidation
{
  public static final String GROUP_ID = "org.oasis-open";
  public static final String VERSION_20 = "2.0";
  public static final String VERSION_21 = "2.1";
  public static final String VERSION_22 = "2.2";

  public static final VESID VID_UBL_20_APPLICATIONRESPONSE = new VESID (GROUP_ID, "applicationresponse", VERSION_20);
  public static final VESID VID_UBL_20_ATTACHEDDOCUMENT = new VESID (GROUP_ID, "attacheddocument", VERSION_20);
  public static final VESID VID_UBL_20_BILLOFLADING = new VESID (GROUP_ID, "billoflading", VERSION_20);
  public static final VESID VID_UBL_20_CATALOGUE = new VESID (GROUP_ID, "catalogue", VERSION_20);
  public static final VESID VID_UBL_20_CATALOGUEDELETION = new VESID (GROUP_ID, "cataloguedeletion", VERSION_20);
  public static final VESID VID_UBL_20_CATALOGUEITEMSPECIFICATIONUPDATE = new VESID (GROUP_ID,
                                                                                     "catalogueitemspecificationupdate",
                                                                                     VERSION_20);
  public static final VESID VID_UBL_20_CATALOGUEPRICINGUPDATE = new VESID (GROUP_ID,
                                                                           "cataloguepricingupdate",
                                                                           VERSION_20);
  public static final VESID VID_UBL_20_CATALOGUEREQUEST = new VESID (GROUP_ID, "cataloguerequest", VERSION_20);
  public static final VESID VID_UBL_20_CERTIFICATEOFORIGIN = new VESID (GROUP_ID, "certificateoforigin", VERSION_20);
  public static final VESID VID_UBL_20_CREDITNOTE = new VESID (GROUP_ID, "creditnote", VERSION_20);
  public static final VESID VID_UBL_20_DEBITNOTE = new VESID (GROUP_ID, "debitnote", VERSION_20);
  public static final VESID VID_UBL_20_DESPATCHADVICE = new VESID (GROUP_ID, "despatchadvice", VERSION_20);
  public static final VESID VID_UBL_20_FORWARDINGINSTRUCTIONS = new VESID (GROUP_ID,
                                                                           "forwardinginstructions",
                                                                           VERSION_20);
  public static final VESID VID_UBL_20_FREIGHTINVOICE = new VESID (GROUP_ID, "freightinvoice", VERSION_20);
  public static final VESID VID_UBL_20_INVOICE = new VESID (GROUP_ID, "invoice", VERSION_20);
  public static final VESID VID_UBL_20_ORDER = new VESID (GROUP_ID, "order", VERSION_20);
  public static final VESID VID_UBL_20_ORDERCANCELLATION = new VESID (GROUP_ID, "ordercancellation", VERSION_20);
  public static final VESID VID_UBL_20_ORDERCHANGE = new VESID (GROUP_ID, "orderchange", VERSION_20);
  public static final VESID VID_UBL_20_ORDERRESPONSE = new VESID (GROUP_ID, "orderresponse", VERSION_20);
  public static final VESID VID_UBL_20_ORDERRESPONSESIMPLE = new VESID (GROUP_ID, "orderresponsesimple", VERSION_20);
  public static final VESID VID_UBL_20_PACKINGLIST = new VESID (GROUP_ID, "packinglist", VERSION_20);
  public static final VESID VID_UBL_20_QUOTATION = new VESID (GROUP_ID, "quotation", VERSION_20);
  public static final VESID VID_UBL_20_RECEIPTADVICE = new VESID (GROUP_ID, "receiptadvice", VERSION_20);
  public static final VESID VID_UBL_20_REMINDER = new VESID (GROUP_ID, "reminder", VERSION_20);
  public static final VESID VID_UBL_20_REMITTANCEADVICE = new VESID (GROUP_ID, "remittanceadvice", VERSION_20);
  public static final VESID VID_UBL_20_REQUESTFORQUOTATION = new VESID (GROUP_ID, "requestforquotation", VERSION_20);
  public static final VESID VID_UBL_20_SELFBILLEDCREDITNOTE = new VESID (GROUP_ID, "selfbilledcreditnote", VERSION_20);
  public static final VESID VID_UBL_20_SELFBILLEDINVOICE = new VESID (GROUP_ID, "selfbilledinvoice", VERSION_20);
  public static final VESID VID_UBL_20_STATEMENT = new VESID (GROUP_ID, "statement", VERSION_20);
  public static final VESID VID_UBL_20_TRANSPORTATIONSTATUS = new VESID (GROUP_ID, "transportationstatus", VERSION_20);
  public static final VESID VID_UBL_20_WAYBILL = new VESID (GROUP_ID, "waybill", VERSION_20);

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

  public static final VESID VID_UBL_22_APPLICATIONRESPONSE = new VESID (GROUP_ID, "applicationresponse", VERSION_22);
  public static final VESID VID_UBL_22_ATTACHEDDOCUMENT = new VESID (GROUP_ID, "attacheddocument", VERSION_22);
  public static final VESID VID_UBL_22_AWARDEDNOTIFICATION = new VESID (GROUP_ID, "awardednotification", VERSION_22);
  public static final VESID VID_UBL_22_BILLOFLADING = new VESID (GROUP_ID, "billoflading", VERSION_22);
  public static final VESID VID_UBL_22_BUSINESSCARD = new VESID (GROUP_ID, "businesscard", VERSION_22);
  public static final VESID VID_UBL_22_CALLFORTENDERS = new VESID (GROUP_ID, "callfortenders", VERSION_22);
  public static final VESID VID_UBL_22_CATALOGUE = new VESID (GROUP_ID, "catalogue", VERSION_22);
  public static final VESID VID_UBL_22_CATALOGUEDELETION = new VESID (GROUP_ID, "cataloguedeletion", VERSION_22);
  public static final VESID VID_UBL_22_CATALOGUEITEMSPECIFICATIONUPDATE = new VESID (GROUP_ID,
                                                                                     "catalogueitemspecificationupdate",
                                                                                     VERSION_22);
  public static final VESID VID_UBL_22_CATALOGUEPRICINGUPDATE = new VESID (GROUP_ID,
                                                                           "cataloguepricingupdate",
                                                                           VERSION_22);
  public static final VESID VID_UBL_22_CATALOGUEREQUEST = new VESID (GROUP_ID, "cataloguerequest", VERSION_22);
  public static final VESID VID_UBL_22_CERTIFICATEOFORIGIN = new VESID (GROUP_ID, "certificateoforigin", VERSION_22);
  public static final VESID VID_UBL_22_CONTRACTAWARDNOTICE = new VESID (GROUP_ID, "contractawardnotice", VERSION_22);
  public static final VESID VID_UBL_22_CONTRACTNOTICE = new VESID (GROUP_ID, "contractnotice", VERSION_22);
  public static final VESID VID_UBL_22_CREDITNOTE = new VESID (GROUP_ID, "creditnote", VERSION_22);
  public static final VESID VID_UBL_22_DEBITNOTE = new VESID (GROUP_ID, "debitnote", VERSION_22);
  public static final VESID VID_UBL_22_DESPATCHADVICE = new VESID (GROUP_ID, "despatchadvice", VERSION_22);
  public static final VESID VID_UBL_22_DIGITALAGREEMENT = new VESID (GROUP_ID, "digitalagreement", VERSION_22);
  public static final VESID VID_UBL_22_DIGITALCAPABILITY = new VESID (GROUP_ID, "digitalcapability", VERSION_22);
  public static final VESID VID_UBL_22_DOCUMENTSTATUS = new VESID (GROUP_ID, "documentstatus", VERSION_22);
  public static final VESID VID_UBL_22_DOCUMENTSTATUSREQUEST = new VESID (GROUP_ID,
                                                                          "documentstatusrequest",
                                                                          VERSION_22);
  public static final VESID VID_UBL_22_ENQUIRY = new VESID (GROUP_ID, "enquiry", VERSION_22);
  public static final VESID VID_UBL_22_ENQUIRYRESPONSE = new VESID (GROUP_ID, "enquiryresponse", VERSION_22);
  public static final VESID VID_UBL_22_EXCEPTIONCRITERIA = new VESID (GROUP_ID, "exceptioncriteria", VERSION_22);
  public static final VESID VID_UBL_22_EXCEPTIONNOTIFICATION = new VESID (GROUP_ID,
                                                                          "exceptionnotification",
                                                                          VERSION_22);
  public static final VESID VID_UBL_22_EXPRESSIONOFINTERESTREQUEST = new VESID (GROUP_ID,
                                                                                "expressionofinterestrequest",
                                                                                VERSION_22);
  public static final VESID VID_UBL_22_EXPRESSIONOFINTERESTRESPONSE = new VESID (GROUP_ID,
                                                                                 "expressionofinterestresponse",
                                                                                 VERSION_22);
  public static final VESID VID_UBL_22_FORECAST = new VESID (GROUP_ID, "forecast", VERSION_22);
  public static final VESID VID_UBL_22_FORECASTREVISION = new VESID (GROUP_ID, "forecastrevision", VERSION_22);
  public static final VESID VID_UBL_22_FORWARDINGINSTRUCTIONS = new VESID (GROUP_ID,
                                                                           "forwardinginstructions",
                                                                           VERSION_22);
  public static final VESID VID_UBL_22_FREIGHTINVOICE = new VESID (GROUP_ID, "freightinvoice", VERSION_22);
  public static final VESID VID_UBL_22_FULFILMENTCANCELLATION = new VESID (GROUP_ID,
                                                                           "fulfilmentcancellation",
                                                                           VERSION_22);
  public static final VESID VID_UBL_22_GOODSITEMITINERARY = new VESID (GROUP_ID, "goodsitemitinerary", VERSION_22);
  public static final VESID VID_UBL_22_GUARANTEECERTIFICATE = new VESID (GROUP_ID, "guaranteecertificate", VERSION_22);
  public static final VESID VID_UBL_22_INSTRUCTIONFORRETURNS = new VESID (GROUP_ID,
                                                                          "instructionforreturns",
                                                                          VERSION_22);
  public static final VESID VID_UBL_22_INVENTORYREPORT = new VESID (GROUP_ID, "inventoryreport", VERSION_22);
  public static final VESID VID_UBL_22_INVOICE = new VESID (GROUP_ID, "invoice", VERSION_22);
  public static final VESID VID_UBL_22_ITEMINFORMATIONREQUEST = new VESID (GROUP_ID,
                                                                           "iteminformationrequest",
                                                                           VERSION_22);
  public static final VESID VID_UBL_22_ORDER = new VESID (GROUP_ID, "order", VERSION_22);
  public static final VESID VID_UBL_22_ORDERCANCELLATION = new VESID (GROUP_ID, "ordercancellation", VERSION_22);
  public static final VESID VID_UBL_22_ORDERCHANGE = new VESID (GROUP_ID, "orderchange", VERSION_22);
  public static final VESID VID_UBL_22_ORDERRESPONSE = new VESID (GROUP_ID, "orderresponse", VERSION_22);
  public static final VESID VID_UBL_22_ORDERRESPONSESIMPLE = new VESID (GROUP_ID, "orderresponsesimple", VERSION_22);
  public static final VESID VID_UBL_22_PACKINGLIST = new VESID (GROUP_ID, "packinglist", VERSION_22);
  public static final VESID VID_UBL_22_PRIORINFORMATIONNOTICE = new VESID (GROUP_ID,
                                                                           "priorinformationnotice",
                                                                           VERSION_22);
  public static final VESID VID_UBL_22_PRODUCTACTIVITY = new VESID (GROUP_ID, "productactivity", VERSION_22);
  public static final VESID VID_UBL_22_QUALIFICATIONAPPLICATIONREQUEST = new VESID (GROUP_ID,
                                                                                    "qualificationapplicationrequest",
                                                                                    VERSION_22);
  public static final VESID VID_UBL_22_QUALIFICATIONAPPLICATIONRESPONSE = new VESID (GROUP_ID,
                                                                                     "qualificationapplicationresponse",
                                                                                     VERSION_22);
  public static final VESID VID_UBL_22_QUOTATION = new VESID (GROUP_ID, "quotation", VERSION_22);
  public static final VESID VID_UBL_22_RECEIPTADVICE = new VESID (GROUP_ID, "receiptadvice", VERSION_22);
  public static final VESID VID_UBL_22_REMINDER = new VESID (GROUP_ID, "reminder", VERSION_22);
  public static final VESID VID_UBL_22_REMITTANCEADVICE = new VESID (GROUP_ID, "remittanceadvice", VERSION_22);
  public static final VESID VID_UBL_22_REQUESTFORQUOTATION = new VESID (GROUP_ID, "requestforquotation", VERSION_22);
  public static final VESID VID_UBL_22_RETAILEVENT = new VESID (GROUP_ID, "retailevent", VERSION_22);
  public static final VESID VID_UBL_22_SELFBILLEDCREDITNOTE = new VESID (GROUP_ID, "selfbilledcreditnote", VERSION_22);
  public static final VESID VID_UBL_22_SELFBILLEDINVOICE = new VESID (GROUP_ID, "selfbilledinvoice", VERSION_22);
  public static final VESID VID_UBL_22_STATEMENT = new VESID (GROUP_ID, "statement", VERSION_22);
  public static final VESID VID_UBL_22_STOCKAVAILABILITYREPORT = new VESID (GROUP_ID,
                                                                            "stockavailabilityreport",
                                                                            VERSION_22);
  public static final VESID VID_UBL_22_TENDER = new VESID (GROUP_ID, "tender", VERSION_22);
  public static final VESID VID_UBL_22_TENDERCONTRACT = new VESID (GROUP_ID, "tendercontract", VERSION_22);
  public static final VESID VID_UBL_22_TENDERERQUALIFICATION = new VESID (GROUP_ID,
                                                                          "tendererqualification",
                                                                          VERSION_22);
  public static final VESID VID_UBL_22_TENDERERQUALIFICATIONRESPONSE = new VESID (GROUP_ID,
                                                                                  "tendererqualificationresponse",
                                                                                  VERSION_22);
  public static final VESID VID_UBL_22_TENDERRECEIPT = new VESID (GROUP_ID, "tenderreceipt", VERSION_22);
  public static final VESID VID_UBL_22_TENDERSTATUS = new VESID (GROUP_ID, "tenderstatus", VERSION_22);
  public static final VESID VID_UBL_22_TENDERSTATUSREQUEST = new VESID (GROUP_ID, "tenderstatusrequest", VERSION_22);
  public static final VESID VID_UBL_22_TENDERWITHDRAWAL = new VESID (GROUP_ID, "tenderwithdrawal", VERSION_22);
  public static final VESID VID_UBL_22_TRADEITEMLOCATIONPROFILE = new VESID (GROUP_ID,
                                                                             "tradeitemlocationprofile",
                                                                             VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTATIONSTATUS = new VESID (GROUP_ID, "transportationstatus", VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTATIONSTATUSREQUEST = new VESID (GROUP_ID,
                                                                                "transportationstatusrequest",
                                                                                VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTEXECUTIONPLAN = new VESID (GROUP_ID,
                                                                           "transportexecutionplan",
                                                                           VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTEXECUTIONPLANREQUEST = new VESID (GROUP_ID,
                                                                                  "transportexecutionplanrequest",
                                                                                  VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTPROGRESSSTATUS = new VESID (GROUP_ID,
                                                                            "transportprogressstatus",
                                                                            VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTPROGRESSSTATUSREQUEST = new VESID (GROUP_ID,
                                                                                   "transportprogressstatusrequest",
                                                                                   VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTSERVICEDESCRIPTION = new VESID (GROUP_ID,
                                                                                "transportservicedescription",
                                                                                VERSION_22);
  public static final VESID VID_UBL_22_TRANSPORTSERVICEDESCRIPTIONREQUEST = new VESID (GROUP_ID,
                                                                                       "transportservicedescriptionrequest",
                                                                                       VERSION_22);
  public static final VESID VID_UBL_22_UNAWARDEDNOTIFICATION = new VESID (GROUP_ID,
                                                                          "unawardednotification",
                                                                          VERSION_22);
  public static final VESID VID_UBL_22_UNSUBSCRIBEFROMPROCEDUREREQUEST = new VESID (GROUP_ID,
                                                                                    "unsubscribefromprocedurerequest",
                                                                                    VERSION_22);
  public static final VESID VID_UBL_22_UNSUBSCRIBEFROMPROCEDURERESPONSE = new VESID (GROUP_ID,
                                                                                     "unsubscribefromprocedureresponse",
                                                                                     VERSION_22);
  public static final VESID VID_UBL_22_UTILITYSTATEMENT = new VESID (GROUP_ID, "utilitystatement", VERSION_22);
  public static final VESID VID_UBL_22_WAYBILL = new VESID (GROUP_ID, "waybill", VERSION_22);
  public static final VESID VID_UBL_22_WEIGHTSTATEMENT = new VESID (GROUP_ID, "weightstatement", VERSION_22);

  private UBLValidation ()
  {}

  /**
   * Register all standard UBL 2.0 validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initUBL20 (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL20NamespaceContext.getInstance ());

    final boolean bNotDeprecated = false;
    for (final EUBL20DocumentType e : EUBL20DocumentType.values ())
    {
      final String sName = e.getLocalName ();
      final VESID aVESID = new VESID (GROUP_ID, sName.toLowerCase (Locale.US), VERSION_20);

      // No Schematrons here
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                             "UBL " + sName + " " + VERSION_20,
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (e)));
    }
  }

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

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    final boolean bNotDeprecated = false;
    for (final EUBL21DocumentType e : EUBL21DocumentType.values ())
    {
      final String sName = e.getLocalName ();
      final VESID aVESID = new VESID (GROUP_ID, sName.toLowerCase (Locale.US), VERSION_21);

      // No Schematrons here
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                             "UBL " + sName + " " + VERSION_21,
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (e)));
    }
  }

  /**
   * Register all standard UBL 2.2 validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initUBL22 (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL22NamespaceContext.getInstance ());

    final boolean bNotDeprecated = false;
    for (final EUBL22DocumentType e : EUBL22DocumentType.values ())
    {
      final String sName = e.getLocalName ();
      final VESID aVESID = new VESID (GROUP_ID, sName.toLowerCase (Locale.US), VERSION_22);

      // No Schematrons here
      aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (aVESID,
                                                                             "UBL " + sName + " " + VERSION_22,
                                                                             bNotDeprecated,
                                                                             ValidationExecutorXSD.create (e)));
    }
  }

  // public static void main (final String [] args)
  // {
  // for (final EUBL22DocumentType e : EUBL22DocumentType.values ())
  // {
  // final String sName = e.getLocalName ();
  // System.out.println ("public static final VESID VID_UBL_22_" +
  // sName.toUpperCase (Locale.US) +
  // " = new VESID (GROUP_ID, \"" +
  // sName.toLowerCase (Locale.US) +
  // "\", VERSION_22);");
  // }
  // }
}
