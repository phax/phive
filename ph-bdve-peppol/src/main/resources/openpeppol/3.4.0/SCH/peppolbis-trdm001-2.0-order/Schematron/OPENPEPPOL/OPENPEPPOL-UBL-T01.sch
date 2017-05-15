<?xml version="1.0" encoding="UTF-8"?>
<!-- 

        	UBL syntax binding to the T01   
        	Author: Oriol Bausà

     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Order-2" queryBinding="xslt2">
  <title>OPENPEPPOL  T01 bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2"/>
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
  <phase id="OPENPEPPOLT01_phase">
    <active pattern="UBL-T01"/>
  </phase>
  <phase id="codelist_phase">
    <active pattern="CodesT01"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/OPENPEPPOL-T01.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="UBL/OPENPEPPOL-UBL-T01.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="codelist/OPENPEPPOLCodesT01-UBL.sch"/>
</schema>
