<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T58 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T58">
  <rule context="$endpoint">
    <assert test="$EUGEN-T58-R001" flag="fatal" id="EUGEN-T58-R001">[EUGEN-T58-R001]-An endpoint identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$party_identifier">
    <assert test="$EUGEN-T58-R002" flag="fatal" id="EUGEN-T58-R002">[EUGEN-T58-R002]-A party identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$response_code">
    <assert test="$EUGEN-T58-R003" flag="fatal" id="EUGEN-T58-R003">[EUGEN-T58-R003]-A response code MUST have a list identifier attribute &#8220;UNCL4343&#8221;</assert>
  </rule>
</pattern>
