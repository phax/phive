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
<!--Abstract Schematron rules for T14-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T14">
  <rule context="$CreditNote">
    <assert flag="fatal" test="$ATGOV-T14-R002">[ATGOV-T14-R002]-A maximum number of 999 invoice lines must be present.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R003">[ATGOV-T14-R003]-The order number or buyer group must be present.</assert>
    <assert flag="warning" test="$ATGOV-T14-R005">[ATGOV-T14-R005]-Exactly 1 beneficiary account may be present.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R009">[ATGOV-T14-R009]-At last 2 cashbacks may be present.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R013">[ATGOV-T14-R013]-A maximum of 200 attachments are allowed within a single document.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R014">[ATGOV-T14-R014]-The maximum size of all attachments after Base64 decoding must not exceed 15 Megabytes.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R016">[ATGOV-T14-R016]-The payable amount of an invoice must be smaller or equal than 999999999.99.</assert>
  </rule>
  <rule context="$Supplier">
    <assert flag="fatal" test="$ATGOV-T14-R001">[ATGOV-T14-R001]-The email address of the biller is mandatory.</assert>
  </rule>
  <rule context="$CreditNoteLine">
    <assert flag="fatal" test="$ATGOV-T14-R008">[ATGOV-T14-R008]-The order position number (per line item) must be present when the OrderID is a PO number (10 digit numeric).</assert>
    <assert flag="fatal" test="$ATGOV-T14-R015">[ATGOV-T14-R015]-The gross amount of a single invoice line must be greater or equal than -999999999999.99 and smaller or equal than 999999999999.99.</assert>
  </rule>
  <rule context="$Attachments">
    <assert flag="fatal" test="$ATGOV-T14-R011">[ATGOV-T14-R011]-Attachments to the invoice must be included into the invoice document and may not be referenced from external sources.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R012">[ATGOV-T14-R012]-Attachments included within the invoice must be of one of the following file formats: XLS (application/vnd.ms-excel), XLSX (application/vnd.openxmlformats-officedocument.spreadsheetml.sheet), PDF (application/pdf), PNG (image/png) or XML (application/xml or text/xml).</assert>
  </rule>
  <rule context="$Payment_Means">
    <assert flag="fatal" test="$ATGOV-T14-R007">[ATGOV-T14-R007]-Only valid BICs and IBANs are allowed as beneficiary account information.</assert>
  </rule>
  <rule context="$Payment_Terms">
    <assert flag="warning" test="$ATGOV-T14-R004">[ATGOV-T14-R004]-A credit note should not specify only textual payment terms.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R010">[ATGOV-T14-R010]-The percentage of a cashback item must be greater 0 and lower than 100.</assert>
  </rule>
</pattern>
