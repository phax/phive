<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
    <title>OPENPEPPOL CORE T71 bound to UBL</title>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" prefix="p1"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
    <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
    <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
    <pattern>
        <rule context="/p1:ApplicationResponse">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:UBLVersionID)=1">
	Element 'cbc:UBLVersionID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:CustomizationID)=1">
	Element 'cbc:CustomizationID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ProfileID)=1">
	Element 'cbc:ProfileID' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Note)&lt;=1">
	Element 'cbc:Note' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:DocumentResponse)=1">
	Element 'cac:DocumentResponse' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:DocumentReference)=1">
	Element 'cac:DocumentReference' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cac:Attachment">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cac:ResultOfVerification">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cac:ValidityPeriod">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:CopyIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentDescription">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentType">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:IssueDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:IssueTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:LanguageID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:LocaleCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:XPath">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:IssuerParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:Response)=1">
	Element 'cac:Response' must occur exactly 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cac:DocumentReference">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:DocumentReference' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineStatusCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ResponseCode)=1">
	Element 'cbc:ResponseCode' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Description)&lt;=1">
	Element 'cbc:Description' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:ConditionCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConditionCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:ConditionValueMeasure">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ConditionValueMeasure' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:Description">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Description' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:IndicationIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndicationIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:Percent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Percent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:ReferenceDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReferenceDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:ReferenceTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReferenceTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:ReliabilityPercent">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReliabilityPercent' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:SequenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:SequenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReason">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:StatusReason' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:Text">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:Text' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:Description[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:Description[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:EffectiveDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EffectiveDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:EffectiveTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EffectiveTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:RecipientParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:RecipientParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:ResponseCode)=1">
	Element 'cbc:ResponseCode' must occur exactly 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cbc:Description)&lt;=1">
	Element 'cbc:Description' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cac:Status">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Status' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:Description[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:Description[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:EffectiveDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EffectiveDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:EffectiveTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:EffectiveTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@listID">
	Attribute '@listID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@listAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@listAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@listName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@listSchemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listSchemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@listURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@listVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @listVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode[@name]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @name' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:ReceiverParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyIdentification)&lt;=1">
	Element 'cac:PartyIdentification' may occur at maximum 1 times.</assert>
            <assert flag="warning" id="PEPPOL_CORE_R001" test="count(cac:PartyName)&lt;=1">
	Element 'cac:PartyName' may occur at maximum 1 times.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:AgentParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:Contact">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Contact' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:FinancialAccount">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:Language">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Language' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyIdentification/cbc:ID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyIdentification/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyLegalEntity">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyName/cbc:Name[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyName/cbc:Name[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PartyTaxScheme">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:Person">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Person' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PhysicalLocation">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PostalAddress">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:PowerOfAttorney">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cac:ServiceProviderParty">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:EndpointID">
            <assert flag="warning" id="PEPPOL_CORE_R001" test="@schemeID">
	Attribute '@schemeID' is required in this context.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:EndpointID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:EndpointID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:EndpointID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:EndpointID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:EndpointID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:EndpointID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:IndustryClassificationCode">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:LogoReferenceID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:MarkAttentionIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:MarkCareIndicator">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:SenderParty/cbc:WebsiteURI">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cac:Signature">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cac:Signature' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:CustomizationID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:CustomizationID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:CustomizationID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:CustomizationID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:CustomizationID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:CustomizationID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:CustomizationID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:Note[@languageID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:Note[@languageLocaleID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @languageLocaleID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileExecutionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ProfileID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ResponseDate">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ResponseDate' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:ResponseTime">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:ResponseTime' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UBLVersionID[@schemeAgencyID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UBLVersionID[@schemeAgencyName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeAgencyName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UBLVersionID[@schemeDataURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeDataURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UBLVersionID[@schemeID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UBLVersionID[@schemeName]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeName' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UBLVersionID[@schemeURI]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeURI' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UBLVersionID[@schemeVersionID]">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Attribute @schemeVersionID' marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:UUID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/cbc:VersionID">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="/p1:ApplicationResponse/ext:UBLExtensions">
            <report flag="warning" id="PEPPOL_CORE_R002" test="true()">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
        </rule>
    </pattern>
</schema>
