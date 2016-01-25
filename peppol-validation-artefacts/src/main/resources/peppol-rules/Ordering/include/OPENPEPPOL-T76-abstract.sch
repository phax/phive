<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T76-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T76">
  <rule context="$endpoint">
    <assert flag="fatal" test="$EUGEN-T76-R001" id="EUGEN-T76-R001">[EUGEN-T76-R001]-An endpoint identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$line_status">
    <assert flag="fatal" test="$EUGEN-T76-R004" id="EUGEN-T76-R004">[EUGEN-T76-R004]-A response line status code MUST have a list identifier attribute “UNCL1225”</assert>
  </rule>
  <rule context="$party_identifier">
    <assert flag="fatal" test="$EUGEN-T76-R002" id="EUGEN-T76-R002">[EUGEN-T76-R002]-A party identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$response_code">
    <assert flag="fatal" test="$EUGEN-T76-R003" id="EUGEN-T76-R003">[EUGEN-T76-R003]-A response code MUST have a list identifier attribute “UNCL1225”</assert>
  </rule>
</pattern>
