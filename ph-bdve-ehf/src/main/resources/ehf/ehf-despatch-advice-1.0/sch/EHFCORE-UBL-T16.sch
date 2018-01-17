<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
  <title>Schema for Pakkseddel; 1.0; 1</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:DespatchAdvice">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:UBLVersionID)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:CustomizationID)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:ProfileID)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:Note)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:OrderReference)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:AdditionalDocumentReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Party)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:DeliveryContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Contact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@schemeID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Party)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Contact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@schemeID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@schemeID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:Note)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:DeliveredQuantity)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:OrderLineReference)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Shipment)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:BuyersItemIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueDocumentReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueItemIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Certificate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ClassifiedTaxCategory">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CommodityClassification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Dimension">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:AdditionalTemperature">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:ContactParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:EmergencyTemperature">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:FlashpointTemperature">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:HazardousGoodsTransit">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:SecondaryHazard">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:AdditionalInformation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:CategoryName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:EmergencyProceduresCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardousCategoryCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:LowerOrangeHazardPlacardID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MarkingID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MedicalFirstAidGuideCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardEndorsement">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardNotation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:TechnicalName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@listID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@name]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UpperOrangeHazardPlacardID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:InformationContentProviderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ManufactureTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ProductTraceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:RegistrationID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemSpecificationDocumentReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturerParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturersItemIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginCountry">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:TransactionConditions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:AdditionalInformation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:BrandName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:CatalogueIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Description">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:HazardousRiskIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Keyword">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:ModelName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackSizeNumeric">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cac:OrderReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineStatusCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:SalesOrderLineID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Delivery">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ExportCountry">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FirstArrivalPortLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FreightAllowanceCharge">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:GoodsItem">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:LastExitPortLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:OriginAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ReturnAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ShipmentStage">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:ShippingMarks)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:CustomsIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:FloorSpaceMeasurementDimension">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:GoodsItem">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HandlingUnitDespatchLine">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HazardousGoodsTransit">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MaximumTemperature">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:Description">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MaximumMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MinimumMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MinimumTemperature">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Package">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:PalletSpaceMeasurementDimension">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReceivedHandlingUnitReceiptLine">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReferencedShipment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ShipmentDocumentReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Status">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportMeans">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:DamageRemarks">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ShippingMarks[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ShippingMarks[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TotalGoodsItemQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TotalPackageQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TraceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@name]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ConsignmentQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredCustomsValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeliveryInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:FreeOnBoardValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:Information">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:InsuranceValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetNetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ShippingPriorityLevelCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SpecialInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SplitConsignmentIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalGoodsItemQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderReason">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:DeliveredQuantity">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@unitCode">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:DeliveredQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:DeliveredQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:LineStatusCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:Note[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:Note[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingQuantity">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@unitCode">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingReason[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingReason[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OversupplyQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Party)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:DespatchContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@schemeID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@schemeID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:SellerContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:DataSendingCapability">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CustomerReference">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:OrderTypeCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:SalesOrderID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Party)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:DeliveryContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Contact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@schemeID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Party)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:DespatchContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="@schemeID">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:SellerContact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:DataSendingCapability">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Consignment)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:BillOfLadingHolderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:Person)&lt;=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Contact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Language">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cac:IdentityDocumentReference)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:Contact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:Attachment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentDescription">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentTypeCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentType[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentType[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:ResidenceAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:BirthDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:BirthplaceName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:FamilyName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:FirstName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:GenderCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:JobTitle">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:MiddleName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:NameSuffix">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:NationalityID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:OrganizationDepartment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:OtherName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:Title">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ChildConsignment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CollectPaymentTerms">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsigneeParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsignorParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsolidatedShipment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CustomsIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DisbursementPaymentTerms">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExporterParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExtraAllowanceCharge">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryTransportationService">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDestinationCountry">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FirstArrivalPortLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightAllowanceCharge">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightForwarderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:HazardousItemNotificationParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ImporterParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:InsuranceParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LastExitPortLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LogisticsOperatorParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MainCarriageShipmentStage">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MortgageHolderParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:NotifyParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OnCarriageShipmentStage">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDepartureCountry">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PaymentTerms">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PerformingCarrierParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedDeliveryTransportEvent">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedPickupTransportEvent">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PreCarriageShipmentStage">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PrepaidPaymentTerms">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedDeliveryTransportEvent">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedPickupTransportEvent">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:Status">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:SubstituteCarrierParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransitCountry">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportAdvisorParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportContract">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportHandlingUnit">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:AnimalFoodIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BrokerAssignedID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BulkCargoIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierAssignedID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierServiceInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ChargeableWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsigneeAssignedID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignmentQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignorAssignedID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsolidatableIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContainerizedIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContractedCarrierAssignedID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CustomsClearanceServiceInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredCustomsValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredForCarriageValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredStatisticsValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeliveryInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ForwarderServiceInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreeOnBoardValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreightForwarderAssignedID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GeneralCargoIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HaulageInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HazardousRiskIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HumanFoodIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Information[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Information[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsurancePremiumAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsuranceValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LivestockIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingLengthMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingSequenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetNetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:PerformingCarrierAssignedID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Remarks">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SequenceID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ShippingPriorityLevelCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialSecurityIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialServiceInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SplitConsignmentIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SummaryDescription">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffDescription">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ThirdPartyPayerIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalGoodsItemQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalInvoiceAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalTransportHandlingUnitQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:AlternativeDeliveryLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:CarrierParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:CarrierParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:Contact">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country">
      <assert flag="warning" id="EHFCORE_T16_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:EstimatedDespatchPeriod">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:NotifyParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:RequestedDespatchPeriod">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:Instructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ReleaseID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MaximumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MinimumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:NotifyParty">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:PromisedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:RequestedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Shipment">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryDate">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryTime">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ReleaseID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ExportCountry">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FirstArrivalPortLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FreightAllowanceCharge">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:GoodsItem">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:LastExitPortLocation">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:OriginAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ReturnAddress">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ShipmentStage">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:TransportHandlingUnit">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ConsignmentQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredCustomsValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeliveryInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:FreeOnBoardValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:Information[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:Information[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:InsuranceValueAmount">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetNetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ShippingPriorityLevelCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SpecialInstructions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SplitConsignmentIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalGoodsItemQuantity">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCode]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Signature">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:DespatchAdviceTypeCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:LineCountNumeric">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:Note[@languageID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:Note[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileExecutionID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID">
      <assert flag="warning" id="EHFCORE_T16_R002" test="normalize-space(.)='2.1'">[EHFCORE-T16-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/ext:UBLExtensions">
      <assert flag="warning" id="EHFCORE_T16_R001" test="true()">[EHFCORE-T16-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
</schema>