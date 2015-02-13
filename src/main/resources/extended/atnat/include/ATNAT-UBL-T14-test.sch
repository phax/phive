<?xml version="1.0" encoding="UTF-8"?>
<!--

    Version: MPL 1.1/EUPL 1.1

    The contents of this file are subject to the Mozilla Public License Version
    1.1 (the "License"); you may not use this file except in compliance with
    the License. You may obtain a copy of the License at:
    http://www.mozilla.org/MPL/

    Software distributed under the License is distributed on an "AS IS" basis,
    WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
    for the specific language governing rights and limitations under the
    License.

    The Original Code is Copyright The PEPPOL project (http://www.peppol.eu)

    Alternatively, the contents of this file may be used under the
    terms of the EUPL, Version 1.1 or - as soon they will be approved
    by the European Commission - subsequent versions of the EUPL
    (the "Licence"); You may not use this work except in compliance
    with the Licence.
    You may obtain a copy of the Licence at:
    http://joinup.ec.europa.eu/software/page/eupl/licence-eupl

    Unless required by applicable law or agreed to in writing, software
    distributed under the Licence is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the Licence for the specific language governing permissions and
    limitations under the Licence.

    If you wish to allow use of your version of this file only
    under the terms of the EUPL License and not to allow others to use
    your version of this file under the MPL, indicate your decision by
    deleting the provisions above and replace them with the notice and
    other provisions required by the EUPL License. If you do not delete
    the provisions above, a recipient may use your version of this file
    under either the MPL or the EUPL License.

-->
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron tests for binding UBL and transaction T14-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T14" id="UBL-T14">
  <param name="ATNAT-T14-R001" value="((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 10000 and cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not ((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 10000)" />
  <param name="ATNAT-T14-R002" value="((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:TaxScheme/cbc:ID = 'VAT') and (number(cbc:Percent) = 0) and (cbc:ID = 'E') or (cbc:ID = 'AE')) or not ((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:TaxScheme/cbc:ID = 'VAT') and (number(cbc:Percent) = 0))" />
  <param name="ATNAT-T14-R003" value="((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:Delivery/cbc:ActualDeliveryDate) or (cac:InvoicePeriod/cbc:StartDate and cac:InvoicePeriod/cbc:EndDate)) or not ((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATNAT-T14-R004" value="((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (//cac:TaxCategory/cbc:ID = 'AE') and cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not ((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (//cac:TaxCategory/cbc:ID = 'AE'))" />
  <param name="ATNAT-T14-R005" value="((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 400 and cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not ((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 400)" />
  <param name="ATNAT-T14-R006" value="((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:TaxScheme/cbc:ID = 'VAT') and (cbc:ID = 'AE') and number(../cbc:TaxAmount) = 0) or not ((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:TaxScheme/cbc:ID = 'VAT') and (cbc:ID = 'AE'))" />
  <param name="ATNAT-T14-R007" value="((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:TaxCategory) and (cac:TaxCategory/cbc:Percent)) or not ((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="CreditNote" value="/ubl:CreditNote" />
  <param name="Tax_Category" value="//cac:TaxCategory" />
  <param name="AllowanceCharge" value="/ubl:CreditNote/cac:AllowanceCharge" />
</pattern>
