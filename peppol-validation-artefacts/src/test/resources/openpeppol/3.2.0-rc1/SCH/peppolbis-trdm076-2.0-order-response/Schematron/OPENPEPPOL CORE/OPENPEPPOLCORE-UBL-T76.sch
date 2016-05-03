<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
    <title>OPENPEPPOL CORE T76 bound to UBL</title>
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
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:UBLVersionID)=1">
	Element 'cbc:UBLVersionID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:CustomizationID)=1">
	Element 'cbc:CustomizationID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ProfileID)=1">
	Element 'cbc:ProfileID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:OrderResponseCode)=1">
	Element 'cbc:OrderResponseCode' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:DocumentCurrencyCode)=1">
	Element 'cbc:DocumentCurrencyCode' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:OrderReference)=1">
	Element 'cac:OrderReference' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Delivery)&lt;=1">
	Element 'cac:Delivery' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:AccountingCustomerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingCustomerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:AccountingSupplierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingSupplierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:AdditionalDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:AllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:AccountingContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ElectronicMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Telefax' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Telephone' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Contract">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contract' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PromisedDeliveryPeriod)=1">
	Element 'cac:PromisedDeliveryPeriod' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:AlternativeDeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:CarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:Despatch">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:EstimatedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:MaximumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:MinimumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:NotifyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cac:Shipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:MaximumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:MinimumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:ReleaseID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Delivery/cbc:TrackingID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TrackingID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:DestinationCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DestinationCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:FreightForwarderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FreightForwarderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:LegalMonetaryTotal">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LegalMonetaryTotal' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OrderDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:SellerSubstitutedLineItem)&lt;=1">
	Element 'cac:SellerSubstitutedLineItem' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:OrderLineReference)=1">
	Element 'cac:OrderLineReference' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:BuyerProposedSubstituteLineItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerProposedSubstituteLineItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:CatalogueLineReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueLineReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:LineStatusCode)=1">
	Element 'cbc:LineStatusCode' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Delivery)&lt;=1">
	Element 'cac:Delivery' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:AllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PromisedDeliveryPeriod)=1">
	Element 'cac:PromisedDeliveryPeriod' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:AlternativeDeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:CarrierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CarrierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Despatch' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MaximumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MinimumDeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:NotifyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NotifyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Shipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Shipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ReleaseID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReleaseID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TrackingID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CommodityClassification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Dimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OrderedShipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OrderedShipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OriginatorParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginatorParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PriceList' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PricingExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:PricingReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:SubLineItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SubLineItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:WarrantyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCost">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BackOrderAllowedIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InspectionMethodCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineExtensionAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumBackorderQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumBackorderQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:PartialDeliveryIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PartialDeliveryIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:SalesOrderID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:TotalTaxAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalTaxAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:WarrantyInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WarrantyInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cac:OrderReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OrderReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:SalesOrderLineID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:QuotationLineReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:QuotationLineReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerProposedSubstituteLineItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerProposedSubstituteLineItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:AllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Delivery">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:DeliveryTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ClassifiedTaxCategory)&lt;=1">
	Element 'cac:ClassifiedTaxCategory' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Value)=1">
	Element 'cbc:Value' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ValueQualifier)&lt;=1">
	Element 'cbc:ValueQualifier' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RangeDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ListValue' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NameCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TestMethod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:BuyersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Certificate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ItemClassificationCode)=1">
	Element 'cbc:ItemClassificationCode' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CommodityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CommodityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:NatureCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NatureCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Dimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:HazardousItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:InformationContentProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemInstance">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemSpecificationDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginCountry">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginCountry' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:TransactionConditions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:AdditionalInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:BrandName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:CatalogueIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:HazardousRiskIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Keyword">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:ModelName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackSizeNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OrderedShipment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OrderedShipment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OriginatorParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginatorParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Price">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Price' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:PricingReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:SubLineItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SubLineItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:WarrantyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCost">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:BackOrderAllowedIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BackOrderAllowedIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:InspectionMethodCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InspectionMethodCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineExtensionAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineExtensionAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumBackorderQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumBackorderQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumBackorderQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumBackorderQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:PartialDeliveryIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PartialDeliveryIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:SalesOrderID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:TotalTaxAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalTaxAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:WarrantyInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WarrantyInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderLine/cbc:SubstitutionStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SubstitutionStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:CustomerReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:OrderTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:SalesOrderID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OrderReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OriginatorCustomerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginatorCustomerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:OriginatorDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginatorDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:PaymentExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:PaymentMeans">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:PaymentTerms">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:PricingExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:AccountingContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:DespatchContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cac:SellerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:DataSendingCapability">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:Signature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Signature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:TaxExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:TaxTotal">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:TransactionConditions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:AccountingCost">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:AccountingCostCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomerReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:CustomizationID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:GrossVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:GrossWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:LineCountNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:NetNetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:NetVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:NetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:OrderResponseCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:PricingCurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PricingCurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileExecutionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:ProfileID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:SalesOrderID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:TaxCurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxCurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:TotalPackagesQuantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TotalPackagesQuantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UBLVersionID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:OrderResponse/ext:UBLExtensions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
</schema>
