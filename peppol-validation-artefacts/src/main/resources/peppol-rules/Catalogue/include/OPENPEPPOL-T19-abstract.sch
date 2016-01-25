<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T19-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T19">
  <rule context="$Attribute_identifier_scheme">
    <assert flag="fatal" test="$EUGEN-T19-R053" id="EUGEN-T19-R053">[EUGEN-T19-R053]-An attribute identifier MUST have an scheme identifier “UNCL6313” </assert>
  </rule>
  <rule context="$Classified_Tax_Category_Identifier">
    <assert flag="fatal" test="$EUGEN-T19-R049" id="EUGEN-T19-R049">[EUGEN-T19-R049]-A classified tax category identifier MUST have a scheme identifier attribute “UNCL5305”</assert>
  </rule>
  <rule context="$Country_Identification_Code">
    <assert flag="fatal" test="$EUGEN-T19-R047" id="EUGEN-T19-R047">[EUGEN-T19-R047]-A country identification code MUST have a list identifier attribute “ISO3166-1:Alpha2”</assert>
  </rule>
  <rule context="$Endpoint">
    <assert flag="fatal" test="$EUGEN-T19-R043" id="EUGEN-T19-R043">[EUGEN-T19-R043]-An endpoint identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$Header_level_action_code">
    <assert flag="fatal" test="$EUGEN-T19-R046" id="EUGEN-T19-R046">[EUGEN-T19-R046]-A catalogue header action code MUST have a list identifier attribute “ACTIONCODE:PEPPOL”</assert>
  </rule>
  <rule context="$Line_level_action_code">
    <assert flag="fatal" test="$EUGEN-T19-R045" id="EUGEN-T19-R045">[EUGEN-T19-R045]-A catalogue line action code MUST have a list identifier attribute “ACTIONCODE:BII2”</assert>
  </rule>
  <rule context="$Package_Level_Code">
    <assert flag="fatal" test="$EUGEN-T19-R050" id="EUGEN-T19-R050">[EUGEN-T19-R050]-A package level code MUST have a list identifier attribute “GS17009:PEPPOL“</assert>
  </rule>
  <rule context="$Party_Identifier">
    <assert flag="fatal" test="$EUGEN-T19-R044" id="EUGEN-T19-R044">[EUGEN-T19-R044]-A party identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$UNDG_Code">
    <assert flag="fatal" test="$EUGEN-T19-R051" id="EUGEN-T19-R051">[EUGEN-T19-R051]-A UNDG code MUST have a list identifier attribute “UNCL8273”</assert>
  </rule>
  <rule context="$Unit_Code">
    <assert flag="fatal" test="$EUGEN-T19-R048" id="EUGEN-T19-R048">[EUGEN-T19-R048]-A unit code attribute MUST have a unit code list identifier attribute “UNECERec20”</assert>
  </rule>
</pattern>
