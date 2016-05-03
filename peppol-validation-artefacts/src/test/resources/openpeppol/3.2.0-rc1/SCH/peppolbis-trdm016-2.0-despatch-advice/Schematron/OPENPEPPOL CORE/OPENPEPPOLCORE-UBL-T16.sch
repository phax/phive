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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:BuyerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:DeliveryContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:BuyerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:DeliveryContact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DeliveryCustomerParty/cbc:SupplierAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:AdditionalItemProperty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:BuyersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CatalogueItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Certificate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ClassifiedTaxCategory">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:CommodityClassification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:Dimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:AdditionalTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:ContactParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ContactParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:EmergencyTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:EmergencyTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:FlashpointTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FlashpointTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:HazardousGoodsTransit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cac:SecondaryHazard">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SecondaryHazard' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:AdditionalInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:CategoryName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CategoryName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:EmergencyProceduresCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EmergencyProceduresCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:HazardousCategoryCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousCategoryCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:LowerOrangeHazardPlacardID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LowerOrangeHazardPlacardID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MarkingID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkingID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:MedicalFirstAidGuideCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MedicalFirstAidGuideCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:NetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardEndorsement">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlacardEndorsement' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:PlacardNotation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlacardNotation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:TechnicalName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TechnicalName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:HazardousItem/cbc:UpperOrangeHazardPlacardID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UpperOrangeHazardPlacardID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:InformationContentProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:AdditionalItemProperty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cac:AdditionalItemProperty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ManufactureTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ManufactureTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:ProductTraceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ProductTraceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:RegistrationID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemInstance/cbc:SerialID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ItemSpecificationDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:ManufacturersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:OriginCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cac:TransactionConditions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:AdditionalInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:BrandName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:CatalogueIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:HazardousRiskIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Keyword">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:ModelName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Item/cbc:PackSizeNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cac:OrderReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OrderReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:LineStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:SalesOrderLineID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:OrderLineReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Consignment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Consignment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:Delivery">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ExportCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ExportCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FirstArrivalPortLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:FreightAllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:GoodsItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:LastExitPortLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:OriginAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ReturnAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReturnAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:ShipmentStage">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShipmentStage' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ActualPackage' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:CustomsIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:FloorSpaceMeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FloorSpaceMeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:GoodsItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HandlingUnitDespatchLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HandlingUnitDespatchLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:HazardousGoodsTransit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MaximumTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MaximumTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:AttributeID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MaximumMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:MinimumMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MinimumTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MinimumTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Package">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Package' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:PalletSpaceMeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PalletSpaceMeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReceivedHandlingUnitReceiptLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReceivedHandlingUnitReceiptLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ReferencedShipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReferencedShipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:ShipmentDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShipmentDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:Status">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Status' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransportEquipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:TransportMeans">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransportMeans' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:DamageRemarks">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DamageRemarks' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:HandlingInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ShippingMarks[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:ShippingMarks[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TotalGoodsItemQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TotalPackageQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalPackageQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TraceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TraceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ConsignmentQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredCustomsValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:DeliveryInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:FreeOnBoardValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:GrossWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:HandlingInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:Information">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Information' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:InsuranceValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetNetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:NetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:ShippingPriorityLevelCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SpecialInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:SplitConsignmentIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalGoodsItemQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BackorderQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:BackorderReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BackorderReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:LineStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingReason[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OutstandingReason[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:OversupplyQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OversupplyQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchLine/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:DespatchContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cac:SellerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:DespatchSupplierParty/cbc:DataSendingCapability">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:CustomerReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:OrderTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:SalesOrderID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OrderReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:BuyerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:DeliveryContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:DespatchContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cac:SellerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:SellerSupplierParty/cbc:DataSendingCapability">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BillOfLadingHolderParty' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentType[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:DocumentType[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:IdentityDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cac:ResidenceAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResidenceAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:BirthDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BirthDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:BirthplaceName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BirthplaceName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:FamilyName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FamilyName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:FirstName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FirstName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:GenderCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GenderCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:JobTitle">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:JobTitle' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:MiddleName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MiddleName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:NameSuffix">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NameSuffix' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:NationalityID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NationalityID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:OrganizationDepartment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OrganizationDepartment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:OtherName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OtherName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:Person/cbc:Title">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Title' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CarrierParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ChildConsignment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ChildConsignment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CollectPaymentTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CollectPaymentTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsigneeParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ConsigneeParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsignorParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ConsignorParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ConsolidatedShipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ConsolidatedShipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:CustomsIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CustomsIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:DisbursementPaymentTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DisbursementPaymentTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExporterParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ExporterParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ExtraAllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ExtraAllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinalDeliveryParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDeliveryTransportationService">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinalDeliveryTransportationService' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FinalDestinationCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinalDestinationCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FirstArrivalPortLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightAllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:FreightForwarderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FreightForwarderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:HazardousItemNotificationParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HazardousItemNotificationParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:ImporterParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ImporterParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:InsuranceParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:InsuranceParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LastExitPortLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:LogisticsOperatorParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LogisticsOperatorParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MainCarriageShipmentStage">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MainCarriageShipmentStage' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:MortgageHolderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MortgageHolderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:NotifyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OnCarriageShipmentStage">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OnCarriageShipmentStage' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDepartureCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginalDepartureCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginalDespatchParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:OriginalDespatchTransportationService">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginalDespatchTransportationService' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PaymentTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PerformingCarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PerformingCarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedDeliveryTransportEvent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PlannedDeliveryTransportEvent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PlannedPickupTransportEvent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PlannedPickupTransportEvent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PreCarriageShipmentStage">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PreCarriageShipmentStage' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:PrepaidPaymentTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PrepaidPaymentTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedDeliveryTransportEvent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedDeliveryTransportEvent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:RequestedPickupTransportEvent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedPickupTransportEvent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:Status">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Status' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:SubstituteCarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SubstituteCarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransitCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransitCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportAdvisorParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransportAdvisorParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportContract">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransportContract' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cac:TransportHandlingUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransportHandlingUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:AnimalFoodIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AnimalFoodIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BrokerAssignedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BrokerAssignedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:BulkCargoIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BulkCargoIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierAssignedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CarrierAssignedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CarrierServiceInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CarrierServiceInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ChargeableWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ChargeableWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsigneeAssignedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConsigneeAssignedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignmentQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsignorAssignedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConsignorAssignedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ConsolidatableIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConsolidatableIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContainerizedIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ContainerizedIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ContractedCarrierAssignedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ContractedCarrierAssignedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:CustomsClearanceServiceInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomsClearanceServiceInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredCustomsValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredForCarriageValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeclaredStatisticsValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:DeliveryInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ForwarderServiceInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ForwarderServiceInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreeOnBoardValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:FreightForwarderAssignedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FreightForwarderAssignedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GeneralCargoIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GeneralCargoIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:GrossWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HandlingInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HaulageInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HaulageInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HazardousRiskIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:HumanFoodIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HumanFoodIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Information[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Information[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsurancePremiumAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InsurancePremiumAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:InsuranceValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LivestockIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LivestockIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingLengthMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LoadingLengthMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:LoadingSequenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LoadingSequenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetNetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:NetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:PerformingCarrierAssignedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerformingCarrierAssignedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:Remarks">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Remarks' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SequenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SequenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ShippingPriorityLevelCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialSecurityIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SpecialSecurityIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SpecialServiceInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SpecialServiceInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SplitConsignmentIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:SummaryDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SummaryDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TariffCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TariffDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TariffDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:ThirdPartyPayerIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ThirdPartyPayerIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalGoodsItemQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalInvoiceAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalInvoiceAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Consignment/cbc:TotalTransportHandlingUnitQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalTransportHandlingUnitQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:AlternativeDeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:CarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:CarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:EstimatedDespatchPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:EstimatedDespatchPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:NotifyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cac:RequestedDespatchPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedDespatchPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EstimatedDespatchDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:EstimatedDespatchTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EstimatedDespatchTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GuaranteedDespatchDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:GuaranteedDespatchTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GuaranteedDespatchTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:Instructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Instructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:ReleaseID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RequestedDespatchDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Despatch/cbc:RequestedDespatchTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RequestedDespatchTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:EstimatedDeliveryPeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MaximumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:MinimumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:NotifyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:PromisedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PromisedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:RequestedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cac:Shipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ActualDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:LatestDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MaximumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:MinimumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:ReleaseID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:Delivery/cbc:TrackingID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ExportCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ExportCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FirstArrivalPortLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FirstArrivalPortLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:FreightAllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FreightAllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:GoodsItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:GoodsItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:LastExitPortLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LastExitPortLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:OriginAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ReturnAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReturnAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:ShipmentStage">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShipmentStage' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cac:TransportHandlingUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransportHandlingUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ConsignmentQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConsignmentQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredCustomsValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredCustomsValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredForCarriageValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeclaredStatisticsValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeclaredStatisticsValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:DeliveryInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DeliveryInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:FreeOnBoardValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FreeOnBoardValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:HandlingInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HandlingInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:Information[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:Information[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:InsuranceValueAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InsuranceValueAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetNetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:NetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:ShippingPriorityLevelCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ShippingPriorityLevelCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SpecialInstructions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SpecialInstructions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:SplitConsignmentIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SplitConsignmentIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalGoodsItemQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalGoodsItemQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCodeListID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity[@unitCode]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCode' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cac:Signature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Signature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:CustomizationID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:DespatchAdviceTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DespatchAdviceTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:LineCountNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileExecutionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:ProfileID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
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
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UBLVersionID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:DespatchAdvice/ext:UBLExtensions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
</schema>
