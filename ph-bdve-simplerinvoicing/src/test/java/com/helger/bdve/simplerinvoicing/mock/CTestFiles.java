/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.simplerinvoicing.mock;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.simplerinvoicing.SimplerInvoicingValidation;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

@Immutable
@SuppressWarnings ("deprecation")
public final class CTestFiles
{
  public static final ValidationExecutorSetRegistry VES_REGISTRY = new ValidationExecutorSetRegistry ();
  static
  {
    SimplerInvoicingValidation.initSimplerInvoicing (VES_REGISTRY);
  }

  private CTestFiles ()
  {}

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <MockFile> getAllTestFiles ()
  {
    final ICommonsList <MockFile> ret = new CommonsArrayList <> ();
    for (final VESID aVESID : new VESID [] { SimplerInvoicingValidation.VID_SI_INVOICE_V10,
                                             SimplerInvoicingValidation.VID_SI_INVOICE_V11,
                                             SimplerInvoicingValidation.VID_SI_INVOICE_V12,
                                             SimplerInvoicingValidation.VID_SI_ORDER_V12,
                                             SimplerInvoicingValidation.VID_SI_INVOICE_V20,
                                             SimplerInvoicingValidation.VID_SI_CREDIT_NOTE_V20,
                                             SimplerInvoicingValidation.VID_SI_INVOICE_V202,
                                             SimplerInvoicingValidation.VID_SI_CREDIT_NOTE_V202 })
      for (final IReadableResource aRes : getAllMatchingTestFiles (aVESID))
        ret.add (MockFile.createGoodCase (aRes, aVESID));

    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public static ICommonsList <? extends IReadableResource> getAllMatchingTestFiles (@Nonnull final VESID aVESID)
  {
    ValueEnforcer.notNull (aVESID, "VESID");

    final String sPath10 = "/test-files/simplerinvoicing/SI-UBL-1.0/";
    final String sPath11 = "/test-files/simplerinvoicing/SI-UBL-1.1/";
    final String sPath12 = "/test-files/simplerinvoicing/SI-UBL-1.2/";
    final String sPath200 = "/test-files/simplerinvoicing/SI-UBL-2.0/";
    final String sPath202 = "/test-files/simplerinvoicing/SI-UBL-2.0.2/";

    final ICommonsList <IReadableResource> ret = new CommonsArrayList <> ();
    if (aVESID.equals (SimplerInvoicingValidation.VID_SI_INVOICE_V10))
    {
      final String sPath = sPath10;
      ret.add (new ClassPathResource (sPath + "SI-UBL-1.0-ok-minimal.xml"));
      ret.add (new ClassPathResource (sPath + "SI-UBL-1.0-ok-reference.xml"));
      ret.add (new ClassPathResource (sPath + "SI-UBL-1.0-ok.xml"));
    }
    else
      if (aVESID.equals (SimplerInvoicingValidation.VID_SI_INVOICE_V11))
      {
        final String sPath = sPath11;
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-BII2-T10-R034.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-BII2-T10-R035.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-BII2-T10-R037.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-BII2-T10-R045.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-BII2-T10-R046.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-EUGEN-T10-R026.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-EUGEN-T10-R030.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-EUGEN-T10-R035.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-EUGEN-T10-R036.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-EUGEN-T10-R037.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-EUGEN-T10-R038.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-extension.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-full-multiple-currencies.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-full-single-currency.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-full-tax-currency.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-full-tax-subcategory.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-full.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-minimal-corrective.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-minimal.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-reference.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-rounding-vat-1.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-single-item.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-taxes-ae.xml"));
        ret.add (new ClassPathResource (sPath + "SI-UBL-1.1-ok-taxes.xml"));
      }
      else
        if (aVESID.equals (SimplerInvoicingValidation.VID_SI_INVOICE_V12))
        {
          final String sPath = sPath12;
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-BII2-T10-R034.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-BII2-T10-R035.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-BII2-T10-R037.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-BII2-T10-R045.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-BII2-T10-R046.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-EUGEN-T10-R026.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-EUGEN-T10-R030.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-EUGEN-T10-R035.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-EUGEN-T10-R036.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-EUGEN-T10-R037.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-EUGEN-T10-R038.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-extension.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-full-multiple-currencies.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-full-single-currency.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-full-tax-currency.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-full-tax-subcategory.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-full.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-minimal-corrective.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-minimal.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-reference.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-rounding-vat-1.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-si-extension-1.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-si-extension-2.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-si-extension-3.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-si-extension.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-single-item.xml"));
          ret.add (new ClassPathResource (sPath + "SI-UBL-INV-1.2-ok-taxes-ae.xml"));
        }
        else
          if (aVESID.equals (SimplerInvoicingValidation.VID_SI_ORDER_V12))
          {
            final String sPath = sPath12;
            ret.add (new ClassPathResource (sPath + "SI-UBL-PO-1.2-ok-minimal.xml"));
          }
          else
            if (aVESID.equals (SimplerInvoicingValidation.VID_SI_INVOICE_V20))
            {
              final String sPath = sPath200;
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_both_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_customer_not_nl.xml"));
              if (false)
                ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_customer_no_companyid.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_supplier_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-11_ok_negative_payment.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-11_ok_no_payment.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-12_ok.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-1_ok_supplier_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-1_ok_supplier_oin.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-2_ok_supplier_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-31_ok_notsepa.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-3_ok_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-4_ok_customer_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-4_ok_supplier_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-5_ok.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-5_ok_supplier_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-5_ok_taxpart_not_nl.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-7_ok_384.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-7_ok_389.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-9_ok.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_additionaldocumentreference.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_allowance.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_allowance_line.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_base.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_charge.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_charge_line.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_full.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_quantities_linevalues_wrong.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_quantities.xml"));
              ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_unitcode.xml"));
            }
            else
              if (aVESID.equals (SimplerInvoicingValidation.VID_SI_CREDIT_NOTE_V20))
              {
                final String sPath = sPath200;
                ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-8_ok_381.xml"));
              }
              else
                if (aVESID.equals (SimplerInvoicingValidation.VID_SI_INVOICE_V202))
                {
                  final String sPath = sPath202;
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_both_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_customer_not_nl.xml"));
                  if (false)
                    ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_customer_no_companyid.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-10_ok_supplier_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-11_ok_negative_payment.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-11_ok_no_payment.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-12_ok.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-1_ok_supplier_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-1_ok_supplier_oin.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-2_ok_supplier_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-31_ok_notsepa.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-3_ok_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-4_ok_customer_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-4_ok_supplier_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-5_ok.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-5_ok_supplier_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-5_ok_taxpart_not_nl.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-7_ok_384.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-7_ok_389.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-9_ok.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_additionaldocumentreference.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_allowance.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_allowance_line.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_base.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_charge.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_charge_line.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_full.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_quantities_linevalues_wrong.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_quantities.xml"));
                  ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_ok_unitcode.xml"));
                }
                else
                  if (aVESID.equals (SimplerInvoicingValidation.VID_SI_CREDIT_NOTE_V202))
                  {
                    final String sPath = sPath202;
                    ret.add (new ClassPathResource (sPath + "SI-UBL-2.0_BR-NL-8_ok_381.xml"));
                  }
                  else
                    throw new IllegalArgumentException ("Invalid VESID: " + aVESID);
    return ret;
  }
}
