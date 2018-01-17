<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:u="utils"
        schemaVersion="iso" queryBinding="xslt2">

  <title>Common EHF rules for Post-Award</title>

  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" prefix="ubl-application-response"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" prefix="ubl-catalogue"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" prefix="ubl-despatch-advice"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2" prefix="ubl-order"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2" prefix="ubl-order-response"/>
  <ns uri="utils" prefix="u"/>

  <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:gln" as="xs:boolean">
    <param name="val"/>
    <variable name="length" select="string-length($val) - 1"/>
    <variable name="digits" select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
    <variable name="weightedSum" select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (1 + ((($i + 1) mod 2) * 2)))"/>
    <value-of select="10 - ($weightedSum mod 10) = number(substring($val, $length + 1, 1))"/>
  </function>

  <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:mod11" as="xs:boolean">
    <param name="val"/>
    <variable name="length" select="string-length($val) - 1"/>
    <variable name="digits" select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
    <variable name="weightedSum" select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (($i mod 6) + 2))"/>
    <value-of select="number($val) &gt; 0 and (11 - ($weightedSum mod 11)) mod 11 = number(substring($val, $length + 1, 1))"/>
  </function>

  <pattern>
    <rule context="cbc:*">
      <assert id="EHF-COMMON-R001"
              test=". != ''"
              flag="fatal">Document MUST not contain empty elements.</assert>
    </rule>
    <rule context="cac:*">
      <assert id="EHF-COMMON-R002"
              test="count(*) != 0"
              flag="fatal">Document MUST not contain empty elements.</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="/*">
      <assert id="EHF-COMMON-R003"
              test="not(@*:schemaLocation)"
              flag="warning">Document SHOULD not contain schema location.</assert>
      <assert id="EHF-COMMON-R004"
              test="cbc:UBLVersionID"
              flag="fatal">Document MUST have a syntax identifier.</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = 'NO:ORGNR']">
      <assert id="EHF-COMMON-R010"
              test="matches(., '^[0-9]{9}$') and u:mod11(.)"
              flag="fatal">MUST be a valid Norwegian organization number. Only numerical value allowed</assert>
    </rule>
    <rule context="cbc:EndpointID">
      <assert id="EHF-COMMON-R014"
              test="false()"
              flag="fatal">An endpoint identifier scheme MUST have the value 'NO:ORGNR'.</assert>
    </rule>
    <rule context="cac:PartyIdentification/cbc:ID[@schemeID = 'NO:ORGNR']">
      <assert id="EHF-COMMON-R011"
              test="matches(., '^[0-9]{9}$') and u:mod11(.)"
              flag="fatal">When scheme is NO:ORGNR, a valid Norwegian organization number must be used. Only numerical value allowed</assert>
    </rule>
    <rule context="cbc:CompanyID[@schemeID = 'NO:VAT'] | cac:PartyTaxScheme/cbc:CompanyID[not(@schemeID)]">
      <assert id="EHF-COMMON-R012"
              test="matches(., '^[0-9]{9}MVA$') and u:mod11(substring(., 1, 9))"
              flag="fatal">A VAT number MUST be valid Norwegian organization number (nine numbers) followed by the letters MVA.</assert>
    </rule>
    <rule context="cbc:CompanyID[@schemeID = 'NO:ORGNR'] | cac:PartyLegalEntity/cbc:CompanyID[not(@schemeID)]">
      <assert id="EHF-COMMON-R013"
              test="matches(., '^[0-9]{9}$') and u:mod11(.)"
              flag="fatal">When scheme is NO:ORGNR, a valid Norwegian organization number must be used. Only numerical value allowed</assert>
    </rule>
    <rule context="cac:*[ends-with(name(), 'TaxCategory')]/cbc:ID">
      <assert id="EHF-COMMON-R020"
              test="some $code in tokenize('AA E H K R S Z', '\s') satisfies $code = normalize-space(.)"
              flag="fatal">Tax categories MUST be one of the follwoing codes:  AA E H K R S Z</assert>
    </rule>
    <rule context="cbc:*[ends-with(name(), 'Date')]">
      <assert id="EHF-COMMON-R030"
              test="(string(.) castable as xs:date) and (string-length(.) = 10)"
              flag="fatal">A date must be formatted YYYY-MM-DD.</assert>
    </rule>
    <rule context="cbc:ID[@schemeID = 'GLN']">
       <assert id="EHF-COMMON-R040"
               test="matches(., '^[0-9]+$') and u:gln(.)"
               flag="warning">Invalid GLN number provided.</assert>
    </rule>
    <rule context="cbc:EmbeddedDocumentBinaryObject[@mimeCode]">
      <assert id="EHF-COMMON-R100"
              test="some $code in tokenize('application/pdf image/gif image/tiff image/jpeg image/png text/plain', '\s') satisfies $code = normalize-space(@mimeCode)"
              flag="warning">Attachment is not a recommended MIMEType.</assert>
    </rule>
  </pattern>

 </schema>
