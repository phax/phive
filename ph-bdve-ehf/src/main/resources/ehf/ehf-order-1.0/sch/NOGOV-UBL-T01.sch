<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

   <title>Norwegian rules for EHF Order</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2" prefix="ubl"/>

   <pattern>
      <rule context="/ubl:Order">
         <assert id="NOGOV-T01-R002"
                 test="cac:BuyerCustomerParty/cac:Party"
                 flag="fatal">[NOGOV-T01-R002]-An order MUST contain buyer information</assert>
         <assert id="NOGOV-T01-R018"
                 test="cac:SellerSupplierParty/cac:Party"
                 flag="fatal">[NOGOV-T01-R018]-An order MUST contain seller information</assert>
      </rule>
      <rule context="cac:LineItem">
         <assert id="NOGOV-T01-R005"
                 test="cbc:Quantity"
                 flag="fatal">[NOGOV-T01-R005]-An order line item MUST have a quantity</assert>
      </rule>
      <rule context="cac:BuyerCustomerParty">
         <assert id="NOGOV-T01-R001"
                 test="string-length(cac:Party/cac:Contact/cbc:ID) &gt;0"
                 flag="warning">[NOGOV-T01-R001]-Kundens referanse BØR fylles ut i henhold til norske krav -- Customer reference SHOULD have a value</assert>
      </rule>
      <rule context="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]">
        <assert id="NOGOV-T01-R023"
                test="@schemeID = 'NO:ORGNR'"
                flag="warning">[NOGOV-T01-R023]-CompanyID for legal entity qualifier must have value 'NO:ORGNR' when provided.</assert>
      </rule>
      <rule context="cac:PartyTaxScheme/cbc:CompanyID[@schemeID]">
        <assert id="NOGOV-T01-R024"
                test="@schemeID = 'NO:VAT'"
                flag="warning">[NOGOV-T01-R024]-CompanyID for tax scheme qualifier must have value 'NO:VAT' when provided.</assert>
      </rule>
      <rule context="cac:Attachment/cac:ExternalReference">
         <assert id="NOGOV-T01-R013"
                 test="cbc:URI"
                 flag="fatal">[NOGOV-T01-R013]-URI MUST be specified when describing external reference documents.</assert>
      </rule>
      <rule context="cac:Contract">
         <assert id="NOGOV-T01-R014"
                 test="cbc:ID"
                 flag="fatal">[NOGOV-T01-R014]-Contract ID MUST be specified when referencing contracts.</assert>
      </rule>
      <rule context="cac:PartyTaxScheme">
         <assert id="NOGOV-T01-R016"
                 test="cbc:CompanyID"
                 flag="fatal">[NOGOV-T01-R016]-VAT identifier MUST be specified when VAT information is present</assert>
      </rule>
      <rule context="cac:TaxScheme">
         <assert id="NOGOV-T01-R017"
                 test="cbc:ID"
                 flag="fatal">[NOGOV-T01-R017]-Every tax scheme MUST be defined through an identifier.</assert>
      </rule>
      <rule context="cac:Country">
         <assert id="NOGOV-T01-R015"
                 test="cbc:IdentificationCode"
                 flag="fatal">[NOGOV-T01-R015]-Identification code MUST be specified when describing a country.</assert>
      </rule>
      <rule context="cac:OriginatorCustomerParty">
         <assert id="NOGOV-T01-R019"
                 test="cac:Party"
                 flag="fatal">[NOGOV-T01-R019]-If originator element is present, party must be specified</assert>
      </rule>
      <rule context="cac:AccountingCustomerParty">
         <assert id="NOGOV-T01-R020"
                 test="cac:Party"
                 flag="fatal">[NOGOV-T01-R020]-If invoicee element is present, party must be specified</assert>
      </rule>
      <rule context="cac:ClassifiedTaxCategory">
         <assert id="NOGOV-T01-R004"
                 test="cbc:ID"
                 flag="fatal">[NOGOV-T01-R004]-If classified tax category is present, VAT category code must be specified</assert>
      </rule>
      <rule context="cac:CommodityClassification">
         <assert id="NOGOV-T01-R003"
                 test="cbc:ItemClassificationCode"
                 flag="fatal">[NOGOV-T01-R003]-If product classification element is present, classification code must be specified</assert>
      </rule>
      <rule context="cbc:ProfileID">
         <assert id="EHFPROFILE-T01-R001"
                 test=". = 'urn:www.cenbii.eu:profile:bii28:ver2.0'"
                 flag="fatal">[EHFPROFILE-T01-R001]-An order must only be used in profile 28</assert>
      </rule>
   </pattern>
</schema>
