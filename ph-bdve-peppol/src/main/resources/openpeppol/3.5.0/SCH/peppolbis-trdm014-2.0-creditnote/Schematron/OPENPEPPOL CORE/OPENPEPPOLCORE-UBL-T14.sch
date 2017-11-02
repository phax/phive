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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:BuyerContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:DeliveryContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Note' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HeadParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:AdditionalAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:DespatchContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Note' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HeadParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PostalZone' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:StreetName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:SellerContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SellerContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:AdditionalAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:DataSendingCapability">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FileName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MimeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ResultOfVerification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:IssueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LanguageID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LocaleCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:VersionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:VersionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:XPath">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:XPath' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent[@format]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @format' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRange' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TaxTotal' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCost">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCostCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:BaseAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BaseAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PerUnitAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PrepaidIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:SequenceNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:AdditionalDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:BillingReferenceLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BillingReferenceLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:Attachment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Attachment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ResultOfVerification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentType">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LanguageID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LocaleCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:VersionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:VersionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:XPath">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:XPath' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:DebitNoteDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Attachment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:VersionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:XPath' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:ReminderDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:BuyerCustomerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BuyerCustomerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:Attachment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Attachment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ResultOfVerification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentType[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentType[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LanguageID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LocaleCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:VersionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:VersionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:XPath">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:XPath' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxCategory">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TaxCategory' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxTotal">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TaxTotal' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCost">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCostCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:BaseAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BaseAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PerUnitAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PrepaidIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:SequenceNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cac:AllowanceCharge">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:Amount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Amount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:Attachment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Attachment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ResultOfVerification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentType">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:IssueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LanguageID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:LocaleCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:VersionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:VersionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:XPath">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:XPath' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:DebitNoteDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Attachment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:VersionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:XPath' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:ReminderDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:AlternativeDeliveryLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:CarrierParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:Conditions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Conditions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:InformationURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InformationURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:Despatch">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Despatch' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:EstimatedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:MaximumDeliveryUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:MinimumDeliveryUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:NotifyParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:PromisedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:RequestedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:Shipment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Shipment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:ActualDeliveryTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:LatestDeliveryDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:LatestDeliveryTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:MaximumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:MinimumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Quantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:ReleaseID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:TrackingID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TrackingID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DeliveryTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DespatchLineReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DespatchLineReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DiscrepancyResponse">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DescriptionCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DurationMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:EndTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:StartTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:StartTime' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RangeDimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ListValue' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NameCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TestMethod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ValueQualifier' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ValueQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:BuyersItemIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueItemIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Certificate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Certificate' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @format' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRange' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:NatureCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NatureCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Dimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Dimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:HazardousItem">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HazardousItem' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:InformationContentProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemInstance">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ItemInstance' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemSpecificationDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturersItemIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:TransactionConditions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:AdditionalInformation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:BrandName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BrandName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:CatalogueIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:HazardousRiskIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Keyword">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Keyword' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:ModelName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ModelName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackSizeNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cac:OrderReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OrderReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:SalesOrderLineID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OriginatorParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginatorParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PaymentTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:PaymentMeans">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TaxCategory' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TaxTotal' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCost">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AllowanceChargeReason' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PriceList">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PriceList' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PricingExchangeRate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCodeListID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity[@unitCode]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCode' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:OrderableUnitFactorRate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceChangeReason">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceType">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PriceType' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PricingReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PricingReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:ReceiptLineReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReceiptLineReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:SubCreditNoteLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SubCreditNoteLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:RoundingAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxEvidenceIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxIncludedIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCostCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCost[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCost[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity[@unitCodeListAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity[@unitCodeListAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:FreeOfChargeIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FreeOfChargeIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:Note[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:Note[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:PaymentPurposeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentPurposeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:TaxPointDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxPointDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:AlternativeDeliveryLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:CarrierParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:Conditions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Conditions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:InformationURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InformationURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:DeliveryTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:Despatch">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Despatch' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:EstimatedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:MaximumDeliveryUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:MinimumDeliveryUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:NotifyParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:PromisedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:RequestedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cac:Shipment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Shipment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:ActualDeliveryTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:LatestDeliveryDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:LatestDeliveryTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:MaximumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:MinimumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Quantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:ReleaseID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Delivery/cbc:TrackingID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TrackingID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:DeliveryTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:DespatchDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DespatchDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:DiscrepancyResponse">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DescriptionCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DurationMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:EndTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:StartTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:StartTime' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PayableAlternativeAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cac:DocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:CustomerReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:IssueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:OrderTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:SalesOrderID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OrderReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:OriginatorDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginatorDocumentReference' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:HeadParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HeadParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyTaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PostalAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PayeeParty/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentAlternativeExchangeRate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentAlternativeExchangeRate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentExchangeRate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentExchangeRate' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CV2ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:CardChipCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CardChipCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:CardTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CardTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:ChipApplicationID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ChipApplicationID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:ExpiryDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:HolderName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HolderName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:IssueNumberID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueNumberID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:IssuerID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssuerID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:NetworkID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:PrimaryAccountNumberID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CardAccount/cbc:ValidityStartDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ValidityStartDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:CreditAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CreditAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:Country">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Country' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:Address">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Address' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AdditionalStreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AdditionalStreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CountrySubentity[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CountrySubentity[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:PostalZone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:PostalZone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:StreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:StreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AliasName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AliasName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:CurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentNote' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PayerFinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PayerFinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:PaymentMandate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentMandate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cac:TradeFinancing">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TradeFinancing' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:InstructionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InstructionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:InstructionNote">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InstructionNote' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ExchangeRate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cac:PenaltyPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PenaltyPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cac:SettlementPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SettlementPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:Amount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Amount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:InstallmentDueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InstallmentDueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:InvoicingPartyReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InvoicingPartyReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:Note[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:Note[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentDueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentDueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentMeansID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentMeansID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentPercent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentPercent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PaymentTermsDetailsURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentTermsDetailsURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PenaltyAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PenaltyAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PenaltySurchargePercent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PenaltySurchargePercent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:PrepaidPaymentReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PrepaidPaymentReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:ReferenceEventCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ReferenceEventCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:SettlementDiscountAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SettlementDiscountAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PaymentTerms/cbc:SettlementDiscountPercent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SettlementDiscountPercent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:PricingExchangeRate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:ReceiptDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReceiptDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:SellerSupplierParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SellerSupplierParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:Signature">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Signature' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:StatementDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:StatementDocumentReference' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ForeignExchangeContract' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:CalculationRate[@format]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @format' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:ExchangeMarketID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExchangeMarketID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyBaseRate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SourceCurrencyBaseRate' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyBaseRate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TargetCurrencyBaseRate' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyLegalEntity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PostalAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent[@format]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @format' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRange' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CalculationSequenceNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:Percent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Percent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRange' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cbc:RoundingAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxEvidenceIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxIncludedIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:AccountingCostCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:AccountingCost[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:AccountingCost[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CreditNoteTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CreditNoteTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:CustomizationID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:LineCountNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:Note[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:Note[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:PaymentAlternativeCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentAlternativeCurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:PaymentCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PaymentCurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:PricingCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PricingCurrencyCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileExecutionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:ProfileID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
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
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:TaxCurrencyCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UBLVersionID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:CreditNote/ext:UBLExtensions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
</schema>
