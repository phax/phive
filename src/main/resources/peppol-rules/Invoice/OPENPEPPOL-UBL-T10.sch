<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron assembly for OPENPEPPOL using binding UBL and transaction T10 based on OpenPEPPOL-T10-BusinessRules-v03.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <title>OPENPEPPOL T10 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" />
  <phase id="OPENPEPPOL_T10_phase">
    <active pattern="UBL-T10" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codes-T10" />
  </phase>
  <include href="include/OPENPEPPOL-T10-abstract.sch" />
  <include href="include/OPENPEPPOL-UBL-T10-codes.sch" />
  <include href="include/OPENPEPPOL-UBL-T10-test.sch" />
</schema>
