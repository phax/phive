<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!
Abstract Schematron rules for T10-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T10">
  <rule context="$AllowanceCharge">
    <assert flag="fatal" test="$ATNAT-T10-R007" id="ATNAT-T10-R007">[ATNAT-T10-R007]-Allowances and charges on header level need a VAT rate.</assert>
  </rule>
  <rule context="$Attachments">
    <assert flag="fatal" test="$ATNAT-T10-R008" id="ATNAT-T10-R008">[ATNAT-T10-R008]-Attachments to the invoice must be included into the invoice document and may not be referenced from external sources.</assert>
  </rule>
  <rule context="$Invoice">
    <assert flag="fatal" test="$ATNAT-T10-R001" id="ATNAT-T10-R001">[ATNAT-T10-R001]-If the invoice total exceeds € 10.000, the VAT number of the customer MUST be provided, if the supplier has a registered office in Austria.</assert>
    <assert flag="fatal" test="$ATNAT-T10-R003" id="ATNAT-T10-R003">[ATNAT-T10-R003]-The invoice MUST contain either the actual delivery date or the invoicing period.</assert>
    <assert flag="fatal" test="$ATNAT-T10-R004" id="ATNAT-T10-R004">[ATNAT-T10-R004]-If products or services are subject to the Reverse Charge System (customer has to bear the tax, not the supplier - Austria: UStG § 19) the VAT identification number of the customer MUST be provided.</assert>
    <assert flag="fatal" test="$ATNAT-T10-R005" id="ATNAT-T10-R005">[ATNAT-T10-R005]-If the invoice total exceeds € 400, the VAT number of the supplier MUST be provided, if the supplier has a registered office in Austria.</assert>
  </rule>
  <rule context="$Tax_Category">
    <assert flag="fatal" test="$ATNAT-T10-R002" id="ATNAT-T10-R002">[ATNAT-T10-R002]-If the tax percentage in a tax category is 0% then the tax category identifier MUST be "E" or "AE" (UN-5305).</assert>
    <assert flag="fatal" test="$ATNAT-T10-R006" id="ATNAT-T10-R006">[ATNAT-T10-R006]-If products or services are subject to the Reverse Charge System (customer has to bear the tax, not the supplier - Austria: UStG § 19) the VAT tax amount must be 0.</assert>
  </rule>
</pattern>
