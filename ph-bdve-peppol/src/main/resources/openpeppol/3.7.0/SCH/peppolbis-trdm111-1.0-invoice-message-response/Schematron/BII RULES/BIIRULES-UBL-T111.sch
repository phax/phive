<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso" queryBinding="xslt2">

  <title>BIIRULES  T11 bound to UBL</title>

  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"/>
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

  <pattern id="business_rules">
 		<rule context="cbc:ProfileID">
			<assert id="OP-T111-R001" 
					test="( normalize-space(.)='urn:www.peppol.eu:profile:bis63a:ver1.0' )" 
					flag="fatal">[OP-T111-R001]- An Invoice Response SHALL have the profile identifier "urn:www.peppol.eu:profile:bis63a:ver1.0".</assert>
		</rule>

  </pattern>

</schema>
