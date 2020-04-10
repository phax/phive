<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!
Abstract Schematron rules for T14-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T14">
  <rule context="$Attachments">
    <assert flag="fatal" test="$ATGOV-T14-R012" id="ATGOV-T14-R012">[ATGOV-T14-R012]-Attachments included within the invoice must be of one of the following file formats: XLS (application/vnd.ms-excel), XLSX (application/vnd.openxmlformats-officedocument.spreadsheetml.sheet), PDF (application/pdf), PNG (image/png) or XML (application/xml or text/xml).</assert>
  </rule>
  <rule context="$CreditNote">
    <assert flag="fatal" test="$ATGOV-T14-R002" id="ATGOV-T14-R002">[ATGOV-T14-R002]-A maximum number of 999 invoice lines must be present.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R003" id="ATGOV-T14-R003">[ATGOV-T14-R003]-The order number or buyer group must be present.</assert>
    <assert flag="warning" test="$ATGOV-T14-R005" id="ATGOV-T14-R005">[ATGOV-T14-R005]-Exactly 1 beneficiary account may be present.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R009" id="ATGOV-T14-R009">[ATGOV-T14-R009]-At last 2 cashbacks may be present.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R013" id="ATGOV-T14-R013">[ATGOV-T14-R013]-A maximum of 200 attachments are allowed within a single document.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R014" id="ATGOV-T14-R014">[ATGOV-T14-R014]-The maximum size of all attachments after Base64 decoding must not exceed 15 Megabytes.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R016" id="ATGOV-T14-R016">[ATGOV-T14-R016]-The payable amount of an invoice must be smaller or equal than 999999999.99.</assert>
  </rule>
  <rule context="$CreditNoteLine">
    <assert flag="fatal" test="$ATGOV-T14-R008" id="ATGOV-T14-R008">[ATGOV-T14-R008]-The order position number (per line item) must be present when the OrderID is a PO number (10 digit numeric).</assert>
    <assert flag="fatal" test="$ATGOV-T14-R015" id="ATGOV-T14-R015">[ATGOV-T14-R015]-The gross amount of a single invoice line must be greater or equal than -999999999999.99 and smaller or equal than 999999999999.99.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R018" id="ATGOV-T14-R018">[ATGOV-T14-R018]-The unit net amount of a line may have at most 4 fraction digits</assert>
  </rule>
  <rule context="$Payment_Means">
    <assert flag="fatal" test="$ATGOV-T14-R007" id="ATGOV-T14-R007">[ATGOV-T14-R007]-Only valid BICs and IBANs are allowed as beneficiary account information.</assert>
  </rule>
  <rule context="$Payment_Terms">
    <assert flag="warning" test="$ATGOV-T14-R004" id="ATGOV-T14-R004">[ATGOV-T14-R004]-A credit note should not specify only textual payment terms.</assert>
    <assert flag="fatal" test="$ATGOV-T14-R010" id="ATGOV-T14-R010">[ATGOV-T14-R010]-The percentage of a cashback item must be greater 0 and lower than 100.</assert>
  </rule>
  <rule context="$Supplier">
    <assert flag="fatal" test="$ATGOV-T14-R001" id="ATGOV-T14-R001">[ATGOV-T14-R001]-The email address of the biller is mandatory.</assert>
  </rule>
</pattern>
