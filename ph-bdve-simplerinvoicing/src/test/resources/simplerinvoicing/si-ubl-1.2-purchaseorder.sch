<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Order-2" queryBinding="xslt" xmlns="http://purl.oclc.org/dsdl/schematron">
    <!--
        Release 1.2
        Author: Rik Ribbers
        Email: info@simplerinvoicing.org


        Usable XPath statements for getting insight into Schematron file:
        //rule[@context=preceding-sibling::rule/@context]      - - - > Gets all rules that might not get fired because they have the same context as previous rules
        max(//assert/substring-before(text(), ']'))   - - - > Gets the maximum number of the current error numbering in the rule set
        //assert[@flag='fatal' or (not(@flag) and parent::rule/@flag='fatal')]    - - - > Gets all asserts that are flagged 'fatal'
        //assert[not(@flag) or @flag != parent::rule/@flag] - - - > Gets all asserts where the flag differs from the rule flag

        Development comments:
        To facilitate developers of software, the rules should point to the actual elements that are giving the problem. Sometimes this
        is not possible, like when the element is required but it's not there, but most times this should be possible.
        So instead of writing an assert with cbc:ID = 'something' you should ensure that the cbc:ID is matched in the context of the rule and the
        assert then only needs to check .='something'
        If the context would be a to broad match than limit it using predicates with a parent match like cbc:ID[parent::cac:TaxScheme]

    -->
    <title>Simplerinvoicing purchase order v1.2 bound to UBL 2.1 and OPENPEPPOL v2</title>
    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

    <!-- basic version-independent checks -->
    <include href="general/SI-UBL-PO-GENERAL.SCH" />


    <!-- SimplerInvoicing Version 1.2 -->

    <include href="si-ubl-1.2/si-po/SI-UBL-PO-V12-WARNING.SCH" />
    <include href="si-ubl-1.2/si-po/SI-UBL-PO-V12-FATAL.SCH" />
    <include href="si-ubl-1.2/si-po/SI-UBL-PO-V12-Codes.SCH" />

    <include href="si-ubl-1.2/si-po/BII/abstract/BIIRULES-T01.sch"/>
    <include href="si-ubl-1.2/si-po/BII/UBL/BIIRULES-UBL-T01.sch"/>
    <include href="si-ubl-1.2/si-po/BII/codelist/BIIRULESCodesT01-UBL.sch"/>

    <include href="si-ubl-1.2/si-po/PEPPOL/abstract/OPENPEPPOL-T01.sch"/>
    <include href="si-ubl-1.2/si-po/PEPPOL/UBL/OPENPEPPOL-UBL-T01.sch"/>
    <include href="si-ubl-1.2/si-po/PEPPOL/codelist/OPENPEPPOLCodesT01-UBL.sch"/>

</schema>
