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
import com.helger.peppol.validation.artefact.EValidationArtefactType;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.domain.ValidationKey;
import com.helger.peppol.validation.domain.peppol.PeppolValidationKeys;

/**
 * This enum contains the deprecated BII Core rules. With validation package
 * 3.1.0 these rules where deprecated.
 *
 * @author Philip Helger
 */
public enum EBIICoreValidationSchematronArtefact implements IValidationArtefact
{
 CATALOGUE_CORE ("Catalogue/BIICORE-UBL-T19-V1.0.sch", PeppolValidationKeys.CATALOGUE_01_T19),
 ORDER_CORE ("Order/BIICORE-UBL-T01-V1.0.sch", PeppolValidationKeys.ORDER_03_T01),
 INVOICE_CORE ("Invoice/BIICORE-UBL-T10-V1.0.sch", PeppolValidationKeys.INVOICE_04_T10),
 BILLING_CREDIT_NOTE_CORE ("Billing/BIICORE-UBL-T14-V1.0.sch", PeppolValidationKeys.BILLING_05_T14),
 ORDERING_ORDER_CORE ("Ordering/BIICORE-UBL-T01-V1.0.sch", PeppolValidationKeys.ORDERING_28_T01),
 DESPATCH_ADVICE_CORE ("DespatchAdvice/BIICORE-UBL-T16-V1.0.sch", PeppolValidationKeys.DESPATCH_ADVICE_30_T16);

  private final ClassPathResource m_aResource;
  private final ValidationKey m_aValidationKey;

  private EBIICoreValidationSchematronArtefact (@Nonnull @Nonempty final String sPath,
                                                @Nonnull final ValidationKey aTransactionKey)
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
   * correct execution order.
   *
   * @param aValidationKey
   *        The validation to search. May not be <code>null</code>.
   * @return A non-<code>null</code> list with all matching artefacts in the
   *         order they were defined. This list may be empty, if no matching
   *         artefact is present.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static List <EBIICoreValidationSchematronArtefact> getAllMatchingValidationArtefacts (@Nonnull final ValidationKey aValidationKey)
  {
    ValueEnforcer.notNull (aValidationKey, "ValidationKey");

    final List <EBIICoreValidationSchematronArtefact> ret = new ArrayList <EBIICoreValidationSchematronArtefact> ();
    for (final EBIICoreValidationSchematronArtefact e : values ())
      if (e.getValidationKey ().hasSameSpecificationAndTransaction (aValidationKey))
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
    for (final EBIICoreValidationSchematronArtefact e : values ())
      ret.add (e.m_aValidationKey);
    return ret;
  }
}
