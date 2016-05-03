<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T58 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T58">
  <rule context="$catalogue_rejection">
    <assert test="$BII2-T58-R001" flag="fatal" id="BII2-T58-R001">[BII2-T58-R001]-A catalogue rejection MUST have a profile identifier</assert>
    <assert test="$BII2-T58-R002" flag="fatal" id="BII2-T58-R002">[BII2-T58-R002]-A catalogue rejection MUST have a customization identifier</assert>
    <assert test="$BII2-T58-R003" flag="fatal" id="BII2-T58-R003">[BII2-T58-R003]-A catalogue rejection MUST contain the date of issue</assert>
    <assert test="$BII2-T58-R004" flag="fatal" id="BII2-T58-R004">[BII2-T58-R004]-A catalogue rejection MUST contain the response identifier</assert>
    <assert test="$BII2-T58-R005" flag="fatal" id="BII2-T58-R005">[BII2-T58-R005]-The party sending the catalogue rejection MUST be specified</assert>
    <assert test="$BII2-T58-R006" flag="fatal" id="BII2-T58-R006">[BII2-T58-R006]-The party receiving the catalogue rejection MUST be specified</assert>
    <assert test="$BII2-T58-R009" flag="fatal" id="BII2-T58-R009">[BII2-T58-R009]-A catalogue rejection MUST contain a response decision</assert>
    <assert test="$BII2-T58-R010" flag="fatal" id="BII2-T58-R010">[BII2-T58-R010]-A catalogue rejection MUST contain a document reference</assert>
  </rule>
  <rule context="$Receiving_Party">
    <assert test="$BII2-T58-R008" flag="fatal" id="BII2-T58-R008">[BII2-T58-R008]-A catalogue rejection receiving party MUST contain the full name or an identifier</assert>
  </rule>
  <rule context="$Sending_Party">
    <assert test="$BII2-T58-R007" flag="fatal" id="BII2-T58-R007">[BII2-T58-R007]-A catalogue rejection sending party MUST contain the full name or an identifier</assert>
  </rule>
</pattern>
