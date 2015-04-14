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
  <param name="ATGOV-T14-R001" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:Contact/cbc:ElectronicMail)) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R002" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and count(cac:CreditNoteLine) &lt; 999) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R003" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:OrderReference/cbc:ID)) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R004" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cbc:Note) and cbc:SettlementDiscountPercent and cac:SettlementPeriod) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cbc:Note))" />
  <param name="ATGOV-T14-R005" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and count(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID) = 1) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R006" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cbc:AccountingCost)) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R007" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and cbc:PaymentMeansCode = '31' and  (cac:PayeeFinancialAccount/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and  (cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID = 'BIC')) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R008" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (string(number(//cac:OrderReference/cbc:ID)) != 'NaN') and (cac:OrderReferenceLine/cbc:LineID)) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (string(number(//cac:OrderReference/cbc:ID)) != 'NaN'))" />
  <param name="ATGOV-T14-R009" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and count(cac:PaymentTerms/cac:SettlementPeriod) &lt;= 2) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R010" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cbc:SettlementDiscountPercent) and number(cbc:SettlementDiscountPercent) > 0 and number(cbc:SettlementDiscountPercent) &lt; 100) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cbc:SettlementDiscountPercent))" />
  <param name="ATGOV-T14-R011" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and count(cac:Attachment/cac:ExternalReference) = 0) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R012" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:Attachment/cbc:EmbeddedDocumentBinaryObject) and cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.ms-excel' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/pdf' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'image/png' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/xml' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'text/xml') or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (cac:Attachment/cbc:EmbeddedDocumentBinaryObject))" />
  <param name="ATGOV-T14-R013" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and count(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject) &lt;= 200) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R014" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and string-length(string-join(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/text(),'')) * 3 div 4 &lt;= 15728640) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R015" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and (number(cbc:LineExtensionAmount) >= -999999999999.99 and number(cbc:LineExtensionAmount) &lt;= 999999999999.99)) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R016" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and number(cac:LegalMonetaryTotal/cbc:PayableAmount) &lt;= 999999999.99) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="ATGOV-T14-R017" value="((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT') and count(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID) >= 1) or not ((//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'))" />
  <param name="CreditNote" value="/ubl:CreditNote" />
  <param name="Payment_Means" value="/ubl:CreditNote/cac:PaymentMeans" />
  <param name="Supplier" value="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party" />
  <param name="CreditNoteLine" value="/ubl:CreditNote/cac:CreditNoteLine" />
  <param name="Payment_Terms" value="/ubl:CreditNote/cac:PaymentTerms" />
  <param name="Attachments" value="/ubl:CreditNote/cac:AdditionalDocumentReference" />
</pattern>
