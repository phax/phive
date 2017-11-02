<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T01 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T01">
  <rule context="$Country_identification">
    <assert test="$EUGEN-T01-R015" flag="fatal" id="EUGEN-T01-R015">[EUGEN-T01-R015]-A country
      identification code MUST have a list identifier attribute
      &#8220;ISO3166-1:Alpha2&#8221;</assert>
  </rule>
  <rule context="$Document_Currency">
    <assert test="$EUGEN-T01-R014" flag="fatal" id="EUGEN-T01-R014">[EUGEN-T01-R014]-A document
      currency code MUST have a list identifier attribute &#8220;ISO4217&#8221;</assert>
  </rule>
  <rule context="$Endpoint">
    <assert test="$EUGEN-T01-R011" flag="fatal" id="EUGEN-T01-R011">[EUGEN-T01-R011]-An endpoint
      identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$Order_Type">
    <assert test="$EUGEN-T01-R013" flag="fatal" id="EUGEN-T01-R013">[EUGEN-T01-R013]-An order type
      code MUST have a list identifier attribute &#8220;UNCL1001&#8221;</assert>
  </rule>
  <rule context="$Party_Identifier">
    <assert test="$EUGEN-T01-R012" flag="fatal" id="EUGEN-T01-R012">[EUGEN-T01-R012]-A party
      identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$Tax_Category_Identifier">
    <assert test="$EUGEN-T01-R017" flag="fatal" id="EUGEN-T01-R017">[EUGEN-T01-R017]-A tax category
      identifier MUST have a scheme identifier attribute &#8220;UNCL5305&#8221;</assert>
  </rule>
  <rule context="$Unit_Code">
    <assert test="$EUGEN-T01-R016" flag="fatal" id="EUGEN-T01-R016">[EUGEN-T01-R016]-A unit code
      attribute MUST have a unit code list identifier attribute &#8220;UNECERec20&#8221;</assert>
  </rule>
  <rule context="$Order">
    <assert test="$EUGEN-T01-R018" flag="warning" id="EUGEN-T01-R018">[EUGEN-T01-R018]- An order
      should not contain empty elements</assert>
  </rule>
  <rule context="$Expected_totals">
    <assert test="$EUGEN-T01-R019" flag="fatal" id="EUGEN-T01-R019">[EUGEN-T01-R019]- If <name/> is used, all order lines MUST have a Line total amount. Order line <value-of select="/ubl:Order/cac:OrderLine/cac:LineItem/cbc:ID[not(../cbc:LineExtensionAmount)]"/> has no line amount
     </assert>
    

  </rule>
  

</pattern>
