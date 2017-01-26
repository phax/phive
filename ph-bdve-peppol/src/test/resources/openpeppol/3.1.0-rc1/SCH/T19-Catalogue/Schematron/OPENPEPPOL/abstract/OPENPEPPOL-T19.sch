<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T19 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T19">
  <rule context="$Attribute_identifier_scheme">
    <assert test="$EUGEN-T19-R053" flag="fatal" id="EUGEN-T19-R053">[EUGEN-T19-R053]-An attribute identifier MUST have an scheme identifier &#8220;UNCL6313&#8221; </assert>
  </rule>
  <rule context="$Classified_Tax_Category_Identifier">
    <assert test="$EUGEN-T19-R049" flag="fatal" id="EUGEN-T19-R049">[EUGEN-T19-R049]-A classified tax category identifier MUST have a scheme identifier attribute &#8220;UNCL5305&#8221;</assert>
  </rule>
  <rule context="$Country_Identification_Code">
    <assert test="$EUGEN-T19-R047" flag="fatal" id="EUGEN-T19-R047">[EUGEN-T19-R047]-A country identification code MUST have a list identifier attribute &#8220;ISO3166-1:Alpha2&#8221;</assert>
  </rule>
  <rule context="$Endpoint">
    <assert test="$EUGEN-T19-R043" flag="fatal" id="EUGEN-T19-R043">[EUGEN-T19-R043]-An endpoint identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$Header_level_action_code">
    <assert test="$EUGEN-T19-R046" flag="fatal" id="EUGEN-T19-R046">[EUGEN-T19-R046]-A catalogue header action code MUST have a list identifier attribute &#8220;ACTIONCODE:PEPPOL&#8221;</assert>
  </rule>
  <rule context="$Line_level_action_code">
    <assert test="$EUGEN-T19-R045" flag="fatal" id="EUGEN-T19-R045">[EUGEN-T19-R045]-A catalogue line action code MUST have a list identifier attribute &#8220;ACTIONCODE:BII2&#8221;</assert>
  </rule>
  <rule context="$Package_Level_Code">
    <assert test="$EUGEN-T19-R050" flag="fatal" id="EUGEN-T19-R050">[EUGEN-T19-R050]-A package level code MUST have a list identifier attribute &#8220;GS17009:PEPPOL&#8220;</assert>
  </rule>
  <rule context="$Party_Identifier">
    <assert test="$EUGEN-T19-R044" flag="fatal" id="EUGEN-T19-R044">[EUGEN-T19-R044]-A party identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$UNDG_Code">
    <assert test="$EUGEN-T19-R051" flag="fatal" id="EUGEN-T19-R051">[EUGEN-T19-R051]-A UNDG code MUST have a list identifier attribute &#8220;UNCL8273&#8221;</assert>
  </rule>
  <rule context="$Unit_Code">
    <assert test="$EUGEN-T19-R048" flag="fatal" id="EUGEN-T19-R048">[EUGEN-T19-R048]-A unit code attribute MUST have a unit code list identifier attribute &#8220;UNECERec20&#8221;</assert>
  </rule>
</pattern>
