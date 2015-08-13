<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T10-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T10">
  <rule context="$Allowance_Charge">
    <assert flag="fatal" test="$BII2-T10-R025" id="BII2-T10-R025">[BII2-T10-R025]-Each document level allowance or charge details MUST have an allowance and charge reason text</assert>
    <assert flag="fatal" test="$BII2-T10-R043" id="BII2-T10-R043">[BII2-T10-R043]-Document level allowances and charges details MUST have allowance and charge VAT category if the invoice has a VAT total amount</assert>
  </rule>
  <rule context="$Invoice">
    <assert flag="fatal" test="$BII2-T10-R001" id="BII2-T10-R001">[BII2-T10-R001]-An invoice MUST have a customization identifier</assert>
    <assert flag="fatal" test="$BII2-T10-R002" id="BII2-T10-R002">[BII2-T10-R002]-An invoice MUST have a business profile identifier</assert>
    <assert flag="fatal" test="$BII2-T10-R003" id="BII2-T10-R003">[BII2-T10-R003]-An invoice MUST have an invoice identifier</assert>
    <assert flag="fatal" test="$BII2-T10-R004" id="BII2-T10-R004">[BII2-T10-R004]-An invoice MUST have an invoice issue date</assert>
    <assert flag="fatal" test="$BII2-T10-R005" id="BII2-T10-R005">[BII2-T10-R005]-An invoice MUST specify the currency code for the document</assert>
    <assert flag="fatal" test="$BII2-T10-R006" id="BII2-T10-R006">[BII2-T10-R006]-An invoice MUST have a seller name and/or a seller identifier</assert>
    <assert flag="fatal" test="$BII2-T10-R008" id="BII2-T10-R008">[BII2-T10-R008]-An invoice MUST have a buyer name and/or a buyer identifier</assert>
    <assert flag="fatal" test="$BII2-T10-R010" id="BII2-T10-R010">[BII2-T10-R010]-An invoice MUST have the sum of line amounts</assert>
    <assert flag="fatal" test="$BII2-T10-R011" id="BII2-T10-R011">[BII2-T10-R011]-An invoice MUST have the invoice total without VAT</assert>
    <assert flag="fatal" test="$BII2-T10-R012" id="BII2-T10-R012">[BII2-T10-R012]-An invoice MUST have the invoice total with VAT (value of purchase)</assert>
    <assert flag="fatal" test="$BII2-T10-R013" id="BII2-T10-R013">[BII2-T10-R013]-An invoice MUST have the amount due for payment</assert>
    <assert flag="fatal" test="$BII2-T10-R014" id="BII2-T10-R014">[BII2-T10-R014]-An invoice MUST have at least one invoice line</assert>
    <assert flag="fatal" test="$BII2-T10-R015" id="BII2-T10-R015">[BII2-T10-R015]-An invoice MUST specify the VAT total amount, if there are VAT line amounts</assert>
    <assert flag="fatal" test="$BII2-T10-R026" id="BII2-T10-R026">[BII2-T10-R026]-An invoice MUST contain VAT category details unless VAT total amount is omitted.</assert>
    <assert flag="fatal" test="$BII2-T10-R035" id="BII2-T10-R035">[BII2-T10-R035]-Invoice total with VAT MUST NOT be negative</assert>
    <assert flag="fatal" test="$BII2-T10-R037" id="BII2-T10-R037">[BII2-T10-R037]-Amount due for payment in an invoice MUST NOT be negative</assert>
    <assert flag="fatal" test="$BII2-T10-R044" id="BII2-T10-R044">[BII2-T10-R044]-A seller VAT identifier MUST be provided if the invoice has a VAT total amount</assert>
    <assert flag="fatal" test="$BII2-T10-R047" id="BII2-T10-R047">[BII2-T10-R047]-A buyer VAT identifier MUST be present if the VAT category code is reverse VAT</assert>
    <assert flag="fatal" test="$BII2-T10-R048" id="BII2-T10-R048">[BII2-T10-R048]-An invoice with a VAT category code of reverse charge MUST NOT contain other VAT categories.</assert>
    <assert flag="fatal" test="$BII2-T10-R049" id="BII2-T10-R049">[BII2-T10-R049]-The invoice total without VAT MUST be equal to the VAT category taxable amount if the VAT category code is reverse charge</assert>
    <assert flag="fatal" test="$BII2-T10-R050" id="BII2-T10-R050">[BII2-T10-R050]-The VAT category tax amount MUST be zero  if the VAT category code is reverse charge (since there is only one VAT category allowed it follows that the invoice tax total for reverse charge invoices is zero)</assert>
  </rule>
  <rule context="$Invoice_Line">
    <assert flag="fatal" test="$BII2-T10-R017" id="BII2-T10-R017">[BII2-T10-R017]-Each invoice line MUST have an invoice line identifier</assert>
    <assert flag="fatal" test="$BII2-T10-R018" id="BII2-T10-R018">[BII2-T10-R018]-Each invoice line MUST have an invoiced quantity</assert>
    <assert flag="fatal" test="$BII2-T10-R019" id="BII2-T10-R019">[BII2-T10-R019]-Each invoice line MUST have a quantity unit of measure</assert>
    <assert flag="fatal" test="$BII2-T10-R020" id="BII2-T10-R020">[BII2-T10-R020]-Each invoice line MUST have an invoice line net amount</assert>
    <assert flag="fatal" test="$BII2-T10-R021" id="BII2-T10-R021">[BII2-T10-R021]-Each invoice line MUST have an invoice line item name and/or the invoice line item identifier</assert>
    <assert flag="fatal" test="$BII2-T10-R032" id="BII2-T10-R032">[BII2-T10-R032]-A scheme identifier for the invoice line item registered identifier MUST be provided if invoice line item registered identifiers are used to identify a product.(e.g. GTIN)</assert>
    <assert flag="fatal" test="$BII2-T10-R033" id="BII2-T10-R033">[BII2-T10-R033]-A scheme identifier for a invoice line item commodity classification MUST be provided if invoice line item commodity classification are used to classify an invoice line item (e.g. CPV or UNSPSC)</assert>
    <assert flag="fatal" test="$BII2-T10-R034" id="BII2-T10-R034">[BII2-T10-R034]-Invoice line item net price MUST NOT be negative</assert>
    <assert flag="fatal" test="$BII2-T10-R046" id="BII2-T10-R046">[BII2-T10-R046]-Each invoice line MUST be categorized with the invoice line VAT category if the invoice has a VAT total amount </assert>
  </rule>
  <rule context="$Invoice_Period_Information">
    <assert flag="fatal" test="$BII2-T10-R023" id="BII2-T10-R023">[BII2-T10-R023]-Each invoice period information MUST have an invoice period start date</assert>
    <assert flag="fatal" test="$BII2-T10-R024" id="BII2-T10-R024">[BII2-T10-R024]-Each invoice period information MUST have an invoice period end date</assert>
    <assert flag="fatal" test="$BII2-T10-R031" id="BII2-T10-R031">[BII2-T10-R031]-An invoice period end date MUST be later or equal to an invoice period start date</assert>
  </rule>
  <rule context="$Payment_Means">
    <assert flag="fatal" test="$BII2-T10-R039" id="BII2-T10-R039">[BII2-T10-R039]-An account identifier MUST be present if payment means type is funds transfer</assert>
    <assert flag="fatal" test="$BII2-T10-R040" id="BII2-T10-R040">[BII2-T10-R040]-A sellers financial institution identifier MUST be provided if the scheme of the account identifier is IBAN and the payment means is international bank transfer</assert>
    <assert flag="fatal" test="$BII2-T10-R041" id="BII2-T10-R041">[BII2-T10-R041]-A payment means MUST specify the payment means type</assert>
    <assert flag="fatal" test="$BII2-T10-R042" id="BII2-T10-R042">[BII2-T10-R042]-A sellers financial institution identifier scheme MUST be BIC if the scheme of the account identifier is IBAN and the payment means type is international account transfer </assert>
  </rule>
  <rule context="$Total_Invoice">
    <assert flag="fatal" test="$BII2-T10-R051" id="BII2-T10-R051">[BII2-T10-R051]-Sum of line amounts MUST equal the invoice line net amounts</assert>
    <assert flag="fatal" test="$BII2-T10-R052" id="BII2-T10-R052">[BII2-T10-R052]-An invoice total without VAT MUST equal the sum of line amounts plus the sum of charges on document level minus the sum of allowances on document level</assert>
    <assert flag="fatal" test="$BII2-T10-R053" id="BII2-T10-R053">[BII2-T10-R053]-An invoice total with VAT MUST equal the invoice total without VAT plus the VAT total amount and the rounding of invoice total</assert>
    <assert flag="fatal" test="$BII2-T10-R054" id="BII2-T10-R054">[BII2-T10-R054]-The sum of allowances at document level MUST be equal to the sum of document level allowance amounts</assert>
    <assert flag="fatal" test="$BII2-T10-R055" id="BII2-T10-R055">[BII2-T10-R055]-The sum of charges at document level MUST be equal to the sum of document level charge amounts</assert>
    <assert flag="fatal" test="$BII2-T10-R056" id="BII2-T10-R056">[BII2-T10-R056]-Amount due for payment MUST be equal to the invoice total amount with VAT minus the paid amounts</assert>
    <assert flag="fatal" test="$BII2-T10-R058" id="BII2-T10-R058">[BII2-T10-R058]-Invoice total without VAT MUST be equal to the sum of VAT category taxable amounts</assert>
  </rule>
  <rule context="$VAT_category">
    <assert flag="fatal" test="$BII2-T10-R027" id="BII2-T10-R027">[BII2-T10-R027]-Each VAT category details MUST have a VAT category taxable amount</assert>
    <assert flag="fatal" test="$BII2-T10-R028" id="BII2-T10-R028">[BII2-T10-R028]-Each VAT category details MUST have a VAT category tax amount</assert>
    <assert flag="fatal" test="$BII2-T10-R029" id="BII2-T10-R029">[BII2-T10-R029]-Every VAT category details MUST be defined through a VAT category code</assert>
    <assert flag="fatal" test="$BII2-T10-R030" id="BII2-T10-R030">[BII2-T10-R030]-The VAT category percentage MUST be provided if the VAT category code is standard.</assert>
    <assert flag="fatal" test="$BII2-T10-R045" id="BII2-T10-R045">[BII2-T10-R045]-A VAT exemption reason MUST be provided if the VAT category code is exempt or reverse charge.</assert>
  </rule>
</pattern>
