<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for T77 -->
<!-- Timestamp: 2016-12-22 19:47:44 +0000 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T77">
  <rule context="$Endpoint">
    <assert test="$EUGEN-T77-R013" flag="fatal" id="EUGEN-T77-R013">[EUGEN-T77-R013]-An endpoint identifier MUST have a scheme identifier attribute</assert>
    <assert test="$EUGEN-T77-R014" flag="fatal" id="EUGEN-T77-R014">[EUGEN-T77-R014]-A party identifier MUST have a scheme identifier attribute</assert>
  </rule>
  <rule context="$Item">
    <assert test="$EUGEN-T77-R012" flag="fatal" id="EUGEN-T77-R012">[EUGEN-T77-R012]-Only one attachment may be identified as main image.</assert>
  </rule>
  <rule context="$ServiceIndicator">
    <assert test="$EUGEN-T77-R010" flag="fatal" id="EUGEN-T77-R010">[EUGEN-T77-R010]-For AdditionalItemProperties where name is ServiceIndicator the value may only be "true" or "false".</assert>
  </rule>
  <rule context="$ItemClassification">
    <assert test="$EUGEN-T77-R017" flag="fatal" id="EUGEN-T77-R017">[EUGEN-T77-R017]-Item classification codes MUST include code list value (listID)</assert>
  </rule>
  <rule context="$PriceAndQuantity">
    <assert test="$EUGEN-T77-R008" flag="fatal" id="EUGEN-T77-R008">[EUGEN-T77-R008]-Unit code for price base quantity must be same as for batch quantity.</assert>
    <assert test="$EUGEN-T77-R009" flag="fatal" id="EUGEN-T77-R009">[EUGEN-T77-R009]-Each line must have a price.</assert>
    <assert test="$EUGEN-T77-R011" flag="fatal" id="EUGEN-T77-R011">[EUGEN-T77-R011]-LeadTimeMeasure unitCode shall only be DAY</assert>
  </rule>
  <rule context="$PunchOut">
    <assert test="$EUGEN-T77-R001" flag="fatal" id="EUGEN-T77-R001">[EUGEN-T77-R001]-CustomizationID shall be urn:www.cenbii.eu:transaction:biitrns077:ver2.0:extended:www.peppol.eu:bis:peppol18a:ver1.0</assert>
    <assert test="$EUGEN-T77-R002" flag="fatal" id="EUGEN-T77-R002">[EUGEN-T77-R002]-ProfileID shall be urn:www.cenbii.eu:profile:bii18:ver1.0</assert>
    <assert test="$EUGEN-T77-R003" flag="fatal" id="EUGEN-T77-R003">[EUGEN-T77-R003]-The validity period end date may not be earlier than the issue date.</assert>
    <assert test="$EUGEN-T77-R004" flag="fatal" id="EUGEN-T77-R004">[EUGEN-T77-R004]-Complete cart indicator may only be "true" or "false"</assert>
    <assert test="$EUGEN-T77-R006" flag="warning" id="EUGEN-T77-R006">[EUGEN-T77-R006]-The shopping cart message should contain the Sellers end point id.</assert>
    <assert test="$EUGEN-T77-R007" flag="warning" id="EUGEN-T77-R007">[EUGEN-T77-R007]-The shopping cart message should contain the Buyers end point id.</assert>
    <assert test="$EUGEN-T77-R015" flag="fatal" id="EUGEN-T77-R015">[EUGEN-T77-R015]-UBL version must be 2.1</assert>
  </rule>
</pattern>
