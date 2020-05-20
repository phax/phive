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
package com.helger.bdve.oioubl;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.spi.LocationBeautifierSPI;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

/**
 * Generic OIOUBL validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class OIOUBLValidation
{
  private static final String GROUPID = "dk.oioubl";
  private static final String VERSION = "2.0.2";
  public static final VESID VID_OIOUBL_APPLICATION_RESPONSE = new VESID (GROUPID, "application-response", VERSION);
  public static final VESID VID_OIOUBL_CATALOGUE = new VESID (GROUPID, "catalogue", VERSION);
  public static final VESID VID_OIOUBL_CATALOGUE_DELETION = new VESID (GROUPID, "catalogue-deletion", VERSION);
  public static final VESID VID_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE = new VESID (GROUPID,
                                                                                        "catalogue-item-specification-update",
                                                                                        VERSION);
  public static final VESID VID_OIOUBL_CATALOGUE_PRICING_UPDATE = new VESID (GROUPID,
                                                                             "catalogue-pricing-update",
                                                                             VERSION);
  public static final VESID VID_OIOUBL_CATALOGUE_REQUEST = new VESID (GROUPID, "catalogue-request", VERSION);
  public static final VESID VID_OIOUBL_CREDIT_NOTE = new VESID (GROUPID, "credit-note", VERSION);
  public static final VESID VID_OIOUBL_INVOICE = new VESID (GROUPID, "invoice", VERSION);
  public static final VESID VID_OIOUBL_ORDER = new VESID (GROUPID, "order", VERSION);
  public static final VESID VID_OIOUBL_ORDER_CANCELLATION = new VESID (GROUPID, "order-cancellation", VERSION);
  public static final VESID VID_OIOUBL_ORDER_CHANGE = new VESID (GROUPID, "order-change", VERSION);
  public static final VESID VID_OIOUBL_ORDER_RESPONSE = new VESID (GROUPID, "order-response", VERSION);
  public static final VESID VID_OIOUBL_ORDER_RESPONSE_SIMPLE = new VESID (GROUPID, "order-response-simple", VERSION);
  public static final VESID VID_OIOUBL_REMINDER = new VESID (GROUPID, "reminder", VERSION);
  public static final VESID VID_OIOUBL_STATEMENT = new VESID (GROUPID, "statement", VERSION);

  @Nonnull
  private static ClassLoader _getCL ()
  {
    return OIOUBLValidation.class.getClassLoader ();
  }

  private static final IReadableResource OIOUBL_APPLICATION_RESPONSE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_ApplicationResponse_Schematron.xsl",
                                                                                              _getCL ());
  private static final IReadableResource OIOUBL_CATALOGUE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_Catalogue_Schematron.xsl",
                                                                                   _getCL ());
  private static final IReadableResource OIOUBL_CATALOGUE_DELETION = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_CatalogueDeletion_Schematron.xsl",
                                                                                            _getCL ());
  private static final IReadableResource OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_CatalogueItemSpecificationUpdate_Schematron.xsl",
                                                                                                             _getCL ());
  private static final IReadableResource OIOUBL_CATALOGUE_PRICING_UPDATE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_CataloguePricingUpdate_Schematron.xsl",
                                                                                                  _getCL ());
  private static final IReadableResource OIOUBL_CATALOGUE_REQUEST = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_CatalogueRequest_Schematron.xsl",
                                                                                           _getCL ());
  private static final IReadableResource OIOUBL_CREDIT_NOTE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_CreditNote_Schematron.xsl",
                                                                                     _getCL ());
  private static final IReadableResource OIOUBL_INVOICE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_Invoice_Schematron.xsl",
                                                                                 _getCL ());
  private static final IReadableResource OIOUBL_ORDER = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_Order_Schematron.xsl",
                                                                               _getCL ());
  private static final IReadableResource OIOUBL_ORDER_CANCELLATION = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_OrderCancellation_Schematron.xsl",
                                                                                            _getCL ());
  private static final IReadableResource OIOUBL_ORDER_CHANGE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_OrderChange_Schematron.xsl",
                                                                                      _getCL ());
  private static final IReadableResource OIOUBL_ORDER_RESPONSE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_OrderResponse_Schematron.xsl",
                                                                                        _getCL ());
  private static final IReadableResource OIOUBL_ORDER_RESPONSE_SIMPLE = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_OrderResponseSimple_Schematron.xsl",
                                                                                               _getCL ());
  private static final IReadableResource OIOUBL_REMINDER = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_Reminder_Schematron.xsl",
                                                                                  _getCL ());
  private static final IReadableResource OIOUBL_STATEMENT = new ClassPathResource ("/oioubl/2.0.2/OIOUBL_Statement_Schematron.xsl",
                                                                                   _getCL ());

  private OIOUBLValidation ()
  {}

  @Nonnull
  private static IValidationExecutor _createTVR (@Nonnull final IReadableResource aRes)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_OIOUBL,
                                                                     aRes),
                                             null,
                                             UBL21NamespaceContext.getInstance ());
  }

  /**
   * Register all standard OIOUBL validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initOIOUBL (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // For better error messages
    LocationBeautifierSPI.addMappings (UBL21NamespaceContext.getInstance ());

    final boolean bNotDeprecated = false;
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_APPLICATION_RESPONSE,
                                                                           "OIOUBL Application Response " +
                                                                                                            VID_OIOUBL_APPLICATION_RESPONSE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.APPLICATION_RESPONSE),
                                                                           _createTVR (OIOUBL_APPLICATION_RESPONSE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_CATALOGUE,
                                                                           "OIOUBL Catalogue " +
                                                                                                 VID_OIOUBL_CATALOGUE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE),
                                                                           _createTVR (OIOUBL_CATALOGUE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_CATALOGUE_DELETION,
                                                                           "OIOUBL Catalogue Deletion " +
                                                                                                          VID_OIOUBL_CATALOGUE_DELETION.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE_DELETION),
                                                                           _createTVR (OIOUBL_CATALOGUE_DELETION)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE,
                                                                           "OIOUBL Catalogue Item Specification Update " +
                                                                                                                           VID_OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE_ITEM_SPECIFICATION_UPDATE),
                                                                           _createTVR (OIOUBL_CATALOGUE_ITEM_SPECIFICATION_UPDATE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_CATALOGUE_PRICING_UPDATE,
                                                                           "OIOUBL Catalogue Pricing Update " +
                                                                                                                VID_OIOUBL_CATALOGUE_PRICING_UPDATE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE_PRICING_UPDATE),
                                                                           _createTVR (OIOUBL_CATALOGUE_PRICING_UPDATE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_CATALOGUE_REQUEST,
                                                                           "OIOUBL Catalogue Request " +
                                                                                                         VID_OIOUBL_CATALOGUE_REQUEST.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CATALOGUE_REQUEST),
                                                                           _createTVR (OIOUBL_CATALOGUE_REQUEST)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_CREDIT_NOTE,
                                                                           "OIOUBL Credit Note " +
                                                                                                   VID_OIOUBL_CREDIT_NOTE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.CREDIT_NOTE),
                                                                           _createTVR (OIOUBL_CREDIT_NOTE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_INVOICE,
                                                                           "OIOUBL Invoice " +
                                                                                               VID_OIOUBL_INVOICE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.INVOICE),
                                                                           _createTVR (OIOUBL_INVOICE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_ORDER,
                                                                           "OIOUBL Order " +
                                                                                             VID_OIOUBL_ORDER.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER),
                                                                           _createTVR (OIOUBL_ORDER)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_ORDER_CANCELLATION,
                                                                           "OIOUBL Order Cancellation " +
                                                                                                          VID_OIOUBL_ORDER_CANCELLATION.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_CANCELLATION),
                                                                           _createTVR (OIOUBL_ORDER_CANCELLATION)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_ORDER_CHANGE,
                                                                           "OIOUBL Order Change " +
                                                                                                    VID_OIOUBL_ORDER_CHANGE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_CHANGE),
                                                                           _createTVR (OIOUBL_ORDER_CHANGE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_ORDER_RESPONSE,
                                                                           "OIOUBL Order Response " +
                                                                                                      VID_OIOUBL_ORDER_RESPONSE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE),
                                                                           _createTVR (OIOUBL_ORDER_RESPONSE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_ORDER_RESPONSE_SIMPLE,
                                                                           "OIOUBL Order Response Simple " +
                                                                                                             VID_OIOUBL_ORDER_RESPONSE_SIMPLE.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.ORDER_RESPONSE_SIMPLE),
                                                                           _createTVR (OIOUBL_ORDER_RESPONSE_SIMPLE)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_REMINDER,
                                                                           "OIOUBL Reminder " +
                                                                                                VID_OIOUBL_REMINDER.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.REMINDER),
                                                                           _createTVR (OIOUBL_REMINDER)));
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_OIOUBL_STATEMENT,
                                                                           "OIOUBL Statement " +
                                                                                                 VID_OIOUBL_STATEMENT.getVersion (),
                                                                           bNotDeprecated,
                                                                           ValidationExecutorXSD.create (EUBL21DocumentType.STATEMENT),
                                                                           _createTVR (OIOUBL_STATEMENT)));
  }
}
