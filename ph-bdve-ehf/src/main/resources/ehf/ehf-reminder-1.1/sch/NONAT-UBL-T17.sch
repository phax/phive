<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
  schemaVersion="iso" queryBinding="xslt2">

   <title>Sjekk mot norsk regelverk</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Reminder-2" prefix="ubl"/>

   <pattern>
      <rule context="//cac:AccountingCustomerParty/cac:Party">
         <assert id="NONAT-T17-R010"
                 test="(cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode)"
                 flag="warning">A customer postal address in a reminder document SHOULD contain at least city name, zip code and country code.</assert>
         <assert id="NONAT-T17-R024"
                 test="(cac:PartyIdentification/cbc:ID != '')"
                 flag="warning">A customer number for AccountingCustomerParty SHOULD be provided.</assert>
         <assert id="NONAT-T17-R026"
                 test="(cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone) or (cac:PostalAddress/cbc:ID)"
                 flag="fatal">A customer address in a reminder MUST contain at least city and zip code or have an address identifier.</assert>
         <assert id="NONAT-T17-R027"
                 test="(cac:PartyLegalEntity/cbc:CompanyID != '')"
                 flag="fatal">The Norwegian legal registration ID for the customer MUST be provided.</assert>
         <assert id="NONAT-T17-R030"
                 test="(cac:PartyLegalEntity/cbc:RegistrationName != '')"
                 flag="warning">Legal registration name for the customer SHOULD be provided.</assert>
         <assert id="NONAT-T17-R028" test="(cac:Contact/cbc:ID != '')" flag="fatal">A customer contact reference identifier MUST be provided.</assert>
      </rule>
      <rule context="//cac:ReminderLine">
         <assert id="NONAT-T17-R006" test="(cbc:ID)" flag="fatal">Reminder lines MUST have a line identifier.</assert>
         <assert id="NONAT-T17-R007" test="(cac:BillingReference)" flag="fatal">A reminder MUST specify billing reference.</assert>
      </rule>
      <rule context="//cbc:ProfileID">
         <assert id="NONAT-T17-R016"
                 test=". = 'urn:www.cenbii.eu:profile:biixy:ver1.0'"
                 flag="fatal">An reminder transaction T17 must only be used in Profile xy.</assert>
      </rule>
      <rule context="/ubl:Reminder">
         <assert id="NONAT-T17-R001" test="(cbc:ID)" flag="fatal">A reminder MUST have a reminder number.</assert>
         <assert id="NONAT-T17-R002" test="(cbc:IssueDate)" flag="fatal">A reminder MUST have the date of issue.</assert>
         <assert id="NONAT-T17-R003"
                 test="(cac:LegalMonetaryTotal/cbc:LineExtensionAmount)"
                 flag="fatal">A reminder MUST specify the sum of the line amounts.</assert>
         <assert id="NONAT-T17-R004"
                 test="(cac:LegalMonetaryTotal/cbc:PayableAmount)"
                 flag="fatal">A reminder MUST specify the total payable amount.</assert>
         <assert id="NONAT-T17-R005" test="(cac:ReminderLine)" flag="fatal">A reminder MUST specify at least one line item.</assert>
         <assert id="NONAT-T17-R013"
                 test="not(cac:PayeeParty) or (cac:PayeeParty/cac:PartyName/cbc:Name)"
                 flag="fatal">If payee information is provided then the payee name MUST be specified.</assert>
         <assert id="NONAT-T17-R014"
                 test="(((//cac:TaxCategory/cbc:ID) = 'AE') and not((//cac:TaxCategory/cbc:ID) != 'AE' )) or not((//cac:TaxCategory/cbc:ID) = 'AE') or not(//cac:TaxCategory)"
                 flag="warning">A reminder document with reverse charge VAT MAY NOT contain other VAT categories.</assert>
         <assert id="NONAT-T17-R015"
                 test="//cac:TaxTotal/cbc:TaxAmount = 0 and (//cac:TaxCategory/cbc:ID) = 'AE' or not((//cac:TaxCategory/cbc:ID) = 'AE' )"
                 flag="fatal">The tax amount for reverse charge VAT MUST be zero. (since there is only one VAT category allowed it follows that the invoice tax total for reverse charge invoices is zero)</assert>
         <assert id="NONAT-T17-R017" test="(cbc:UBLVersionID)" flag="fatal">A reminder MUST have a syntax identifier.</assert>
         <assert id="NONAT-T17-R018" test="(cbc:CustomizationID)" flag="fatal">A reminder MUST have a customization identifier.</assert>
         <assert id="NONAT-T17-R019" test="(cbc:ProfileID)" flag="fatal">A reminder MUST have a profile identifier.</assert>
         <assert id="NONAT-T17-R020"
                 test="(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name)"
                 flag="fatal">A reminder MUST contain the full name of the supplier.</assert>
         <assert id="NONAT-T17-R025"
                 test="(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name)"
                 flag="fatal">A reminder MUST contain the full name of the customer.</assert>
      </rule>
      <rule context="//cac:AccountingSupplierParty/cac:Party">
         <assert id="NONAT-T17-R009"
                 test="(cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode)"
                 flag="warning">A supplier postal address in a reminder document SHOULD contain at least city name, zip code and country code.</assert>
         <assert id="NONAT-T17-R021"
                 test="(cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone) or (cac:PostalAddress/cbc:ID)"
                 flag="fatal">A supplier address in an reminder MUST contain at least the city name and a zip code or have an address identifier.</assert>
         <assert id="NONAT-T17-R022"
                 test="(cac:PostalAddress/cac:Country/cbc:IdentificationCode != '')"
                 flag="fatal">Country code for the supplier address MUST be provided.</assert>
         <assert id="NONAT-T17-R023"
                 test="(cac:PartyLegalEntity/cbc:CompanyID != '')"
                 flag="fatal">The Norwegian legal registration ID for the supplier MUST be provided.</assert>
         <assert id="NONAT-T17-R031"
                 test="(cac:PartyLegalEntity/cbc:RegistrationName != '')"
                 flag="warning">The legal registration name for the supplier SHOULD be provided.</assert>
      </rule>
      <rule context="//cac:TaxSubtotal">
         <assert id="NONAT-T17-R012"
                 test="(number(cac:TaxCategory/cbc:Percent) = 0 and (cac:TaxCategory/cbc:TaxExemptionReason or cac:TaxCategory/cbc:TaxExemptionReasonCode)) or (number(cac:TaxCategory/cbc:Percent) !=0)"
                 flag="warning">If the tax percentage in a tax category is 0% then an exemption reason SHOULD be provided except in reverse charge VAT.</assert>
      </rule>
      <rule context="/ubl:Reminder/cac:TaxTotal">
         <assert id="NONAT-T17-R029" test="(cbc:TaxAmount)" flag="fatal">A reminder MUST specify the tax total amount.</assert>
      </rule>
      <rule context="//cac:LegalMonetaryTotal">
         <assert id="NONAT-T17-R008"
                 test="number(child::cbc:LineExtensionAmount) = number(round((sum(//cac:ReminderLine/cbc:DebitLineAmount) - sum(//cac:ReminderLine/cbc:CreditLineAmount)) * 100) div 100)"
                 flag="fatal">Reminder total line extension amount MUST equal the sum of the line totals.</assert>
      </rule>
   </pattern>
</schema>
