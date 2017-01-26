<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    schemaVersion="iso">
  <title>BII2 CORE restrictions for Call For Tenders Transaction (T40) UBL-CallForTenders-2.1</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CallForTenders-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <report flag="warning" test=".">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <report flag="warning" test=".">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <report flag="warning" test=".">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <report flag="warning" test=".">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <report flag="warning" test=".">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <report flag="warning" test=".">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI">
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
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:AdditionalDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test=".">
	Element 'cbc:CityName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test=".">
	Element 'cbc:CompanyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cbc:ActivityCode">
      <report flag="warning" test=".">
	Element 'cbc:ActivityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cbc:BuyerProfileURI">
      <report flag="warning" test=".">
	Element 'cbc:BuyerProfileURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ContractingParty/cbc:ContractingPartyTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:ContractingPartyTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:LegalDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:LegalDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:BuyerContact">
      <report flag="warning" test=".">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test=".">
	Element 'cbc:CityName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test=".">
	Element 'cbc:CompanyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:BudgetAmount/cac:ApplicableTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ApplicableTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:BudgetAmount/cbc:AverageSubsequentContractAmount">
      <report flag="warning" test=".">
	Element 'cbc:AverageSubsequentContractAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:BudgetAmount/cbc:EstimatedOverallContractAmount">
      <report flag="warning" test=".">
	Element 'cbc:EstimatedOverallContractAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:BudgetAmount/cbc:MinimumAmount">
      <report flag="warning" test=".">
	Element 'cbc:MinimumAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:BudgetAmount/cbc:MonetaryScope">
      <report flag="warning" test=".">
	Element 'cbc:MonetaryScope' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:BudgetAmount/cbc:TaxExclusiveAmount">
      <report flag="warning" test=".">
	Element 'cbc:TaxExclusiveAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:ContractExtension/cac:OptionValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:OptionValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:ContractExtension/cac:Renewal">
      <report flag="warning" test=".">
	Element 'cac:Renewal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:ContractExtension/cbc:MaximumNumberNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MaximumNumberNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:ContractExtension/cbc:MinimumNumberNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MinimumNumberNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:ContractExtension/cbc:OptionsDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:PlannedPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:PlannedPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:PlannedPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RealizedLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:DocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
      <report flag="warning" test=".">
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
      <report flag="warning" test=".">
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
      <report flag="warning" test=".">
	Element 'cac:RangeDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
      <report flag="warning" test=".">
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
      <report flag="warning" test=".">
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
      <report flag="warning" test=".">
	Element 'cbc:ListValue' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
      <report flag="warning" test=".">
	Element 'cbc:NameCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
      <report flag="warning" test=".">
	Element 'cbc:TestMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:Value">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier">
      <report flag="warning" test=".">
	Element 'cbc:ValueQualifier' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ValueQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:BuyersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cbc:ExtendedID">
      <report flag="warning" test=".">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:Certificate">
      <report flag="warning" test=".">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ClassifiedTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CommodityClassification">
      <report flag="warning" test=".">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:Dimension">
      <report flag="warning" test=".">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:HazardousItem">
      <report flag="warning" test=".">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:InformationContentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ItemInstance">
      <report flag="warning" test=".">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ItemSpecificationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ManufacturerParty">
      <report flag="warning" test=".">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ManufacturersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:OriginCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:SellersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:SellersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:StandardItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:StandardItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:BrandName">
      <report flag="warning" test=".">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:CatalogueIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:Keyword">
      <report flag="warning" test=".">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:ModelName">
      <report flag="warning" test=".">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:PackQuantity">
      <report flag="warning" test=".">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:PackSizeNumeric">
      <report flag="warning" test=".">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:AllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:ApplicableTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ApplicableTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress">
      <report flag="warning" test=".">
	Element 'cac:ApplicableTerritoryAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:DeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:DependentPriceReference">
      <report flag="warning" test=".">
	Element 'cac:DependentPriceReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Package">
      <report flag="warning" test=".">
	Element 'cac:Package' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:AllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PriceList">
      <report flag="warning" test=".">
	Element 'cac:PriceList' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PricingExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity">
      <report flag="warning" test=".">
	Element 'cbc:BaseQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:OrderableUnitFactorRate">
      <report flag="warning" test=".">
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceChangeReason">
      <report flag="warning" test=".">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType">
      <report flag="warning" test=".">
	Element 'cbc:PriceType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:LeadTimeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:TradingRestrictions">
      <report flag="warning" test=".">
	Element 'cbc:TradingRestrictions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:SubRequestForTenderLine">
      <report flag="warning" test=".">
	Element 'cac:SubRequestForTenderLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cac:WarrantyValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cbc:MaximumQuantity">
      <report flag="warning" test="@unitCodeListID">
	Attribute '@unitCodeListID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyID">
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyName">
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cbc:MaximumTaxInclusiveAmount">
      <report flag="warning" test=".">
	Element 'cbc:MaximumTaxInclusiveAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cbc:MinimumQuantity">
      <report flag="warning" test="@unitCodeListID">
	Attribute '@unitCodeListID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyID">
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyName">
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cbc:Quantity">
      <report flag="warning" test="@unitCodeListID">
	Attribute '@unitCodeListID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyID">
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyName">
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequestForTenderLine/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:CargoTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:CommodityCode">
      <report flag="warning" test=".">
	Element 'cbc:CommodityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:ItemClassificationCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:NatureCode">
      <report flag="warning" test=".">
	Element 'cbc:NatureCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:EstimatedOverallContractQuantity">
      <report flag="warning" test=".">
	Element 'cbc:EstimatedOverallContractQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:FeeDescription">
      <report flag="warning" test=".">
	Element 'cbc:FeeDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:ProcurementSubTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:ProcurementTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:QualityControlCode">
      <report flag="warning" test=".">
	Element 'cbc:QualityControlCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:RequestedDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:RequestedDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProject/cbc:RequiredFeeAmount">
      <report flag="warning" test=".">
	Element 'cbc:RequiredFeeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:BudgetAmount/cac:ApplicableTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ApplicableTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:BudgetAmount/cbc:AverageSubsequentContractAmount">
      <report flag="warning" test=".">
	Element 'cbc:AverageSubsequentContractAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:BudgetAmount/cbc:EstimatedOverallContractAmount">
      <report flag="warning" test=".">
	Element 'cbc:EstimatedOverallContractAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:BudgetAmount/cbc:MinimumAmount">
      <report flag="warning" test=".">
	Element 'cbc:MinimumAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:BudgetAmount/cbc:MonetaryScope">
      <report flag="warning" test=".">
	Element 'cbc:MonetaryScope' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:BudgetAmount/cbc:TaxExclusiveAmount">
      <report flag="warning" test=".">
	Element 'cbc:TaxExclusiveAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:ContractExtension/cac:OptionValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:OptionValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:ContractExtension/cac:Renewal">
      <report flag="warning" test=".">
	Element 'cac:Renewal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:ContractExtension/cbc:MaximumNumberNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MaximumNumberNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:ContractExtension/cbc:MinimumNumberNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MinimumNumberNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:ContractExtension/cbc:OptionsDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:PlannedPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:PlannedPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:PlannedPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:Address/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RealizedLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:DeliveryPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:DocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
      <report flag="warning" test=".">
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
      <report flag="warning" test=".">
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
      <report flag="warning" test=".">
	Element 'cac:RangeDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
      <report flag="warning" test=".">
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
      <report flag="warning" test=".">
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
      <report flag="warning" test=".">
	Element 'cbc:ListValue' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
      <report flag="warning" test=".">
	Element 'cbc:NameCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
      <report flag="warning" test=".">
	Element 'cbc:TestMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:Value">
      <report flag="warning" test=".">
	Element 'cbc:Value' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier">
      <report flag="warning" test=".">
	Element 'cbc:ValueQualifier' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ValueQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:BuyersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cbc:ExtendedID">
      <report flag="warning" test=".">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CatalogueItemIdentification/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:Certificate">
      <report flag="warning" test=".">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ClassifiedTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:CommodityClassification">
      <report flag="warning" test=".">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:Dimension">
      <report flag="warning" test=".">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:HazardousItem">
      <report flag="warning" test=".">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:InformationContentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ItemInstance">
      <report flag="warning" test=".">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ItemSpecificationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ManufacturerParty">
      <report flag="warning" test=".">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:ManufacturersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:OriginCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:SellersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:SellersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:StandardItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:StandardItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:BrandName">
      <report flag="warning" test=".">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:CatalogueIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:Keyword">
      <report flag="warning" test=".">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:ModelName">
      <report flag="warning" test=".">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:PackQuantity">
      <report flag="warning" test=".">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:Item/cbc:PackSizeNumeric">
      <report flag="warning" test=".">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:AllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:ApplicableTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ApplicableTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress">
      <report flag="warning" test=".">
	Element 'cac:ApplicableTerritoryAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit">
      <report flag="warning" test=".">
	Element 'cac:DeliveryUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:DependentPriceReference">
      <report flag="warning" test=".">
	Element 'cac:DependentPriceReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Package">
      <report flag="warning" test=".">
	Element 'cac:Package' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:AllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PriceList">
      <report flag="warning" test=".">
	Element 'cac:PriceList' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PricingExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity">
      <report flag="warning" test=".">
	Element 'cbc:BaseQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:OrderableUnitFactorRate">
      <report flag="warning" test=".">
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceChangeReason">
      <report flag="warning" test=".">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType">
      <report flag="warning" test=".">
	Element 'cbc:PriceType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure">
      <report flag="warning" test=".">
	Element 'cbc:LeadTimeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:RequiredItemLocationQuantity/cbc:TradingRestrictions">
      <report flag="warning" test=".">
	Element 'cbc:TradingRestrictions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:SubRequestForTenderLine">
      <report flag="warning" test=".">
	Element 'cac:SubRequestForTenderLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cac:WarrantyValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cbc:MaximumQuantity">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cbc:MinimumQuantity">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cbc:Quantity">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequestForTenderLine/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:CargoTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:CommodityCode">
      <report flag="warning" test=".">
	Element 'cbc:CommodityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:ItemClassificationCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cac:RequiredCommodityClassification/cbc:NatureCode">
      <report flag="warning" test=".">
	Element 'cbc:NatureCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:EstimatedOverallContractQuantity">
      <report flag="warning" test=".">
	Element 'cbc:EstimatedOverallContractQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:FeeDescription">
      <report flag="warning" test=".">
	Element 'cbc:FeeDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:ProcurementSubTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:ProcurementTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:QualityControlCode">
      <report flag="warning" test=".">
	Element 'cbc:QualityControlCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:RequestedDeliveryDate">
      <report flag="warning" test=".">
	Element 'cbc:RequestedDeliveryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:ProcurementProject/cbc:RequiredFeeAmount">
      <report flag="warning" test=".">
	Element 'cbc:RequiredFeeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AdditionalInformationParty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalInformationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:Amount">
      <report flag="warning" test=".">
	Element 'cbc:Amount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:Rate">
      <report flag="warning" test=".">
	Element 'cbc:Rate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:UnknownPriceIndicator">
      <report flag="warning" test=".">
	Element 'cbc:UnknownPriceIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AppealTerms/cac:AppealInformationParty">
      <report flag="warning" test=".">
	Element 'cac:AppealInformationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AppealTerms/cac:AppealReceiverParty">
      <report flag="warning" test=".">
	Element 'cac:AppealReceiverParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AppealTerms/cac:MediationParty">
      <report flag="warning" test=".">
	Element 'cac:MediationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AppealTerms/cac:PresentationPeriod">
      <report flag="warning" test=".">
	Element 'cac:PresentationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AppealTerms/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cac:SubordinateAwardingCriteria">
      <report flag="warning" test=".">
	Element 'cac:SubordinateAwardingCriteria' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:AwardingCriteriaTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:CalculationExpression">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:CalculationExpressionCode">
      <report flag="warning" test=".">
	Element 'cbc:CalculationExpressionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:MaximumQuantity">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:MinimumImprovementBid">
      <report flag="warning" test=".">
	Element 'cbc:MinimumImprovementBid' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:MinimumQuantity">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:Weight">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:WeightNumeric">
      <report flag="warning" test=".">
	Element 'cbc:WeightNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cac:TechnicalCommitteePerson">
      <report flag="warning" test=".">
	Element 'cac:TechnicalCommitteePerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cbc:LowTendersDescription">
      <report flag="warning" test=".">
	Element 'cbc:LowTendersDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cbc:TechnicalCommitteeDescription">
      <report flag="warning" test=".">
	Element 'cbc:TechnicalCommitteeDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:AwardingTerms/cbc:WeightingAlgorithmCode">
      <report flag="warning" test=".">
	Element 'cbc:WeightingAlgorithmCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:BudgetAccountLine">
      <report flag="warning" test=".">
	Element 'cac:BudgetAccountLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:CallForTenderDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CallForTenderDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ContractAcceptancePeriod">
      <report flag="warning" test=".">
	Element 'cac:ContractAcceptancePeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ContractExecutionRequirement">
      <report flag="warning" test=".">
	Element 'cac:ContractExecutionRequirement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ContractResponsibleParty">
      <report flag="warning" test=".">
	Element 'cac:ContractResponsibleParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ContractualDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ContractualDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:DocumentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:DocumentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:EmploymentLegislationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:EnvironmentalLegislationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:FiscalLegislationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:FiscalLegislationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:PaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cac:ConstitutionPeriod">
      <report flag="warning" test=".">
	Element 'cac:ConstitutionPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:AmountRate">
      <report flag="warning" test=".">
	Element 'cbc:AmountRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:GuaranteeTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:LiabilityAmount">
      <report flag="warning" test=".">
	Element 'cbc:LiabilityAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderEvaluationParty">
      <report flag="warning" test=".">
	Element 'cac:TenderEvaluationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderPreparation/cac:DocumentTenderRequirement">
      <report flag="warning" test=".">
	Element 'cac:DocumentTenderRequirement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderPreparation/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderPreparation/cbc:OpenTenderID">
      <report flag="warning" test=".">
	Element 'cbc:OpenTenderID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderPreparation/cbc:ProcurementProjectLotID">
      <report flag="warning" test=".">
	Element 'cbc:ProcurementProjectLotID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderPreparation/cbc:TenderEnvelopeID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderPreparation/cbc:TenderEnvelopeTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TenderEnvelopeTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderRecipientParty">
      <report flag="warning" test=".">
	Element 'cac:TenderRecipientParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TenderValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:TenderValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:DurationPeriod">
      <report flag="warning" test=".">
	Element 'cac:DurationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference">
      <report flag="warning" test=".">
	Element 'cac:ExternalReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:EvidenceIssuingParty">
      <report flag="warning" test=".">
	Element 'cac:EvidenceIssuingParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cbc:EvidenceTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:EvaluationCriteriaTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:ExpressionCode">
      <report flag="warning" test=".">
	Element 'cbc:ExpressionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:ThresholdAmount">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:ThresholdQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:RequiredBusinessClassificationScheme">
      <report flag="warning" test=".">
	Element 'cac:RequiredBusinessClassificationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference">
      <report flag="warning" test=".">
	Element 'cac:ExternalReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:EvidenceIssuingParty">
      <report flag="warning" test=".">
	Element 'cac:EvidenceIssuingParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cbc:EvidenceTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cbc:TendererRequirementTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TendererRequirementTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:DurationPeriod">
      <report flag="warning" test=".">
	Element 'cac:DurationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference">
      <report flag="warning" test=".">
	Element 'cac:ExternalReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:EvidenceIssuingParty">
      <report flag="warning" test=".">
	Element 'cac:EvidenceIssuingParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cbc:EvidenceTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:EvaluationCriteriaTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:ExpressionCode">
      <report flag="warning" test=".">
	Element 'cbc:ExpressionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:ThresholdAmount">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:ThresholdQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:EmployeeQuantity">
      <report flag="warning" test=".">
	Element 'cbc:EmployeeQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:LegalForm">
      <report flag="warning" test=".">
	Element 'cbc:LegalForm' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:OperatingYearsQuantity">
      <report flag="warning" test=".">
	Element 'cbc:OperatingYearsQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:PersonalSituation">
      <report flag="warning" test=".">
	Element 'cbc:PersonalSituation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cac:WarrantyValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:AcceptedVariantsDescription">
      <report flag="warning" test=".">
	Element 'cbc:AcceptedVariantsDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:AwardingMethodTypeCode">
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
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:EconomicOperatorRegistryURI">
      <report flag="warning" test=".">
	Element 'cbc:EconomicOperatorRegistryURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:FundingProgram">
      <report flag="warning" test=".">
	Element 'cbc:FundingProgram' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:FundingProgramCode">
      <report flag="warning" test=".">
	Element 'cbc:FundingProgramCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:MaximumAdvertisementAmount">
      <report flag="warning" test=".">
	Element 'cbc:MaximumAdvertisementAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:MaximumVariantQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumVariantQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:PaymentFrequencyCode">
      <report flag="warning" test=".">
	Element 'cbc:PaymentFrequencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:PenaltyClauses">
      <report flag="warning" test=".">
	Element 'cbc:PenaltyClauses' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:PriceEvaluationCode">
      <report flag="warning" test=".">
	Element 'cbc:PriceEvaluationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:PriceRevisionFormulaDescription">
      <report flag="warning" test=".">
	Element 'cbc:PriceRevisionFormulaDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cac:TenderingTerms/cbc:RequiredCurriculaIndicator">
      <report flag="warning" test=".">
	Element 'cbc:RequiredCurriculaIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:ProcurementProjectLot/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:ReceiverParty">
      <report flag="warning" test=".">
	Element 'cac:ReceiverParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:Signature">
      <report flag="warning" test=".">
	Element 'cac:Signature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TechnicalDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:TechnicalDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AdditionalDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AuctionTerms/cbc:AuctionConstraintIndicator">
      <report flag="warning" test=".">
	Element 'cbc:AuctionConstraintIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AuctionTerms/cbc:AuctionURI">
      <report flag="warning" test=".">
	Element 'cbc:AuctionURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AuctionTerms/cbc:ConditionsDescription">
      <report flag="warning" test=".">
	Element 'cbc:ConditionsDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AuctionTerms/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AuctionTerms/cbc:ElectronicDeviceDescription">
      <report flag="warning" test=".">
	Element 'cbc:ElectronicDeviceDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AuctionTerms/cbc:JustificationDescription">
      <report flag="warning" test=".">
	Element 'cbc:JustificationDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:AuctionTerms/cbc:ProcessDescription">
      <report flag="warning" test=".">
	Element 'cbc:ProcessDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:DocumentAvailabilityPeriod">
      <report flag="warning" test=".">
	Element 'cac:DocumentAvailabilityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:EconomicOperatorShortList">
      <report flag="warning" test=".">
	Element 'cac:EconomicOperatorShortList' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:FrameworkAgreement/cac:DurationPeriod">
      <report flag="warning" test=".">
	Element 'cac:DurationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:FrameworkAgreement/cac:SubsequentProcessTenderRequirement">
      <report flag="warning" test=".">
	Element 'cac:SubsequentProcessTenderRequirement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:FrameworkAgreement/cbc:ExpectedOperatorQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ExpectedOperatorQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:FrameworkAgreement/cbc:Frequency">
      <report flag="warning" test=".">
	Element 'cbc:Frequency' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:FrameworkAgreement/cbc:Justification">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:FrameworkAgreement/cbc:MaximumOperatorQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumOperatorQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:InvitationSubmissionPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:InvitationSubmissionPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:InvitationSubmissionPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:InvitationSubmissionPeriod/cbc:StartDate">
      <report flag="warning" test=".">
	Element 'cbc:StartDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:InvitationSubmissionPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:NoticeDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:NoticeDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cac:CurrentStatus">
      <report flag="warning" test=".">
	Element 'cac:CurrentStatus' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cac:OccurenceLocation">
      <report flag="warning" test=".">
	Element 'cac:OccurenceLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cbc:CompletionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CompletionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cbc:IdentificationID">
      <report flag="warning" test=".">
	Element 'cbc:IdentificationID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cbc:OccurrenceDate">
      <report flag="warning" test=".">
	Element 'cbc:OccurrenceDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cbc:OccurrenceTime">
      <report flag="warning" test=".">
	Element 'cbc:OccurrenceTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:OpenTenderEvent/cbc:TypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ParticipationRequestReceptionPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ParticipationRequestReceptionPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ParticipationRequestReceptionPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ParticipationRequestReceptionPeriod/cbc:StartDate">
      <report flag="warning" test=".">
	Element 'cbc:StartDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ParticipationRequestReceptionPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ProcessJustification/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ProcessJustification/cbc:PreviousCancellationReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:PreviousCancellationReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ProcessJustification/cbc:ProcessReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:ProcessJustification/cbc:ProcessReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:ProcessReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:TenderSubmissionDeadlinePeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:TenderSubmissionDeadlinePeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:TenderSubmissionDeadlinePeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:TenderSubmissionDeadlinePeriod/cbc:StartDate">
      <report flag="warning" test=".">
	Element 'cbc:StartDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cac:TenderSubmissionDeadlinePeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:CandidateReductionConstraintIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CandidateReductionConstraintIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:ContractingSystemCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:ExpenseCode">
      <report flag="warning" test=".">
	Element 'cbc:ExpenseCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:GovernmentAgreementConstraintIndicator">
      <report flag="warning" test=".">
	Element 'cbc:GovernmentAgreementConstraintIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:NegotiationDescription">
      <report flag="warning" test=".">
	Element 'cbc:NegotiationDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:OriginalContractingSystemID">
      <report flag="warning" test=".">
	Element 'cbc:OriginalContractingSystemID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:PartPresentationCode">
      <report flag="warning" test=".">
	Element 'cbc:PartPresentationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:ProcedureCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:SubmissionMethodCode">
      <report flag="warning" test=".">
	Element 'cbc:SubmissionMethodCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingProcess/cbc:UrgencyCode">
      <report flag="warning" test=".">
	Element 'cbc:UrgencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms">
      <assert flag="warning" test="count(cac:RequiredFinancialGuarantee)&lt;=1">
	Element 'cac:RequiredFinancialGuarantee' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AdditionalInformationParty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalInformationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:Amount">
      <report flag="warning" test=".">
	Element 'cbc:Amount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:Rate">
      <report flag="warning" test=".">
	Element 'cbc:Rate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AllowedSubcontractTerms/cbc:UnknownPriceIndicator">
      <report flag="warning" test=".">
	Element 'cbc:UnknownPriceIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AppealTerms/cac:AppealInformationParty">
      <report flag="warning" test=".">
	Element 'cac:AppealInformationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AppealTerms/cac:AppealReceiverParty">
      <report flag="warning" test=".">
	Element 'cac:AppealReceiverParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AppealTerms/cac:MediationParty">
      <report flag="warning" test=".">
	Element 'cac:MediationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AppealTerms/cac:PresentationPeriod">
      <report flag="warning" test=".">
	Element 'cac:PresentationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AppealTerms/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cac:SubordinateAwardingCriteria">
      <report flag="warning" test=".">
	Element 'cac:SubordinateAwardingCriteria' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:AwardingCriteriaTypeCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:CalculationExpression">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:CalculationExpressionCode">
      <report flag="warning" test=".">
	Element 'cbc:CalculationExpressionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:MaximumQuantity">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:MinimumImprovementBid">
      <report flag="warning" test=".">
	Element 'cbc:MinimumImprovementBid' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:MinimumQuantity">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:Weight">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:AwardingCriteria/cbc:WeightNumeric">
      <report flag="warning" test=".">
	Element 'cbc:WeightNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cac:TechnicalCommitteePerson">
      <report flag="warning" test=".">
	Element 'cac:TechnicalCommitteePerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cbc:LowTendersDescription">
      <report flag="warning" test=".">
	Element 'cbc:LowTendersDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cbc:TechnicalCommitteeDescription">
      <report flag="warning" test=".">
	Element 'cbc:TechnicalCommitteeDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:AwardingTerms/cbc:WeightingAlgorithmCode">
      <report flag="warning" test=".">
	Element 'cbc:WeightingAlgorithmCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:BudgetAccountLine">
      <report flag="warning" test=".">
	Element 'cac:BudgetAccountLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:CallForTenderDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CallForTenderDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ContractAcceptancePeriod">
      <report flag="warning" test=".">
	Element 'cac:ContractAcceptancePeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ContractExecutionRequirement">
      <report flag="warning" test=".">
	Element 'cac:ContractExecutionRequirement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ContractResponsibleParty">
      <report flag="warning" test=".">
	Element 'cac:ContractResponsibleParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ContractualDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ContractualDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:DocumentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:DocumentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EmploymentLegislationDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:EnvironmentalLegislationDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:FiscalLegislationDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:PaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:ProcurementLegislationDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cac:ConstitutionPeriod">
      <report flag="warning" test=".">
	Element 'cac:ConstitutionPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:AmountRate">
      <report flag="warning" test=".">
	Element 'cbc:AmountRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:GuaranteeTypeCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:RequiredFinancialGuarantee/cbc:LiabilityAmount">
      <report flag="warning" test=".">
	Element 'cbc:LiabilityAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderEvaluationParty">
      <report flag="warning" test=".">
	Element 'cac:TenderEvaluationParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderPreparation/cac:DocumentTenderRequirement">
      <report flag="warning" test=".">
	Element 'cac:DocumentTenderRequirement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderPreparation/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderPreparation/cbc:OpenTenderID">
      <report flag="warning" test=".">
	Element 'cbc:OpenTenderID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderPreparation/cbc:ProcurementProjectLotID">
      <report flag="warning" test=".">
	Element 'cbc:ProcurementProjectLotID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderPreparation/cbc:TenderEnvelopeID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderPreparation/cbc:TenderEnvelopeTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TenderEnvelopeTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderRecipientParty">
      <report flag="warning" test=".">
	Element 'cac:TenderRecipientParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderValidityPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderValidityPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderValidityPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderValidityPeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TenderValidityPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:DurationPeriod">
      <report flag="warning" test=".">
	Element 'cac:DurationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <report flag="warning" test=".">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <report flag="warning" test=".">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <report flag="warning" test=".">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <report flag="warning" test=".">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <report flag="warning" test=".">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <report flag="warning" test=".">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cac:EvidenceIssuingParty">
      <report flag="warning" test=".">
	Element 'cac:EvidenceIssuingParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cbc:EvidenceTypeCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cac:SuggestedEvidence/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:EvaluationCriteriaTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:EvaluationCriteriaTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:ExpressionCode">
      <report flag="warning" test=".">
	Element 'cbc:ExpressionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:ThresholdAmount">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:FinancialEvaluationCriteria/cbc:ThresholdQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:RequiredBusinessClassificationScheme">
      <report flag="warning" test=".">
	Element 'cac:RequiredBusinessClassificationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <report flag="warning" test=".">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <report flag="warning" test=".">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <report flag="warning" test=".">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <report flag="warning" test=".">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <report flag="warning" test=".">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <report flag="warning" test=".">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cac:EvidenceIssuingParty">
      <report flag="warning" test=".">
	Element 'cac:EvidenceIssuingParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cbc:EvidenceTypeCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cac:SuggestedEvidence/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:SpecificTendererRequirement/cbc:TendererRequirementTypeCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:DurationPeriod">
      <report flag="warning" test=".">
	Element 'cac:DurationPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <report flag="warning" test=".">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <report flag="warning" test=".">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <report flag="warning" test=".">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <report flag="warning" test=".">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <report flag="warning" test=".">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <report flag="warning" test=".">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:ID">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cac:EvidenceIssuingParty">
      <report flag="warning" test=".">
	Element 'cac:EvidenceIssuingParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cbc:EvidenceTypeCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cac:SuggestedEvidence/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:EvaluationCriteriaTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:EvaluationCriteriaTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:ExpressionCode">
      <report flag="warning" test=".">
	Element 'cbc:ExpressionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:ThresholdAmount">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cac:TechnicalEvaluationCriteria/cbc:ThresholdQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ThresholdQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:EmployeeQuantity">
      <report flag="warning" test=".">
	Element 'cbc:EmployeeQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:LegalForm">
      <report flag="warning" test=".">
	Element 'cbc:LegalForm' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:OperatingYearsQuantity">
      <report flag="warning" test=".">
	Element 'cbc:OperatingYearsQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:TendererQualificationRequest/cbc:PersonalSituation">
      <report flag="warning" test=".">
	Element 'cbc:PersonalSituation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cac:WarrantyValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:AcceptedVariantsDescription">
      <report flag="warning" test=".">
	Element 'cbc:AcceptedVariantsDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:AwardingMethodTypeCode">
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
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:EconomicOperatorRegistryURI">
      <report flag="warning" test=".">
	Element 'cbc:EconomicOperatorRegistryURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:FundingProgram">
      <report flag="warning" test=".">
	Element 'cbc:FundingProgram' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:FundingProgramCode">
      <report flag="warning" test=".">
	Element 'cbc:FundingProgramCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:MaximumAdvertisementAmount">
      <report flag="warning" test=".">
	Element 'cbc:MaximumAdvertisementAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:MaximumVariantQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumVariantQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:PaymentFrequencyCode">
      <report flag="warning" test=".">
	Element 'cbc:PaymentFrequencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:PenaltyClauses">
      <report flag="warning" test=".">
	Element 'cbc:PenaltyClauses' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:PriceEvaluationCode">
      <report flag="warning" test=".">
	Element 'cbc:PriceEvaluationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:PriceRevisionFormulaDescription">
      <report flag="warning" test=".">
	Element 'cbc:PriceRevisionFormulaDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cac:TenderingTerms/cbc:RequiredCurriculaIndicator">
      <report flag="warning" test=".">
	Element 'cbc:RequiredCurriculaIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cbc:ApprovalDate">
      <report flag="warning" test=".">
	Element 'cbc:ApprovalDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cbc:ContractFolderID">
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
    <rule context="/p1:CallForTenders/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cbc:CustomizationID">
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
    <rule context="/p1:CallForTenders/cbc:ID">
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
    <rule context="/p1:CallForTenders/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cbc:ProfileExecutionID">
      <report flag="warning" test=".">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/cbc:ProfileID">
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
    <rule context="/p1:CallForTenders/cbc:UBLVersionID">
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
    <rule context="/p1:CallForTenders/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CallForTenders/ext:UBLExtensions">
      <report flag="warning" test=".">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
</schema>
