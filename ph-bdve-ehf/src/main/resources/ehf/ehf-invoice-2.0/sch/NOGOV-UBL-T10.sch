<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

  <title>Sjekk mot norske nasjonale regler</title>

  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" prefix="ubl"/>

   <pattern>
      <let name="isZ01" value="/ubl:Invoice/cbc:InvoiceTypeCode = 'Z01'"/>
      <let name="isZ02" value="/ubl:Invoice/cbc:InvoiceTypeCode = 'Z02'"/>
      <let name="isB2C" value="$isZ01 or //cac:AdditionalDocumentReference/cbc:DocumentType = 'elektroniskB2Cfaktura'"/>
      <let name="documentCurrencyCode" value="/ubl:Invoice/cbc:DocumentCurrencyCode"/>

      <rule context="cbc:ProfileID">
         <assert id="EHFPROFILE-T10-R001"
                 test="some $p in tokenize('urn:www.cenbii.eu:profile:bii04:ver2.0 urn:www.cenbii.eu:profile:bii05:ver2.0 urn:www.cenbii.eu:profile:biixy:ver2.0', '\s') satisfies $p = normalize-space(.)"
                 flag="fatal">[EHFPROFILE-T10-R001]-An invoice transaction T10 must only be used in Profiles 4, 5 or xy.</assert>
      </rule>
      <rule context="cbc:InvoiceTypeCode">
        <assert id="NOGOV-T10-R042"
                test="some $code in tokenize('380 393 384 Z01 Z02', '\s') satisfies $code = ."
                flag="fatal">[NOGOV-T10-R042]-An Invoice MUST be coded with the InvoiceTypeCode code list UNCL D1001 BII2 subset</assert>
      </rule>
      <rule context="cac:AccountingSupplierParty/cac:Party">
         <assert id="NOGOV-T10-R001"
                 test="$isZ02 or cac:Contact/cbc:ID"
                 flag="warning">[NOGOV-T10-R001]-A contact reference identifier SHOULD be provided for AccountingSupplierParty according to EHF.</assert>
      </rule>
      <rule context="cac:PaymentMeans">
         <assert id="NOGOV-T10-R011"
                 test="cac:PayeeFinancialAccount/cbc:ID"
                 flag="fatal">[NOGOV-T10-R011]-PayeeFinancialAccount MUST be provided according EHF.</assert>
         <assert id="NOGOV-T10-R012"
                 test="cbc:PaymentID"
                 flag="warning">[NOGOV-T10-R012]-Payment Identifier (KID number) SHOULD be used according to EHF.</assert>
      </rule>
      <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'BBAN']">
         <assert id="NOGOV-T10-R032"
                 test="matches(., '^[0-9]+$')"
                 flag="fatal">[NOGOV-T10-R032]-Only numbers are allowed as bank account number if scheme is BBAN.</assert>
      </rule>
      <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'IBAN']">
         <assert id="NOGOV-T10-R033"
                 test="matches(., '^NO[0-9]+$')"
                 flag="warning">[NOGOV-T10-R033]-IBAN number is not for a Norwegain bank account</assert>
      </rule>
      <rule context="cac:OrderReference">
         <assert id="NOGOV-T10-R013"
                 test="cbc:ID"
                 flag="warning">[NOGOV-T10-R013]-An association to Order Reference SHOULD be provided according to EHF.</assert>
      </rule>
      <rule context="cac:InvoiceLine">
         <assert id="NOGOV-T10-R003"
                 test="cbc:AccountingCost"
                 flag="warning">[NOGOV-T10-R003]-The buyer's accounting code applied to the Invoice Line SHOULD be provided according to EHF.</assert>
         <assert id="NOGOV-T10-R004"
                 test="$isZ02 or cac:OrderLineReference/cbc:LineID"
                 flag="warning">[NOGOV-T10-R004]-An association to Order Line Reference SHOULD be provided according to EHF.</assert>
      </rule>
      <rule context="cac:Item">
         <assert id="NOGOV-T10-R002"
                 test="$isZ02 or cac:SellersItemIdentification/cbc:ID"
                 flag="warning">[NOGOV-T10-R002]-The sellers ID for the item SHOULD be provided according to EHF.</assert>
      </rule>
      <rule context="cac:OriginCountry">
         <assert id="NOGOV-T10-R022"
                 test="cbc:IdentificationCode"
                 flag="warning">[NOGOV-T10-R022]-Identification code MUST be specified when describing origin country.</assert>
      </rule>
      <rule context="cac:ManufacturerParty">
         <assert id="NOGOV-T10-R024"
                 test="cac:PartyName/cbc:Name"
                 flag="warning">[NOGOV-T10-R024]-Name MUST be specified when describing a manufacturer party.</assert>
      </rule>
      <rule context="cac:CommodityClassification">
         <assert id="NOGOV-T10-R023"
                 test="cbc:ItemClassificationCode"
                 flag="warning">[NOGOV-T10-R023]-Item classification code MUST be specified when describing commodity classification.</assert>
      </rule>
      <rule context="ubl:Invoice">
         <assert id="NOGOV-T10-R014"
                 test="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount != 0) and (cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or (cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount = 0) or not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT'])))"
                 flag="fatal">[NOGOV-T10-R014]-If the VAT total amount in an invoice exists it MUST contain the suppliers VAT number.</assert>
         <assert id="NOGOV-T10-R034"
                 test="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'true'])"
                 flag="fatal">[NOGOV-T10-R034]-If charge is present on document level, total charge must be stated.</assert>
         <assert id="NOGOV-T10-R035"
                 test="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'false'])"
                 flag="fatal">[NOGOV-T10-R035]-If allowance is present on document level, total allowance must be stated.</assert>
         <assert id="NOGOV-T10-R005"
                 test="$isZ02 or cac:ContractDocumentReference/cbc:ID"
                 flag="warning">[NOGOV-T10-R005]-ContractDocumentReference SHOULD be provided according to EHF.</assert>
         <assert id="NOGOV-T10-R016"
                 test="cbc:InvoiceTypeCode"
                 flag="fatal">[NOGOV-T10-R016]-An EHF invoice MUST have an invoice type code.</assert>
         <assert id="NOGOV-T10-R019"
                 test="cac:PaymentMeans"
                 flag="fatal">[NOGOV-T10-R019]-An invoice MUST have payment means information.</assert>
      </rule>
      <rule context="ubl:Invoice/cac:PaymentTerms">
         <assert id="NOGOV-T10-R020"
                 test="cbc:Note"
                 flag="fatal">[NOGOV-T10-R020]-Note MUST be specified when describing Payment terms.</assert>
      </rule>
      <rule context="cac:TaxRepresentativeParty">
         <assert id="NOGOV-T10-R017"
                 test="cac:PartyName/cbc:Name"
                 flag="fatal">[NOGOV-T10-R017]-Name MUST be specified when describing a Tax Representative</assert>
         <assert id="NOGOV-T10-R018"
                 test="cac:PartyTaxScheme/cbc:CompanyID"
                 flag="fatal">[NOGOV-T10-R018]-Company identifier MUST be specified when describing a Tax Representative</assert>
      </rule>
      <rule context="ubl:Invoice/cac:TaxTotal">
         <assert id="NOGOV-T10-R021"
                 test="cac:TaxSubtotal"
                 flag="fatal">[NOGOV-T10-R021]-An invoice MUST have Tax Subtotal specifications.</assert>
         <assert id="NOGOV-T10-R038"
                 test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T10-R038]-Total tax amount cannot have more than 2 decimals</assert>
         <assert id="NOGOV-T10-R041"
                 test="count(distinct-values(cac:TaxSubtotal/cac:TaxCategory/cbc:ID/normalize-space(text()))) = count(cac:TaxSubtotal)"
                 flag="fatal">[NOGOV-T10-R041]-Multiple tax subtotals per tax category code is not allowed.</assert>
      </rule>
      <rule context="cbc:Amount | cbc:TaxableAmount | cbc:TaxAmount | cbc:LineExtensionAmount | cbc:PriceAmount | cbc:BaseAmount | cac:LegalMonetaryTotal/cbc:*">
         <!-- cbc:*[contains(name(), 'Amount') and not(contains(name(), 'Transaction'))] -->

         <assert id="NOGOV-T10-R025"
                 test="not(@currencyID) or @currencyID = $documentCurrencyCode"
                 flag="fatal">[NOGOV-T10-R025]-The attribute currencyID must have the same value as DocumentCurrencyCode, except the attribute for TransactionCurrencyTaxAmount.</assert>
         <assert id="NOGOV-T10-R037"
                 test="not(parent::node()/local-name() = 'LegalMonetaryTotal') or string-length(substring-after(., '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T10-R037]-Document level amounts cannot have more than 2 decimals</assert>
      </rule>
      <rule context="cac:AccountingCustomerParty/cac:Party">
         <assert id="NOGOV-T10-R006"
                 test="cac:PartyIdentification/cbc:ID"
                 flag="warning">[NOGOV-T10-R006]-A customer number for AccountingCustomerParty SHOULD be provided according to EHF.</assert>
         <assert id="NOGOV-T10-R007"
                 test="cac:Contact/cbc:ID"
                 flag="fatal">[NOGOV-T10-R007]-A contact reference identifier MUST be provided for AccountingCustomerParty according to EHF.</assert>
         <assert id="NOGOV-T10-R009"
                 test="$isB2C or cac:PartyLegalEntity/cbc:CompanyID"
                 flag="fatal">[NOGOV-T10-R009]-PartyLegalEntity for AccountingCustomerParty MUST be provided according to EHF.</assert>
         <assert id="NOGOV-T10-R015"
                 test="$isB2C or cac:PartyLegalEntity/cbc:RegistrationName"
                 flag="fatal">[NOGOV-T10-R015]-Registration name for AccountingCustomerParty MUST be provided according to EHF.</assert>
      </rule>
      <rule context="cac:TaxSubtotal">
         <assert id="NOGOV-T10-R039"
                 test="string-length(substring-after(cbc:TaxableAmount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T10-R039]-Tax subtotal amounts cannot have more than 2 decimals</assert>
         <assert id="NOGOV-T10-R039"
                 test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T10-R039]-Tax subtotal amounts cannot have more than 2 decimals</assert>
      </rule>
      <rule context="ubl:Invoice/cac:AllowanceCharge">
         <assert id="NOGOV-T10-R040"
                 test="string-length(substring-after(cbc:Amount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T10-R040]-Allowance or charge amounts on document level cannot have more than 2 decimals</assert>
      </rule>
      <rule context="cac:LegalMonetaryTotal">
        <assert id="NOGOV-T10-R043"
                test="not(cbc:PayableRoundingAmount) or abs(xs:decimal(cbc:PayableRoundingAmount)) &lt;= max((xs:decimal(abs(cbc:PayableAmount) div 10), xs:decimal(1)))"
                flag="warning">[NOGOV-T10-R043]-Payable rounding amount should be no more than 10% of payable amount.</assert>
      </rule>
   </pattern>
</schema>
