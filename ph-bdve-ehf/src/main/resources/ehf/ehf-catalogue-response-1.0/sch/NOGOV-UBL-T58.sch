<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

   <title>Norwegian rules for EHF Catalogue Response</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" prefix="ubl"/>

   <pattern>
      <rule context="/ubl:ApplicationResponse">
         <assert id="NOGOV-T58-R003"
                 test="cac:SenderParty/cbc:EndpointID"
                 flag="warning">[NOGOV-T58-R003]-A catalogue response should have sellers endpoint id.</assert>
         <assert id="NOGOV-T58-R004"
                 test="cac:ReceiverParty/cbc:EndpointID"
                 flag="warning">[NOGOV-T58-R004]-A catalogue response should have the receivers endpoint id.</assert>
      </rule>
      <rule context="cbc:ProfileID">
         <assert id="EHFPROFILE-T58-R001"
                 test=". = 'urn:www.cenbii.eu:profile:bii01:ver2.0'"
                 flag="fatal">[EHFPROFILE-T58-R001]-A Catalogue response must only be used in profile 1</assert>
      </rule>
   </pattern>
</schema>
