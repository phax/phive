<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
    <title>OPENPEPPOL CORE T19 bound to UBL</title>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" prefix="p1"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
    <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
    <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
    <pattern>
        <rule context="/p1:Catalogue">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:UBLVersionID)=1">
	Element 'cbc:UBLVersionID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:CustomizationID)=1">
	Element 'cbc:CustomizationID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ProfileID)=1">
	Element 'cbc:ProfileID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ValidityPeriod)=1">
	Element 'cac:ValidityPeriod' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ReferencedContract)&lt;=1">
	Element 'cac:ReferencedContract' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:WarrantyInformation)&lt;=1">
	Element 'cbc:WarrantyInformation' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComplementaryRelatedItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ComplementaryRelatedItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ContractorCustomerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ContractorCustomerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ManufacturersItemIdentification)&lt;=1">
	Element 'cac:ManufacturersItemIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ClassifiedTaxCategory)&lt;=1">
	Element 'cac:ClassifiedTaxCategory' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:ManufacturerParty)&lt;=1">
	Element 'cac:ManufacturerParty' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Value)=1">
	Element 'cbc:Value' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RangeDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ListValue' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NameCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TestMethod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:BuyersItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CatalogueDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CatalogueItemIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:Signature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Signature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:Remarks[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CommodityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:NatureCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NatureCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Description[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:AdditionalTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:ContactParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ContactParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:EmergencyTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:EmergencyTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:FlashpointTemperature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FlashpointTemperature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:HazardousGoodsTransit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HazardousGoodsTransit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:SecondaryHazard">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SecondaryHazard' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:AdditionalInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:CategoryName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CategoryName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:EmergencyProceduresCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EmergencyProceduresCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardousCategoryCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousCategoryCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:LowerOrangeHazardPlacardID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LowerOrangeHazardPlacardID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:MarkingID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkingID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:MedicalFirstAidGuideCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MedicalFirstAidGuideCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:NetVolumeMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:NetWeightMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:PlacardEndorsement">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlacardEndorsement' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:PlacardNotation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlacardNotation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:Quantity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Quantity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:TechnicalName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TechnicalName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UpperOrangeHazardPlacardID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UpperOrangeHazardPlacardID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:InformationContentProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:AdditionalItemProperty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cac:AdditionalItemProperty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:ExpiryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:ManufactureDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ManufactureDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:ManufactureTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ManufactureTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:ProductTraceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ProductTraceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:RegistrationID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:SerialID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SerialID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:EndpointID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:AdditionalInformation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:BrandName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:BrandName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:CatalogueIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:HazardousRiskIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:Keyword[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:ModelName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackSizeNumeric[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:KeywordItemProperty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:KeywordItemProperty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:EndTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacementRelatedItem">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ReplacementRelatedItem' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:AllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTaxCategory">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ApplicableTaxCategory' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryUnit' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DependentPriceReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DependentPriceReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Package">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Package' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:AllowanceCharge">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PriceList">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PriceList' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PricingExchangeRate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:EndTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:StartTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:OrderableUnitFactorRate[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceChangeReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:HazardousRiskIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:TradingRestrictions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TradingRestrictions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:SellerSupplierParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerSupplierParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:WarrantyParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:WarrantyParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cac:WarrantyValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:LifeCycleStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LifeCycleStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@unitCodeListID">
	Attribute '@unitCodeListID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity[@unitCodeListAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity[@unitCodeListAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:OrderQuantityIncrementNumeric[@format]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @format' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:OrderableUnit[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:OrderableUnit[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:WarrantyInformation[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:AccountingContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:BuyerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:DeliveryContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cbc:SupplierAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:HeadParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:ShareholderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ProviderParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:HeadParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:ShareholderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ID)=1">
	Element 'cbc:ID' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cac:ContractDocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ContractDocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cac:ContractualDelivery">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ContractualDelivery' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cac:NominationPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:NominationPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ContractTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ContractTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ContractType[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ContractType[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:NominationDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NominationDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:NominationTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:NominationTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:AccountingContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:DespatchContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Name' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Department">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Department' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:District' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:ID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Region' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Room' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:SellerContact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cbc:AdditionalAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SellerSupplierParty/cbc:DataSendingCapability">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:Signature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Signature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:PreviousVersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PreviousVersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:RevisionDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RevisionDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:RevisionTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RevisionTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:TradingTerms/cac:ApplicableAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ApplicableAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:TradingTerms/cbc:Information[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:TradingTerms/cbc:Reference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Reference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:DescriptionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:DurationMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:EndTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:StartTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ActionCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:LineCountNumeric">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:Note">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Note' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:PreviousVersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:PreviousVersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileExecutionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:ProfileID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:RevisionDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RevisionDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:RevisionTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:RevisionTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:VersionID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:VersionID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:VersionID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:VersionID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:VersionID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:VersionID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/cbc:VersionID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:Catalogue/ext:UBLExtensions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
</schema>
