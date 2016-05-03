<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
    <title>OPENPEPPOL CORE T14 bound to UBL</title>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" prefix="p1"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
    <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
    <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
    <pattern>
        <rule context="/p1:CreditNote">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:UBLVersionID)=1">
	Element 'cbc:UBLVersionID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:CustomizationID)=1">
	Element 'cbc:CustomizationID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ProfileID)=1">
	Element 'cbc:ProfileID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:DocumentCurrencyCode)=1">
	Element 'cbc:DocumentCurrencyCode' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:InvoicePeriod)&lt;=1">
	Element 'cac:InvoicePeriod' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ContractDocumentReference)&lt;=1">
	Element 'cac:ContractDocumentReference' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Delivery)&lt;=1">
	Element 'cac:Delivery' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:TaxTotal)&lt;=1">
	Element 'cac:TaxTotal' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:AccountingContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:BuyerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:DeliveryContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)=1">
	Element 'cac:PartyName' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PostalAddress)=1">
	Element 'cac:PostalAddress' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyTaxScheme)&lt;=1">
	Element 'cac:PartyTaxScheme' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyLegalEntity)&lt;=1">
	Element 'cac:PartyLegalEntity' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:AccountingContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:DespatchContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)=1">
	Element 'cac:PartyName' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PostalAddress)=1">
	Element 'cac:PostalAddress' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyTaxScheme)&lt;=1">
	Element 'cac:PartyTaxScheme' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyLegalEntity)&lt;=1">
	Element 'cac:PartyLegalEntity' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:SellerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:DataSendingCapability">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:AllowanceChargeReason)=1">
	Element 'cbc:AllowanceChargeReason' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:TaxCategory)&lt;=1">
	Element 'cac:TaxCategory' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:PaymentMeans">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCost">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:BaseAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PrepaidIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:SequenceNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:AdditionalDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:BillingReferenceLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BillingReferenceLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:DebitNoteDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:ReminderDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BuyerCustomerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerCustomerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentType[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentType[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:CreditedQuantity)=1">
	Element 'cbc:CreditedQuantity' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:LineExtensionAmount)=1">
	Element 'cbc:LineExtensionAmount' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:InvoicePeriod)&lt;=1">
	Element 'cac:InvoicePeriod' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:OrderLineReference)&lt;=1">
	Element 'cac:OrderLineReference' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:BillingReference)&lt;=1">
	Element 'cac:BillingReference' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:TaxTotal)&lt;=1">
	Element 'cac:TaxTotal' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Item)=1">
	Element 'cac:Item' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:AllowanceChargeReason)=1">
	Element 'cbc:AllowanceChargeReason' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:PaymentMeans">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxCategory">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxCategory' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxTotal">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCost">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:BaseAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PrepaidIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:SequenceNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:BillingReferenceLine)&lt;=1">
	Element 'cac:BillingReferenceLine' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:AdditionalDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cac:AllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:Amount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Amount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:DebitNoteDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:ReminderDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:AlternativeDeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:CarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:Conditions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:InformationURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:Despatch">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:EstimatedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:MaximumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:MinimumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:NotifyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:PromisedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:RequestedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:Shipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:ActualDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:LatestDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:LatestDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:MaximumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:MinimumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:ReleaseID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:TrackingID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TrackingID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DespatchLineReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchLineReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DiscrepancyResponse">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:EndTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:StartTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Description)&lt;=1">
	Element 'cbc:Description' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Name)=1">
	Element 'cbc:Name' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ClassifiedTaxCategory)&lt;=1">
	Element 'cac:ClassifiedTaxCategory' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Value)=1">
	Element 'cbc:Value' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RangeDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ListValue' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NameCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TestMethod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ValueQualifier' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ValueQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:BuyersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Certificate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ItemClassificationCode)=1">
	Element 'cbc:ItemClassificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:NatureCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NatureCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Dimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:HazardousItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:InformationContentProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemInstance">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemSpecificationDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:TransactionConditions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:AdditionalInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:BrandName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:CatalogueIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:HazardousRiskIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Keyword">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:ModelName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackSizeNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cac:OrderReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OrderReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:SalesOrderLineID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OriginatorParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginatorParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PaymentTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:PaymentMeans">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxCategory' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCost">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AllowanceChargeReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PriceList">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PriceList' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PricingExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCodeListID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCode]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCode' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:OrderableUnitFactorRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceChangeReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PricingReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:ReceiptLineReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReceiptLineReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:SubCreditNoteLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SubCreditNoteLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:RoundingAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxEvidenceIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxIncludedIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCost[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCost[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:FreeOfChargeIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FreeOfChargeIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:PaymentPurposeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentPurposeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:TaxPointDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxPointDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:AlternativeDeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:CarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:Conditions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Conditions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:InformationURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InformationURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:Despatch">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:EstimatedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:MaximumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:MinimumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:NotifyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:PromisedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:RequestedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:Shipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:ActualDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:LatestDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:LatestDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:MaximumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:MinimumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:ReleaseID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:TrackingID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TrackingID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:DespatchDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:DiscrepancyResponse">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:EndTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:StartTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:LegalMonetaryTotal">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:LineExtensionAmount)=1">
	Element 'cbc:LineExtensionAmount' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:TaxExclusiveAmount)=1">
	Element 'cbc:TaxExclusiveAmount' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:TaxInclusiveAmount)=1">
	Element 'cbc:TaxInclusiveAmount' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PayableAlternativeAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:CustomerReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:OrderTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:SalesOrderID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OriginatorDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginatorDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyLegalEntity)&lt;=1">
	Element 'cac:PartyLegalEntity' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:HeadParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentAlternativeExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentAlternativeExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:PaymentID)&lt;=1">
	Element 'cbc:PaymentID' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:CV2ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CV2ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:CardChipCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CardChipCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:CardTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CardTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:ChipApplicationID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ChipApplicationID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:ExpiryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:HolderName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HolderName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:IssueNumberID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueNumberID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:IssuerID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssuerID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:ValidityStartDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ValidityStartDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CreditAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CreditAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:Country">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Country' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:Address">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Address' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AliasName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AliasName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentNote' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayerFinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PayerFinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PaymentMandate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentMandate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:TradeFinancing">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TradeFinancing' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:InstructionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InstructionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:InstructionNote">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InstructionNote' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cac:ExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cac:PenaltyPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PenaltyPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cac:SettlementPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SettlementPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:Amount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Amount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:InstallmentDueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InstallmentDueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:InvoicingPartyReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InvoicingPartyReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentDueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentDueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentMeansID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentMeansID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentPercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentPercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentTermsDetailsURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentTermsDetailsURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PenaltyAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PenaltyAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PenaltySurchargePercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PenaltySurchargePercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PrepaidPaymentReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PrepaidPaymentReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:ReferenceEventCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReferenceEventCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:SettlementDiscountAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SettlementDiscountAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:SettlementDiscountPercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SettlementDiscountPercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PricingExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ReceiptDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReceiptDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:SellerSupplierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerSupplierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Signature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Signature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:StatementDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:StatementDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:CalculationRate)=1">
	Element 'cbc:CalculationRate' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:MathematicOperatorCode)=1">
	Element 'cbc:MathematicOperatorCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cac:ForeignExchangeContract">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ForeignExchangeContract' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:CalculationRate[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:ExchangeMarketID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExchangeMarketID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyBaseRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SourceCurrencyBaseRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyBaseRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TargetCurrencyBaseRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)=1">
	Element 'cac:PartyName' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyTaxScheme)&lt;=1">
	Element 'cac:PartyTaxScheme' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:TaxableAmount)=1">
	Element 'cbc:TaxableAmount' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Percent)=1">
	Element 'cbc:Percent' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CalculationSequenceNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:Percent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Percent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cbc:RoundingAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxEvidenceIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxIncludedIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:AccountingCost[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:AccountingCost[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CreditNoteTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CreditNoteTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:LineCountNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:PaymentAlternativeCurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentAlternativeCurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:PaymentCurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PaymentCurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:PricingCurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PricingCurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileExecutionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/ext:UBLExtensions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
</schema>
