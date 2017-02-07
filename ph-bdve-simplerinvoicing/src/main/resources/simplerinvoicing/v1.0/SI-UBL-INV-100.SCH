<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" queryBinding="xslt" xmlns="http://purl.oclc.org/dsdl/schematron">
	<!-- 
		Release 1.0c 
		Author: M.P. Diepstra (Innopay) 
		Email: support@simplerinvoicing.org
	-->
	<!-- 
		Usable XPath statements for getting insight into Schematron file:
		//rule[@context=preceding-sibling::rule/@context]      - - - > Gets all rules that might not get fired because they have the same context as previous rules
		max(//assert/substring-before(text(), ']'))   - - - > Gets the maximum number of the current error numbering in the rule set
		//assert[@flag='fatal' or (not(@flag) and parent::rule/@flag='fatal')]    - - - > Gets all asserts that are flagged 'fatal'
		//assert[not(@flag) or @flag != parent::rule/@flag] - - - > Gets all asserts where the flag differs from the rule flag 
	-->
	<!-- 
		Rule comments:
		Rule R425 doesn't correspond with the SI Implemenation Guide, it is warned to be mandatory,but SI implementation guideliness say its optional. 
				Since its a warning, that can be ignored, we've left the rule in.
		Rule R428 seems as if it needs revising on the test, it now doesn't match when there is no AllowanceCharge specified, whereas the description explains it 
				depends on the VAT total amount
		All other rules comply with the SI Implementation Guideliness v1.0, but their matching has improved such that errors that previously remained
				 undetected by the Schematron validation are now shown. 
	-->
	<title>BIICORE  T10 bound to UBL</title>
	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
	<phase id="BIICORET10_phase">
		<active pattern="SI-UBL-INV-WARNING"/>
		<active pattern="SI-UBL-INV-FATAL"/>
	</phase>
	<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-UBL-INV-FATAL">
		<rule context="ubl:Invoice" flag="fatal">
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
	<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-UBL-INV-WARNING">
		<rule context="ubl:Invoice" flag="warning">
			<assert test="contains(cbc:CustomizationID, 'urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x')" flag="warning">[SI-UBL-INV-R000]-This XML instance is NOT a core SI-UBL Invoice</assert>
			<assert test="not(count(//*[not(*) and not(normalize-space(text()))]) &gt; 0)" flag="warning">[SI-UBL-INV-R001]-An invoice SHOULD not contain empty elements.</assert>
			<assert test="not(cbc:CopyIndicator)" flag="warning">[SI-UBL-INV-R002]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:UUID) " flag="warning">[SI-UBL-INV-R003]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:IssueTime) " flag="warning">[SI-UBL-INV-R004]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:TaxCurrencyCode)" flag="warning">[SI-UBL-INV-R005]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:PricingCurrencyCode) " flag="warning">[SI-UBL-INV-R006]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:PaymentCurrencyCode) " flag="warning">[SI-UBL-INV-R007]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:PaymentAlternativeCurrencyCode) " flag="warning">[SI-UBL-INV-R008]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:AccountingCostCode) " flag="warning">[SI-UBL-INV-R009]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cbc:LineCountNumeric)" flag="warning">[SI-UBL-INV-R010]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:BillingReference)" flag="warning">[SI-UBL-INV-R011]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:DespatchDocumentReference) " flag="warning">[SI-UBL-INV-R012]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:ReceiptDocumentReference)" flag="warning">[SI-UBL-INV-R013]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OriginatorDocumentReference)" flag="warning">[SI-UBL-INV-R014]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Signature)" flag="warning">[SI-UBL-INV-R015]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:BuyerCustomerParty)" flag="warning">[SI-UBL-INV-R016]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:SellerSupplierParty)" flag="warning">[SI-UBL-INV-R017]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxRepresentativeParty)" flag="warning">[SI-UBL-INV-R018]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:DeliveryTerms/cbc:ID)" flag="warning">[SI-UBL-INV-R020]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:DeliveryTerms/cbc:LossRiskResponsibilityCode)" flag="warning">[SI-UBL-INV-R021]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:DeliveryTerms/cbc:LossRisk)" flag="warning">[SI-UBL-INV-R022]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:DeliveryTerms/cbc:DeliveryLocation)" flag="warning">[SI-UBL-INV-R023]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:DeliveryTerms/cbc:AllowanceCharge)" flag="warning">[SI-UBL-INV-R024]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PrepaidPayment)" flag="warning">[SI-UBL-INV-R025]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxExchangeRate)" flag="warning">[SI-UBL-INV-R026]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PricingExchangeRate)" flag="warning">[SI-UBL-INV-R027]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentExchangeRate)" flag="warning">[SI-UBL-INV-R028]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentAlternativeExchangeRate)" flag="warning">[SI-UBL-INV-R029]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoicePeriod/cbc:StartTime)" flag="warning">[SI-UBL-INV-R030]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoicePeriod/cbc:EndTime)" flag="warning">[SI-UBL-INV-R031]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoicePeriod/cbc:DurationMeasure)" flag="warning">[SI-UBL-INV-R032]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoicePeriod/cbc:Description)" flag="warning">[SI-UBL-INV-R033]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoicePeriod/cbc:DescriptionCode)" flag="warning">[SI-UBL-INV-R034]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OrderReference/cbc:SalesOrderID)" flag="warning">[SI-UBL-INV-R035]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OrderReference/cbc:CopyIndicator) " flag="warning">[SI-UBL-INV-R036]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OrderReference/cbc:UUID) " flag="warning">[SI-UBL-INV-R037]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OrderReference/cbc:IssueDate) " flag="warning">[SI-UBL-INV-R038]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OrderReference/cbc:IssueTime) " flag="warning">[SI-UBL-INV-R039]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OrderReference/cbc:CustomerReference)" flag="warning">[SI-UBL-INV-R040]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:OrderReference/cac:DocumentReference)" flag="warning">[SI-UBL-INV-R041]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:ContractDocumentReference/cbc:CooyIndicator)" flag="warning">[SI-UBL-INV-R042]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:ContractDocumentReference/cbc:UUID)" flag="warning">[SI-UBL-INV-R043]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:ContractDocumentReference/cbc:IssueDate)" flag="warning">[SI-UBL-INV-R044]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:ContractDocumentReference/cbc:DocumentTypeCode)" flag="warning">[SI-UBL-INV-R045]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:ContractDocumentReference/cbc:XPath)" flag="warning">[SI-UBL-INV-R046]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:ContractDocumentReference/cac:Attachment)" flag="warning">[SI-UBL-INV-R047]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cbc:CopyIndicator)" flag="warning">[SI-UBL-INV-R048]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cbc:UUID)" flag="warning">[SI-UBL-INV-R049]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cbc:IssueDate)" flag="warning">[SI-UBL-INV-R050]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cbc:DocumentTypeCode)" flag="warning">[SI-UBL-INV-R051]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cbc:XPath)" flag="warning">[SI-UBL-INV-R052]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash)" flag="warning">[SI-UBL-INV-R053]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate)" flag="warning">[SI-UBL-INV-R054]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime)" flag="warning">[SI-UBL-INV-R055]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID)" flag="warning">[SI-UBL-INV-R056]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cbc:AdditionalAccountID)" flag="warning">[SI-UBL-INV-R057]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cbc:DataSendingCapability)" flag="warning">[SI-UBL-INV-R058]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:DespatchContact)" flag="warning">[SI-UBL-INV-R059]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:AccountingContact)" flag="warning">[SI-UBL-INV-R060]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:SellerContact)" flag="warning">[SI-UBL-INV-R061]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cbc:MarkCareIndicator)" flag="warning">[SI-UBL-INV-R062]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cbc:MarkAttentionIndicator)" flag="warning">[SI-UBL-INV-R063]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI)" flag="warning">[SI-UBL-INV-R064]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cbc:LogoReferenceID)" flag="warning">[SI-UBL-INV-R065]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Language)" flag="warning">[SI-UBL-INV-R066]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode)" flag="warning">[SI-UBL-INV-R067]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode)" flag="warning">[SI-UBL-INV-R068]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor)" flag="warning">[SI-UBL-INV-R069]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Room)" flag="warning">[SI-UBL-INV-R070]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName)" flag="warning">[SI-UBL-INV-R071]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName)" flag="warning">[SI-UBL-INV-R072]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail)" flag="warning">[SI-UBL-INV-R073]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention)" flag="warning">[SI-UBL-INV-R074]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare)" flag="warning">[SI-UBL-INV-R075]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification)" flag="warning">[SI-UBL-INV-R076]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)" flag="warning">[SI-UBL-INV-R077]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Region)" flag="warning">[SI-UBL-INV-R078]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District)" flag="warning">[SI-UBL-INV-R079]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset)" flag="warning">[SI-UBL-INV-R080]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine)" flag="warning">[SI-UBL-INV-R081]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name)" flag="warning">[SI-UBL-INV-R082]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate)" flag="warning">[SI-UBL-INV-R083]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PhysicalLocation)" flag="warning">[SI-UBL-INV-R084]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)" flag="warning">[SI-UBL-INV-R085]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)" flag="warning">[SI-UBL-INV-R086]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)" flag="warning">[SI-UBL-INV-R087]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason)" flag="warning">[SI-UBL-INV-R088]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)" flag="warning">[SI-UBL-INV-R089]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)" flag="warning">[SI-UBL-INV-R090]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">[SI-UBL-INV-R091]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">[SI-UBL-INV-R092]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">[SI-UBL-INV-R093]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode)" flag="warning">[SI-UBL-INV-R094]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode)" flag="warning">[SI-UBL-INV-R095]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox)" flag="warning">[SI-UBL-INV-R096]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor)" flag="warning">[SI-UBL-INV-R097]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room)" flag="warning">[SI-UBL-INV-R098]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName)" flag="warning">[SI-UBL-INV-R101]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName)" flag="warning">[SI-UBL-INV-R102]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail)" flag="warning">[SI-UBL-INV-R104]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department)" flag="warning">[SI-UBL-INV-R105]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention)" flag="warning">[SI-UBL-INV-R106]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare)" flag="warning">[SI-UBL-INV-R107]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification)" flag="warning">[SI-UBL-INV-R108]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName)" flag="warning">[SI-UBL-INV-R109]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode)" flag="warning">[SI-UBL-INV-R111]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region)" flag="warning">[SI-UBL-INV-R112]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)" flag="warning">[SI-UBL-INV-R113]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset)" flag="warning">[SI-UBL-INV-R114]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine)" flag="warning">[SI-UBL-INV-R115]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name)" flag="warning">[SI-UBL-INV-R116]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate)" flag="warning">[SI-UBL-INV-R117]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)" flag="warning">[SI-UBL-INV-R118]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID)" flag="warning">[SI-UBL-INV-R119]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name)" flag="warning">[SI-UBL-INV-R120]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Note)" flag="warning">[SI-UBL-INV-R121]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication)" flag="warning">[SI-UBL-INV-R122]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:Title)" flag="warning">[SI-UBL-INV-R123]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:NameSuffix)" flag="warning">[SI-UBL-INV-R124]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:OrganizationDepartment)" flag="warning">[SI-UBL-INV-R125]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:AgentParty)" flag="warning">[SI-UBL-INV-R126]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID)" flag="warning">[SI-UBL-INV-R127]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID)" flag="warning">[SI-UBL-INV-R128]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cbc:AdditionalAccountID)" flag="warning">[SI-UBL-INV-R129]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:DeliveryContact)" flag="warning">[SI-UBL-INV-R130]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:AccountingContact)" flag="warning">[SI-UBL-INV-R131]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:BuyerContact)" flag="warning">[SI-UBL-INV-R132]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator)" flag="warning">[SI-UBL-INV-R133]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator)" flag="warning">[SI-UBL-INV-R134]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI)" flag="warning">[SI-UBL-INV-R135]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID)" flag="warning">[SI-UBL-INV-R136]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Language)" flag="warning">[SI-UBL-INV-R137]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode)" flag="warning">[SI-UBL-INV-R138]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode)" flag="warning">[SI-UBL-INV-R139]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor)" flag="warning">[SI-UBL-INV-R140]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room)" flag="warning">[SI-UBL-INV-R141]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName)" flag="warning">[SI-UBL-INV-R142]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName)" flag="warning">[SI-UBL-INV-R143]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail)" flag="warning">[SI-UBL-INV-R144]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention)" flag="warning">[SI-UBL-INV-R145]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare)" flag="warning">[SI-UBL-INV-R146]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification)" flag="warning">[SI-UBL-INV-R147]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)" flag="warning">[SI-UBL-INV-R148]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region)" flag="warning">[SI-UBL-INV-R149]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District)" flag="warning">[SI-UBL-INV-R150]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset)" flag="warning">[SI-UBL-INV-R151]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine)" flag="warning">[SI-UBL-INV-R152]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name)" flag="warning">[SI-UBL-INV-R153]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate)" flag="warning">[SI-UBL-INV-R154]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation)" flag="warning">[SI-UBL-INV-R155]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)" flag="warning">[SI-UBL-INV-R156]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)" flag="warning">[SI-UBL-INV-R157]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)" flag="warning">[SI-UBL-INV-R158]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason)" flag="warning">[SI-UBL-INV-R159]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)" flag="warning">[SI-UBL-INV-R160]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)" flag="warning">[SI-UBL-INV-R161]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">[SI-UBL-INV-R162]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">[SI-UBL-INV-R163]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">[SI-UBL-INV-R164]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode)" flag="warning">[SI-UBL-INV-R165]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode)" flag="warning">[SI-UBL-INV-R166]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox)" flag="warning">[SI-UBL-INV-R167]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor)" flag="warning">[SI-UBL-INV-R168]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room)" flag="warning">[SI-UBL-INV-R169]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName)" flag="warning">[SI-UBL-INV-R172]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName)" flag="warning">[SI-UBL-INV-R173]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail)" flag="warning">[SI-UBL-INV-R175]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department)" flag="warning">[SI-UBL-INV-R176]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention)" flag="warning">[SI-UBL-INV-R177]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare)" flag="warning">[SI-UBL-INV-R178]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification)" flag="warning">[SI-UBL-INV-R179]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName)" flag="warning">[SI-UBL-INV-R180]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode)" flag="warning">[SI-UBL-INV-R182]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region)" flag="warning">[SI-UBL-INV-R183]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)" flag="warning">[SI-UBL-INV-R184]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset)" flag="warning">[SI-UBL-INV-R185]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine)" flag="warning">[SI-UBL-INV-R186]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name)" flag="warning">[SI-UBL-INV-R187]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate)" flag="warning">[SI-UBL-INV-R188]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)" flag="warning">[SI-UBL-INV-R189]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID)" flag="warning">[SI-UBL-INV-R190]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name)" flag="warning">[SI-UBL-INV-R191]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note)" flag="warning">[SI-UBL-INV-R192]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication)" flag="warning">[SI-UBL-INV-R193]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:Title)" flag="warning">[SI-UBL-INV-R194]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:NameSuffix)" flag="warning">[SI-UBL-INV-R195]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment)" flag="warning">[SI-UBL-INV-R196]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:AgentParty)" flag="warning">[SI-UBL-INV-R197]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cbc:MarkCareIndicator)" flag="warning">[SI-UBL-INV-R198]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cbc:MarkAttentionIndicator)" flag="warning">[SI-UBL-INV-R199]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cbc:WebsiteURI)" flag="warning">[SI-UBL-INV-R200]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cbc:LogoReferenceID)" flag="warning">[SI-UBL-INV-R201]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:Language)" flag="warning">[SI-UBL-INV-R202]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:PostalAddress)" flag="warning">[SI-UBL-INV-R203]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:PhysicalLocation)" flag="warning">[SI-UBL-INV-R204]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:PartyTaxScheme)" flag="warning">[SI-UBL-INV-R205]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName)" flag="warning">[SI-UBL-INV-R206]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress)" flag="warning">[SI-UBL-INV-R207]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)" flag="warning">[SI-UBL-INV-R208]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:Contact)" flag="warning">[SI-UBL-INV-R209]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:Person)" flag="warning">[SI-UBL-INV-R210]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PayeeParty/cac:AgentParty)" flag="warning">[SI-UBL-INV-R211]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:ID)" flag="warning">[SI-UBL-INV-R212]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:Quantity)" flag="warning">[SI-UBL-INV-R213]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:MinimumQuantity)" flag="warning">[SI-UBL-INV-R214]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:MaximumQuantity)" flag="warning">[SI-UBL-INV-R215]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:ActualDeliveryTime)" flag="warning">[SI-UBL-INV-R216]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:LatestDeliveryDate)" flag="warning">[SI-UBL-INV-R217]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:LatestDeliveryTime)" flag="warning">[SI-UBL-INV-R218]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cbc:TrackingID)" flag="warning">[SI-UBL-INV-R219]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryAddress)" flag="warning">[SI-UBL-INV-R220]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cbc:Description)" flag="warning">[SI-UBL-INV-R221]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cbc:Conditions)" flag="warning">[SI-UBL-INV-R222]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity)" flag="warning">[SI-UBL-INV-R223]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode)" flag="warning">[SI-UBL-INV-R224]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod)" flag="warning">[SI-UBL-INV-R225]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode)" flag="warning">[SI-UBL-INV-R226]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode)" flag="warning">[SI-UBL-INV-R227]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor)" flag="warning">[SI-UBL-INV-R228]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room)" flag="warning">[SI-UBL-INV-R229]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName)" flag="warning">[SI-UBL-INV-R230]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName)" flag="warning">[SI-UBL-INV-R231]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail)" flag="warning">[SI-UBL-INV-R232]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department)" flag="warning">[SI-UBL-INV-R233]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention)" flag="warning">[SI-UBL-INV-R234]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare)" flag="warning">[SI-UBL-INV-R235]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification)" flag="warning">[SI-UBL-INV-R236]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName)" flag="warning">[SI-UBL-INV-R237]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode)" flag="warning">[SI-UBL-INV-R238]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region)" flag="warning">[SI-UBL-INV-R239]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District)" flag="warning">[SI-UBL-INV-R240]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset)" flag="warning">[SI-UBL-INV-R241]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine)" flag="warning">[SI-UBL-INV-R242]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name)" flag="warning">[SI-UBL-INV-R243]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate)" flag="warning">[SI-UBL-INV-R244]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:RequestedDeliveryPeriod)" flag="warning">[SI-UBL-INV-R245]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:PromisedDeliveryPeriod)" flag="warning">[SI-UBL-INV-R246]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:EstimatedDeliveryPeriod)" flag="warning">[SI-UBL-INV-R247]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:DeliveryParty)" flag="warning">[SI-UBL-INV-R248]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:Delivery/cac:DeliveryLocation/cac:Despatch)" flag="warning">[SI-UBL-INV-R249]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cbc:ID)" flag="warning">[SI-UBL-INV-R250]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cbc:InstructionID)" flag="warning">[SI-UBL-INV-R251]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cbc:InstructionNote)" flag="warning">[SI-UBL-INV-R252]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:CardAccount)" flag="warning">[SI-UBL-INV-R253]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayerFinancialAccount)" flag="warning">[SI-UBL-INV-R254]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:CreditAccount)" flag="warning">[SI-UBL-INV-R255]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:Name)" flag="warning">[SI-UBL-INV-R256]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountTypeCode)" flag="warning">[SI-UBL-INV-R257]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:CurrencyCode)" flag="warning">[SI-UBL-INV-R258]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:Country)" flag="warning">[SI-UBL-INV-R259]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name)" flag="warning">[SI-UBL-INV-R260]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:Address)" flag="warning">[SI-UBL-INV-R261]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name)" flag="warning">[SI-UBL-INV-R262]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address)" flag="warning">[SI-UBL-INV-R263]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cbc:ID)" flag="warning">[SI-UBL-INV-R264]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cbc:PaymentMeansID)" flag="warning">[SI-UBL-INV-R265]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cbc:PrepaidPaymentReferenceID)" flag="warning">[SI-UBL-INV-R266]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cbc:ReferenceEventCode)" flag="warning">[SI-UBL-INV-R267]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cbc:SettlementDiscountPercent)" flag="warning">[SI-UBL-INV-R268]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cbc:PenaltySurchargePercent)" flag="warning">[SI-UBL-INV-R269]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cbc:Amount)" flag="warning">[SI-UBL-INV-R270]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cac:SettlementPeriod)" flag="warning">[SI-UBL-INV-R271]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:PaymentTerms/cac:PenaltyPeriod)" flag="warning">[SI-UBL-INV-R272]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:ID)" flag="warning">[SI-UBL-INV-R273]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)" flag="warning">[SI-UBL-INV-R274]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:MultiplierFactorNumeric)" flag="warning">[SI-UBL-INV-R275]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:PrepaidIndicator)" flag="warning">[SI-UBL-INV-R276]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:SequenceNumeric)" flag="warning">[SI-UBL-INV-R277]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:BaseAmount)" flag="warning">[SI-UBL-INV-R278]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:AccountingCostCode)" flag="warning">[SI-UBL-INV-R279]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cbc:AccountingCost)" flag="warning">[SI-UBL-INV-R280]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:Name) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:Percent) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">[SI-UBL-INV-R281]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount)" flag="warning">[SI-UBL-INV-R283]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">[SI-UBL-INV-R284]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal)" flag="warning">[SI-UBL-INV-R285]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:AllowanceCharge/cac:PaymentMeans)" flag="warning">[SI-UBL-INV-R286]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cbc:RoundingAmount)" flag="warning">[SI-UBL-INV-R287]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">[SI-UBL-INV-R288]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric)" flag="warning">[SI-UBL-INV-R289]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount)" flag="warning">[SI-UBL-INV-R290]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:Percent)" flag="warning">[SI-UBL-INV-R291]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure)" flag="warning">[SI-UBL-INV-R292]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount)" flag="warning">[SI-UBL-INV-R293]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange)" flag="warning">[SI-UBL-INV-R294]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent)" flag="warning">[SI-UBL-INV-R295]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name)" flag="warning">[SI-UBL-INV-R296]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure)" flag="warning">[SI-UBL-INV-R297]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount)" flag="warning">[SI-UBL-INV-R298]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange)" flag="warning">[SI-UBL-INV-R299]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent)" flag="warning">[SI-UBL-INV-R300]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name)" flag="warning">[SI-UBL-INV-R301]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">[SI-UBL-INV-R302]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">[SI-UBL-INV-R303]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">[SI-UBL-INV-R304]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cbc:UUID)" flag="warning">[SI-UBL-INV-R305]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cbc:TaxPointDate)" flag="warning">[SI-UBL-INV-R306]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cbc:AccountingCostCode)" flag="warning">[SI-UBL-INV-R307]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cbc:FreeOfChargeIndicator)" flag="warning">[SI-UBL-INV-R308]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:OrderLineReference/cbc:SalesOrderLineID)" flag="warning">[SI-UBL-INV-R309]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:DespatchLineReference)" flag="warning">[SI-UBL-INV-R310]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:ReceiptLineReference)" flag="warning">[SI-UBL-INV-R311]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:BillingReference)" flag="warning">[SI-UBL-INV-R312]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:DocumentReference)" flag="warning">[SI-UBL-INV-R313]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:PricingReference)" flag="warning">[SI-UBL-INV-R314]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:OriginatorParty)" flag="warning">[SI-UBL-INV-R315]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Delivery)" flag="warning">[SI-UBL-INV-R316]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:PaymentTerms)" flag="warning">[SI-UBL-INV-R317]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:ID)" flag="warning">[SI-UBL-INV-R318]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)" flag="warning">[SI-UBL-INV-R319]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric)" flag="warning">[SI-UBL-INV-R320]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:PrepaidIndicator)" flag="warning">[SI-UBL-INV-R321]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:SequenceNumeric)" flag="warning">[SI-UBL-INV-R322]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:BaseAmount)" flag="warning">[SI-UBL-INV-R323]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:AccountingCostCode)" flag="warning">[SI-UBL-INV-R324]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cbc:AccountingCost)" flag="warning">[SI-UBL-INV-R325]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:Name) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode) or not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">[SI-UBL-INV-R326]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount)" flag="warning">[SI-UBL-INV-R328]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">[SI-UBL-INV-R329]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxSubtotal)" flag="warning">[SI-UBL-INV-R330]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:AllowanceCharge/cac:PaymentMeans)" flag="warning">[SI-UBL-INV-R331]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:TaxTotal/cbc:RoundingAmount)" flag="warning">[SI-UBL-INV-R332]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">[SI-UBL-INV-R333]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal)" flag="warning">[SI-UBL-INV-R334]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:PackQuantity)" flag="warning">[SI-UBL-INV-R335]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:PackSizeNumeric)" flag="warning">[SI-UBL-INV-R336]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:CatalogueIndicator)" flag="warning">[SI-UBL-INV-R337]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:HazardousRiskIndicator)" flag="warning">[SI-UBL-INV-R338]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:AdditionalInformation)" flag="warning">[SI-UBL-INV-R339]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:Keyword)" flag="warning">[SI-UBL-INV-R340]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:BrandName)" flag="warning">[SI-UBL-INV-R341]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cbc:ModelName)" flag="warning">[SI-UBL-INV-R342]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID)" flag="warning">[SI-UBL-INV-R343]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:PhysycalAttribute)" flag="warning">[SI-UBL-INV-R344]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:MeasurementDimension)" flag="warning">[SI-UBL-INV-R345]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:IssuerParty)" flag="warning">[SI-UBL-INV-R346]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID)" flag="warning">[SI-UBL-INV-R347]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:PhysycalAttribute)" flag="warning">[SI-UBL-INV-R348]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:MeasurementDimension)" flag="warning">[SI-UBL-INV-R349]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:IssuerParty)" flag="warning">[SI-UBL-INV-R350]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:ExtendedID)" flag="warning">[SI-UBL-INV-R352]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:PhysycalAttribute)" flag="warning">[SI-UBL-INV-R353]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:MeasurementDimension)" flag="warning">[SI-UBL-INV-R354]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:IssuerParty)" flag="warning">[SI-UBL-INV-R355]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:NatureCargo)" flag="warning">[SI-UBL-INV-R356]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode)" flag="warning">[SI-UBL-INV-R357]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode)" flag="warning">[SI-UBL-INV-R358]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:ManufacturersItemIdentification)" flag="warning">[SI-UBL-INV-R359]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:CatalogueItemIdentification)" flag="warning">[SI-UBL-INV-R360]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification)" flag="warning">[SI-UBL-INV-R361]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:CatalogueDocumentReference)" flag="warning">[SI-UBL-INV-R362]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:ItemSpecificationDocumentReference)" flag="warning">[SI-UBL-INV-R363]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:OriginCountry)" flag="warning">[SI-UBL-INV-R364]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TransactionConditions)" flag="warning">[SI-UBL-INV-R365]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:HazardousItem)" flag="warning">[SI-UBL-INV-R366]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:ManufacturerParty)" flag="warning">[SI-UBL-INV-R367]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:InformationContentProviderParty)" flag="warning">[SI-UBL-INV-R368]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:OriginAddress)" flag="warning">[SI-UBL-INV-R369]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:ItemInstance)" flag="warning">[SI-UBL-INV-R370]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:Name)" flag="warning">[SI-UBL-INV-R371]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:BaseUnitMeasure)" flag="warning">[SI-UBL-INV-R372]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cbcPerUnitAmount)" flag="warning">[SI-UBL-INV-R373]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TaxExemptionReasonCode)" flag="warning">[SI-UBL-INV-R374]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TaxExemptionReason)" flag="warning">[SI-UBL-INV-R375]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TierRange)" flag="warning">[SI-UBL-INV-R376]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TierRatePercent)" flag="warning">[SI-UBL-INV-R377]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:Name)" flag="warning">[SI-UBL-INV-R378]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">[SI-UBL-INV-R379]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">[SI-UBL-INV-R380]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionAddress)" flag="warning">[SI-UBL-INV-R381]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:AdditionalProperty/cac:UsabilityPeriod)" flag="warning">[SI-UBL-INV-R382]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:AdditionalProperty/cac:ItemPropertyGroup)" flag="warning">[SI-UBL-INV-R383]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cbc:PriceChangeReason)" flag="warning">[SI-UBL-INV-R384]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cbc:PriceTypeCode)" flag="warning">[SI-UBL-INV-R385]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cbc:PriceType)" flag="warning">[SI-UBL-INV-R386]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cbc:OrderableUnitFactorRate)" flag="warning">[SI-UBL-INV-R387]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:ValidityPeriod)" flag="warning">[SI-UBL-INV-R388]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:PriceList)" flag="warning">[SI-UBL-INV-R389]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:ID)" flag="warning">[SI-UBL-INV-R390]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)" flag="warning">[SI-UBL-INV-R391]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator)" flag="warning">[SI-UBL-INV-R392]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric)" flag="warning">[SI-UBL-INV-R393]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode)" flag="warning">[SI-UBL-INV-R394]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCost)" flag="warning">[SI-UBL-INV-R395]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:Name) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode) or not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress) " flag="warning">[SI-UBL-INV-R396]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount)" flag="warning">[SI-UBL-INV-R398]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">[SI-UBL-INV-R399]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxSubtotal)" flag="warning">[SI-UBL-INV-R400]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:PaymentMeans)" flag="warning">[SI-UBL-INV-R401]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:OrderLineReference/cbc:UUID)" flag="warning">[SI-UBL-INV-R402]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:OrderLineReference/cbc:LineStatusCode)" flag="warning">[SI-UBL-INV-R403]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
			<assert test="not(cac:InvoiceLine/cac:OrderLineReference/cac:OrderReference)" flag="warning">[SI-UBL-INV-R404]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		</rule>
		<rule context="cac:AccountingCustomerParty/cac:Party" flag="warning">
			<assert test="count(cac:PartyIdentification)&lt;=1" flag="warning">[SI-UBL-INV-R405]-Element 'PartyIdentification' may occur at maximum 1 times.</assert>
			<assert test="count(cac:PartyName)=1" flag="warning">[SI-UBL-INV-R406]-Element 'PartyName' must occur exactly 1 times.</assert>
			<assert test="count(cac:PartyTaxScheme)&lt;=1" flag="warning">[SI-UBL-INV-R407]-Element 'PartyTaxScheme' may occur at maximum 1 times.</assert>
		</rule>
		<rule context="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress">
			<assert test="(cbc:StreetName and cbc:CityName and cbc:PostalZone and cac:Country/cbc:IdentificationCode)" flag="warning">[SI-UBL-INV-R424]-A customer postal address in an invoice SHOULD contain at least, Street name and number, city name, zip code and country code.</assert>
		</rule>
		<rule context="cac:AccountingSupplierParty/cac:Party" flag="warning">
			<assert test="count(cac:PartyIdentification)&lt;=1" flag="warning">[SI-UBL-INV-R408]-Element 'PartyIdentification' may occur at maximum 1 times.</assert>
			<assert test="count(cac:PartyName)=1" flag="warning">[SI-UBL-INV-R409]-Element 'PartyName' must occur exactly 1 times.</assert>
			<assert test="count(cac:PostalAddress)=1" flag="warning">[SI-UBL-INV-R410]-Element 'PostalAddress' must occur exactly 1 times.</assert>
			<assert test="count(cac:PartyTaxScheme)&lt;=1" flag="warning">[SI-UBL-INV-R411]-Element 'PartyTaxScheme' may occur at maximum 1 times.</assert>
			<assert test="(cac:PostalAddress/cbc:StreetName and cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode)" flag="warning">[SI-UBL-INV-R423]-A supplier postal address in an invoice SHOULD contain at least, Street name and number, city name, zip code and country code.</assert>
		</rule>
		<rule context="ubl:Invoice/cac:InvoiceLine" flag="warning">
			<assert test="count(cac:TaxTotal)&lt;=1" flag="warning">[SI-UBL-INV-R412]-Element 'TaxTotal' may occur at maximum 1 times.</assert>
			<assert test="count(cac:Price)=1" flag="warning">[SI-UBL-INV-R413]-Element 'Price' must occur exactly 1 times.</assert>
			<assert test="(cbc:InvoicedQuantity and cbc:InvoicedQuantity/@unitCode)" flag="warning">[SI-UBL-INV-R425]-Each invoice line SHOULD contain the quantity and unit of measure</assert>
		</rule>
		<rule context="ubl:Invoice/cac:InvoiceLine/cac:Item" flag="warning">
			<assert test="count(cbc:Description)&lt;=1" flag="warning">[SI-UBL-INV-R414]-Element 'Description' may occur at maximum 1 times.</assert>
			<assert test="count(cbc:Name)=1" flag="warning">[SI-UBL-INV-R415]-Element 'Name' must occur exactly 1 times.</assert>
			<assert test="count(cac:ClassifiedTaxCategory)&lt;=1" flag="warning">[SI-UBL-INV-R416]-Element 'ClassifiedTaxCategory' may occur at maximum 1 times.</assert>
		</rule>
		<rule context="ubl:Invoice/cac:InvoiceLine/cac:Price" flag="warning">
			<assert test="count(cac:AllowanceCharge)&lt;=1" flag="warning">[SI-UBL-INV-R417]-Element 'AllowanceCharge' may occur at maximum 1 times.</assert>
		</rule>
		<rule context="ubl:Invoice/cac:LegalMonetaryTotal" flag="warning">
			<assert test="count(cbc:TaxExclusiveAmount)=1" flag="warning">[SI-UBL-INV-R418]-Element 'TaxExclusiveAmount' must occur exactly 1 times.</assert>
			<assert test="count(cbc:TaxInclusiveAmount)=1" flag="warning">[SI-UBL-INV-R419]-Element 'TaxInclusiveAmount' must occur exactly 1 times.</assert>
			<assert test="count(cbc:LineExtensionAmount)=1" flag="warning">[SI-UBL-INV-R453]-Element 'LineExtensionAmount' must occur exactly 1 times.</assert>
		</rule>
		<rule context="ubl:Invoice/cac:PayeeParty" flag="warning">
			<assert test="count(cac:PartyIdentification)&lt;=1" flag="warning">[SI-UBL-INV-R420]-Element 'PartyIdentification' may occur at maximum 1 times.</assert>
			<assert test="count(cac:PartyName)&lt;=1" flag="warning">[SI-UBL-INV-R421]-Element 'PartyName' may occur at maximum 1 times</assert>
		</rule>
		<rule context="ubl:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount" flag="warning">
			<assert test="count(cbc:ID)=1" flag="warning">[SI-UBL-INV-R422]-Element 'ID' must occur exactly 1 times.</assert>
		</rule>
		<rule context="cac:PaymentMeans" flag="warning">
			<assert test="((cbc:PaymentMeansCode = '31') and (cac:PayeeFinancialAccount/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and (cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID = 'BIC')) or (cbc:PaymentMeansCode != '31') or ((cbc:PaymentMeansCode = '31') and  (not(cac:PayeeFinancialAccount/cbc:ID/@schemeID) or (cac:PayeeFinancialAccount/cbc:ID/@schemeID != 'IBAN')))" flag="warning">[SI-UBL-INV-R426]-If the payment means are international account transfer and the account id is IBAN then the financial institution should be identified by using the BIC id.</assert>
		</rule>
		<rule context="cac:Delivery/cac:DeliveryLocation/cac:Address" flag="warning">
			<assert test="(cbc:CityName and cbc:PostalZone and cac:Country/cbc:IdentificationCode)" flag="warning">[SI-UBL-INV-R427]-A Delivery address in an invoice SHOULD contain at least, city, zip code and country code.</assert>
		</rule>
		<rule context="cac:TaxSubtotal" flag="warning">
			<assert test="((cac:TaxCategory/cbc:ID = 'E') and (cac:TaxCategory/cbc:TaxExemptionReason or cac:TaxCategory/cbc:TaxExemptionReasonCode)) or (cac:TaxCategory/cbc:ID != 'E')" flag="warning">[SI-UBL-INV-R431]-If the category for VAT is exempt (E) then an exemption reason SHOULD be provided.</assert>
		</rule>
		<rule context="cac:FinancialInstitution/cbc:ID//@schemeID" flag="warning">
			<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' BIC ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[SI-UBL-INV-R446]-If FinancialAccountID is IBAN then Financial InstitutionID SHOULD be BIC code.</assert>
		</rule>
		<rule context="cac:PostalAddress/cbc:ID//@schemeID" flag="warning">
			<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[SI-UBL-INV-R447]-Postal address identifiers SHOULD be GLN.</assert>
		</rule>
		<rule context="cac:Delivery/cac:DeliveryLocation/cbc:ID//@schemeID" flag="warning">
			<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[SI-UBL-INV-R448]-Location identifiers SHOULD be GLN</assert>
		</rule>
		<rule context="cac:Item/cac:StandardItemIdentification/cbc:ID//@schemeID" flag="warning">
			<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GTIN ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[SI-UBL-INV-R449]-Standard item identifiers SHOULD be GTIN.</assert>
		</rule>
		<rule context="cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode//@listID" flag="warning">
			<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' UNSPSC eCLASS CPV ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[SI-UBL-INV-R450]-Commodity classification SHOULD be one of UNSPSC, eClass or CPV.</assert>
		</rule>
	</pattern>
</schema>
