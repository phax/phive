<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T14 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T14">
  <rule context="$Allowance_Charge">
    <assert test="$BII2-T14-R025" flag="fatal" id="BII2-T14-R025">[BII2-T14-R025]-Each document level allowance or charge details MUST have an allowance and charge reason text</assert>
    <assert test="$BII2-T14-R043" flag="fatal" id="BII2-T14-R043">[BII2-T14-R043]-Document level allowances and charges details MUST have allowance and charge VAT category if the credit note has a VAT total amount</assert>
  </rule>
  <rule context="$Credit_Note">
    <assert test="$BII2-T14-R001" flag="fatal" id="BII2-T14-R001">[BII2-T14-R001]-A credit note MUST have a customization identifier</assert>
    <assert test="$BII2-T14-R002" flag="fatal" id="BII2-T14-R002">[BII2-T14-R002]-A credit note MUST have a business process identifier</assert>
    <assert test="$BII2-T14-R003" flag="fatal" id="BII2-T14-R003">[BII2-T14-R003]-A credit note MUST have a credit note identifier</assert>
    <assert test="$BII2-T14-R004" flag="fatal" id="BII2-T14-R004">[BII2-T14-R004]-A credit note MUST have a credit note issue date</assert>
    <assert test="$BII2-T14-R005" flag="fatal" id="BII2-T14-R005">[BII2-T14-R005]-A credit note MUST specify the currency code for the document</assert>
    <assert test="$BII2-T14-R006" flag="fatal" id="BII2-T14-R006">[BII2-T14-R006]-A credit note MUST have a seller name and/or a seller identifier</assert>
    <assert test="$BII2-T14-R008" flag="fatal" id="BII2-T14-R008">[BII2-T14-R008]-A credit note MUST have a buyer name and/or a buyer identifier</assert>
    <assert test="$BII2-T14-R010" flag="fatal" id="BII2-T14-R010">[BII2-T14-R010]-A credit note MUST have the sum of line amounts</assert>
    <assert test="$BII2-T14-R011" flag="fatal" id="BII2-T14-R011">[BII2-T14-R011]-A credit note MUST have the credit note total without VAT</assert>
    <assert test="$BII2-T14-R012" flag="fatal" id="BII2-T14-R012">[BII2-T14-R012]-A credit note MUST have the credit note total with VAT (value of purchase)</assert>
    <assert test="$BII2-T14-R013" flag="fatal" id="BII2-T14-R013">[BII2-T14-R013]-A credit note MUST have the amount due for payment</assert>
    <assert test="$BII2-T14-R014" flag="fatal" id="BII2-T14-R014">[BII2-T14-R014]-A credit note MUST have at least one credit note line</assert>
    <assert test="$BII2-T14-R015" flag="fatal" id="BII2-T14-R015">[BII2-T14-R015]-A credit note MUST specify the VAT total amount, if there are VAT line amounts</assert>
    <assert test="$BII2-T14-R026" flag="fatal" id="BII2-T14-R026">[BII2-T14-R026]-A credit note MUST contain VAT category details  unless VAT total amount is omitted.</assert>
    <assert test="$BII2-T14-R035" flag="fatal" id="BII2-T14-R035">[BII2-T14-R035]-Credit Note total with VAT MUST NOT be negative</assert>
    <assert test="$BII2-T14-R037" flag="fatal" id="BII2-T14-R037">[BII2-T14-R037]-Amount due for payment in a credit note MUST NOT be negative</assert>
    <assert test="$BII2-T14-R044" flag="fatal" id="BII2-T14-R044">[BII2-T14-R044]-A seller VAT identifier MUST be provided if the credit note has a VAT total amount</assert>
    <assert test="$BII2-T14-R047" flag="fatal" id="BII2-T14-R047">[BII2-T14-R047]-A buyer VAT identifier MUST be present if the VAT category code is reverse VAT</assert>
    <assert test="$BII2-T14-R049" flag="fatal" id="BII2-T14-R049">[BII2-T14-R049]-The credit note total without VAT MUST be equal to the VAT category taxable amount if the VAT category code is reverse charge</assert>
    <assert test="$BII2-T14-R050" flag="fatal" id="BII2-T14-R050">[BII2-T14-R050]-The VAT category tax amount MUST be zero  if the VAT category code is reverse charge (since there is only one VAT category allowed it follows that the credit note tax total for reverse charge credit notes is zero)</assert>
    <assert test="$BII2-T14-R058" flag="fatal" id="BII2-T14-R058">[BII2-T14-R058]-Credit Note total without VAT MUST be equal to the sum of VAT category taxable amounts</assert>
  </rule>
  <rule context="$Credit_Note_Line">
    <assert test="$BII2-T14-R017" flag="fatal" id="BII2-T14-R017">[BII2-T14-R017]-Each credit note line MUST have a credit note line identifier</assert>
    <assert test="$BII2-T14-R018" flag="fatal" id="BII2-T14-R018">[BII2-T14-R018]-Each credit note line MUST have a credit noted quantity</assert>
    <assert test="$BII2-T14-R019" flag="fatal" id="BII2-T14-R019">[BII2-T14-R019]-Each credit note line MUST have a quantity unit of measure</assert>
    <assert test="$BII2-T14-R020" flag="fatal" id="BII2-T14-R020">[BII2-T14-R020]-Each credit note line MUST have a credit note line net amount</assert>
    <assert test="$BII2-T14-R021" flag="fatal" id="BII2-T14-R021">[BII2-T14-R021]-Each credit note line MUST have a credit note line item name and/or the credit note line item identifier</assert>
    <assert test="$BII2-T14-R032" flag="fatal" id="BII2-T14-R032">[BII2-T14-R032]-A scheme identifier for the credit note line item registered identifier MUST be provided if credit note line item registered identifiers are used to identify a product.(e.g. GTIN)</assert>
    <assert test="$BII2-T14-R033" flag="fatal" id="BII2-T14-R033">[BII2-T14-R033]-A scheme identifier for a credit note line item commodity classification MUST be provided if credit note line item commodity classification are used to classify a credit note line item (e.g. CPV or UNSPSC)</assert>
    <assert test="$BII2-T14-R034" flag="fatal" id="BII2-T14-R034">[BII2-T14-R034]-Credit Note line item net price MUST NOT be negative</assert>
    <assert test="$BII2-T14-R046" flag="fatal" id="BII2-T14-R046">[BII2-T14-R046]-Each credit note line MUST be categorized with the credit note line VAT category if the credit note has a VAT total amount </assert>
  </rule>
  <rule context="$Credit_Note_Period_Information">
    <assert test="$BII2-T14-R023" flag="fatal" id="BII2-T14-R023">[BII2-T14-R023]-Each credit note period information MUST have a credit note period start date</assert>
    <assert test="$BII2-T14-R024" flag="fatal" id="BII2-T14-R024">[BII2-T14-R024]-Each credit note period information MUST have a credit note period end date</assert>
    <assert test="$BII2-T14-R031" flag="fatal" id="BII2-T14-R031">[BII2-T14-R031]-A credit note period end date MUST be later or equal to a credit note period start date</assert>
  </rule>
  <rule context="$Total_Credit_Note">
    <assert test="$BII2-T14-R051" flag="fatal" id="BII2-T14-R051">[BII2-T14-R051]-Sum of line amounts MUST equal the credit note line net amounts</assert>
    <assert test="$BII2-T14-R052" flag="fatal" id="BII2-T14-R052">[BII2-T14-R052]-A credit note total without VAT MUST equal the sum of line amounts plus the sum of charges on document level minus the sum of allowances on document level</assert>
    <assert test="$BII2-T14-R053" flag="fatal" id="BII2-T14-R053">[BII2-T14-R053]-A credit note total with VAT MUST equal the credit note total without VAT plus the VAT total amount and the rounding of credit note total</assert>
    <assert test="$BII2-T14-R054" flag="fatal" id="BII2-T14-R054">[BII2-T14-R054]-The sum of allowances at document level MUST be equal to the sum of document level allowance amounts</assert>
    <assert test="$BII2-T14-R055" flag="fatal" id="BII2-T14-R055">[BII2-T14-R055]-The sum of charges at document level MUST be equal to the sum of document level charge amounts</assert>
    <assert test="$BII2-T14-R056" flag="fatal" id="BII2-T14-R056">[BII2-T14-R056]-Amount due for payment MUST be equal to the credit note total amount with VAT minus the paid amounts</assert>
  </rule>
  <rule context="$VAT_category">
    <assert test="$BII2-T14-R027" flag="fatal" id="BII2-T14-R027">[BII2-T14-R027]-Each VAT category details MUST have a VAT category taxable amount</assert>
    <assert test="$BII2-T14-R028" flag="fatal" id="BII2-T14-R028">[BII2-T14-R028]-Each VAT category details MUST have a VAT category tax amount</assert>
    <assert test="$BII2-T14-R029" flag="fatal" id="BII2-T14-R029">[BII2-T14-R029]-Every VAT category details MUST be defined through a VAT category code</assert>
    <assert test="$BII2-T14-R030" flag="fatal" id="BII2-T14-R030">[BII2-T14-R030]-The VAT category percentage MUST be provided if the VAT category code is standard.</assert>
    <assert test="$BII2-T14-R045" flag="fatal" id="BII2-T14-R045">[BII2-T14-R045]-A VAT exemption reason MUST be provided if the VAT category code is exempt  or reverse charge.</assert>
    <assert test="$BII2-T14-R048" flag="fatal" id="BII2-T14-R048">[BII2-T14-R048]-A credit note with a VAT category code of reverse charge MUST NOT contain other VAT categories</assert>
  </rule>
</pattern>
