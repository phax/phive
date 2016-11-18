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
package com.helger.peppol.validation.engine.peppol;

import javax.annotation.Nonnull;

import com.helger.bdve.EValidationType;
import com.helger.bdve.ValidationArtefactKey;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.CommonsLinkedHashSet;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.collection.ext.ICommonsOrderedSet;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * This enumeration contains all the default OpenPEPPOL Schematron artefacts.
 * They are ordered ascending by BIS number, second by transaction and third by
 * desired execution order.
 *
 * @author Philip Helger
 */
public enum EPeppolStandardValidationSchematronArtefact implements IValidationArtefact
{
  CATALOGUE_RULES ("Catalogue/BIIRULES-UBL-T19.sch", PeppolValidationKeys.CATALOGUE_01_T19),
  CATALOGUE_OPENPEPPOL ("Catalogue/OPENPEPPOL-UBL-T19.sch", PeppolValidationKeys.CATALOGUE_01_T19),

  CATALOGUE_RESPONSE_RULES ("Catalogue/BIIRULES-UBL-T58.sch", PeppolValidationKeys.CATALOGUE_01_T58),
  CATALOGUE_RESPONSE_OPENPEPPOL ("Catalogue/OPENPEPPOL-UBL-T58.sch", PeppolValidationKeys.CATALOGUE_01_T58),

  ORDER_RULES ("Order/BIIRULES-UBL-T01.sch", PeppolValidationKeys.ORDER_03_T01),
  ORDER_OPENPEPPOL ("Order/OPENPEPPOL-UBL-T01.sch", PeppolValidationKeys.ORDER_03_T01),

  INVOICE_RULES ("Invoice/BIIRULES-UBL-T10.sch", PeppolValidationKeys.INVOICE_04_T10),
  INVOICE_OPENPEPPOL ("Invoice/OPENPEPPOL-UBL-T10.sch", PeppolValidationKeys.INVOICE_04_T10),

  BILLING_CREDIT_NOTE_RULES ("Billing/BIIRULES-UBL-T14.sch", PeppolValidationKeys.BILLING_05_T14),
  BILLING_CREDIT_NOTE_OPENPEPPOL ("Billing/OPENPEPPOL-UBL-T14.sch", PeppolValidationKeys.BILLING_05_T14),

  ORDERING_ORDER_RULES ("Ordering/BIIRULES-UBL-T01.sch", PeppolValidationKeys.ORDERING_28_T01),
  ORDERING_ORDER_OPENPEPPOL ("Ordering/OPENPEPPOL-UBL-T01.sch", PeppolValidationKeys.ORDERING_28_T01),

  ORDERING_ORDER_RESPONSE_RULES ("Ordering/BIIRULES-UBL-T76.sch", PeppolValidationKeys.ORDERING_28_T76),
  ORDERING_ORDER_RESPONSE_OPENPEPPOL ("Ordering/OPENPEPPOL-UBL-T76.sch", PeppolValidationKeys.ORDERING_28_T76),

  DESPATCH_ADVICE_RULES ("DespatchAdvice/BIIRULES-UBL-T16.sch", PeppolValidationKeys.DESPATCH_ADVICE_30_T16),
  DESPATCH_ADVICE_OPENPEPPOL ("DespatchAdvice/OPENPEPPOL-UBL-T16.sch", PeppolValidationKeys.DESPATCH_ADVICE_30_T16),

  MLR_RULES ("MLR/BIIRULES-UBL-T71.sch", PeppolValidationKeys.MLR_36_T71),
  MLR_OPENPEPPOL ("MLR/OPENPEPPOL-UBL-T71.sch", PeppolValidationKeys.MLR_36_T71);

  private final ClassPathResource m_aResource;
  private final ValidationArtefactKey m_aValidationKey;

  private EPeppolStandardValidationSchematronArtefact (@Nonnull @Nonempty final String sPath,
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
  public static ICommonsList <IValidationExecutor> getAllMatchingValidationArtefacts (@Nonnull final ValidationArtefactKey aValidationKey)
  {
    ValueEnforcer.notNull (aValidationKey, "ValidationKey");

    final ICommonsList <IValidationExecutor> ret = new CommonsArrayList<> ();
    // Add all XSDs and Schematrons
    ArrayHelper.forEach (EPeppolStandardValidationSchematronArtefact.values (),
                         x -> x.m_aValidationKey.hasSameSpecificationAndTransaction (aValidationKey),
                         x -> {
                           // Add XSDs only from one artefact
                           if (ret.isEmpty ())
                           {
                             for (final IReadableResource aXSDRes : x.m_aValidationKey.getTransaction ()
                                                                                      .getJAXBDocumentType ()
                                                                                      .getAllXSDResources ())
                               ret.add (new ValidationExecutorXSD (ValidationArtefact.createXSD (aXSDRes,
                                                                                                 aValidationKey)));
                           }
                           ret.add (new ValidationExecutorSchematron (x));
                         });
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
    final ICommonsOrderedSet <ValidationArtefactKey> ret = new CommonsLinkedHashSet<> ();
    ret.addAllMapped (values (), x -> x.m_aValidationKey);
    return ret;
  }
}
