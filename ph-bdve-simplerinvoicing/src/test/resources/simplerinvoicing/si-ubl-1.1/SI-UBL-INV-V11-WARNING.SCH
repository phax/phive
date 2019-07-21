<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-V11-INV-WARNING">
	<!-- Backwards compatibility statement for Simplerinvoicing v1.0, it should include the version for which the asserts in this pattern MUST not be executed -->
    <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.1'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.1'))]">
        <assert test="true()" />
    </rule>
	<!-- End backwards compatibiltiy statement -->

	<!-- Rules are numbered in the region 2xx -->
	<rule context="cbc:CustomizationID">
		<assert test="contains(., 'urn:www.simplerinvoicing.org:si:si-ubl:ver1.1')" flag="fatal">[SI-V11-INV-R200]-This XML instance is NOT tagged as an SI-UBL 1.1 invoice</assert>
	</rule>
	<rule context="cac:ContractDocumentReference[2]">
		<assert test="false()">[SI-V11-INV-R201]-An SI invoice SHOULD not contain more than one contract document reference</assert>
	</rule>
	<rule context="cac:InvoicePeriod[2]">
		<assert test="false()">[SI-V11-INV-R202]-An SI invoice SHOULD not contain more than one invoice period</assert>
	</rule>
	<rule context="cbc:Note[2]">
		<assert test="false()">[SI-V11-INV-R203]-Multple notes in a section SHOULD not occur</assert>
	</rule>
	<rule context="cbc:PartyIdentification[2]">
		<assert test="false()" flag="warning">[SI-V11-INV-R204]-A party SHOULD not contain more than one identification</assert>
	</rule>
	<rule context="cac:PartyName[2]">
		<assert test="false()" flag="warning">[SI-V11-INV-R205]-A party SHOULD not contain more than one name</assert>
	</rule>
	<rule context="cac:PartyTaxScheme[2]">
		<assert test="false()" flag="warning">[SI-V11-INV-R206]-A party SHOULD not contain more than one tax scheme</assert>
	</rule>
	<rule context="cac:PartyLegalEntity[2]">
		<assert test="false()" flag="warning">[SI-V11-INV-R207]-A party SHOULD not contain more than one legal entity</assert>
	</rule>
	<rule context="cac:PostalAddress | cac:Address">
		<assert test="(cbc:StreetName and cbc:CityName and cbc:PostalZone and cac:Country)" flag="warning">[SI-V11-INV-R208]-An address in an invoice SHOULD contain at least, street name and number, city name, zip code and the country</assert>
	</rule>
	<rule context="cac:PaymentMeans[2]">
		<assert test="false()" flag="warning">[SI-V11-INV-R209]-An invoice SHOULD not contain more than one means of payment</assert>
	</rule>
	<rule context="cbc:PaymentID[2]">
		<assert test="false()" flag="warning">[SI-V11-INV-R210]-A payment means SHOULD not have multiple payment ids</assert>
	</rule>
	<rule context="cbc:PrimaryAccountNumberID">
		<assert test="string-length(normalize-space(text())) = 4 or string-length(normalize-space(text())) = 6">[SI-V11-INV-R211]-In accordance to general rules for
			referencing payments cards only the last 4 or 6 digits of the card number SHOULD be used.</assert>
	</rule>
	<rule context="cac:PaymentTerms[2]">
		<assert test="false()">[SI-V11-INV-R212]-An invoice SHOULD not have multiple payment terms</assert>
	</rule>
	<!-- Next rule is commented because it conflicts with rule BII2-T10-R025, for the moment we assume the BII2
	rule should be followed -->
	<!--<rule context="cbc:AllowanceChargeReason" flag="fatal">
		<assert test="not(preceding-sibling::cbc:AllowanceChargeReasonCode)">[SI-V11-INV-R213]-When an allowance charge reason code is specified the allowance charge reason SHOULD not be included</assert>
	</rule>-->
	<rule context="cbc:TaxExemptionReasonCode | cbc:TaxExemptionReason">
		<assert test="preceding-sibling::cbc:ID[text() = 'E' or text() = 'AB']" flag="warning">[SI-V11-INV-R214]-A tax exemption reason or reason code SHOULD only be given when the tax category is tax exempt</assert>
	</rule>
	<rule context="cac:TaxCategory[2]">
		<assert test="false()">[SI-V11-INV-R215]-Tax category SHOULD not occur more than once in a section</assert>
	</rule>
	<rule context="cac:TaxTotal[2]">
		<assert test="false()">[SI-V11-INV-R216]-An invoice SHOULD not have multiple tax totals on invoice level</assert>
	</rule>
	<rule context="cac:Delivery/cac:DeliveryLocation/cbc:ID/@schemeID" flag="warning">
		<assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[SI-V11-INV-R217]-Location identifiers SHOULD be GLN</assert>
	</rule>
	<rule context="cac:Delivery[2]">
		<assert test="false()">[SI-V11-INV-R218]-Each invoiceline SHOULD have no more than one delivery specified</assert>
	</rule>
	<rule context="cac:ClassifiedTaxCategory[2]">
		<assert test="false()">[SI-V11-INV-R219]-An invoiceline SHOULD not have more than one classified tax category</assert>
	</rule>
	<rule context="cac:Price/cac:AllowanceCharge[2]">
		<assert test="false()">[SI-V11-INV-R220]-The price in an invoiceline SHOULD not have more than one allowance charge</assert>
	</rule>
	<rule context="ubl:Invoice" flag="warning">
		<assert test="not(cbc:CopyIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:CopyIndicator</assert>
		<assert test="not(cbc:UUID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:UUID</assert>
		<assert test="not(cbc:IssueTime)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:IssueTime</assert>
		<assert test="not(cbc:PricingCurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:PricingCurrencyCode</assert>
		<assert test="not(cbc:PaymentCurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:PaymentCurrencyCode</assert>
		<assert test="not(cbc:PaymentAlternativeCurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:PaymentAlternativeCurrencyCode</assert>
		<assert test="not(cbc:AccountingCostCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:AccountingCostCode</assert>
		<assert test="not(cbc:LineCountNumeric)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cbc:LineCountNumeric</assert>
		<assert test="not(cac:DespatchDocumentReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:DespatchDocumentReference</assert>
		<assert test="not(cac:ReceiptDocumentReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:ReceiptDocumentReference</assert>
		<assert test="not(cac:OriginatorDocumentReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:OriginatorDocumentReference</assert>
		<assert test="not(cac:Signature)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Signature</assert>
		<assert test="not(cac:SellerSupplierParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:SellerSupplierParty</assert>
		<assert test="not(cac:PrepaidPayment)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PrepaidPayment</assert>
		<assert test="not(cac:PricingExchangeRate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PricingExchangeRate</assert>
		<assert test="not(cac:PaymentExchangeRate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentExchangeRate</assert>
		<assert test="not(cac:PaymentAlternativeExchangeRate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentAlternativeExchangeRate</assert>

		<!-- Elements removed from SI v1.1 compared to v1.0 -->
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:FirstName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:FirstName</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:FamilyName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:FamilyName</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:MiddleName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:MiddleName</assert>
		<assert test="not(cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:JobTitle)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:JobTitle</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Streetname)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Streetname</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubEntity)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubEntity</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/PostalAddress/cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/PostalAddress/cbc:ID</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:FirstName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:FirstName</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:FamilyName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:FamilyName</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:MiddleName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:MiddleName</assert>
		<assert test="not(cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:JobTitle)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:JobTitle</assert>

	</rule>
	<rule context="cac:DeliveryTerms" flag="warning">
		<assert test="not(cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:DeliveryTerms/cbc:ID</assert>
		<assert test="not(cbc:LossRiskResponsibilityCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:DeliveryTerms/cbc:LossRiskResponsibilityCode</assert>
		<assert test="not(cbc:LossRisk)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:DeliveryTerms/cbc:LossRisk</assert>
		<assert test="not(cbc:DeliveryLocation)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:DeliveryTerms/cbc:DeliveryLocation</assert>
		<assert test="not(cbc:AllowanceCharge)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:DeliveryTerms/cbc:AllowanceCharge</assert>
	</rule>
	<rule context="cac:InvoicePeriod" flag="warning">
		<assert test="not(cac:InvoicePeriod/cbc:StartTime)" flag="warning">[SI-UBL-INV-R030]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:InvoicePeriod/cbc:EndTime)" flag="warning">[SI-UBL-INV-R031]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:InvoicePeriod/cbc:DurationMeasure)" flag="warning">[SI-UBL-INV-R032]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:InvoicePeriod/cbc:Description)" flag="warning">[SI-UBL-INV-R033]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:InvoicePeriod/cbc:DescriptionCode)" flag="warning">[SI-UBL-INV-R034]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
	</rule>
	<rule context="cac:InvoicePeriod" flag="warning">
		<assert test="not(cac:OrderReference/cbc:SalesOrderID)" flag="warning">[SI-UBL-INV-R035]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:OrderReference/cbc:CopyIndicator) " flag="warning">[SI-UBL-INV-R036]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:OrderReference/cbc:UUID) " flag="warning">[SI-UBL-INV-R037]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:OrderReference/cbc:IssueDate) " flag="warning">[SI-UBL-INV-R038]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:OrderReference/cbc:IssueTime) " flag="warning">[SI-UBL-INV-R039]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:OrderReference/cbc:CustomerReference)" flag="warning">[SI-UBL-INV-R040]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:OrderReference/cac:DocumentReference)" flag="warning">[SI-UBL-INV-R041]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
	</rule>
	<rule context="cac:InvoicePeriod" flag="warning">
		<assert test="not(cac:ContractDocumentReference/cbc:CopyIndicator)" flag="warning">[SI-UBL-INV-R042]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:ContractDocumentReference/cbc:UUID)" flag="warning">[SI-UBL-INV-R043]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:ContractDocumentReference/cbc:IssueDate)" flag="warning">[SI-UBL-INV-R044]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:ContractDocumentReference/cbc:DocumentTypeCode)" flag="warning">[SI-UBL-INV-R045]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:ContractDocumentReference/cbc:XPath)" flag="warning">[SI-UBL-INV-R046]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:ContractDocumentReference/cac:Attachment)" flag="warning">[SI-UBL-INV-R047]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
	</rule>
	<rule context="cac:AdditionalDocumentReference" flag="warning">
		<assert test="not(cbc:CopyIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AdditionalDocumentReference/cbc:CopyIndicator</assert>
		<assert test="not(cbc:UUID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AdditionalDocumentReference/cbc:UUID</assert>
		<assert test="not(cbc:IssueDate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AdditionalDocumentReference/cbc:IssueDate</assert>
		<assert test="not(cbc:DocumentTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AdditionalDocumentReference/cbc:DocumentTypeCode</assert>
		<assert test="not(cbc:XPath)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AdditionalDocumentReference/cbc:XPath</assert>
		<assert test="not(cac:Attachment/cac:ExternalReference/cbc:DocumentHash)" flag="warning">[SI-UBL-INV-R053]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:Attachment/cac:ExternalReference/cbc:ExpiryDate)" flag="warning">[SI-UBL-INV-R054]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:Attachment/cac:ExternalReference/cbc:ExpiryTime)" flag="warning">[SI-UBL-INV-R055]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
	</rule>
	<rule context="cac:AccountingSupplierParty">
		<assert test="not(cbc:DataSendingCapability)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cbc:DataSendingCapability</assert>
		<assert test="not(cac:DespatchContact)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:DespatchContact</assert>
		<assert test="not(cac:AccountingContact)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:AccountingContact</assert>
		<assert test="not(cac:SellerContact)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:SellerContact</assert>
		<assert test="not(cac:Party/cbc:MarkCareIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cbc:MarkCareIndicator</assert>
		<assert test="not(cac:Party/cbc:MarkAttentionIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cbc:MarkAttentionIndicator</assert>
		<assert test="not(cac:Party/cbc:WebsiteURI)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI</assert>
		<assert test="not(cac:Party/cbc:LogoReferenceID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cbc:LogoReferenceID</assert>
		<assert test="not(cac:Party/cac:Language)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Language</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:AddressTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:AddressFormatCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:Floor)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:Room)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Room</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:BlockName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:BuildingName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:InhouseMail)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:MarkAttention)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:MarkCare)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:PlotIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:Region)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Region</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:District)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:TimezoneOffset)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cac:AddressLine)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cac:Country/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cac:LocationCoordinate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate</assert>
		<assert test="not(cac:Party/cac:PhysicalLocation)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PhysicalLocation</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme</assert>
		<assert test="not(cac:Party/cac:Contact/cbc:Note)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Note</assert>
		<assert test="not(cac:Party/cac:Contact/cac:OtherCommunication)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication</assert>
		<assert test="not(cac:Party/cac:Person/cbc:Title)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:Title</assert>
		<assert test="not(cac:Party/cac:Person/cbc:NameSuffix)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:NameSuffix</assert>
		<assert test="not(cac:Party/cac:Person/cbc:OrganizationDepartment)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:Person/cbc:OrganizationDepartment</assert>
		<assert test="not(cac:Party/cac:AgentParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingSupplierParty/cac:Party/cac:AgentParty</assert>
	</rule>
	<rule context="cac:AccountingCustomerParty">
		<assert test="not(cac:DeliveryContact)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:DeliveryContact</assert>
		<assert test="not(cac:AccountingContact)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:AccountingContact</assert>
		<assert test="not(cac:BuyerContact)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:BuyerContact</assert>
		<assert test="not(cac:Party/cbc:MarkCareIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator</assert>
		<assert test="not(cac:Party/cbc:MarkAttentionIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator</assert>
		<assert test="not(cac:Party/cbc:WebsiteURI)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI</assert>
		<assert test="not(cac:Party/cbc:LogoReferenceID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID</assert>
		<assert test="not(cac:Party/cac:Language)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Language</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:AddressTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:AddressFormatCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:Floor)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:Room)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:BlockName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:BuildingName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:InhouseMail)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:MarkAttention)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:MarkCare)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:PlotIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:Region)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:District)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cbc:TimezoneOffset)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cac:AddressLine)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cac:Country/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name</assert>
		<assert test="not(cac:Party/cac:PostalAddress/cac:LocationCoordinate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate</assert>
		<assert test="not(cac:Party/cac:PhysicalLocation)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode</assert>
		<assert test="not(cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate</assert>
		<assert test="not(cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme</assert>
		<assert test="not(cac:Party/cac:Contact/cbc:Note)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note</assert>
		<assert test="not(cac:Party/cac:Contact/cac:OtherCommunication)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication</assert>
		<assert test="not(cac:Party/cac:Person/cbc:Title)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:Title</assert>
		<assert test="not(cac:Party/cac:Person/cbc:NameSuffix)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:NameSuffix</assert>
		<assert test="not(cac:Party/cac:Person/cbc:OrganizationDepartment)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment</assert>
		<assert test="not(cac:Party/cac:AgentParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AccountingCustomerParty/cac:Party/cac:AgentParty</assert>
	</rule>
	<rule context="cac:PayeeParty">
		<assert test="not(cbc:MarkCareIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cbc:MarkCareIndicator</assert>
		<assert test="not(cbc:MarkAttentionIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cbc:MarkAttentionIndicator</assert>
		<assert test="not(cbc:WebsiteURI)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cbc:WebsiteURI</assert>
		<assert test="not(cbc:LogoReferenceID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cbc:LogoReferenceID</assert>
		<assert test="not(cac:Language)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:Language</assert>
		<assert test="not(cac:PostalAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:PostalAddress</assert>
		<assert test="not(cac:PhysicalLocation)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:PhysicalLocation</assert>
		<assert test="not(cac:PartyTaxScheme)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:PartyTaxScheme</assert>
		<assert test="not(cac:PartyLegalEntity/cbc:RegistrationName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName</assert>
		<assert test="not(cac:PartyLegalEntity/cac:RegistrationAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress</assert>
		<assert test="not(cac:PartyLegalEntity/cac:CorporateRegistrationScheme)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme</assert>
		<assert test="not(cac:Contact)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:Contact</assert>
		<assert test="not(cac:Person)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:Person</assert>
		<assert test="not(cac:AgentParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PayeeParty/cac:AgentParty</assert>
	</rule>
	<rule context="cac:Delivery">
		<assert test="not(cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cbc:ID</assert>
		<assert test="not(cbc:MinimumQuantity)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cbc:MinimumQuantity</assert>
		<assert test="not(cbc:MaximumQuantity)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cbc:MaximumQuantity</assert>
		<assert test="not(cbc:ActualDeliveryTime)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cbc:ActualDeliveryTime</assert>
		<assert test="not(cbc:LatestDeliveryDate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cbc:LatestDeliveryDate</assert>
		<assert test="not(cbc:LatestDeliveryTime)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cbc:LatestDeliveryTime</assert>
		<assert test="not(cbc:TrackingID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cbc:TrackingID</assert>
		<assert test="not(cac:DeliveryAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryAddress</assert>
		<assert test="not(cac:DeliveryLocation/cbc:Description)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cbc:Description</assert>
		<assert test="not(cac:DeliveryLocation/cbc:Conditions)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cbc:Conditions</assert>
		<assert test="not(cac:DeliveryLocation/cbc:CountrySubentity)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity</assert>
		<assert test="not(cac:DeliveryLocation/cbc:CountrySubentityCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode</assert>
		<assert test="not(cac:DeliveryLocation/cac:ValidityPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:Floor)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:Room)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:BlockName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:BuildingName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:InhouseMail)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:MarkAttention)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:MarkCare)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:PlotIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:Region)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:District)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cac:AddressLine)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name</assert>
		<assert test="not(cac:DeliveryLocation/cac:Address/cac:LocationCoordinate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate</assert>
		<assert test="not(cac:DeliveryLocation/cac:RequestedDeliveryPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:RequestedDeliveryPeriod</assert>
		<assert test="not(cac:DeliveryLocation/cac:PromisedDeliveryPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:PromisedDeliveryPeriod</assert>
		<assert test="not(cac:DeliveryLocation/cac:EstimatedDeliveryPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:EstimatedDeliveryPeriod</assert>
		<assert test="not(cac:DeliveryLocation/cac:DeliveryParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:DeliveryParty</assert>
		<assert test="not(cac:DeliveryLocation/cac:Despatch)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:Delivery/cac:DeliveryLocation/cac:Despatch</assert>
	</rule>
	<rule context="cac:PaymentMeans">
		<assert test="not(cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cbc:ID</assert>
		<assert test="not(cbc:InstructionID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cbc:InstructionID</assert>
		<assert test="not(cbc:InstructionNote)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cbc:InstructionNote</assert>
		<assert test="not(cac:PayerFinancialAccount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cac:PayerFinancialAccount</assert>
		<assert test="not(cac:CreditAccount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cac:CreditAccount</assert>
		<assert test="not(cac:PayeeFinancialAccount/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:Name</assert>
		<assert test="not(cac:PayeeFinancialAccount/cbc:AccountTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountTypeCode</assert>
		<assert test="not(cac:PayeeFinancialAccount/cbc:CurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:CurrencyCode</assert>
		<assert test="not(cac:PayeeFinancialAccount/cac:Country)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentMeans/cac:PayeeFinancialAccount/cac:Country</assert>
	</rule>
	<rule context="cac:PaymentTerms">
		<assert test="not(cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cbc:ID</assert>
		<assert test="not(cbc:PaymentMeansID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cbc:PaymentMeansID</assert>
		<assert test="not(cbc:PrepaidPaymentReferenceID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cbc:PrepaidPaymentReferenceID</assert>
		<assert test="not(cbc:ReferenceEventCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cbc:ReferenceEventCode</assert>
		<assert test="not(cbc:SettlementDiscountPercent)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cbc:SettlementDiscountPercent</assert>
		<assert test="not(cbc:PenaltySurchargePercent)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cbc:PenaltySurchargePercent</assert>
		<assert test="not(cbc:Amount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cbc:Amount</assert>
		<assert test="not(cac:SettlementPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cac:SettlementPeriod</assert>
		<assert test="not(cac:PenaltyPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:PaymentTerms/cac:PenaltyPeriod</assert>
	</rule>
	<rule context="cac:AllowanceCharge">
		<assert test="not(cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cbc:ID</assert>
		<assert test="not(cbc:PrepaidIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cbc:PrepaidIndicator</assert>
		<assert test="not(cbc:SequenceNumeric)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cbc:SequenceNumeric</assert>
		<assert test="not(cbc:AccountingCostCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cbc:AccountingCostCode</assert>
		<assert test="not(cbc:AccountingCost)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cbc:AccountingCost</assert>
		<assert test="not(cac:TaxCategory/cbc:Name) or not(cac:TaxCategory/cbc:Percent) or not(cac:TaxCategory/cbc:BaseUnitMeasure) or not(cac:TaxCategory/cbc:PerUnitAmount) or not(cac:TaxCategory/cbc:TaxExemptionReasonCode) or not(cac:TaxCategory/cbc:TaxExemptionReason) or not(cac:TaxCategory/cbc:TierRange) or not(cac:TaxCategory/cbc:TierRatePercent) or not(cac:TaxCategory/cac:TaxScheme/cbc:Name) or not(cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode) or not(cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode) or not(cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">[SI-UBL-INV-R281]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:TaxTotal/cbc:RoundingAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount</assert>
		<assert test="not(cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator</assert>
		<assert test="not(cac:TaxTotal/cac:TaxSubtotal)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal</assert>
		<assert test="not(cac:PaymentMeans)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:AllowanceCharge/cac:PaymentMeans</assert>
	</rule>
	<rule context="cac:TaxTotal">
		<assert test="not(cbc:RoundingAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cbc:RoundingAmount</assert>
		<assert test="not(cbc:TaxEvidenceIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cbc:TaxEvidenceIndicator</assert>
		<assert test="not(cac:TaxSubtotal/cbc:CalculationSequenceNumeric)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric</assert>
		<assert test="not(cac:TaxSubtotal/cbc:BaseUnitMeasure)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure</assert>
		<assert test="not(cac:TaxSubtotal/cbc:PerUnitAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount</assert>
		<assert test="not(cac:TaxSubtotal/cbc:TierRange)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange</assert>
		<assert test="not(cac:TaxSubtotal/cbc:TierRatePercent)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode</assert>
		<assert test="not(cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress</assert>
	</rule>
	<rule context="cac:InvoiceLine">
		<assert test="not(cbc:UUID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cbc:UUID</assert>
		<assert test="not(cbc:TaxPointDate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cbc:TaxPointDate</assert>
		<assert test="not(cbc:AccountingCostCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cbc:AccountingCostCode</assert>
		<assert test="not(cbc:FreeOfChargeIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cbc:FreeOfChargeIndicator</assert>
		<assert test="not(cac:OrderLineReference/cbc:SalesOrderLineID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:OrderLineReference/cbc:SalesOrderLineID</assert>
		<assert test="not(cac:DespatchLineReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:DespatchLineReference</assert>
		<assert test="not(cac:ReceiptLineReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:ReceiptLineReference</assert>
		<assert test="not(cac:BillingReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:BillingReference</assert>
		<assert test="not(cac:DocumentReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:DocumentReference</assert>
		<assert test="not(cac:PricingReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:PricingReference</assert>
		<assert test="not(cac:OriginatorParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:OriginatorParty</assert>
		<assert test="not(cac:PaymentTerms)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:PaymentTerms</assert>
		<assert test="not(cac:AllowanceCharge/cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:ID</assert>
		<assert test="not(cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode</assert>
		<assert test="not(cac:AllowanceCharge/cbc:MultiplierFactorNumeric)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric</assert>
		<assert test="not(cac:AllowanceCharge/cbc:PrepaidIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:PrepaidIndicator</assert>
		<assert test="not(cac:AllowanceCharge/cbc:SequenceNumeric)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:SequenceNumeric</assert>
		<assert test="not(cac:AllowanceCharge/cbc:BaseAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:BaseAmount</assert>
		<assert test="not(cac:AllowanceCharge/cbc:AccountingCostCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:AccountingCostCode</assert>
		<assert test="not(cac:AllowanceCharge/cbc:AccountingCost)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cbc:AccountingCost</assert>
		<assert test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:Name) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:Percent) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange) or not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode) or not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress)" flag="warning">[SI-UBL-INV-R326]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount</assert>
		<assert test="not(cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator</assert>
		<assert test="not(cac:AllowanceCharge/cac:TaxTotal/cbc:TaxSubtotal)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxSubtotal</assert>
		<assert test="not(cac:AllowanceCharge/cac:PaymentMeans)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:AllowanceCharge/cac:PaymentMeans</assert>
		<assert test="not(cac:TaxTotal/cbc:RoundingAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:TaxTotal/cbc:RoundingAmount</assert>
		<assert test="not(cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:TaxTotal/cbc:TaxEvidenceIndicator</assert>
		<assert test="not(cac:Item/cbc:PackQuantity)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:PackQuantity</assert>
		<assert test="not(cac:Item/cbc:PackSizeNumeric)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:PackSizeNumeric</assert>
		<assert test="not(cac:Item/cbc:CatalogueIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:CatalogueIndicator</assert>
		<assert test="not(cac:Item/cbc:HazardousRiskIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:HazardousRiskIndicator</assert>
		<assert test="not(cac:Item/cbc:AdditionalInformation)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:AdditionalInformation</assert>
		<assert test="not(cac:Item/cbc:Keyword)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:Keyword</assert>
		<assert test="not(cac:Item/cbc:BrandName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:BrandName</assert>
		<assert test="not(cac:Item/cbc:ModelName)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cbc:ModelName</assert>
		<assert test="not(cac:Item/cac:SellersItemIdentification/cbc:ExtendedID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID</assert>
		<assert test="not(cac:Item/cac:SellersItemIdentification/cbc:PhysycalAttribute)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:PhysycalAttribute</assert>
		<assert test="not(cac:Item/cac:SellersItemIdentification/cbc:MeasurementDimension)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:MeasurementDimension</assert>
		<assert test="not(cac:Item/cac:SellersItemIdentification/cbc:IssuerParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:SellersItemIdentification/cbc:IssuerParty</assert>
		<assert test="not(cac:Item/cac:StandardItemIdentification/cbc:ExtendedID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID</assert>
		<assert test="not(cac:Item/cac:StandardItemIdentification/cbc:PhysycalAttribute)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:PhysycalAttribute</assert>
		<assert test="not(cac:Item/cac:StandardItemIdentification/cbc:MeasurementDimension)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:MeasurementDimension</assert>
		<assert test="not(cac:Item/cac:StandardItemIdentification/cbc:IssuerParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:IssuerParty</assert>
		<assert test="not(cac:Item/cac:BuyersItemIdentification/cbc:ExtendedID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:ExtendedID</assert>
		<assert test="not(cac:Item/cac:BuyersItemIdentification/cbc:PhysycalAttribute)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:PhysycalAttribute</assert>
		<assert test="not(cac:Item/cac:BuyersItemIdentification/cbc:MeasurementDimension)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:MeasurementDimension</assert>
		<assert test="not(cac:Item/cac:BuyersItemIdentification/cbc:IssuerParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:BuyersItemIdentification/cbc:IssuerParty</assert>
		<assert test="not(cac:Item/cac:CommodityClassification/cbc:NatureCargo)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:NatureCargo</assert>
		<assert test="not(cac:Item/cac:CommodityClassification/cbc:CargoTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode</assert>
		<assert test="not(cac:Item/cac:ManufacturersItemIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:ManufacturersItemIdentification</assert>
		<assert test="not(cac:Item/cac:CatalogueItemIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:CatalogueItemIdentification</assert>
		<assert test="not(cac:Item/cac:AdditionalItemIdentification)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:AdditionalItemIdentification</assert>
		<assert test="not(cac:Item/cac:CatalogueDocumentReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:CatalogueDocumentReference</assert>
		<assert test="not(cac:Item/cac:ItemSpecificationDocumentReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:ItemSpecificationDocumentReference</assert>
		<assert test="not(cac:Item/cac:TransactionConditions)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TransactionConditions</assert>
		<assert test="not(cac:Item/cac:HazardousItem)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:HazardousItem</assert>
		<assert test="not(cac:Item/cac:ManufacturerParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:ManufacturerParty</assert>
		<assert test="not(cac:Item/cac:InformationContentProviderParty)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:InformationContentProviderParty</assert>
		<assert test="not(cac:Item/cac:OriginAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:OriginAddress</assert>
		<assert test="not(cac:Item/cac:ItemInstance)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:ItemInstance</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:Name</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cbc:BaseUnitMeasure)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:BaseUnitMeasure</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cbcPerUnitAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cbcPerUnitAmount</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cbc:TaxExemptionReasonCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TaxExemptionReasonCode</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cbc:TaxExemptionReason)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TaxExemptionReason</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cbc:TierRange)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TierRange</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cbc:TierRatePercent)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cbc:TierRatePercent</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:Name)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:Name</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionAddress)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionAddress</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cac:AdditionalProperty/cac:UsabilityPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:AdditionalProperty/cac:UsabilityPeriod</assert>
		<assert test="not(cac:Item/cac:TaxCategory/cac:AdditionalProperty/cac:ItemPropertyGroup)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Item/cac:TaxCategory/cac:AdditionalProperty/cac:ItemPropertyGroup</assert>
		<assert test="not(cac:Price/cbc:PriceChangeReason)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cbc:PriceChangeReason</assert>
		<assert test="not(cac:Price/cbc:PriceTypeCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cbc:PriceTypeCode</assert>
		<assert test="not(cac:Price/cbc:PriceType)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cbc:PriceType</assert>
		<assert test="not(cac:Price/cbc:OrderableUnitFactorRate)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cbc:OrderableUnitFactorRate</assert>
		<assert test="not(cac:Price/cac:ValidityPeriod)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:ValidityPeriod</assert>
		<assert test="not(cac:Price/cac:PriceList)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:PriceList</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cbc:ID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:ID</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cbc:AccountingCost)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCost</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:Name) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode) or not(cac:Price/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress) " flag="warning">[SI-UBL-INV-R396]-A conformant SI-UBL invoice core data model SHOULD not have data elements not in the core.</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxSubtotal)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxSubtotal</assert>
		<assert test="not(cac:Price/cac:AllowanceCharge/cac:PaymentMeans)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cac:PaymentMeans</assert>
		<assert test="not(cac:OrderLineReference/cbc:UUID)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:OrderLineReference/cbc:UUID</assert>
		<assert test="not(cac:OrderLineReference/cbc:LineStatusCode)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:OrderLineReference/cbc:LineStatusCode</assert>
		<assert test="not(cac:OrderLineReference/cac:OrderReference)" flag="warning">A Simplerinvoicing invoice SHOULD not contain the element cac:InvoiceLine/cac:OrderLineReference/cbc:OrderReference</assert>
	</rule>

	<rule context="*">
		<assert test="* or normalize-space(text()) != ''" flag="warning">[SI-V11-INV-R300]-An invoice SHOULD not contain empty elements.</assert>
	</rule>
</pattern>
