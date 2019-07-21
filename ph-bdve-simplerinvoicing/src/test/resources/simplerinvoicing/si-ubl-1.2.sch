<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt" xmlns="http://purl.oclc.org/dsdl/schematron">
    <!--
        Release 1.2
        Author: Rik Ribbers, Jelte Jansen (SIDN)
        Email: support@simplerinvoicing.org
        Changes since 1.1.1:
        - SI-UBL version 1.2 rules included
        - XSLT 2.0 support

        Release 1.1.1
        Author: Jelte Jansen (SIDN Labs)
        Changes since 1.1:
        - SI-UBL version detection is now based on CustomizationID instead of UBLVersion
        - Split up schematron tree into versions (v1.0 and v1.1)
        - Added UBL Business rules to v1.0 checker

        Release 1.1
        Author: M.P. Diepstra (Innopay)
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
            <assert test="contains(normalize-space(.), 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2')" flag="fatal">[SI-V12-INV-R200]-This XML instance is NOT tagged as an SI-UBL 1.2 invoice; please check the CustomizationID value</assert>
        </rule>
    </pattern>

    <!-- SimplerInvoicing Version 1.2 -->

    <include href="si-ubl-1.2/si-invoice/SI-UBL-INV-V12-WARNING.SCH" />
    <include href="si-ubl-1.2/si-invoice/SI-UBL-INV-V12-FATAL.SCH" />
    <include href="si-ubl-1.2/si-invoice/SI-UBL-INV-V12-Codes.SCH" />

    <include href="si-ubl-1.2/si-invoice/BII/abstract/BIIRULES-T10.sch"/>
    <include href="si-ubl-1.2/si-invoice/BII/UBL/BIIRULES-UBL-T10.sch"/>
    <include href="si-ubl-1.2/si-invoice/BII/codelist/BIIRULESCodesT10-UBL.sch"/>

    <include href="si-ubl-1.2/si-invoice/PEPPOL/abstract/OPENPEPPOL-T10.sch"/>
    <include href="si-ubl-1.2/si-invoice/PEPPOL/UBL/OPENPEPPOL-UBL-T10.sch"/>
    <include href="si-ubl-1.2/si-invoice/PEPPOL/codelist/OPENPEPPOLCodesT10-UBL.sch"/>

</schema>
