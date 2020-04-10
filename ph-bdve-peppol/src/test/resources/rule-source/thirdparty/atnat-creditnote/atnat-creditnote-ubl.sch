<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!
Schematron assembly for atnat-creditnote using binding UBL and transaction T14 based on atnat-T14-BusinessRules-v06.xlsx-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>atnat-creditnote T14 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
  <phase id="atnat-creditnote_T14_phase">
    <active pattern="UBL-T14" />
  </phase>
  <include href="include/atnat-creditnote-abstract.sch" />
  <include href="include/atnat-creditnote-ubl-test.sch" />
</schema>
