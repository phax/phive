<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for T16 -->
<!-- Timestamp: 2016-03-05 16:17:57 +0100 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T16">
  <rule context="$unit_code">
    <assert test="$EUGEN-T16-R004" flag="fatal" id="EUGEN-T16-R004">[EUGEN-T16-R004]-A unit code attribute MUST have a unit code list identifier attribute UNECERec20.</assert>
  </rule>
  <rule context="$undg_code">
    <assert test="$EUGEN-T16-R005" flag="fatal" id="EUGEN-T16-R005">[EUGEN-T16-R005]-A UNDG code MUST have a list identifier attribute UNCL8273</assert>
  </rule>
  <rule context="$transport_handling_unit_type">
    <assert test="$EUGEN-T16-R006" flag="fatal" id="EUGEN-T16-R006">[EUGEN-T16-R006]-A transport handling unit type code MUST have a list identifier attribute UNECERec21.</assert>
  </rule>
  <rule context="$endpoint">
    <assert test="$EUGEN-T16-R001" flag="fatal" id="EUGEN-T16-R001">[EUGEN-T16-R001]-An endpoint identifier MUST have a scheme identifier attribute.</assert>
  </rule>
  <rule context="$party">
    <assert test="$EUGEN-T16-R002" flag="fatal" id="EUGEN-T16-R002">[EUGEN-T16-R002]-A party identifier MUST have a scheme identifier attribute.</assert>
  </rule>
  <rule context="$country">
    <assert test="$EUGEN-T16-R003" flag="fatal" id="EUGEN-T16-R003">[EUGEN-T16-R003]-A country identification code MUST have a list identifier attribute ISO3166-1:Alpha2.</assert>
  </rule>
  <rule context="$despatch_advice_Line">
    <assert test="$EUGEN-T16-R007" flag="fatal" id="EUGEN-T16-R007">[EUGEN-T16-R007]-Each despatch advice line MUST have a delivered quantity</assert>
  </rule>
  <rule context="$despatch_advice">
  <assert test="$EUGEN-T16-R008" flag="warning" id="EUGEN-T16-R008">[EUGEN-T16-R008]- A despatch advice should not contain empty elements</assert>
  </rule>
</pattern>
