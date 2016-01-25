<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T76 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T76">
  <rule context="$endpoint">
    <assert test="$EUGEN-T76-R001" flag="fatal" id="EUGEN-T76-R001">[EUGEN-T76-R001]-An endpoint identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$line_status">
    <assert test="$EUGEN-T76-R004" flag="fatal" id="EUGEN-T76-R004">[EUGEN-T76-R004]-A response line status code MUST have a list identifier attribute &#8220;UNCL1225&#8221;</assert>
  </rule>
  <rule context="$party_identifier">
    <assert test="$EUGEN-T76-R002" flag="fatal" id="EUGEN-T76-R002">[EUGEN-T76-R002]-A party identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$response_code">
    <assert test="$EUGEN-T76-R003" flag="fatal" id="EUGEN-T76-R003">[EUGEN-T76-R003]-A response code MUST have a list identifier attribute &#8220;UNCL1225&#8221;</assert>
  </rule>
</pattern>
