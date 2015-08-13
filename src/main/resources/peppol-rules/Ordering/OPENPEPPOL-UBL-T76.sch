<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron assembly for OPENPEPPOL using binding UBL and transaction T76 based on OpenPEPPOL-T76-BusinessRules-v01.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <title>OPENPEPPOL T76 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2" />
  <phase id="OPENPEPPOL_T76_phase">
    <active pattern="UBL-T76" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codes-T76" />
  </phase>
  <include href="include/OPENPEPPOL-T76-abstract.sch" />
  <include href="include/OPENPEPPOL-UBL-T76-codes.sch" />
  <include href="include/OPENPEPPOL-UBL-T76-test.sch" />
</schema>
