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
package com.helger.bdve.en16931;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.spec.BusinessSpecification;
import com.helger.bdve.spec.BusinessSpecificationRegistry;
import com.helger.bdve.spec.IBusinessSpecification;
import com.helger.bdve.spec.SpecificationTransaction;
import com.helger.cii.d16b.CIID16BNamespaceContext;
import com.helger.cii.d16b.ECIID16BDocumentType;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.jaxb.builder.JAXBDocumentType;
import com.helger.ubl21.EUBL21DocumentType;
import com.helger.ubl21.UBL21NamespaceContext;

import eu.cen.en16931.edifact.invoicd14b.iso20625.MINVOIC;

/**
 * CEN/TC 434 - EN 16931 validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CEN19631
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

  public static final IBusinessSpecification EN16931 = _createBusinessSpec ("eu.cen", "en16931", "EN 16931");

  // Predefined keys for UBL, CII and EDIFACT
  public static final ValidationArtefactKey VK_INVOICE_CII = new ValidationArtefactKey.Builder ().setBusinessSpecification (EN16931)
                                                                                                 .setTransaction (new SpecificationTransaction ("cii",
                                                                                                                                                "CII Invoice",
                                                                                                                                                ECIID16BDocumentType.CROSS_INDUSTRY_INVOICE,
                                                                                                                                                CIID16BNamespaceContext.getInstance ()))
                                                                                                 .build ();
  public static final ValidationArtefactKey VK_INVOICE_EDIFACT = new ValidationArtefactKey.Builder ().setBusinessSpecification (EN16931)
                                                                                                     .setTransaction (new SpecificationTransaction ("edifact",
                                                                                                                                                    "EDIFACT/ISO 20625 Invoice",
                                                                                                                                                    new JAXBDocumentType (MINVOIC.class,
                                                                                                                                                                          new CommonsArrayList <> ("/schemas/INVOIC_D14B_ISO20625.xsd"),
                                                                                                                                                                          x -> x),
                                                                                                                                                    CIID16BNamespaceContext.getInstance ()))
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_INVOICE_UBL = new ValidationArtefactKey.Builder ().setBusinessSpecification (EN16931)
                                                                                                 .setTransaction (new SpecificationTransaction ("ubl",
                                                                                                                                                "UBL Invoice",
                                                                                                                                                EUBL21DocumentType.INVOICE,
                                                                                                                                                UBL21NamespaceContext.getInstance ()))
                                                                                                 .build ();

  public static final IReadableResource INVOICE_CII_SCH = new ClassPathResource ("/en16931/cii/schematron/EN16931-CII-validation.sch");
  public static final IReadableResource INVOICE_CII_XSLT = new ClassPathResource ("/en16931/cii/schematron/EN16931-CII-validation.xslt");
  public static final IReadableResource INVOICE_EDIFACT_SCH = new ClassPathResource ("/en16931/edifact/schematron/EN16931-EDIFACT-validation.sch");
  public static final IReadableResource INVOICE_EDIFACT_XSLT = new ClassPathResource ("/en16931/edifact/stylesheet/EN16931-EDIFACT-validation-compiled.xsl");
  public static final IReadableResource INVOICE_UBL = new ClassPathResource ("/en16931/ubl/schematron/EN16931-UBL-validation.sch");

  private CEN19631 ()
  {}
}
