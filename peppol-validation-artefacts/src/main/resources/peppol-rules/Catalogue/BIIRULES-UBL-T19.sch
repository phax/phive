<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron assembly for BIIRULES using binding UBL and transaction T19 based on bii2rules-T19-BusinessRules-v05.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <title>BIIRULES T19 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" />
  <phase id="BIIRULES_T19_phase">
    <active pattern="UBL-T19" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codes-T19" />
  </phase>
  <include href="include/BIIRULES-T19-abstract.sch" />
  <include href="include/BIIRULES-UBL-T19-codes.sch" />
  <include href="include/BIIRULES-UBL-T19-test.sch" />
</schema>
