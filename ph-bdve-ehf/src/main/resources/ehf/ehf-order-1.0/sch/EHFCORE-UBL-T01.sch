<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
  <title>Schema for EHF Ordre; 1.0; 2</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:Order">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:UBLVersionID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:CustomizationID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ProfileID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:Note)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:DocumentCurrencyCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:ValidityPeriod)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:OrderDocumentReference)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Contract)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Delivery)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PaymentTerms)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:TaxTotal)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Party)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:DeliveryContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyTaxScheme)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyLegalEntity)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:CompanyID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="normalize-space(.)='VAT'">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:URI)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:DocumentDescription">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:DocumentTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:DocumentType[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:DocumentType[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AdditionalDocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:AllowanceChargeReason)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cac:PaymentMeans">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cac:TaxCategory">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cac:TaxTotal">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:AccountingCost">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:AccountingCostCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:BaseAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:PerUnitAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:PrepaidIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AllowanceCharge/cbc:SequenceNumeric">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AnticipatedMonetaryTotal">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:LineExtensionAmount)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:TaxExclusiveAmount)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:TaxInclusiveAmount)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:AnticipatedMonetaryTotal/cbc:PayableAlternativeAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Party)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:DeliveryContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyTaxScheme)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyLegalEntity)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:CompanyID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="normalize-space(.)='VAT'">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:CatalogueReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cac:ContractDocumentReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cac:ContractualDelivery">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cac:NominationPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ContractTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ContractType[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ContractType[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:Description">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:NominationDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:NominationTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:Note">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Contract/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:AlternativeDeliveryLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:CarrierParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Address)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:Conditions">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:Description">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:InformationURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryLocation/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Language">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:Person">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:Despatch">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:EstimatedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:MaximumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:MinimumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:NotifyParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:PromisedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cac:Shipment">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:ActualDeliveryDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:ActualDeliveryTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:LatestDeliveryDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:LatestDeliveryTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:ReleaseID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Delivery/cbc:TrackingID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cac:SubsidiaryLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:Conditions">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:Description">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:InformationURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:LocationTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cac:DeliveryLocation/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:Amount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:LossRisk">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:LossRiskResponsibilityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:SpecialTerms[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DeliveryTerms/cbc:SpecialTerms[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:DestinationCountry">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:FreightForwarderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cac:Attachment">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:DocumentDescription">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:DocumentType">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:DocumentTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderDocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:Note)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:BuyerProposedSubstituteLineItem">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:CatalogueLineReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:Quantity)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Delivery)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:RequestedDeliveryPeriod)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:AlternativeDeliveryLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:CarrierParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MaximumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MinimumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:NotifyParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Shipment">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ReleaseID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:Description)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:ClassifiedTaxCategory)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:Value)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ValueQualifier)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@unitCode">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="@unitCodeListID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ID)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="normalize-space(.)='VAT'">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:ItemClassificationCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:CommodityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:NatureCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:Dimension">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentType">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OrderedShipment">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:Contact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:Language">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:Person">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:OriginatorParty/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:AllowanceCharge)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cac:PaymentMeans">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cac:TaxCategory">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cac:TaxTotal">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AccountingCost">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:PricingExchangeRate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@unitCode">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="@unitCodeListID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:PricingReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:SubLineItem">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:WarrantyParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cac:WarrantyValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:AccountingCostCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:AccountingCost[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:AccountingCost[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:LineStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:Note">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@unitCode">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="@unitCodeListID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:SalesOrderID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:LineItem/cbc:WarrantyInformation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:OrderLineReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:QuotationLineReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:SellerProposedSubstituteLineItem">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cac:SellerSubstitutedLineItem">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cbc:Note[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cbc:Note[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OrderLine/cbc:SubstitutionStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Party)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:DeliveryContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cac:Attachment">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:DocumentDescription">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:DocumentTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:DocumentType[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:DocumentType[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:OriginatorDocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentExchangeRate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentMeans">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:Note)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cac:ExchangeRate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cac:PenaltyPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cac:SettlementPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:Amount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:InstallmentDueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:InvoicingPartyReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:Note[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:Note[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:PaymentDueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:PaymentMeansID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:PaymentPercent">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:PaymentTermsDetailsURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:PenaltyAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:PenaltySurchargePercent">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:PrepaidPaymentReferenceID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:ReferenceEventCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:SettlementDiscountAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PaymentTerms/cbc:SettlementDiscountPercent">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:PricingExchangeRate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ProjectReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cac:Attachment">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:DocumentDescription">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:DocumentType">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:DocumentTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:QuotationDocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:Party)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:DespatchContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:IdentificationCode)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@schemeID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cac:SellerContact">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:SellerSupplierParty/cbc:DataSendingCapability">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:Signature">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:TaxExchangeRate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:TaxTotal/cac:TaxSubtotal">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:TaxTotal/cbc:RoundingAmount">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:TaxTotal/cbc:TaxEvidenceIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:TaxTotal/cbc:TaxIncludedIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:TransactionConditions">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T01_R002" test="count(cbc:EndDate)=1">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ValidityPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ValidityPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ValidityPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ValidityPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ValidityPeriod/cbc:StartDate">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cac:ValidityPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:AccountingCostCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:AccountingCost[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:AccountingCost[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomerReference">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomizationID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomizationID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomizationID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomizationID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomizationID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomizationID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:CustomizationID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:DocumentCurrencyCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:LineCountNumeric">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:Note[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:Note[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode">
      <assert flag="warning" id="EHFCORE_T01_R002" test="@listID">[EHFCORE-T01-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@listName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:OrderTypeCode[@name]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:PricingCurrencyCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileExecutionID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:ProfileID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:RequestedInvoiceCurrencyCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:SalesOrderID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:TaxCurrencyCode">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UBLVersionID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UBLVersionID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UBLVersionID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UBLVersionID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UBLVersionID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UBLVersionID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UBLVersionID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Order/ext:UBLExtensions">
      <assert flag="warning" id="EHFCORE_T01_R001" test="true()">[EHFCORE-T01-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
</schema>