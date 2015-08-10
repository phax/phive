<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    schemaVersion="iso">
  <title>BII2 CORE restrictions for Order Response Transaction (T02) UBL Order Response 2.1</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AccountingCustomerParty">
      <report flag="warning" test=".">
	Element 'cac:AccountingCustomerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AccountingSupplierParty">
      <report flag="warning" test=".">
	Element 'cac:AccountingSupplierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <report flag="warning" test=".">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <report flag="warning" test=".">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <report flag="warning" test=".">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <report flag="warning" test=".">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <report flag="warning" test=".">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <report flag="warning" test=".">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI">
      <report flag="warning" test=".">
	Element 'cbc:URI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cac:PaymentMeans">
      <report flag="warning" test=".">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cac:TaxCategory">
      <report flag="warning" test=".">
	Element 'cac:TaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cac:TaxTotal">
      <report flag="warning" test=".">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:AccountingCost">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:AllowanceChargeReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:BaseAmount">
      <report flag="warning" test=".">
	Element 'cbc:BaseAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:AllowanceCharge/cbc:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
      <report flag="warning" test=".">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
      <report flag="warning" test=".">
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country">
      <report flag="warning" test=".">
	Element 'cac:Country' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
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
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cac:ContractDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ContractDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cac:ContractualDelivery">
      <report flag="warning" test=".">
	Element 'cac:ContractualDelivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cac:NominationPeriod">
      <report flag="warning" test=".">
	Element 'cac:NominationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:ContractType">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:ContractTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:ContractTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:Contract/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:NominationDate">
      <report flag="warning" test=".">
	Element 'cbc:NominationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:NominationTime">
      <report flag="warning" test=".">
	Element 'cbc:NominationTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Contract/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:AlternativeDeliveryLocation">
      <report flag="warning" test=".">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:CarrierParty">
      <report flag="warning" test=".">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:Region">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cac:Address">
      <report flag="warning" test=".">
	Element 'cac:Address' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:AllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address">
      <report flag="warning" test=".">
	Element 'cac:Address' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cac:DeliveryLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cbc:Amount">
      <report flag="warning" test=".">
	Element 'cbc:Amount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cbc:LossRisk">
      <report flag="warning" test=".">
	Element 'cbc:LossRisk' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cbc:LossRiskResponsibilityCode">
      <report flag="warning" test=".">
	Element 'cbc:LossRiskResponsibilityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms/cbc:SpecialTerms">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:Despatch">
      <report flag="warning" test=".">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:EstimatedDeliveryPeriod">
      <report flag="warning" test=".">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:MaximumDeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:MinimumDeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:NotifyParty">
      <report flag="warning" test=".">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod">
      <report flag="warning" test=".">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cac:Shipment">
      <report flag="warning" test=".">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryTime">
      <report flag="warning" test=".">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryTime">
      <report flag="warning" test=".">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:ReleaseID">
      <report flag="warning" test=".">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Delivery/cbc:TrackingID">
      <report flag="warning" test=".">
	Element 'cbc:TrackingID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:DestinationCountry">
      <report flag="warning" test=".">
	Element 'cac:DestinationCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:FreightForwarderParty">
      <report flag="warning" test=".">
	Element 'cac:FreightForwarderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount">
      <report flag="warning" test=".">
	Element 'cbc:PayableAlternativeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:BuyerProposedSubstituteLineItem">
      <report flag="warning" test=".">
	Element 'cac:BuyerProposedSubstituteLineItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:CatalogueLineReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueLineReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:DocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:AllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:AlternativeDeliveryLocation">
      <report flag="warning" test=".">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:CarrierParty">
      <report flag="warning" test=".">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress">
      <report flag="warning" test=".">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation">
      <report flag="warning" test=".">
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty">
      <report flag="warning" test=".">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch">
      <report flag="warning" test=".">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod">
      <report flag="warning" test=".">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MaximumDeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MinimumDeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:NotifyParty">
      <report flag="warning" test=".">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod">
      <report flag="warning" test=".">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Shipment">
      <report flag="warning" test=".">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime">
      <report flag="warning" test=".">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime">
      <report flag="warning" test=".">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ReleaseID">
      <report flag="warning" test=".">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID">
      <report flag="warning" test=".">
	Element 'cbc:TrackingID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
      <report flag="warning" test=".">
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
      <report flag="warning" test=".">
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
      <report flag="warning" test=".">
	Element 'cac:RangeDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
      <report flag="warning" test=".">
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
      <report flag="warning" test=".">
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
      <report flag="warning" test=".">
	Element 'cbc:ListValue' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
      <report flag="warning" test=".">
	Element 'cbc:NameCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
      <report flag="warning" test=".">
	Element 'cbc:TestMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier">
      <report flag="warning" test=".">
	Element 'cbc:ValueQualifier' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ValueQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate">
      <report flag="warning" test=".">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
      <report flag="warning" test=".">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent">
      <report flag="warning" test="@format">
	Attribute '@format' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
      <report flag="warning" test=".">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
      <report flag="warning" test=".">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
      <report flag="warning" test=".">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:CommodityCode">
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
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:ItemClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:NatureCode">
      <report flag="warning" test=".">
	Element 'cbc:NatureCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Dimension">
      <report flag="warning" test=".">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem">
      <report flag="warning" test=".">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance">
      <report flag="warning" test=".">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty">
      <report flag="warning" test=".">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
      <report flag="warning" test=".">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
      <report flag="warning" test=".">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName">
      <report flag="warning" test=".">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword">
      <report flag="warning" test=".">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName">
      <report flag="warning" test=".">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity">
      <report flag="warning" test=".">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric">
      <report flag="warning" test=".">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OrderedShipment">
      <report flag="warning" test=".">
	Element 'cac:OrderedShipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OriginatorParty">
      <report flag="warning" test=".">
	Element 'cac:OriginatorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cac:PaymentMeans">
      <report flag="warning" test=".">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cac:TaxCategory">
      <report flag="warning" test=".">
	Element 'cac:TaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cac:TaxTotal">
      <report flag="warning" test=".">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AccountingCost">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList">
      <report flag="warning" test=".">
	Element 'cac:PriceList' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PricingExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity">
      <report flag="warning" test="@unitCode">
	Attribute '@unitCode' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListID">
	Attribute '@unitCodeListID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyID">
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyName">
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate">
      <report flag="warning" test=".">
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason">
      <report flag="warning" test=".">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType">
      <report flag="warning" test=".">
	Element 'cbc:PriceType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:PricingReference">
      <report flag="warning" test=".">
	Element 'cac:PricingReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:SubLineItem">
      <report flag="warning" test=".">
	Element 'cac:SubLineItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyParty">
      <report flag="warning" test=".">
	Element 'cac:WarrantyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCost">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:BackOrderAllowedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode">
      <report flag="warning" test=".">
	Element 'cbc:InspectionMethodCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumBackorderQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumBackorderQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity">
      <report flag="warning" test="@unitCode">
	Attribute '@unitCode' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListID">
	Attribute '@unitCodeListID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyID">
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyName">
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:SalesOrderID">
      <report flag="warning" test=".">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:WarrantyInformation">
      <report flag="warning" test=".">
	Element 'cbc:WarrantyInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference">
      <report flag="warning" test=".">
	Element 'cac:OrderLineReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:QuotationLineReference">
      <report flag="warning" test=".">
	Element 'cac:QuotationLineReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerProposedSubstituteLineItem">
      <report flag="warning" test=".">
	Element 'cac:SellerProposedSubstituteLineItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem">
      <report flag="warning" test=".">
	Element 'cac:SellerSubstitutedLineItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cbc:Note">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderLine/cbc:SubstitutionStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:SubstitutionStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cac:DocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:CustomerReference">
      <report flag="warning" test=".">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:OrderTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:SalesOrderID">
      <report flag="warning" test=".">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OrderReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:BuyerContact">
      <report flag="warning" test=".">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PaymentExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PaymentExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PaymentMeans">
      <report flag="warning" test=".">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:PricingExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:DespatchContact">
      <report flag="warning" test=".">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
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
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country">
      <report flag="warning" test=".">
	Element 'cac:Country' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName">
      <report flag="warning" test=".">
	Element 'cbc:CityName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID">
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
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
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
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:SellerContact">
      <report flag="warning" test=".">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:DataSendingCapability">
      <report flag="warning" test=".">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:Signature">
      <report flag="warning" test=".">
	Element 'cac:Signature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TaxExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:TaxExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TaxTotal/cac:TaxSubtotal">
      <report flag="warning" test=".">
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TaxTotal/cbc:RoundingAmount">
      <report flag="warning" test=".">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TaxTotal/cbc:TaxEvidenceIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TaxTotal/cbc:TaxIncludedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:ValidityPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:ValidityPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:ValidityPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:ValidityPeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:ValidityPeriod/cbc:StartDate">
      <report flag="warning" test=".">
	Element 'cbc:StartDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cac:ValidityPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:AccountingCost">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomerReference">
      <report flag="warning" test=".">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:CustomizationID">
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
    <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode">
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
    <rule context="/p1:OrderResponse/cbc:GrossVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ID">
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
    <rule context="/p1:OrderResponse/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:LineCountNumeric">
      <report flag="warning" test=".">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:NetNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:NetVolumeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:Note">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:OrderResponseCode">
      <report flag="warning" test=".">
	Element 'cbc:OrderResponseCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:PricingCurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:PricingCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileExecutionID">
      <report flag="warning" test=".">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:ProfileID">
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
    <rule context="/p1:OrderResponse/cbc:SalesOrderID">
      <report flag="warning" test=".">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:TaxCurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:TotalPackagesQuantity">
      <report flag="warning" test=".">
	Element 'cbc:TotalPackagesQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UBLVersionID">
      <report flag="warning" test=".">
	Element 'cbc:UBLVersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:OrderResponse/ext:UBLExtensions">
      <report flag="warning" test=".">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
</schema>
