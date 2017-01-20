<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    schemaVersion="iso">
  <title>BII2 CORE restrictions for Despatch Advice Transaction (T16)  UBL-DespatchAdvice-2.1</title>
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
      <assert flag="warning" test="count(cbc:CustomizationID)=1">
	Element 'cbc:CustomizationID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(cbc:ProfileID)=1">
	Element 'cbc:ProfileID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(cac:OrderReference)&lt;=1">
	Element 'cac:OrderReference' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:AdditionalDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty">
      <assert flag="warning" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:BuyerContact">
      <report flag="warning" test=".">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party">
      <assert flag="warning" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty">
      <assert flag="warning" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:BuyerContact">
      <report flag="warning" test=".">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party">
      <assert flag="warning" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
      <assert flag="warning" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine">
      <assert flag="warning" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(cac:OrderLineReference)=1">
	Element 'cac:OrderLineReference' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:DocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemProperty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:BuyersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Certificate">
      <report flag="warning" test=".">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ClassifiedTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CommodityClassification">
      <report flag="warning" test=".">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Dimension">
      <report flag="warning" test=".">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:AdditionalTemperature">
      <report flag="warning" test=".">
	Element 'cac:AdditionalTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:ContactParty">
      <report flag="warning" test=".">
	Element 'cac:ContactParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:EmergencyTemperature">
      <report flag="warning" test=".">
	Element 'cac:EmergencyTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:FlashpointTemperature">
      <report flag="warning" test=".">
	Element 'cac:FlashpointTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:HazardousGoodsTransit">
      <report flag="warning" test=".">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:SecondaryHazard">
      <report flag="warning" test=".">
	Element 'cac:SecondaryHazard' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:CategoryName">
      <report flag="warning" test=".">
	Element 'cbc:CategoryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:EmergencyProceduresCode">
      <report flag="warning" test=".">
	Element 'cbc:EmergencyProceduresCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardousCategoryCode">
      <report flag="warning" test=".">
	Element 'cbc:HazardousCategoryCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:LowerOrangeHazardPlacardID">
      <report flag="warning" test=".">
	Element 'cbc:LowerOrangeHazardPlacardID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MarkingID">
      <report flag="warning" test=".">
	Element 'cbc:MarkingID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MedicalFirstAidGuideCode">
      <report flag="warning" test=".">
	Element 'cbc:MedicalFirstAidGuideCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardEndorsement">
      <report flag="warning" test=".">
	Element 'cbc:PlacardEndorsement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardNotation">
      <report flag="warning" test=".">
	Element 'cbc:PlacardNotation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:TechnicalName">
      <report flag="warning" test=".">
	Element 'cbc:TechnicalName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode">
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UpperOrangeHazardPlacardID">
      <report flag="warning" test=".">
	Element 'cbc:UpperOrangeHazardPlacardID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:InformationContentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:AdditionalItemProperty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cac:AdditionalItemProperty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ManufactureTime">
      <report flag="warning" test=".">
	Element 'cbc:ManufactureTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ProductTraceID">
      <report flag="warning" test=".">
	Element 'cbc:ProductTraceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:RegistrationID">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemSpecificationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturerParty">
      <report flag="warning" test=".">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:BrandName">
      <report flag="warning" test=".">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:CatalogueIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Keyword">
      <report flag="warning" test=".">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:ModelName">
      <report flag="warning" test=".">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackQuantity">
      <report flag="warning" test=".">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackSizeNumeric">
      <report flag="warning" test=".">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cac:OrderReference">
      <report flag="warning" test=".">
	Element 'cac:OrderReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:SalesOrderLineID">
      <report flag="warning" test=".">
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:BillOfLadingHolderParty">
      <report flag="warning" test=".">
	Element 'cac:BillOfLadingHolderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:CarrierParty">
      <report flag="warning" test=".">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:ChildConsignment">
      <report flag="warning" test=".">
	Element 'cac:ChildConsignment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:CollectPaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:CollectPaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:ConsigneeParty">
      <report flag="warning" test=".">
	Element 'cac:ConsigneeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:ConsignorParty">
      <report flag="warning" test=".">
	Element 'cac:ConsignorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:ConsolidatedShipment">
      <report flag="warning" test=".">
	Element 'cac:ConsolidatedShipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:CustomsIdentification">
      <report flag="warning" test=".">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:DisbursementPaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:DisbursementPaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:ExporterParty">
      <report flag="warning" test=".">
	Element 'cac:ExporterParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:ExtraAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:ExtraAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:FinalDeliveryParty">
      <report flag="warning" test=".">
	Element 'cac:FinalDeliveryParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:FinalDeliveryTransportationService">
      <report flag="warning" test=".">
	Element 'cac:FinalDeliveryTransportationService' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:FinalDestinationCountry">
      <report flag="warning" test=".">
	Element 'cac:FinalDestinationCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:FirstArrivalPortLocation">
      <report flag="warning" test=".">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:FreightAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:FreightForwarderParty">
      <report flag="warning" test=".">
	Element 'cac:FreightForwarderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:HazardousItemNotificationParty">
      <report flag="warning" test=".">
	Element 'cac:HazardousItemNotificationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:ImporterParty">
      <report flag="warning" test=".">
	Element 'cac:ImporterParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:InsuranceParty">
      <report flag="warning" test=".">
	Element 'cac:InsuranceParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:LastExitPortLocation">
      <report flag="warning" test=".">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:LogisticsOperatorParty">
      <report flag="warning" test=".">
	Element 'cac:LogisticsOperatorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:MainCarriageShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:MainCarriageShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:MortgageHolderParty">
      <report flag="warning" test=".">
	Element 'cac:MortgageHolderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:NotifyParty">
      <report flag="warning" test=".">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OnCarriageShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:OnCarriageShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDepartureCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginalDepartureCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchParty">
      <report flag="warning" test=".">
	Element 'cac:OriginalDespatchParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:EnvironmentalEmission">
      <report flag="warning" test=".">
	Element 'cac:EnvironmentalEmission' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:EstimatedDurationPeriod">
      <report flag="warning" test=".">
	Element 'cac:EstimatedDurationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:ExcludedTransportHandlingUnit">
      <report flag="warning" test=".">
	Element 'cac:ExcludedTransportHandlingUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:IncludedTransportHandlingUnit">
      <report flag="warning" test=".">
	Element 'cac:IncludedTransportHandlingUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:ResponsibleTransportServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ResponsibleTransportServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:ShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:ShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TotalCapacityDimension">
      <report flag="warning" test=".">
	Element 'cac:TotalCapacityDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportEvent">
      <report flag="warning" test=".">
	Element 'cac:TransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainedPackage">
      <report flag="warning" test=".">
	Element 'cac:ContainedPackage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:ApplicableTransportMeans">
      <report flag="warning" test=".">
	Element 'cac:ApplicableTransportMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:AttachedTransportEquipment">
      <report flag="warning" test=".">
	Element 'cac:AttachedTransportEquipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:ContainedInTransportEquipment">
      <report flag="warning" test=".">
	Element 'cac:ContainedInTransportEquipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:ContainedPackage">
      <report flag="warning" test=".">
	Element 'cac:ContainedPackage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:Delivery">
      <report flag="warning" test=".">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:DeliveryTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:Despatch">
      <report flag="warning" test=".">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:FreightAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:ContainedGoodsItem">
      <report flag="warning" test=".">
	Element 'cac:ContainedGoodsItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:ContainingPackage">
      <report flag="warning" test=".">
	Element 'cac:ContainingPackage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Delivery">
      <report flag="warning" test=".">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Despatch">
      <report flag="warning" test=".">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:FreightAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:GoodsItemContainer">
      <report flag="warning" test=".">
	Element 'cac:GoodsItemContainer' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:InvoiceLine">
      <report flag="warning" test=".">
	Element 'cac:InvoiceLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:AdditionalItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:AdditionalItemProperty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:BuyersItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:BuyersItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:BuyersItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:BuyersItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:BuyersItemIdentification/cbc:ExtendedID">
      <report flag="warning" test=".">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:BuyersItemIdentification/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:CatalogueDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:CatalogueItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:Certificate">
      <report flag="warning" test=".">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:ClassifiedTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:CommodityClassification">
      <report flag="warning" test=".">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:Dimension">
      <report flag="warning" test=".">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:HazardousItem">
      <report flag="warning" test=".">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:InformationContentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:ItemInstance">
      <report flag="warning" test=".">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:ItemSpecificationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:ManufacturerParty">
      <report flag="warning" test=".">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:ManufacturersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:OriginCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:SellersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:SellersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:StandardItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:StandardItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:BrandName">
      <report flag="warning" test=".">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:CatalogueIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:Keyword">
      <report flag="warning" test=".">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:ModelName">
      <report flag="warning" test=".">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:PackQuantity">
      <report flag="warning" test=".">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Item/cbc:PackSizeNumeric">
      <report flag="warning" test=".">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Pickup">
      <report flag="warning" test=".">
	Element 'cac:Pickup' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:ShipmentDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ShipmentDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cac:Temperature">
      <report flag="warning" test=".">
	Element 'cac:Temperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:ChargeableQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ChargeableQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:ChargeableWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:ChargeableWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:CustomsImportClassifiedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CustomsImportClassifiedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:CustomsStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CustomsStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:CustomsTariffQuantity">
      <report flag="warning" test=".">
	Element 'cbc:CustomsTariffQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:DeclaredCustomsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:DeclaredForCarriageValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:DeclaredStatisticsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:FreeOnBoardValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:GrossVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:InsuranceValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:NetNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:NetVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:PreferenceCriterionCode">
      <report flag="warning" test=".">
	Element 'cbc:PreferenceCriterionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:RequiredCustomsID">
      <report flag="warning" test=".">
	Element 'cbc:RequiredCustomsID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:ReturnableQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ReturnableQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:SequenceNumberID">
      <report flag="warning" test=".">
	Element 'cbc:SequenceNumberID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:TraceID">
      <report flag="warning" test=".">
	Element 'cbc:TraceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:GoodsItem/cbc:ValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:ValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:HandlingTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:HandlingTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:HaulageTradingTerms">
      <report flag="warning" test=".">
	Element 'cac:HaulageTradingTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:HazardousGoodsTransit">
      <report flag="warning" test=".">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:LoadingLocation">
      <report flag="warning" test=".">
	Element 'cac:LoadingLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:LoadingProofParty">
      <report flag="warning" test=".">
	Element 'cac:LoadingProofParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:LoadingTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:LoadingTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:MaximumTemperature">
      <report flag="warning" test=".">
	Element 'cac:MaximumTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:MinimumTemperature">
      <report flag="warning" test=".">
	Element 'cac:MinimumTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:OperatingParty">
      <report flag="warning" test=".">
	Element 'cac:OperatingParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:OwnerParty">
      <report flag="warning" test=".">
	Element 'cac:OwnerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:PackagedTransportHandlingUnit">
      <report flag="warning" test=".">
	Element 'cac:PackagedTransportHandlingUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:Pickup">
      <report flag="warning" test=".">
	Element 'cac:Pickup' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:PickupTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:PickupTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:PositioningTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:PositioningTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:ProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:QuarantineTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:QuarantineTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:ServiceAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:ServiceAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:ShipmentDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ShipmentDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:StorageLocation">
      <report flag="warning" test=".">
	Element 'cac:StorageLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:SupplierParty">
      <report flag="warning" test=".">
	Element 'cac:SupplierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:TransportEquipmentSeal">
      <report flag="warning" test=".">
	Element 'cac:TransportEquipmentSeal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:TransportEvent">
      <report flag="warning" test=".">
	Element 'cac:TransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cac:UnloadingLocation">
      <report flag="warning" test=".">
	Element 'cac:UnloadingLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:AirFlowPercent">
      <report flag="warning" test=".">
	Element 'cbc:AirFlowPercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:AnimalFoodApprovedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:AnimalFoodApprovedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:Characteristics">
      <report flag="warning" test=".">
	Element 'cbc:Characteristics' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:DamageRemarks">
      <report flag="warning" test=".">
	Element 'cbc:DamageRemarks' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:DangerousGoodsApprovedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:DangerousGoodsApprovedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:DispositionCode">
      <report flag="warning" test=".">
	Element 'cbc:DispositionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:FullnessIndicationCode">
      <report flag="warning" test=".">
	Element 'cbc:FullnessIndicationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:GrossVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:HumanFoodApprovedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HumanFoodApprovedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:HumidityPercent">
      <report flag="warning" test=".">
	Element 'cbc:HumidityPercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:Information">
      <report flag="warning" test=".">
	Element 'cbc:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:LegalStatusIndicator">
      <report flag="warning" test=".">
	Element 'cbc:LegalStatusIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:OwnerTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:OwnerTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:PowerIndicator">
      <report flag="warning" test=".">
	Element 'cbc:PowerIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:ProviderTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:ProviderTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:ReferencedConsignmentID">
      <report flag="warning" test=".">
	Element 'cbc:ReferencedConsignmentID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:RefrigeratedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:RefrigeratedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:RefrigerationOnIndicator">
      <report flag="warning" test=".">
	Element 'cbc:RefrigerationOnIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:ReturnabilityIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ReturnabilityIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:SizeTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:SizeTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:SpecialTransportRequirments">
      <report flag="warning" test=".">
	Element 'cbc:SpecialTransportRequirments' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:TareWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:TareWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:TraceID">
      <report flag="warning" test=".">
	Element 'cbc:TraceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:TrackingDeviceCode">
      <report flag="warning" test=".">
	Element 'cbc:TrackingDeviceCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment/cbc:TransportEquipmentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TransportEquipmentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:Delivery">
      <report flag="warning" test=".">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:DeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:DeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:Despatch">
      <report flag="warning" test=".">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:GoodsItem">
      <report flag="warning" test=".">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cac:Pickup">
      <report flag="warning" test=".">
	Element 'cac:Pickup' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackageLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:PackageLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:PackagingTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackingMaterial">
      <report flag="warning" test=".">
	Element 'cbc:PackingMaterial' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ReturnableMaterialIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ReturnableMaterialIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ActualPackage/cbc:TraceID">
      <report flag="warning" test=".">
	Element 'cbc:TraceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:CustomsIdentification">
      <report flag="warning" test=".">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:FloorSpaceMeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:FloorSpaceMeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:GoodsItem">
      <report flag="warning" test=".">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:HandlingUnitDespatchLine">
      <report flag="warning" test=".">
	Element 'cac:HandlingUnitDespatchLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:HazardousGoodsTransit">
      <report flag="warning" test=".">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:MaximumTemperature">
      <report flag="warning" test=".">
	Element 'cac:MaximumTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:MinimumTemperature">
      <report flag="warning" test=".">
	Element 'cac:MinimumTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:Package">
      <report flag="warning" test=".">
	Element 'cac:Package' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:PalletSpaceMeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:PalletSpaceMeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ReceivedHandlingUnitReceiptLine">
      <report flag="warning" test=".">
	Element 'cac:ReceivedHandlingUnitReceiptLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ReferencedShipment">
      <report flag="warning" test=".">
	Element 'cac:ReferencedShipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:ShipmentDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ShipmentDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:Status">
      <report flag="warning" test=".">
	Element 'cac:Status' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:TransportEquipment">
      <report flag="warning" test=".">
	Element 'cac:TransportEquipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cac:TransportMeans">
      <report flag="warning" test=".">
	Element 'cac:TransportMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:DamageRemarks">
      <report flag="warning" test=".">
	Element 'cbc:DamageRemarks' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:HandlingCode">
      <report flag="warning" test=".">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:HandlingInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:ShippingMarks">
      <report flag="warning" test=".">
	Element 'cbc:ShippingMarks' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:TotalGoodsItemQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:TotalPackageQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalPackageQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:TraceID">
      <report flag="warning" test=".">
	Element 'cbc:TraceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TransportHandlingUnitTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:FreightRateClassCode">
      <report flag="warning" test=".">
	Element 'cbc:FreightRateClassCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:NominationDate">
      <report flag="warning" test=".">
	Element 'cbc:NominationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:NominationTime">
      <report flag="warning" test=".">
	Element 'cbc:NominationTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:Priority">
      <report flag="warning" test=".">
	Element 'cbc:Priority' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:TariffClassCode">
      <report flag="warning" test=".">
	Element 'cbc:TariffClassCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:TransportServiceCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:TransportationServiceDescription">
      <report flag="warning" test=".">
	Element 'cbc:TransportationServiceDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService/cbc:TransportationServiceDetailsURI">
      <report flag="warning" test=".">
	Element 'cbc:TransportationServiceDetailsURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:PaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:PerformingCarrierParty">
      <report flag="warning" test=".">
	Element 'cac:PerformingCarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:PlannedDeliveryTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:PlannedDeliveryTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:PlannedPickupTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:PlannedPickupTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:PreCarriageShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:PreCarriageShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:PrepaidPaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PrepaidPaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:RequestedDeliveryTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:RequestedDeliveryTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:RequestedPickupTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:RequestedPickupTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:Status">
      <report flag="warning" test=".">
	Element 'cac:Status' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:SubstituteCarrierParty">
      <report flag="warning" test=".">
	Element 'cac:SubstituteCarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:TransitCountry">
      <report flag="warning" test=".">
	Element 'cac:TransitCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:TransportAdvisorParty">
      <report flag="warning" test=".">
	Element 'cac:TransportAdvisorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:TransportContract">
      <report flag="warning" test=".">
	Element 'cac:TransportContract' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cac:TransportHandlingUnit">
      <report flag="warning" test=".">
	Element 'cac:TransportHandlingUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:AnimalFoodIndicator">
      <report flag="warning" test=".">
	Element 'cbc:AnimalFoodIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:BrokerAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:BrokerAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:BulkCargoIndicator">
      <report flag="warning" test=".">
	Element 'cbc:BulkCargoIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:CarrierAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:CarrierAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:CarrierServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:CarrierServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ChargeableWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:ChargeableWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ConsigneeAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:ConsigneeAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ConsignmentQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ConsignorAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:ConsignorAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ConsolidatableIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ConsolidatableIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ContainerizedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ContainerizedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ContractedCarrierAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:ContractedCarrierAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:CustomsClearanceServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:CustomsClearanceServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:DeclaredCustomsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:DeclaredForCarriageValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:DeclaredStatisticsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:DeliveryInstructions">
      <report flag="warning" test=".">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ForwarderServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:ForwarderServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:FreeOnBoardValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:FreightForwarderAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:FreightForwarderAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:GeneralCargoIndicator">
      <report flag="warning" test=".">
	Element 'cbc:GeneralCargoIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:GrossVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:HandlingCode">
      <report flag="warning" test=".">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:HandlingInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:HaulageInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HaulageInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:HumanFoodIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HumanFoodIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:Information">
      <report flag="warning" test=".">
	Element 'cbc:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:InsurancePremiumAmount">
      <report flag="warning" test=".">
	Element 'cbc:InsurancePremiumAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:InsuranceValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:LivestockIndicator">
      <report flag="warning" test=".">
	Element 'cbc:LivestockIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:LoadingLengthMeasure">
      <report flag="warning" test=".">
	Element 'cbc:LoadingLengthMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:LoadingSequenceID">
      <report flag="warning" test=".">
	Element 'cbc:LoadingSequenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:NetNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:NetVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:PerformingCarrierAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:PerformingCarrierAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:Remarks">
      <report flag="warning" test=".">
	Element 'cbc:Remarks' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:SequenceID">
      <report flag="warning" test=".">
	Element 'cbc:SequenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ShippingPriorityLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:SpecialInstructions">
      <report flag="warning" test=".">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:SpecialSecurityIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SpecialSecurityIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:SpecialServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:SpecialServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:SplitConsignmentIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:SummaryDescription">
      <report flag="warning" test=".">
	Element 'cbc:SummaryDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:TariffCode">
      <report flag="warning" test=".">
	Element 'cbc:TariffCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:TariffDescription">
      <report flag="warning" test=".">
	Element 'cbc:TariffDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:ThirdPartyPayerIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ThirdPartyPayerIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:TotalGoodsItemQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:TotalInvoiceAmount">
      <report flag="warning" test=".">
	Element 'cbc:TotalInvoiceAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment/cbc:TotalTransportHandlingUnitQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Delivery">
      <report flag="warning" test=".">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ExportCountry">
      <report flag="warning" test=".">
	Element 'cac:ExportCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FirstArrivalPortLocation">
      <report flag="warning" test=".">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FreightAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:GoodsItem">
      <report flag="warning" test=".">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:LastExitPortLocation">
      <report flag="warning" test=".">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ReturnAddress">
      <report flag="warning" test=".">
	Element 'cac:ReturnAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:ShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainedPackage">
      <report flag="warning" test=".">
	Element 'cac:ContainedPackage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:ContainingTransportEquipment">
      <report flag="warning" test=".">
	Element 'cac:ContainingTransportEquipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:Delivery">
      <report flag="warning" test=".">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:DeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:DeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:Despatch">
      <report flag="warning" test=".">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:GoodsItem">
      <report flag="warning" test=".">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cac:Pickup">
      <report flag="warning" test=".">
	Element 'cac:Pickup' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackageLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:PackageLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:PackagingTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackingMaterial">
      <report flag="warning" test=".">
	Element 'cbc:PackingMaterial' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ReturnableMaterialIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ReturnableMaterialIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:TraceID">
      <report flag="warning" test=".">
	Element 'cbc:TraceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:CustomsIdentification">
      <report flag="warning" test=".">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:FloorSpaceMeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:FloorSpaceMeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:GoodsItem">
      <report flag="warning" test=".">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HandlingUnitDespatchLine">
      <report flag="warning" test=".">
	Element 'cac:HandlingUnitDespatchLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HazardousGoodsTransit">
      <report flag="warning" test=".">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MaximumTemperature">
      <report flag="warning" test=".">
	Element 'cac:MaximumTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MaximumMeasure">
      <report flag="warning" test=".">
	Element 'cbc:MaximumMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MinimumMeasure">
      <report flag="warning" test=".">
	Element 'cbc:MinimumMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MinimumTemperature">
      <report flag="warning" test=".">
	Element 'cac:MinimumTemperature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Package">
      <report flag="warning" test=".">
	Element 'cac:Package' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:PalletSpaceMeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:PalletSpaceMeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReceivedHandlingUnitReceiptLine">
      <report flag="warning" test=".">
	Element 'cac:ReceivedHandlingUnitReceiptLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReferencedShipment">
      <report flag="warning" test=".">
	Element 'cac:ReferencedShipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ShipmentDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ShipmentDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Status">
      <report flag="warning" test=".">
	Element 'cac:Status' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment">
      <report flag="warning" test=".">
	Element 'cac:TransportEquipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportMeans">
      <report flag="warning" test=".">
	Element 'cac:TransportMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:DamageRemarks">
      <report flag="warning" test=".">
	Element 'cbc:DamageRemarks' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingCode">
      <report flag="warning" test=".">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ShippingMarks">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TotalPackageQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalPackageQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TraceID">
      <report flag="warning" test=".">
	Element 'cbc:TraceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ConsignmentQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredCustomsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeliveryInstructions">
      <report flag="warning" test=".">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:FreeOnBoardValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingCode">
      <report flag="warning" test=".">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:Information">
      <report flag="warning" test=".">
	Element 'cbc:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:InsuranceValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ShippingPriorityLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SpecialInstructions">
      <report flag="warning" test=".">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SplitConsignmentIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalGoodsItemQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderQuantity">
      <report flag="warning" test=".">
	Element 'cbc:BackorderQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderReason">
      <report flag="warning" test=".">
	Element 'cbc:BackorderReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:LineStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:Note">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OversupplyQuantity">
      <report flag="warning" test=".">
	Element 'cbc:OversupplyQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty">
      <assert flag="warning" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:DespatchContact">
      <report flag="warning" test=".">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party">
      <assert flag="warning" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification">
      <report flag="warning" test=".">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:SellerContact">
      <report flag="warning" test=".">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:DataSendingCapability">
      <report flag="warning" test=".">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cac:DocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CustomerReference">
      <report flag="warning" test=".">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:OrderTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:SalesOrderID">
      <report flag="warning" test=".">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty">
      <assert flag="warning" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:BuyerContact">
      <report flag="warning" test=".">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party">
      <assert flag="warning" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty">
      <assert flag="warning" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:DespatchContact">
      <report flag="warning" test=".">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party">
      <assert flag="warning" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:SellerContact">
      <report flag="warning" test=".">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:DataSendingCapability">
      <report flag="warning" test=".">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment">
      <assert flag="warning" test="count(cac:Consignment)&lt;=1">
	Element 'cac:Consignment' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:BillOfLadingHolderParty">
      <report flag="warning" test=".">
	Element 'cac:BillOfLadingHolderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty">
      <assert flag="warning" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyIdentification">
      <report flag="warning" test=".">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ChildConsignment">
      <report flag="warning" test=".">
	Element 'cac:ChildConsignment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CollectPaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:CollectPaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsigneeParty">
      <report flag="warning" test=".">
	Element 'cac:ConsigneeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsignorParty">
      <report flag="warning" test=".">
	Element 'cac:ConsignorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsolidatedShipment">
      <report flag="warning" test=".">
	Element 'cac:ConsolidatedShipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CustomsIdentification">
      <report flag="warning" test=".">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DisbursementPaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:DisbursementPaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExporterParty">
      <report flag="warning" test=".">
	Element 'cac:ExporterParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExtraAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:ExtraAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryParty">
      <report flag="warning" test=".">
	Element 'cac:FinalDeliveryParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryTransportationService">
      <report flag="warning" test=".">
	Element 'cac:FinalDeliveryTransportationService' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDestinationCountry">
      <report flag="warning" test=".">
	Element 'cac:FinalDestinationCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FirstArrivalPortLocation">
      <report flag="warning" test=".">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightForwarderParty">
      <report flag="warning" test=".">
	Element 'cac:FreightForwarderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:HazardousItemNotificationParty">
      <report flag="warning" test=".">
	Element 'cac:HazardousItemNotificationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ImporterParty">
      <report flag="warning" test=".">
	Element 'cac:ImporterParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:InsuranceParty">
      <report flag="warning" test=".">
	Element 'cac:InsuranceParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LastExitPortLocation">
      <report flag="warning" test=".">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LogisticsOperatorParty">
      <report flag="warning" test=".">
	Element 'cac:LogisticsOperatorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MainCarriageShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:MainCarriageShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MortgageHolderParty">
      <report flag="warning" test=".">
	Element 'cac:MortgageHolderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:NotifyParty">
      <report flag="warning" test=".">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OnCarriageShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:OnCarriageShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDepartureCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginalDepartureCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchParty">
      <report flag="warning" test=".">
	Element 'cac:OriginalDespatchParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService">
      <report flag="warning" test=".">
	Element 'cac:OriginalDespatchTransportationService' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PerformingCarrierParty">
      <report flag="warning" test=".">
	Element 'cac:PerformingCarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedDeliveryTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:PlannedDeliveryTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedPickupTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:PlannedPickupTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PreCarriageShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:PreCarriageShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PrepaidPaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PrepaidPaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedDeliveryTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:RequestedDeliveryTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedPickupTransportEvent">
      <report flag="warning" test=".">
	Element 'cac:RequestedPickupTransportEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:Status">
      <report flag="warning" test=".">
	Element 'cac:Status' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:SubstituteCarrierParty">
      <report flag="warning" test=".">
	Element 'cac:SubstituteCarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransitCountry">
      <report flag="warning" test=".">
	Element 'cac:TransitCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportAdvisorParty">
      <report flag="warning" test=".">
	Element 'cac:TransportAdvisorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportContract">
      <report flag="warning" test=".">
	Element 'cac:TransportContract' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportHandlingUnit">
      <report flag="warning" test=".">
	Element 'cac:TransportHandlingUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:AnimalFoodIndicator">
      <report flag="warning" test=".">
	Element 'cbc:AnimalFoodIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BrokerAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:BrokerAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BulkCargoIndicator">
      <report flag="warning" test=".">
	Element 'cbc:BulkCargoIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:CarrierAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:CarrierServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ChargeableWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:ChargeableWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsigneeAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:ConsigneeAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignmentQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignorAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:ConsignorAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsolidatableIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ConsolidatableIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContainerizedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ContainerizedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContractedCarrierAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:ContractedCarrierAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CustomsClearanceServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:CustomsClearanceServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredCustomsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredForCarriageValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredStatisticsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeliveryInstructions">
      <report flag="warning" test=".">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ForwarderServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:ForwarderServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreeOnBoardValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreightForwarderAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:FreightForwarderAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GeneralCargoIndicator">
      <report flag="warning" test=".">
	Element 'cbc:GeneralCargoIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingCode">
      <report flag="warning" test=".">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HaulageInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HaulageInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HumanFoodIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HumanFoodIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Information">
      <report flag="warning" test=".">
	Element 'cbc:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsurancePremiumAmount">
      <report flag="warning" test=".">
	Element 'cbc:InsurancePremiumAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsuranceValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LivestockIndicator">
      <report flag="warning" test=".">
	Element 'cbc:LivestockIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingLengthMeasure">
      <report flag="warning" test=".">
	Element 'cbc:LoadingLengthMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingSequenceID">
      <report flag="warning" test=".">
	Element 'cbc:LoadingSequenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:PerformingCarrierAssignedID">
      <report flag="warning" test=".">
	Element 'cbc:PerformingCarrierAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Remarks">
      <report flag="warning" test=".">
	Element 'cbc:Remarks' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SequenceID">
      <report flag="warning" test=".">
	Element 'cbc:SequenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ShippingPriorityLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialInstructions">
      <report flag="warning" test=".">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialSecurityIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SpecialSecurityIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialServiceInstructions">
      <report flag="warning" test=".">
	Element 'cbc:SpecialServiceInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SplitConsignmentIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SummaryDescription">
      <report flag="warning" test=".">
	Element 'cbc:SummaryDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffCode">
      <report flag="warning" test=".">
	Element 'cbc:TariffCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffDescription">
      <report flag="warning" test=".">
	Element 'cbc:TariffDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ThirdPartyPayerIndicator">
      <report flag="warning" test=".">
	Element 'cbc:ThirdPartyPayerIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalGoodsItemQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalInvoiceAmount">
      <report flag="warning" test=".">
	Element 'cbc:TotalInvoiceAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalTransportHandlingUnitQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:AlternativeDeliveryLocation">
      <report flag="warning" test=".">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:CarrierParty">
      <report flag="warning" test=".">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryAddress">
      <report flag="warning" test=".">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryLocation">
      <report flag="warning" test=".">
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryParty">
      <report flag="warning" test=".">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:CarrierParty">
      <report flag="warning" test=".">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress">
      <report flag="warning" test=".">
	Element 'cac:DespatchAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchLocation">
      <report flag="warning" test=".">
	Element 'cac:DespatchLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchParty">
      <report flag="warning" test=".">
	Element 'cac:DespatchParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:EstimatedDespatchPeriod">
      <report flag="warning" test=".">
	Element 'cac:EstimatedDespatchPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:NotifyParty">
      <report flag="warning" test=".">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:RequestedDespatchPeriod">
      <report flag="warning" test=".">
	Element 'cac:RequestedDespatchPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchDate">
      <report flag="warning" test=".">
	Element 'cbc:EstimatedDespatchDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchTime">
      <report flag="warning" test=".">
	Element 'cbc:EstimatedDespatchTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchDate">
      <report flag="warning" test=".">
	Element 'cbc:GuaranteedDespatchDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchTime">
      <report flag="warning" test=".">
	Element 'cbc:GuaranteedDespatchTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:Instructions">
      <report flag="warning" test=".">
	Element 'cbc:Instructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ReleaseID">
      <report flag="warning" test=".">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchDate">
      <report flag="warning" test=".">
	Element 'cbc:RequestedDespatchDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchTime">
      <report flag="warning" test=".">
	Element 'cbc:RequestedDespatchTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MaximumDeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MinimumDeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:NotifyParty">
      <report flag="warning" test=".">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:PromisedDeliveryPeriod">
      <report flag="warning" test=".">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:RequestedDeliveryPeriod">
      <report flag="warning" test=".">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Shipment">
      <report flag="warning" test=".">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryTime">
      <report flag="warning" test=".">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryTime">
      <report flag="warning" test=".">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ReleaseID">
      <report flag="warning" test=".">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ExportCountry">
      <report flag="warning" test=".">
	Element 'cac:ExportCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FirstArrivalPortLocation">
      <report flag="warning" test=".">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FreightAllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:GoodsItem">
      <report flag="warning" test=".">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:LastExitPortLocation">
      <report flag="warning" test=".">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ReturnAddress">
      <report flag="warning" test=".">
	Element 'cac:ReturnAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ShipmentStage">
      <report flag="warning" test=".">
	Element 'cac:ShipmentStage' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cac:TransportHandlingUnit">
      <report flag="warning" test=".">
	Element 'cac:TransportHandlingUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ConsignmentQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredCustomsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeliveryInstructions">
      <report flag="warning" test=".">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:FreeOnBoardValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingCode">
      <report flag="warning" test=".">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingInstructions">
      <report flag="warning" test=".">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:Information">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:InsuranceValueAmount">
      <report flag="warning" test=".">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ShippingPriorityLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SpecialInstructions">
      <report flag="warning" test=".">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SplitConsignmentIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalGoodsItemQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cac:Signature">
      <report flag="warning" test=".">
	Element 'cac:Signature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:CustomizationID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:DespatchAdviceTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DespatchAdviceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:LineCountNumeric">
      <report flag="warning" test=".">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:Note">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileExecutionID">
      <report flag="warning" test=".">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:ProfileID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UBLVersionID">
      <report flag="warning" test=".">
	Element 'cbc:UBLVersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:DespatchAdvice/ext:UBLExtensions">
      <report flag="warning" test=".">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
</schema>
