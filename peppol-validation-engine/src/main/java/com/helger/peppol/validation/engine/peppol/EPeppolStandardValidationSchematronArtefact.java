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
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
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
 * This enumeration contains all the default OpenPEPPOL Schematron artefacts.
 * They are ordered ascending by BIS number, second by transaction and third by
 * desired execution order.
 *
 * @author Philip Helger
 */
public enum EPeppolStandardValidationSchematronArtefact implements IPeppolValidationArtefact
{
  CATALOGUE_RULES (CATALOGUE + BII_RULES + "BIIRULES-UBL-T19.sch", CPeppolValidation.CATALOGUE_01_T19),
  CATALOGUE_OPENPEPPOL (CATALOGUE + OPENPEPPOL + "OPENPEPPOL-UBL-T19.sch", CPeppolValidation.CATALOGUE_01_T19),
  CATALOGUE_OPENPEPPOL_CORE (CATALOGUE +
                             OPENPEPPOL_CORE +
                             "OPENPEPPOLCORE-UBL-T19.sch",
                             CPeppolValidation.CATALOGUE_01_T19),

  CATALOGUE_RESPONSE_RULES (CATALOGUE_RESPONSE +
                            BII_RULES +
                            "BIIRULES-UBL-T58.sch",
                            CPeppolValidation.CATALOGUE_01_T58),
  CATALOGUE_RESPONSE_OPENPEPPOL (CATALOGUE_RESPONSE +
                                 OPENPEPPOL +
                                 "OPENPEPPOL-UBL-T58.sch",
                                 CPeppolValidation.CATALOGUE_01_T58),
  CATALOGUE_RESPONSE_OPENPEPPOL_CORE (CATALOGUE_RESPONSE +
                                      OPENPEPPOL_CORE +
                                      "OPENPEPPOLCORE-UBL-T58.sch",
                                      CPeppolValidation.CATALOGUE_01_T58),

  ORDER_RULES (ORDER + BII_RULES + "BIIRULES-UBL-T01.sch", CPeppolValidation.ORDER_03_T01),
  ORDER_OPENPEPPOL (ORDER + OPENPEPPOL + "OPENPEPPOL-UBL-T01.sch", CPeppolValidation.ORDER_03_T01),
  ORDER_OPENPEPPOL_CORE (ORDER + OPENPEPPOL_CORE + "OPENPEPPOLCORE-UBL-T01.sch", CPeppolValidation.ORDER_03_T01),

  @Deprecated
  ORDERING_ORDER_RULES (ORDER + BII_RULES + "BIIRULES-UBL-T01.sch", CPeppolValidation.ORDERING_28_T01),
  @Deprecated
  ORDERING_ORDER_OPENPEPPOL (ORDER + OPENPEPPOL + "OPENPEPPOL-UBL-T01.sch", CPeppolValidation.ORDERING_28_T01),
  @Deprecated
  ORDERING_ORDER_OPENPEPPOL_CORE (ORDER + OPENPEPPOL_CORE + "OPENPEPPOLCORE-UBL-T01.sch", CPeppolValidation.ORDERING_28_T01),

  ORDER_RESPONSE_RULES (ORDER_RESPONSE + BII_RULES + "BIIRULES-UBL-T76.sch", CPeppolValidation.ORDERING_28_T76),
  ORDER_RESPONSE_OPENPEPPOL (ORDER_RESPONSE + OPENPEPPOL + "OPENPEPPOL-UBL-T76.sch", CPeppolValidation.ORDERING_28_T76),
  ORDER_RESPONSE_OPENPEPPOL_CORE (ORDER_RESPONSE +
                                  OPENPEPPOL_CORE +
                                  "OPENPEPPOLCORE-UBL-T76.sch",
                                  CPeppolValidation.ORDERING_28_T76),

  DESPATCH_ADVICE_RULES (DESPATCH_ADVICE +
                         BII_RULES +
                         "BIIRULES-UBL-T16.sch",
                         CPeppolValidation.DESPATCH_ADVICE_30_T16),
  DESPATCH_ADVICE_OPENPEPPOL (DESPATCH_ADVICE +
                              OPENPEPPOL +
                              "OPENPEPPOL-UBL-T16.sch",
                              CPeppolValidation.DESPATCH_ADVICE_30_T16),
  DESPATCH_ADVICE_OPENPEPPOL_CORE (DESPATCH_ADVICE +
                                   OPENPEPPOL_CORE +
                                   "OPENPEPPOLCORE-UBL-T16.sch",
                                   CPeppolValidation.DESPATCH_ADVICE_30_T16),

  INVOICE_RULES (INVOICE + BII_RULES + "BIIRULES-UBL-T10.sch", CPeppolValidation.INVOICE_04_T10),
  INVOICE_OPENPEPPOL (INVOICE + OPENPEPPOL + "OPENPEPPOL-UBL-T10.sch", CPeppolValidation.INVOICE_04_T10),
  INVOICE_OPENPEPPOL_CORE (INVOICE + OPENPEPPOL_CORE + "OPENPEPPOLCORE-UBL-T10.sch", CPeppolValidation.INVOICE_04_T10),

  CREDIT_NOTE_RULES (CREDIT_NOTE + BII_RULES + "BIIRULES-UBL-T14.sch", CPeppolValidation.BILLING_05_T14),
  CREDIT_NOTE_OPENPEPPOL (CREDIT_NOTE + OPENPEPPOL + "OPENPEPPOL-UBL-T14.sch", CPeppolValidation.BILLING_05_T14),
  CREDIT_NOTE_OPENPEPPOL_CORE (CREDIT_NOTE +
                               OPENPEPPOL_CORE +
                               "OPENPEPPOLCORE-UBL-T14.sch",
                               CPeppolValidation.BILLING_05_T14),

  MLR_RULES (MLR + BII_RULES + "BIIRULES-UBL-T71.sch", CPeppolValidation.MLR_36_T71),
  MLR_OPENPEPPOL (MLR + OPENPEPPOL + "OPENPEPPOL-UBL-T71.sch", CPeppolValidation.MLR_36_T71),
  MLR_OPENPEPPOL_CORE (MLR + OPENPEPPOL_CORE + "OPENPEPPOLCORE-UBL-T71.sch", CPeppolValidation.MLR_36_T71);

  private final ClassPathResource m_aResource;
  private final ValidationArtefactKey m_aValidationKey;

  private EPeppolStandardValidationSchematronArtefact (@Nonnull @Nonempty final String sPath,
                                                       @Nonnull final ValidationArtefactKey aTransactionKey)
  {
    m_aResource = new ClassPathResource (sPath);
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
    return CollectionHelper.newOrderedSetMapped (values (), x -> x.m_aValidationKey);
  }
}
