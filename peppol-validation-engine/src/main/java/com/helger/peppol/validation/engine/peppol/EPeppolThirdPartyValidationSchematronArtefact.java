/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.engine.peppol;

import javax.annotation.Nonnull;

import com.helger.bdve.EValidationType;
import com.helger.bdve.ValidationArtefactKey;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.collection.ext.ICommonsOrderedSet;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * This enumeration contains all the extended country specific OpenPEPPOL
 * Schematron artefacts I'm aware of. They are ordered ascending country, than
 * by BIS number, by transaction and finally by desired execution order.
 *
 * @author Philip Helger
 */
public enum EPeppolThirdPartyValidationSchematronArtefact implements IValidationArtefact
{
  INVOICE_AT_NAT ("Invoice-Thirdparty/ATNAT-UBL-T10.sch",
                  new ValidationArtefactKey.Builder (CPeppolValidation.INVOICE_04_T10).setCountry ("AT")
                                                                                      .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                      .build ()),
  INVOICE_AT_GOV ("Invoice-Thirdparty/ATGOV-UBL-T10.sch",
                  new ValidationArtefactKey.Builder (CPeppolValidation.INVOICE_04_T10).setCountry ("AT")
                                                                                      .setSectorKey (CPeppolValidation.SECTOR_AT_GOV)
                                                                                      .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                      .build ()),

  BILLING_CREDIT_NOTE_AT_NAT ("Billing-Thirdparty/ATNAT-UBL-T14.sch",
                              new ValidationArtefactKey.Builder (CPeppolValidation.BILLING_05_T14).setCountry ("AT")
                                                                                                  .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                                  .build ()),
  BILLING_CREDIT_NOTE_AT_GOV ("Billing-Thirdparty/ATGOV-UBL-T14.sch",
                              new ValidationArtefactKey.Builder (CPeppolValidation.BILLING_05_T14).setCountry ("AT")
                                                                                                  .setSectorKey (CPeppolValidation.SECTOR_AT_GOV)
                                                                                                  .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                                  .build ());

  private final ClassPathResource m_aResource;
  private final ValidationArtefactKey m_aValidationKey;

  private EPeppolThirdPartyValidationSchematronArtefact (@Nonnull @Nonempty final String sPath,
                                                         @Nonnull final ValidationArtefactKey aTransactionKey)
  {
    m_aResource = new ClassPathResource ("/peppol-rules/" + sPath);
    m_aValidationKey = aTransactionKey;
  }

  @Nonnull
  public EValidationType getValidationArtefactType ()
  {
    return EValidationType.SCHEMATRON;
  }

  @Nonnull
  public IReadableResource getRuleResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public ValidationArtefactKey getValidationKey ()
  {
    return m_aValidationKey;
  }

  /**
   * Get all validation artefacts matching the passed validation key in the
   * correct execution order. It matches business specification, transaction,
   * country and sector?.
   *
   * @param aValidationKey
   *        The validation to search. May not be <code>null</code>.
   * @return A non-<code>null</code> list with all matching artefacts in the
   *         order they were defined. This list may be empty, if no matching
   *         artefact is present.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <IValidationExecutor> getAllMatchingValidationArtefacts (@Nonnull final ValidationArtefactKey aValidationKey)
  {
    ValueEnforcer.notNull (aValidationKey, "ValidationKey");

    final ICommonsList <IValidationExecutor> ret = new CommonsArrayList<> ();
    ArrayHelper.forEach (EPeppolThirdPartyValidationSchematronArtefact.values (),
                         x -> x.m_aValidationKey.hasSameSpecificationAndTransactionAndCountryAndSector (aValidationKey),
                         x -> ret.add (new ValidationExecutorSchematron (x)));
    return ret;
  }

  /**
   * @return An ordered set of all contained validation keys. Never
   *         <code>null</code>.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsOrderedSet <ValidationArtefactKey> getAllValidationKeys ()
  {
    return CollectionHelper.newOrderedSetMapped (values (), x -> x.m_aValidationKey);
  }
}
