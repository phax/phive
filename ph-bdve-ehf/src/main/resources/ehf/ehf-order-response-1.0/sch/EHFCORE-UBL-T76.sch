<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
  <title>Schema for EHF Ordrebekreftelse; 1.0; 2</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:OrderResponse">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:UBLVersionID)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:CustomizationID)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:ProfileID)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:OrderResponseCode)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:Note)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:DocumentCurrencyCode)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:OrderReference)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:Delivery)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AccountingCustomerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AccountingSupplierParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@schemeID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@schemeID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:PromisedDeliveryPeriod)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:AlternativeDeliveryLocation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:CarrierParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:Despatch">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:EstimatedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:MaximumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:MinimumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:NotifyParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:Shipment">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryDate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryDate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ReleaseID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:TrackingID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:DestinationCountry">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:FreightForwarderParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:LegalMonetaryTotal">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:SellerSubstitutedLineItem)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:OrderLineReference)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:BuyerProposedSubstituteLineItem">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:CatalogueLineReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:Note)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:LineStatusCode)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:Delivery)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:PromisedDeliveryPeriod)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:AlternativeDeliveryLocation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:CarrierParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MaximumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MinimumDeliveryUnit">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:NotifyParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Shipment">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryDate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ReleaseID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Dimension">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OrderedShipment">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OriginatorParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PricingExchangeRate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@unitCode">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="@unitCodeListID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:PricingReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:SubLineItem">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyValidityPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCost">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCostCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@listID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@name]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:PartialDeliveryIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@unitCode">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="@unitCodeListID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:SalesOrderID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:TotalTaxAmount">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:WarrantyInformation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cac:OrderReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineStatusCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:SalesOrderLineID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:QuotationLineReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerProposedSubstituteLineItem">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Delivery">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:DeliveryTerms">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:ClassifiedTaxCategory)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:Value)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:ValueQualifier)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@unitCode">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T76_R002" test="@unitCodeListID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:BuyersItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueDocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Certificate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:ID)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:ID)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@schemeID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cbc:ItemClassificationCode)=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CommodityCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:NatureCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Dimension">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:HazardousItem">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:InformationContentProviderParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemInstance">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemSpecificationDocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturersItemIdentification">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginAddress">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginCountry">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:TransactionConditions">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:AdditionalInformation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:BrandName">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:CatalogueIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Description">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:HazardousRiskIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Keyword">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:ModelName">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackSizeNumeric">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OrderedShipment">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OriginatorParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Price">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:PricingReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:SubLineItem">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyValidityPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCost">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCostCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:BackOrderAllowedIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:InspectionMethodCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineExtensionAmount">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineStatusCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumBackorderQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumBackorderQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Note">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:PartialDeliveryIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:SalesOrderID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:TotalTaxAmount">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:WarrantyInformation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cbc:Note">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cbc:SubstitutionStatusCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:CustomerReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:OrderTypeCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:SalesOrderID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PaymentExchangeRate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PaymentMeans">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PaymentTerms">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PricingExchangeRate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:DespatchContact">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T76_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@schemeID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@schemeID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:SellerContact">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:DataSendingCapability">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Signature">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TaxExchangeRate">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TaxTotal">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TransactionConditions">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:AccountingCost">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:AccountingCostCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomerReference">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@listID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@name]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:GrossVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:GrossWeightMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:LineCountNumeric">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:NetNetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:NetVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:NetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:Note[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:Note[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode">
      <assert flag="warning" id="EHFCORE_T76_R002" test="@listID">[EHFCORE-T76-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@name]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:PricingCurrencyCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileExecutionID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:SalesOrderID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:TaxCurrencyCode">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:TotalPackagesQuantity">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/ext:UBLExtensions">
      <assert flag="warning" id="EHFCORE_T76_R001" test="true()">[EHFCORE-T76-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
</schema>