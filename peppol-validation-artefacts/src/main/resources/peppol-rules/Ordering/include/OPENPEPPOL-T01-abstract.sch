<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T01-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T01">
  <rule context="$Country_identification">
    <assert flag="fatal" test="$EUGEN-T01-R015" id="EUGEN-T01-R015">[EUGEN-T01-R015]-A country identification code MUST have a list identifier attribute “ISO3166-1:Alpha2”</assert>
  </rule>
  <rule context="$Document_Currency">
    <assert flag="fatal" test="$EUGEN-T01-R014" id="EUGEN-T01-R014">[EUGEN-T01-R014]-A document currency code MUST have a list identifier attribute “ISO4217”</assert>
  </rule>
  <rule context="$Endpoint">
    <assert flag="fatal" test="$EUGEN-T01-R011" id="EUGEN-T01-R011">[EUGEN-T01-R011]-An endpoint identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$Order_Type">
    <assert flag="fatal" test="$EUGEN-T01-R013" id="EUGEN-T01-R013">[EUGEN-T01-R013]-An order type code MUST have a list identifier attribute “UNCL1001”</assert>
  </rule>
  <rule context="$Party_Identifier">
    <assert flag="fatal" test="$EUGEN-T01-R012" id="EUGEN-T01-R012">[EUGEN-T01-R012]-A party identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$Tax_Category_Identifier">
    <assert flag="fatal" test="$EUGEN-T01-R017" id="EUGEN-T01-R017">[EUGEN-T01-R017]-A tax category identifier MUST have a scheme identifier attribute “UNCL5305”</assert>
  </rule>
  <rule context="$Unit_Code">
    <assert flag="fatal" test="$EUGEN-T01-R016" id="EUGEN-T01-R016">[EUGEN-T01-R016]-A unit code attribute MUST have a unit code list identifier attribute “UNECERec20”</assert>
  </rule>
</pattern>
