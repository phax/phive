<?xml version="1.0" encoding="UTF-8"?>
<!--

            UBL syntax binding to the T77
            Created by Validex Schematron Generator. (2015) Midran Ltd.
            Timestamp: 2016-12-22 19:47:44 +0000
     -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso" queryBinding="xslt2">
  <title>OPENPEPPOL  T77 bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"/>
  <phase id="BIIRULEST77_phase">
    <active pattern="UBL-T77"/>
  </phase>
  <phase id="codelist_phase">
    <active pattern="CodesT77"/>
  </phase>
  <!-- Abstract CEN BII patterns -->
  <!-- ========================= -->
  <include href="abstract/OPENPEPPOLRULES-T77.sch"/>
  <!-- Data Binding parameters -->
  <!-- ======================= -->
  <include href="UBL/OPENPEPPOLRULES-UBL-T77.sch"/>
  <!-- Code Lists Binding rules -->
  <!-- ======================== -->
  <include href="codelist/OPENPEPPOLRULESCodesT77-UBL.sch"/>
</schema>
