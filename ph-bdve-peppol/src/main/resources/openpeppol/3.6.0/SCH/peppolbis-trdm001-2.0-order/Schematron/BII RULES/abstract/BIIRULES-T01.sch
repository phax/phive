<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for T01 -->
<!-- Timestamp: 2016-03-05 16:35:53 +0100 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T01">
  <rule context="$Allowance_Charges">
    <assert test="$BII2-T01-R007" flag="fatal" id="BII2-T01-R007">[BII2-T01-R007]-Allowances and charges MUST have a reason</assert>
  </rule>
  <rule context="$Buyer">
    <assert test="$BII2-T01-R021" flag="fatal" id="BII2-T01-R021">[BII2-T01-R021]-An order MUST have the buyer party name or a buyer party identifier</assert>
  </rule>
  <rule context="$Expected_totals">
    <assert test="$BII2-T01-R012" flag="fatal" id="BII2-T01-R012">[BII2-T01-R012]-Expected total amount for payment MUST NOT be negative, if expected total amount for payment is provided</assert>
    <assert test="$BII2-T01-R013" flag="fatal" id="BII2-T01-R013">[BII2-T01-R013]-Expected total sum of line amounts MUST NOT be negative, if expected total sum of line amounts is provided</assert>
    <assert test="$BII2-T01-R014" flag="fatal" id="BII2-T01-R014">[BII2-T01-R014]-Expected total sum of line amounts MUST equal the sum of the order line amounts at order line level, if expected total sum of line amounts is provided</assert>
    <assert test="$BII2-T01-R015" flag="fatal" id="BII2-T01-R015">[BII2-T01-R015]-Expected total sum of allowance at document level MUST be equal to the sum of allowance amounts at document level, if expected total sum of allowance at document level is provided</assert>
    <assert test="$BII2-T01-R016" flag="fatal" id="BII2-T01-R016">[BII2-T01-R016]-Expected total sum of charges at document level MUST be equal to the sum of charges at document level, if expected total sum of charges at document level is provided</assert>
    <assert test="$BII2-T01-R017" flag="fatal" id="BII2-T01-R017">[BII2-T01-R017]-Expected total amount for payment MUST be equal to the sum of line amounts minus sum of allowances at document level plus sum of charges at document level  and VAT total amount, if expected total amount for payment is provided</assert>
  </rule>
  <rule context="$Item_property">
    <assert test="$BII2-T01-R019" flag="fatal" id="BII2-T01-R019">[BII2-T01-R019]-Each item property MUST have a data name, if item property is provided</assert>
    <assert test="$BII2-T01-R020" flag="fatal" id="BII2-T01-R020">[BII2-T01-R020]-Each item property MUST have a data value, if item property is provided</assert>
  </rule>
  <rule context="$Order">
    <assert test="$BII2-T01-R001" flag="fatal" id="BII2-T01-R001">[BII2-T01-R001]-An order MUST have a customization identifier</assert>
    <assert test="$BII2-T01-R002" flag="fatal" id="BII2-T01-R002">[BII2-T01-R002]-An order MUST have a profile identifier</assert>
    <assert test="$BII2-T01-R004" flag="fatal" id="BII2-T01-R004">[BII2-T01-R004]-An order MUST have a document issue date</assert>
    <assert test="$BII2-T01-R005" flag="warning" id="BII2-T01-R005">[BII2-T01-R005]-An order SHOULD provide information about its validity end date</assert>
    <assert test="$BII2-T01-R006" flag="fatal" id="BII2-T01-R006">[BII2-T01-R006]-An order MUST have a document identifier</assert>
    <assert test="$BII2-T01-R009" flag="fatal" id="BII2-T01-R009">[BII2-T01-R009]-An order MUST be stated in a single currency</assert>
    <assert test="$BII2-T01-R018" flag="warning" id="BII2-T01-R018">[BII2-T01-R018]-VAT total amount SHOULD be the sum of order line tax amounts, if order line tax amounts are provided</assert>
  </rule>
  <rule context="$Order_Line">
    <assert test="$BII2-T01-R003" flag="fatal" id="BII2-T01-R003">[BII2-T01-R003]-Each order line MUST have a document line identifier that is unique within the order</assert>
    <assert test="$BII2-T01-R010" flag="fatal" id="BII2-T01-R010">[BII2-T01-R010]-Each order line ordered quantity MUST not be negative</assert>
    <assert test="$BII2-T01-R011" flag="fatal" id="BII2-T01-R011">[BII2-T01-R011]-Each order line item net price MUST not be negative</assert>
    <assert test="$BII2-T01-R029" flag="warning" id="BII2-T01-R029">[BII2-T01-R029]-Each order line SHOULD have an ordered quantity</assert>
    <assert test="$BII2-T01-R030" flag="fatal" id="BII2-T01-R030">[BII2-T01-R030]-Each order line ordered quantity  MUST have an associated unit of measure</assert>
    <assert test="$BII2-T01-R031" flag="fatal" id="BII2-T01-R031">[BII2-T01-R031]-Each order line MUST have an item identifier and/or an item name</assert>
  </rule>
  <rule context="$Seller">
    <assert test="$BII2-T01-R022" flag="fatal" id="BII2-T01-R022">[BII2-T01-R022]-An order MUST have the seller party name or a seller party identifier</assert>
  </rule>
</pattern>
