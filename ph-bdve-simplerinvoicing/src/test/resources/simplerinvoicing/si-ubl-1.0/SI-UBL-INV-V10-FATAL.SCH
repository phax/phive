<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-V10-INV-FATAL">
	<!-- Version check -->
    <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm010:ver1.0:#urn:www.peppol.eu:bis:peppol4a:ver1.0#urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm010:ver1.0:#urn:www.peppol.eu:bis:peppol4a:ver1.0#urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x'))]">
        <assert test="true()" />
    </rule>
	<!-- End version check -->
	<rule context="ubl:Invoice" flag="fatal">
		<assert test="false()" flag="warning">[SI-UBL-INV-R000]-Simplerinvoicing v1.0 validation is used but will soon be obsolete, please move to Simplerinvoicing v1.1</assert>
		<assert test="//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID and (//cac:TaxCategory/cbc:ID) = 'AE' or not((//cac:TaxCategory/cbc:ID) = 'AE')" flag="fatal">[SI-UBL-INV-R436]-IF VAT = "AE" (reverse charge) THEN it MUST contain Supplier VAT id and Customer VAT</assert>
		<assert test="(((//cac:TaxCategory/cbc:ID) = 'AE')  and not((//cac:TaxCategory/cbc:ID) != 'AE' )) or not((//cac:TaxCategory/cbc:ID) = 'AE') or not(//cac:TaxCategory)" flag="fatal">[SI-UBL-INV-R437]-IF VAT = "AE" (reverse charge) THEN VAT MAY NOT contain other VAT categories.</assert>
		<assert test="(//cbc:TaxExclusiveAmount = //cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cbc:ID='AE']/cbc:TaxableAmount) and (//cac:TaxCategory/cbc:ID) = 'AE' or not((//cac:TaxCategory/cbc:ID) = 'AE')" flag="fatal">[SI-UBL-INV-R438]-IF VAT = "AE" (reverse charge) THEN The taxable amount MUST equal the invoice total without VAT amount.</assert>
		<assert test="//cac:TaxTotal/cbc:TaxAmount = 0 and (//cac:TaxCategory/cbc:ID) = 'AE' or not((//cac:TaxCategory/cbc:ID) = 'AE')" flag="fatal">[SI-UBL-INV-R439]-IF VAT = "AE" (reverse charge) THEN VAT tax amount MUST be zero.</assert>
		<assert test="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) and (cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT'])))" flag="fatal">[SI-UBL-INV-R429]-If the VAT total amount in an invoice exists it MUST contain the suppliers VAT number.</assert>
		<assert test="not(//@currencyID != //cbc:DocumentCurrencyCode)" flag="fatal">[SI-UBL-INV-R445]-Currency Identifier MUST be in stated in the currency stated on header level.</assert>
	</rule>
	<rule context="cac:AllowanceCharge" flag="fatal">
		<assert test="(((//cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) and (cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT')) or not((//cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT'])) and (parent::ubl:Invoice)) or not(parent::ubl:Invoice)" flag="fatal">[SI-UBL-INV-R428]-If the VAT total amount in an invoice exists then an Allowances Charges amount on document level MUST have Tax category for VAT.</assert>
		<assert test="not(cbc:MultiplierFactorNumeric) or number(cbc:MultiplierFactorNumeric) &gt;=0" flag="fatal">[SI-UBL-INV-R434]-An allowance percentage MUST NOT be negative.</assert>
		<assert test="(cbc:MultiplierFactorNumeric and cbc:BaseAmount) or (not(cbc:MultiplierFactorNumeric) and not(cbc:BaseAmount)) " flag="warning">[SI-UBL-INV-R435]-In allowances, both or none of percentage and base amount SHOULD be provided</assert>
		<assert test="number(cbc:Amount)&gt;=0" flag="fatal">[SI-UBL-INV-R443]-An allowance or charge amount MUST NOT be negative.</assert>
		<assert test="(cbc:AllowanceChargeReason)" flag="warning">[SI-UBL-INV-R444]-AllowanceChargeReason text SHOULD be specified for all allowances and charges</assert>
	</rule>
	<rule context="cac:TaxCategory" flag="fatal">
		<assert test="(parent::cac:AllowanceCharge) or (cbc:ID and cbc:Percent) or (cbc:ID = 'AE')" flag="fatal">[SI-UBL-INV-R430]-For each tax subcategory the category ID and the applicable tax percentage MUST be provided.</assert>
	</rule>
	<rule context="ubl:Invoice/cac:PayeeParty" flag="fatal">
		<assert test="cac:PartyName/cbc:Name" flag="fatal">[SI-UBL-INV-R432]-If payee information is provided then the payee name MUST be specified.</assert>
	</rule>
	<rule context="cac:Item/cac:ClassifiedTaxCategory" flag="fatal">
		<assert test="(//cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount and cbc:ID) or not((//cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']))" flag="fatal">[SI-UBL-INV-R433]-If the VAT total amount in an invoice exists then each invoice line item MUST have a VAT category ID.</assert>
	</rule>
	<rule context="cac:LegalMonetaryTotal" flag="fatal">
		<assert test="number(cbc:PayableAmount) &gt;= 0" flag="fatal">[SI-UBL-INV-R440]-Total payable amount in an invoice MUST NOT be negative</assert>
	</rule>
	<rule context="cac:InvoicePeriod" flag="fatal">
		<assert test="(cbc:StartDate)" flag="fatal">[SI-UBL-INV-R441]-If the invoice refers to a period, the period MUST have a start date.</assert>
		<assert test="(cbc:EndDate)" flag="fatal">[SI-UBL-INV-R442]-If the invoice refers to a period, the period MUST have an end date.</assert>
	</rule>
	<rule context="cac:PartyIdentification/cbc:ID/@schemeID" flag="fatal">
		<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN DUNS IBAN DK:CPR DK:CVR DK:P DK:SE DK:VANS IT:VAT IT:CF IT:FTI IT:SIA IT:SECETI NO:ORGNR NO:VAT HU:VAT SE:ORGNR FI:OVT EU:VAT EU:REID FR:SIRET AT:VAT AT:GOV AT:CID IS:KT IBAN AT:KUR ES:VAT NL:KVK NL:VAT NL:OIN ',concat(' ',normalize-space(.),' ') ) ) )" flag="fatal">[SI-UBL-INV-R451]-Party Identifiers MUST use the PEPPOL PartyID list</assert>
	</rule>
	<rule context="cbc:EndpointID/@schemeID" flag="fatal">
		<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN DUNS IBAN DK:CPR DK:CVR DK:P DK:SE DK:VANS IT:VAT IT:CF IT:FTI IT:SIA IT:SECETI NO:ORGNR NO:VAT HU:VAT SE:ORGNR FI:OVT EU:VAT EU:REID FR:SIRET AT:VAT AT:GOV AT:CID IS:KT IBAN AT:KUR ES:VAT NL:KVK NL:VAT NL:OIN ',concat(' ',normalize-space(.),' ') ) ) )" flag="fatal">[SI-UBL-INV-R452]-Endpoint Identifiers MUST use the PEPPOL PartyID list.</assert>
	</rule>
</pattern>
