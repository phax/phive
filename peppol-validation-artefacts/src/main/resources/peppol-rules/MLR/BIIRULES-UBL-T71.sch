<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron assembly for BIIRULES using binding UBL and transaction T71 based on bii2rules-T71-BusinessRules-v03.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <title>BIIRULES T71 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" />
  <phase id="BIIRULES_T71_phase">
    <active pattern="UBL-T71" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codes-T71" />
  </phase>
  <include href="include/BIIRULES-T71-abstract.sch" />
  <include href="include/BIIRULES-UBL-T71-codes.sch" />
  <include href="include/BIIRULES-UBL-T71-test.sch" />
</schema>
