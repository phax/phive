<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron assembly for OPENPEPPOL using binding UBL and transaction T01 based on OpenPEPPOL-T01-BusinessRules-v01.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <title>OPENPEPPOL T01 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2" />
  <phase id="OPENPEPPOL_T01_phase">
    <active pattern="UBL-T01" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codes-T01" />
  </phase>
  <include href="include/OPENPEPPOL-T01-abstract.sch" />
  <include href="include/OPENPEPPOL-UBL-T01-codes.sch" />
  <include href="include/OPENPEPPOL-UBL-T01-test.sch" />
</schema>
