<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" queryBinding="xslt2">
	<title>BIIRULES  T77 bound to UBL</title>
	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
	<phase id="BIIRULEST77_phase">
		<active pattern="UBL-T77"/>
	</phase>
	<phase id="codelist_phase">
		<active pattern="CodesT77"/>
	</phase>
	<!-- Abstract CEN BII patterns -->
	<!-- ========================= -->
	<include href="abstract/BIIRULES-T77.sch"/>
	<!-- Data Binding parameters -->
	<!-- ======================= -->
	<include href="UBL/BIIRULES-UBL-T77.sch"/>
	<!-- Code Lists Binding rules -->
	<!-- ======================== -->
	<include href="codelist/BIIRULESCodesT77-UBL.sch"/>
</schema>
