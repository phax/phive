<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

   <title>Norwegian rules for EHF Despatch Advice</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" prefix="ubl"/>

   <pattern>
      <rule context="cac:Country">
         <assert id="NOGOV-T16-R002"
                 test="cbc:IdentificationCode"
                 flag="fatal">[NOGOV-T16-R002]-Identification code MUST be specified when describing a country.</assert>
      </rule>
      <rule context="cac:DespatchSupplierParty">
         <assert id="NOGOV-T16-R003"
                 test="cac:Party"
                 flag="fatal">[NOGOV-T16-R003]-If despatch supplier element is present, party must be specified</assert>
      </rule>
      <rule context="cac:DeliverCustomerParty">
         <assert id="NOGOV-T16-R004"
                 test="cac:Party"
                 flag="fatal">[NOGOV-T16-R004]-If deliver customer element is present, party must be specified</assert>
      </rule>
      <rule context="cac:BuyerCustomerParty">
         <assert id="NOGOV-T16-R005"
                 test="cac:Party"
                 flag="fatal">[NOGOV-T16-R005]-If buyer customer element is present, party must be specified</assert>
      </rule>
      <rule context="cac:OriginatorCustomerParty">
         <assert id="NOGOV-T16-R006"
                 test="cac:Party"
                 flag="fatal">[NOGOV-T16-R006]-If originator customer element is present, party must be specified</assert>
      </rule>
      <rule context="cac:CarrierParty/cac:Person">
         <assert id="NOGOV-T16-R007"
                 test="cac:IdentityDocumentReference"
                 flag="fatal">[NOGOV-T16-R007]-If carrier person element is present, identity must be specified</assert>
      </rule>
      <rule context="cbc:ProfileID">
         <assert id="EHFPROFILE-T16-R001"
                 test=". = 'urn:www.cenbii.eu:profile:bii30:ver2.0'"
                 flag="fatal">[EHFPROFILE-T16-R001]-A despatch advice must only be used in profile 30</assert>
      </rule>
   </pattern>
</schema>
