<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!
Schematron assembly for atnat-invoice using binding UBL and transaction T10 based on atnat-T10-BusinessRules-v06.xlsx-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>atnat-invoice T10 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" />
  <phase id="atnat-invoice_T10_phase">
    <active pattern="UBL-T10" />
  </phase>
  <include href="include/atnat-invoice-abstract.sch" />
  <include href="include/atnat-invoice-ubl-test.sch" />
</schema>
