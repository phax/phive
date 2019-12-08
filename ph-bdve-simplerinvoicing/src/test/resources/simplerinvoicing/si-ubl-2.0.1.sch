<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
    xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
    xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
    xmlns:cn="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
    xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2">
    <!--
        Release 2.0 alpha
        Author: Jelte Jansen (SIDN)
        Email: support@simplerinvoicing.org
        Changes since 1.1.1:
        - Full rework based on EN/CEN PC 434/SI-UBL 2.0 (wip)

    -->
    <title>PC434-NL-specific Validation</title>
    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

    <!-- additional prefixes for EN-16931 -->
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
    <ns prefix="qdt" uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2"/>
    <ns prefix="udt" uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2"/>
    <ns prefix="cn" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

    <!-- basic CustomizationID check -->
    <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-UBL-VERSION">
        <rule context="ubl:Invoice" flag="fatal">
            <assert test="cbc:CustomizationID" flag="fatal">[BII2-T10-R001] An invoice MUST have a customization identifier</assert>
        </rule>
        <rule context="cn:CreditNote" flag="fatal">
            <assert test="cbc:CustomizationID" flag="fatal">[BII2-T10-R001] A credit note MUST have a customization identifier</assert>
        </rule>
        <!-- must be si 2.0 -->
        <rule context="cbc:CustomizationID">
            <assert test="contains(normalize-space(.), 'urn:cen.eu:en16931:2017#compliant#urn:fdc:nen.nl:nlcius:v1.0')" flag="fatal">[SI-V20-INV-R000]-This XML instance is NOT tagged as an SI-UBL 2.0 invoice or credit note; please check the CustomizationID value</assert>
        </rule>
        <rule context="/" flag="fatal">
            <assert test="ubl:Invoice or cn:CreditNote" flag="fatal">[SI-INV-R000]-This is not an SI-UBL 2.0 Invoice or CreditNote, validation cannot continue</assert>
        </rule>
    </pattern>

    <!-- EN-16931 -->
    <include href="si-ubl-2.0.1/CenPC434/abstract/EN16931-model.sch"/>
    <include href="si-ubl-2.0.1/CenPC434/abstract/EN16931-syntax.sch"/>

    <include href="si-ubl-2.0.1/CenPC434/codelist/EN16931-UBL-codes.sch"/>

    <include href="si-ubl-2.0.1/CenPC434/UBL/EN16931-UBL-model.sch"/>
    <include href="si-ubl-2.0.1/CenPC434/UBL/EN16931-UBL-syntax.sch"/>

    <!-- SI / NLCIUS specific additions -->
    <include href="si-ubl-2.0.1/si-ubl-2.0-nlcius.sch"/>
</schema>
