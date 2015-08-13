<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron assembly for OPENPEPPOL using binding UBL and transaction T16 based on OpenPEPPOL-T16-BusinessRules-v01.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <title>OPENPEPPOL T16 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" />
  <phase id="OPENPEPPOL_T16_phase">
    <active pattern="UBL-T16" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codes-T16" />
  </phase>
  <include href="include/OPENPEPPOL-T16-abstract.sch" />
  <include href="include/OPENPEPPOL-UBL-T16-codes.sch" />
  <include href="include/OPENPEPPOL-UBL-T16-test.sch" />
</schema>
