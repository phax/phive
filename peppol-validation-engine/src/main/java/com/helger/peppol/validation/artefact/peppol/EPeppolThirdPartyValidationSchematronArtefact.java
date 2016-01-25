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
package com.helger.peppol.validation.artefact.peppol;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.peppol.validation.api.ValidationKey;
import com.helger.peppol.validation.api.artefact.EValidationArtefactType;
import com.helger.peppol.validation.api.artefact.IValidationArtefact;
import com.helger.peppol.validation.domain.peppol.PeppolValidationKeys;

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
                 new ValidationKey.Builder (PeppolValidationKeys.INVOICE_04_T10).setCountry ("AT")
                                                                                .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                .build ()),
 INVOICE_AT_GOV ("Invoice-Thirdparty/ATGOV-UBL-T10.sch",
                 new ValidationKey.Builder (PeppolValidationKeys.INVOICE_04_T10).setCountry ("AT")
                                                                                .setSectorKey (PeppolValidationKeys.SECTOR_AT_GOV)
                                                                                .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                .build ()),

 BILLING_CREDIT_NOTE_AT_NAT ("Billing-Thirdparty/ATNAT-UBL-T14.sch",
                             new ValidationKey.Builder (PeppolValidationKeys.BILLING_05_T14).setCountry ("AT")
                                                                                            .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                            .build ()),
 BILLING_CREDIT_NOTE_AT_GOV ("Billing-Thirdparty/ATGOV-UBL-T14.sch",
                             new ValidationKey.Builder (PeppolValidationKeys.BILLING_05_T14).setCountry ("AT")
                                                                                            .setSectorKey (PeppolValidationKeys.SECTOR_AT_GOV)
                                                                                            .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                            .build ());

  private final ClassPathResource m_aResource;
  private final ValidationKey m_aValidationKey;

  private EPeppolThirdPartyValidationSchematronArtefact (@Nonnull @Nonempty final String sPath, @Nonnull final ValidationKey aTransactionKey)
  {
    m_aResource = new ClassPathResource ("/peppol-rules/" + sPath);
    m_aValidationKey = aTransactionKey;
  }

  @Nonnull
  public EValidationArtefactType getValidationArtefactType ()
  {
    return EValidationArtefactType.SCHEMATRON;
  }

  @Nonnull
  public IReadableResource getRuleResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public ValidationKey getValidationKey ()
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
  public static List <EPeppolThirdPartyValidationSchematronArtefact> getAllMatchingValidationArtefacts (@Nonnull final ValidationKey aValidationKey)
  {
    ValueEnforcer.notNull (aValidationKey, "ValidationKey");

    final List <EPeppolThirdPartyValidationSchematronArtefact> ret = new ArrayList <EPeppolThirdPartyValidationSchematronArtefact> ();
    for (final EPeppolThirdPartyValidationSchematronArtefact e : values ())
      if (e.m_aValidationKey.hasSameSpecificationAndTransactionAndCountryAndSector (aValidationKey))
        ret.add (e);
    return ret;
  }

  /**
   * @return An ordered set of all contained validation keys. Never
   *         <code>null</code>.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static Set <ValidationKey> getAllValidationKeys ()
  {
    final Set <ValidationKey> ret = new LinkedHashSet <ValidationKey> ();
    for (final EPeppolThirdPartyValidationSchematronArtefact e : values ())
      ret.add (e.m_aValidationKey);
    return ret;
  }
}
