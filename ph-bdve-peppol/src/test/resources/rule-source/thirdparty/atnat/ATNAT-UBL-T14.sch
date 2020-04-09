<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!
Schematron assembly for ATNAT using binding UBL and transaction T14 based on atnat-T14-BusinessRules-v05.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>ATNAT T14 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
  <phase id="ATNAT_T14_phase">
    <active pattern="UBL-T14" />
  </phase>
  <include href="include/ATNAT-T14-abstract.sch" />
  <include href="include/ATNAT-UBL-T14-test.sch" />
</schema>
