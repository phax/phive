<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    schemaVersion="iso">
  <title>BII2 CORE restrictions for Tender Transaction (T44) UBL-Tender-2.1</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Tender-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test=".">
	Element 'cbc:CityName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test=".">
	Element 'cbc:CompanyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:IdentificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IdentificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:Country">
      <report flag="warning" test=".">
	Element 'cac:Country' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test=".">
	Element 'cbc:CityName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cbc:ActivityCode">
      <report flag="warning" test=".">
	Element 'cbc:ActivityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cbc:BuyerProfileURI">
      <report flag="warning" test=".">
	Element 'cbc:BuyerProfileURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ContractingParty/cbc:ContractingPartyTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:ContractingPartyTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cac:Attachment/cac:ExternalReference">
      <report flag="warning" test=".">
	Element 'cac:ExternalReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentTypeCode">
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
    <rule context="/p1:Tender/cac:DocumentReference/cbc:ID">
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
    <rule context="/p1:Tender/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:BuyerContact">
      <report flag="warning" test=".">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IdentificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test=".">
	Element 'cbc:CityName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test=".">
	Element 'cbc:CompanyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:IdentificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IdentificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation">
      <report flag="warning" test=".">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Conditions">
      <report flag="warning" test=".">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI">
      <report flag="warning" test=".">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cac:DigitalSignatureAttachment">
      <report flag="warning" test=".">
	Element 'cac:DigitalSignatureAttachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cac:OriginalDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:OriginalDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cac:SignatoryParty">
      <report flag="warning" test=".">
	Element 'cac:SignatoryParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cbc:CanonicalizationMethod">
      <report flag="warning" test=".">
	Element 'cbc:CanonicalizationMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cbc:ID">
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
    <rule context="/p1:Tender/cac:Signature/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cbc:SignatureMethod">
      <report flag="warning" test=".">
	Element 'cbc:SignatureMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cbc:ValidationDate">
      <report flag="warning" test=".">
	Element 'cbc:ValidationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cbc:ValidationTime">
      <report flag="warning" test=".">
	Element 'cbc:ValidationTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:Signature/cbc:ValidatorID">
      <report flag="warning" test=".">
	Element 'cbc:ValidatorID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:SubcontractorParty">
      <report flag="warning" test=".">
	Element 'cac:SubcontractorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cac:SubordinateAwardingCriteriaResponse">
      <report flag="warning" test=".">
	Element 'cac:SubordinateAwardingCriteriaResponse' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:AwardingCriteriaDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:AwardingCriteriaID">
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
    <rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount">
      <report flag="warning" test=".">
	Element 'cbc:AllowanceTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount">
      <report flag="warning" test=".">
	Element 'cbc:ChargeTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
      <report flag="warning" test=".">
	Element 'cbc:LineExtensionAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount">
      <report flag="warning" test=".">
	Element 'cbc:PayableAlternativeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount">
      <report flag="warning" test=".">
	Element 'cbc:PayableRoundingAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PrepaidAmount">
      <report flag="warning" test=".">
	Element 'cbc:PrepaidAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount">
      <report flag="warning" test=".">
	Element 'cbc:TaxExclusiveAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cac:TaxSubtotal">
      <report flag="warning" test=".">
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:RoundingAmount">
      <report flag="warning" test=".">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:TaxEvidenceIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:TaxIncludedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:DocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:AdditionalItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:AdditionalItemProperty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:BuyersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CatalogueDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CatalogueItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:Certificate">
      <report flag="warning" test=".">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ClassifiedTaxCategory">
      <report flag="warning" test=".">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CommodityClassification">
      <report flag="warning" test=".">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:Dimension">
      <report flag="warning" test=".">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:HazardousItem">
      <report flag="warning" test=".">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:InformationContentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ItemInstance">
      <report flag="warning" test=".">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ItemSpecificationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ManufacturerParty">
      <report flag="warning" test=".">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ManufacturersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:OriginCountry">
      <report flag="warning" test=".">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:SellersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:SellersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:StandardItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:StandardItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:BrandName">
      <report flag="warning" test=".">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:CatalogueIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Keyword">
      <report flag="warning" test=".">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:ModelName">
      <report flag="warning" test=".">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:PackQuantity">
      <report flag="warning" test=".">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:PackSizeNumeric">
      <report flag="warning" test=".">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:OfferedItemLocationQuantity">
      <report flag="warning" test=".">
	Element 'cac:OfferedItemLocationQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:ReplacementRelatedItem">
      <report flag="warning" test=".">
	Element 'cac:ReplacementRelatedItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:SubTenderLine">
      <report flag="warning" test=".">
	Element 'cac:SubTenderLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:WarrantyParty">
      <report flag="warning" test=".">
	Element 'cac:WarrantyParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:WarrantyValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:ContentUnitQuantity">
      <report flag="warning" test=".">
	Element 'cbc:ContentUnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:ID">
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
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:MaximumOrderQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MaximumOrderQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:MinimumOrderQuantity">
      <report flag="warning" test=".">
	Element 'cbc:MinimumOrderQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:OrderQuantityIncrementNumeric">
      <report flag="warning" test=".">
	Element 'cbc:OrderQuantityIncrementNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:OrderableUnit">
      <report flag="warning" test=".">
	Element 'cbc:OrderableUnit' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:PackLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:PackLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:Quantity">
      <report flag="warning" test=".">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:WarrantyInformation">
      <report flag="warning" test=".">
	Element 'cbc:WarrantyInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cbc:FeeDescription">
      <report flag="warning" test=".">
	Element 'cbc:FeeDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TenderedProject/cbc:ProcurementProjectLotID">
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
    <rule context="/p1:Tender/cac:TenderedProject/cbc:VariantID">
      <report flag="warning" test=".">
	Element 'cbc:VariantID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyIdentification/cbc:ID">
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
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test=".">
	Element 'cbc:CityName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test=".">
	Element 'cbc:CompanyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
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
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cbc:IndustryClassificationCode">
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
    <rule context="/p1:Tender/cac:TendererParty/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:TendererParty/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ValidityPeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ValidityPeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ValidityPeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ValidityPeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cac:ValidityPeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cbc:ContractFolderID">
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
    <rule context="/p1:Tender/cbc:ContractName">
      <report flag="warning" test=".">
	Element 'cbc:ContractName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cbc:CustomizationID">
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
    <rule context="/p1:Tender/cbc:ID">
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
    <rule context="/p1:Tender/cbc:Note">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cbc:ProfileExecutionID">
      <report flag="warning" test=".">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cbc:ProfileID">
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
    <rule context="/p1:Tender/cbc:TenderTypeCode">
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
    <rule context="/p1:Tender/cbc:UBLVersionID">
      <report flag="warning" test=".">
	Element 'cbc:UBLVersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Tender/ext:UBLExtensions">
      <report flag="warning" test=".">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
</schema>
