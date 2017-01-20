<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt" xmlns="http://purl.oclc.org/dsdl/schematron">
    <!--
        Release 1.1.1
        Author: Jelte Jansen (SIDN Labs)
        Changes since 1.1:
        - SI-UBL version detection is now based on CustomizationID instead of UBLVersion
        - Split up schematron tree into versions (v1.0 and v1.1)
        - Added UBL Business rules to v1.0 checker

        Release 1.1
        Author: M.P. Diepstra (Innopay) 
        Email: support@simplerinvoicing.org

        Usable XPath statements for getting insight into Schematron file:
        //rule[@context=preceding-sibling::rule/@context]      - - - > Gets all rules that might not get fired because they have the same context as previous rules
        max(//assert/substring-before(text(), ']'))   - - - > Gets the maximum number of the current error numbering in the rule set
        //assert[@flag='fatal' or (not(@flag) and parent::rule/@flag='fatal')]    - - - > Gets all asserts that are flagged 'fatal'
        //assert[not(@flag) or @flag != parent::rule/@flag] - - - > Gets all asserts where the flag differs from the rule flag 

        Development comments:
        To facilitate developers of invoicing software, the rules should point to the actual elements that are giving the problem. Sometimes this
        is not possible, like when the element is required but it's not there, but most times this should be possible.
        So instead of writing an assert with cbc:ID = 'something' you should ensure that the cbc:ID is matched in the context of the rule and the
        assert then only needs to check .='something' 
        If the context would be a to broad match than limit it using predicates with a parent match like cbc:ID[parent::cac:TaxScheme]
        
        TODO: 
            - Add calculation rules for going from taxamount to transactioncurrencyamount
            - Fix PEPPOL and BII rules to ensure that they target the proper context to facilitate easier pinpointing of problems
            - Fix BII rules for payable amounts calculation 
                        - doesn't work when prepaid is filled, but payable amounts is still the same
                        - doesn't check payable rounding amounts correctly
            - Add warnings for elements not in the core
            - Decide whether or not multiple occurences of items that have macoccur of 1 should be fatal or warning
    -->
    <title>Simplerinvoicing invoice v1.1 bound to UBL 2.1 and OPENPEPPOL v2</title>
    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>

    <phase id="invoice_phase">
        <active pattern="BII-UBL-T10"/>
        <active pattern="PEPPOL-UBL-T10"/>
        <active pattern="SI-V11-INV"/>
    </phase>
    <phase id="codelist_phase">
        <active pattern="BII-CodesT10"/>
        <active pattern="PEPPOL-CodesT10"/>
        <active pattern="SI-V11-CODES"/>
    </phase>
    <phase id="warning_phase">
        <active pattern="SI-V11-INV-WARNING"/>
    </phase>
    <phase id="simplerinvoicing_compatibility_phase">
        <active pattern="SI-V10-INV-FATAL"/>
        <active pattern="SI-V10-INV-WARNING"/>
    </phase>

    <!-- basic version-independent checks -->
    <include href="general/SI-UBL-GENERAL.SCH" />

    <!-- SimplerInvoicing Version 1.1 -->

    <include href="v1.1/BII/abstract/BIIRULES-T10.sch"/>
    <include href="v1.1/BII/UBL/BIIRULES-UBL-T10.sch"/>
    <include href="v1.1/BII/codelist/BIIRULESCodesT10-UBL.sch"/>
    
    <!-- PEPPOL patterns -->
    <include href="v1.1/PEPPOL/abstract/OPENPEPPOL-T10.sch"/>
    <include href="v1.1/PEPPOL/UBL/OPENPEPPOL-UBL-T10.sch"/>
    <include href="v1.1/PEPPOL/codelist/OPENPEPPOLCodesT10-UBL.sch"/>
	
    <!-- and SI itself -->
    <include href="v1.1/SI-UBL-INV-V11-WARNING.SCH" />
    <include href="v1.1/SI-UBL-INV-V11-FATAL.SCH" />
    <include href="v1.1/SI-UBL-INV-V11-Codes.SCH" />
    

    <!-- SimplerInvoicing Version 1.0 -->
    <include href="v1.0/SI-UBL-INV-V10-FATAL.SCH"/>
    <include href="v1.0/SI-UBL-INV-V10-WARNING.SCH"/>

    <include href="v1.0/biirules/abstract/BIIRULES-T10.sch"/>
    <include href="v1.0/biirules/UBL/BIIRULES-UBL-T10.sch"/>
</schema>
