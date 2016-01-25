<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T71-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T71">
  <rule context="$Document_Type_Code">
    <assert flag="fatal" test="$EUGEN-T71-R001" id="EUGEN-T71-R001">[EUGEN-T71-R001]-An document type code MUST have a list identifier attribute 'UNCL1001'.</assert>
  </rule>
  <rule context="$Endpoint">
    <assert flag="fatal" test="$EUGEN-T71-R004" id="EUGEN-T71-R004">[EUGEN-T71-R004]-An endpoint identifier MUST have a scheme identifier attribute.</assert>
  </rule>
  <rule context="$Issue_Type_Code">
    <assert flag="fatal" test="$EUGEN-T71-R003" id="EUGEN-T71-R003">[EUGEN-T71-R003]-A status reason code MUST have a list identifier attribute ‘PEPPOLSTATUS'</assert>
  </rule>
  <rule context="$Party_Identifier">
    <assert flag="fatal" test="$EUGEN-T71-R005" id="EUGEN-T71-R005">[EUGEN-T71-R005]-A party identifier MUST have a scheme identifier attribute.</assert>
  </rule>
  <rule context="$Response_Code">
    <assert flag="fatal" test="$EUGEN-T71-R002" id="EUGEN-T71-R002">[EUGEN-T71-R002]-A response code MUST have a list identifier attribute 'UNCL4343'.</assert>
  </rule>
</pattern>
