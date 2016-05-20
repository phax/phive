<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T16-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T16">
  <rule context="$country">
    <assert flag="fatal" test="$EUGEN-T16-R003" id="EUGEN-T16-R003">[EUGEN-T16-R003]-A country identification code MUST have a list identifier attribute ISO3166-1:Alpha2.</assert>
  </rule>
  <rule context="$despatch_advice_Line">
    <assert flag="fatal" test="$EUGEN-T16-R007" id="EUGEN-T16-R007">[EUGEN-T16-R007]-Each despatch advice line MUST have a delivered quantity</assert>
  </rule>
  <rule context="$endpoint">
    <assert flag="fatal" test="$EUGEN-T16-R001" id="EUGEN-T16-R001">[EUGEN-T16-R001]-An endpoint identifier MUST have a scheme identifier attribute.</assert>
  </rule>
  <rule context="$party">
    <assert flag="fatal" test="$EUGEN-T16-R002" id="EUGEN-T16-R002">[EUGEN-T16-R002]-A party identifier MUST have a scheme identifier attribute.</assert>
  </rule>
  <rule context="$transport_handling_unit_type">
    <assert flag="fatal" test="$EUGEN-T16-R006" id="EUGEN-T16-R006">[EUGEN-T16-R006]-A transport handling unit type code MUST have a list identifier attribute UNECERec21.</assert>
  </rule>
  <rule context="$undg_code">
    <assert flag="fatal" test="$EUGEN-T16-R005" id="EUGEN-T16-R005">[EUGEN-T16-R005]-A UNDG code MUST have a list identifier attribute UNCL8273</assert>
  </rule>
  <rule context="$unit_code">
    <assert flag="fatal" test="$EUGEN-T16-R004" id="EUGEN-T16-R004">[EUGEN-T16-R004]-A unit code attribute MUST have a unit code list identifier attribute UNECERec20.</assert>
  </rule>
</pattern>
