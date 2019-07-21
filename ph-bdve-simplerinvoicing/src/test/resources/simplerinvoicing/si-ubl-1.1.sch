<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt" xmlns="http://purl.oclc.org/dsdl/schematron">
    <!--
        This is a schematron file for the rules of SI-UBL 1.1 only.
    -->
    <title>Simplerinvoicing invoice v1.2 bound to UBL 2.1 and OPENPEPPOL v2</title>
    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

    <!-- version check -->
    <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-UBL-VERSIONS">
        <rule context="/">
            <assert test="ubl:Invoice" flag="fatal">[SI-INV-R000]-This is NOT a UBL 2.x Invoice, validation cannot continue</assert>
        </rule>
        <rule context="ubl:Invoice">
            <assert test="cbc:CustomizationID" flag="fatal">[BII2-T10-R001] An invoice MUST have a customization identifier</assert>
        </rule>
        <rule context="cbc:CustomizationID">
            <assert test="contains(normalize-space(.), 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.1')" flag="fatal">[SI-V11-INV-R200]-This XML instance is NOT tagged as an SI-UBL 1.1 invoice; please check the CustomizationID value</assert>
        </rule>
    </pattern>

    <!-- SimplerInvoicing Version 1.1 -->

    <include href="si-ubl-1.1/BII/abstract/BIIRULES-T10.sch"/>
    <include href="si-ubl-1.1/BII/UBL/BIIRULES-UBL-T10.sch"/>
    <include href="si-ubl-1.1/BII/codelist/BIIRULESCodesT10-UBL.sch"/>

    <include href="si-ubl-1.1/PEPPOL/abstract/OPENPEPPOL-T10.sch"/>
    <include href="si-ubl-1.1/PEPPOL/UBL/OPENPEPPOL-UBL-T10.sch"/>
    <include href="si-ubl-1.1/PEPPOL/codelist/OPENPEPPOLCodesT10-UBL.sch"/>

    <include href="si-ubl-1.1/SI-UBL-INV-V11-WARNING.SCH" />
    <include href="si-ubl-1.1/SI-UBL-INV-V11-FATAL.SCH" />
    <include href="si-ubl-1.1/SI-UBL-INV-V11-Codes.SCH" />
</schema>
