<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

  <title>Norwegian rules for EHF Punch Out</title>

  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" prefix="ubl"/>

  <!--
    00X - Document level
    03X - Delivery
    05X - Totals

    1XX - Line level

    2XX - Item level
    21X - Item Properties
    22X - Tax category
  -->

  <pattern>
    <rule context="ubl:Catalogue">
      <assert id="EHF-T77-R001"
              test="cbc:ProfileID"
              flag="fatal">Punch out MUST have a profile identification.</assert>
    </rule>

    <rule context="cac:Item">
      <assert id="EHF-T77-R220"
              test="cac:ClassifiedTaxCategory"
              flag="fatal">Tax category on line level MUST exists.</assert>
    </rule>

    <rule context="cac:AdditionalItemProperty">
      <assert id="EHF-T77-R210"
              test="cbc:Value"
              flag="fatal">Additional item property MUST have a value.</assert>
    </rule>
  </pattern>

</schema>
