<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
    <title>OPENPEPPOL CORE T16 bound to UBL</title>
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
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:UBLVersionID)=1">
	Element 'cbc:UBLVersionID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:CustomizationID)=1">
	Element 'cbc:CustomizationID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ProfileID)=1">
	Element 'cbc:ProfileID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:OrderReference)&lt;=1">
	Element 'cac:OrderReference' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:AdditionalDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:AccountingContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:BuyerContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:DeliveryContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:AccountingContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:BuyerContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cac:OtherCommunication">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ElectronicMail[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ElectronicMail[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Note">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Note' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telefax[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telefax[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telephone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telephone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:AgentParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyTaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:AdditionalAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:SupplierAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:DeliveredQuantity)=1">
	Element 'cbc:DeliveredQuantity' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:OrderLineReference)=1">
	Element 'cac:OrderLineReference' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Shipment)&lt;=1">
	Element 'cac:Shipment' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:DocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemProperty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:BuyersItemIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueItemIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Certificate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Certificate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ClassifiedTaxCategory">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CommodityClassification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Dimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Dimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:AdditionalTemperature">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalTemperature' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:ContactParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ContactParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:EmergencyTemperature">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:EmergencyTemperature' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:FlashpointTemperature">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FlashpointTemperature' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:HazardousGoodsTransit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:SecondaryHazard">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SecondaryHazard' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:AdditionalInformation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:CategoryName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CategoryName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:EmergencyProceduresCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EmergencyProceduresCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardousCategoryCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HazardousCategoryCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:LowerOrangeHazardPlacardID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LowerOrangeHazardPlacardID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MarkingID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkingID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MedicalFirstAidGuideCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MedicalFirstAidGuideCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetVolumeMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardEndorsement">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlacardEndorsement' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardNotation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlacardNotation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Quantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:TechnicalName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TechnicalName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UpperOrangeHazardPlacardID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UpperOrangeHazardPlacardID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:InformationContentProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:AdditionalItemProperty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cac:AdditionalItemProperty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ManufactureTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ManufactureTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ProductTraceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ProductTraceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:RegistrationID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RegistrationID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemSpecificationDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturersItemIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginCountry">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginCountry' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:TransactionConditions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:AdditionalInformation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:BrandName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BrandName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:CatalogueIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:HazardousRiskIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Keyword">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Keyword' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:ModelName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ModelName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackSizeNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cac:OrderReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OrderReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:SalesOrderLineID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Consignment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Delivery">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Delivery' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ExportCountry">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ExportCountry' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FirstArrivalPortLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FreightAllowanceCharge">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:GoodsItem">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:GoodsItem' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:LastExitPortLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:OriginAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ReturnAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReturnAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ShipmentStage">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ShipmentStage' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ShippingMarks)&lt;=1">
	Element 'cbc:ShippingMarks' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ActualPackage' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:CustomsIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:FloorSpaceMeasurementDimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FloorSpaceMeasurementDimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:GoodsItem">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:GoodsItem' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HandlingUnitDespatchLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HandlingUnitDespatchLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HazardousGoodsTransit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MaximumTemperature">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MaximumTemperature' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MaximumMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MaximumMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MinimumMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MinimumMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MinimumTemperature">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MinimumTemperature' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Package">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Package' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:PalletSpaceMeasurementDimension">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PalletSpaceMeasurementDimension' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReceivedHandlingUnitReceiptLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReceivedHandlingUnitReceiptLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReferencedShipment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReferencedShipment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ShipmentDocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ShipmentDocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Status">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Status' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransportEquipment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportMeans">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransportMeans' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:DamageRemarks">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DamageRemarks' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ShippingMarks[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ShippingMarks[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TotalGoodsItemQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TotalPackageQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalPackageQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TraceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TraceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ConsignmentQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredCustomsValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeliveryInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:FreeOnBoardValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossVolumeMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:Information">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Information' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:InsuranceValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetNetWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetVolumeMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ShippingPriorityLevelCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SpecialInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SplitConsignmentIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalGoodsItemQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BackorderQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderReason">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BackorderReason' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:LineStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:Note[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:Note[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingReason[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingReason[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OversupplyQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:OversupplyQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:AccountingContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:DespatchContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:AgentParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Note' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyTaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PostalAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:SellerContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SellerContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:AdditionalAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:DataSendingCapability">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cac:DocumentReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CustomerReference">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:OrderTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:SalesOrderID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:AccountingContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:BuyerContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:DeliveryContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Party)=1">
	Element 'cac:Party' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:AccountingContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:DespatchContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Note' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Person' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PostalAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:SellerContact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SellerContact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:AdditionalAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:DataSendingCapability">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Consignment)&lt;=1">
	Element 'cac:Consignment' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:BillOfLadingHolderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:BillOfLadingHolderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Person)&lt;=1">
	Element 'cac:Person' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:AgentParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AgentParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Language">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Language' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyLegalEntity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyName/cbc:Name[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyTaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:IdentityDocumentReference)=1">
	Element 'cac:IdentityDocumentReference' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:FinancialAccount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:Attachment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Attachment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:IssuerParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:ResultOfVerification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:ValidityPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentType[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentType[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:IssueDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:IssueTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:LanguageID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:LocaleCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:VersionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:VersionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:XPath">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:XPath' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:ResidenceAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ResidenceAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:BirthDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BirthDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:BirthplaceName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BirthplaceName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:FamilyName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FamilyName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:FirstName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FirstName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:GenderCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GenderCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:JobTitle">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:JobTitle' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:MiddleName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MiddleName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:NameSuffix">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NameSuffix' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:NationalityID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NationalityID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:OrganizationDepartment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:OrganizationDepartment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:OtherName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:OtherName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:Title">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Title' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PhysicalLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PostalAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PowerOfAttorney">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:ServiceProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:IndustryClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:LogoReferenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkAttentionIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkCareIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:WebsiteURI">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ChildConsignment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ChildConsignment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CollectPaymentTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CollectPaymentTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsigneeParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ConsigneeParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsignorParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ConsignorParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsolidatedShipment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ConsolidatedShipment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CustomsIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DeliveryTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DisbursementPaymentTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DisbursementPaymentTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExporterParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ExporterParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExtraAllowanceCharge">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ExtraAllowanceCharge' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinalDeliveryParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryTransportationService">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinalDeliveryTransportationService' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDestinationCountry">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FinalDestinationCountry' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FirstArrivalPortLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightAllowanceCharge">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightForwarderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FreightForwarderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:HazardousItemNotificationParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:HazardousItemNotificationParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ImporterParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ImporterParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:InsuranceParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:InsuranceParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LastExitPortLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LogisticsOperatorParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LogisticsOperatorParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MainCarriageShipmentStage">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MainCarriageShipmentStage' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MortgageHolderParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MortgageHolderParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:NotifyParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OnCarriageShipmentStage">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OnCarriageShipmentStage' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDepartureCountry">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginalDepartureCountry' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginalDespatchParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginalDespatchTransportationService' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PaymentTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PerformingCarrierParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PerformingCarrierParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedDeliveryTransportEvent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PlannedDeliveryTransportEvent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedPickupTransportEvent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PlannedPickupTransportEvent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PreCarriageShipmentStage">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PreCarriageShipmentStage' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PrepaidPaymentTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PrepaidPaymentTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedDeliveryTransportEvent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RequestedDeliveryTransportEvent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedPickupTransportEvent">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RequestedPickupTransportEvent' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:Status">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Status' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:SubstituteCarrierParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:SubstituteCarrierParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransitCountry">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransitCountry' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportAdvisorParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransportAdvisorParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportContract">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransportContract' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportHandlingUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransportHandlingUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:AnimalFoodIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AnimalFoodIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BrokerAssignedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BrokerAssignedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BulkCargoIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BulkCargoIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierAssignedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CarrierAssignedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierServiceInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CarrierServiceInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ChargeableWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ChargeableWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsigneeAssignedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ConsigneeAssignedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignmentQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignorAssignedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ConsignorAssignedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsolidatableIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ConsolidatableIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContainerizedIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ContainerizedIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContractedCarrierAssignedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ContractedCarrierAssignedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CustomsClearanceServiceInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CustomsClearanceServiceInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredCustomsValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredForCarriageValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredStatisticsValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeliveryInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ForwarderServiceInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ForwarderServiceInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreeOnBoardValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreightForwarderAssignedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FreightForwarderAssignedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GeneralCargoIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GeneralCargoIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossVolumeMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HaulageInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HaulageInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HazardousRiskIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HumanFoodIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HumanFoodIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Information[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Information[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsurancePremiumAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InsurancePremiumAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsuranceValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LivestockIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LivestockIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingLengthMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LoadingLengthMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingSequenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LoadingSequenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetNetWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetVolumeMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:PerformingCarrierAssignedID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PerformingCarrierAssignedID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Remarks">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Remarks' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SequenceID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SequenceID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ShippingPriorityLevelCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialSecurityIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SpecialSecurityIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialServiceInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SpecialServiceInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SplitConsignmentIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SummaryDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SummaryDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TariffCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffDescription">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TariffDescription' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ThirdPartyPayerIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ThirdPartyPayerIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalGoodsItemQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalInvoiceAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalInvoiceAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalTransportHandlingUnitQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:AlternativeDeliveryLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:CarrierParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryTerms">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:CarrierParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:Contact">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Contact' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:AddressLine' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:IdentificationCode)=1">
	Element 'cbc:IdentificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listSchemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @listVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@name]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @name' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:Name">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Name' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:LocationCoordinate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AdditionalStreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AddressFormatCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AddressTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BlockName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BlockName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BuildingName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BuildingNumber">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CityName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CityName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CitySubdivisionName">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentityCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentity[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentity[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Department">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Department' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:District">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:District' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Floor">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Floor' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:InhouseMail">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:MarkAttention">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:MarkCare">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PlotIdentification">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PostalZone[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PostalZone[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Postbox">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Postbox' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Region">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Region' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Room">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Room' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:StreetName[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:StreetName[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:TimezoneOffset">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DespatchLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:DespatchParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:EstimatedDespatchPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:EstimatedDespatchPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:NotifyParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:RequestedDespatchPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RequestedDespatchPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EstimatedDespatchDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:EstimatedDespatchTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GuaranteedDespatchDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:GuaranteedDespatchTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:Instructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Instructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ReleaseID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RequestedDespatchDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:RequestedDespatchTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:Description">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Description' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DescriptionCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DurationMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MaximumDeliveryUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MinimumDeliveryUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:NotifyParty">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:PromisedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:RequestedDeliveryPeriod">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Shipment">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Shipment' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryDate">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryTime">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MaximumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MinimumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:Quantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ReleaseID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ExportCountry">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ExportCountry' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FirstArrivalPortLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FreightAllowanceCharge">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:GoodsItem">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:GoodsItem' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:LastExitPortLocation">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:OriginAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ReturnAddress">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ReturnAddress' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ShipmentStage">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:ShipmentStage' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:TransportHandlingUnit">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:TransportHandlingUnit' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ConsignmentQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredCustomsValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeliveryInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:FreeOnBoardValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:Information[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:Information[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:InsuranceValueAmount">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetNetWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetVolumeMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetWeightMeasure">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ShippingPriorityLevelCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SpecialInstructions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SplitConsignmentIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalGoodsItemQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCodeListID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCode]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @unitCode' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Signature">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cac:Signature' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CopyIndicator">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:DespatchAdviceTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DespatchAdviceTypeCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:DocumentStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:LineCountNumeric">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:Note[@languageID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:Note[@languageLocaleID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @languageLocaleID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileExecutionID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="normalize-space(.)='2.1'">
	'2.1' is the only allowed value of 'cbc:UBLVersionID'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeAgencyID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeAgencyName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeAgencyName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeDataURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeDataURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeName]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeName' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeURI]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeURI' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeVersionID]">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Attribute @schemeVersionID' marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UUID">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'cbc:UUID' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/ext:UBLExtensions">
            <assert flag="warning" id="PEPPOL_CORE_R002" test="false()">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</assert>
        </rule>
    </pattern>
</schema>
