<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T71-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T71">
  <rule context="$Receiving_Party">
    <assert flag="fatal" test="$BII2-T71-R008" id="BII2-T71-R008">[BII2-T71-R008]-A message level response receiving party MUST contain the full name or an identifier</assert>
  </rule>
  <rule context="$Sending_Party">
    <assert flag="fatal" test="$BII2-T71-R007" id="BII2-T71-R007">[BII2-T71-R007]-A message level response sending party MUST contain the full name or an identifier</assert>
  </rule>
  <rule context="$message_level_response">
    <assert flag="fatal" test="$BII2-T71-R001" id="BII2-T71-R001">[BII2-T71-R001]-A message level response MUST have a profile identifier</assert>
    <assert flag="fatal" test="$BII2-T71-R002" id="BII2-T71-R002">[BII2-T71-R002]-A message level response MUST have a customization identifier</assert>
    <assert flag="fatal" test="$BII2-T71-R003" id="BII2-T71-R003">[BII2-T71-R003]-A message level response MUST contain the date of issue</assert>
    <assert flag="fatal" test="$BII2-T71-R004" id="BII2-T71-R004">[BII2-T71-R004]-A message level response MUST contain the response identifier</assert>
    <assert flag="fatal" test="$BII2-T71-R005" id="BII2-T71-R005">[BII2-T71-R005]-The party sending the message level response  MUST be specified</assert>
    <assert flag="fatal" test="$BII2-T71-R006" id="BII2-T71-R006">[BII2-T71-R006]-The party receiving the message level response  MUST be specified</assert>
    <assert flag="fatal" test="$BII2-T71-R010" id="BII2-T71-R010">[BII2-T71-R010]-A message level response MUST contain a document reference pointing towards the business message that the response relates to</assert>
    <assert flag="fatal" test="$BII2-T71-R012" id="BII2-T71-R012">[BII2-T71-R012]-A response document MUST be able to clearly indicate whether the received document was accepted or not.</assert>
  </rule>
</pattern>
