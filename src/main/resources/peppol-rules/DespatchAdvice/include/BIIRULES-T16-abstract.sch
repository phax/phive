<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T16-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T16">
  <rule context="$Consignee_Party">
    <assert flag="warning" test="$BII2-T16-R009" id="BII2-T16-R009">[BII2-T16-R009]-A consignee party SHOULD have the party name or a party identifier</assert>
  </rule>
  <rule context="$Item">
    <assert flag="fatal" test="$BII2-T16-R018" id="BII2-T16-R018">[BII2-T16-R018]-An item standard identifier MUST have an identification schema (e.g. GTIN)</assert>
  </rule>
  <rule context="$despatch_advice">
    <assert flag="fatal" test="$BII2-T16-R001" id="BII2-T16-R001">[BII2-T16-R001]-A despatch advice MUST have a customization identifier</assert>
    <assert flag="fatal" test="$BII2-T16-R002" id="BII2-T16-R002">[BII2-T16-R002]-A despatch advice MUST have a profile identifier</assert>
    <assert flag="fatal" test="$BII2-T16-R003" id="BII2-T16-R003">[BII2-T16-R003]-A despatch advice MUST have a document identifier</assert>
    <assert flag="fatal" test="$BII2-T16-R004" id="BII2-T16-R004">[BII2-T16-R004]-A despatch advice MUST have a document issue date</assert>
    <assert flag="warning" test="$BII2-T16-R005" id="BII2-T16-R005">[BII2-T16-R005]-A despatch advice SHOULD have an order identifier</assert>
    <assert flag="fatal" test="$BII2-T16-R006" id="BII2-T16-R006">[BII2-T16-R006]-A despatch advice MUST have a despatching party</assert>
    <assert flag="fatal" test="$BII2-T16-R008" id="BII2-T16-R008">[BII2-T16-R008]-A despatch advice MUST have a consignee party</assert>
    <assert flag="fatal" test="$BII2-T16-R012" id="BII2-T16-R012">[BII2-T16-R012]-A despatch advice MUST have at least one despatch advice line</assert>
  </rule>
  <rule context="$despatch_advice_Line">
    <assert flag="fatal" test="$BII2-T16-R013" id="BII2-T16-R013">[BII2-T16-R013]-Each despatch advice line MUST have a despatch line identifier that is unique within the despatch advice</assert>
    <assert flag="fatal" test="$BII2-T16-R016" id="BII2-T16-R016">[BII2-T16-R016]-Each despatch advice line MUST have an item identifier and/or an item name</assert>
    <assert flag="warning" test="$BII2-T16-R017" id="BII2-T16-R017">[BII2-T16-R017]-Each despatch advice line SHOULD have a delivered quantity</assert>
    <assert flag="fatal" test="$BII2-T16-R019" id="BII2-T16-R019">[BII2-T16-R019]-Each despatch advice line delivered quantity MUST not be negative</assert>
    <assert flag="warning" test="$BII2-T16-R020" id="BII2-T16-R020">[BII2-T16-R020]-Each despatch advice line delivered quantity  SHOULD have an associated unit of measure</assert>
    <assert flag="warning" test="$BII2-T16-R021" id="BII2-T16-R021">[BII2-T16-R021]-An outstanding quantity reason SHOULD be provided if the despatch line contains an outstanding quantity</assert>
  </rule>
  <rule context="$despatched_shipment">
    <assert flag="fatal" test="$BII2-T16-R011" id="BII2-T16-R011">[BII2-T16-R011]-Shipment identifier MUST be provided if the despatch advice contains shipment information</assert>
  </rule>
  <rule context="$despatching_Party">
    <assert flag="warning" test="$BII2-T16-R007" id="BII2-T16-R007">[BII2-T16-R007]-A despatching party SHOULD have the despatching party name</assert>
  </rule>
</pattern>
