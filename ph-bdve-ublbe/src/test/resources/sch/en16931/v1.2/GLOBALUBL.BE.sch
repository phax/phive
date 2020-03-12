<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
        xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
        xmlns:cn="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
        xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
        queryBinding="xslt2">

	<title>EN16931  model bound to ubl</title>

	<ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="qdt" uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2"/>
	<ns prefix="udt" uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2"/>
	<ns prefix="cn"  uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
	<ns prefix="u"	 uri="utils" />
	<ns prefix="xs"  uri="http://www.w3.org/2001/XMLSchema"/>
	<phase id="EN16931model_phase">
		<active pattern="ubl-model"/>
	</phase>
	<phase id="codelist_phase">
		<active pattern="Codesmodel"/>
	</phase>

	<!--Start pattern based on abstract model-->
  <pattern id="ubl-model">
    <rule context="cac:AdditionalDocumentReference">
      <assert id="BR-52" flag="fatal" test="(cbc:ID) != ''">[BR-52]-Each Additional supporting document (BG-24) shall contain a Supporting document reference (BT-122).    </assert>
    </rule>
    <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount">
      <assert id="BR-CO-25" flag="fatal" test="((. > 0) and (exists(//cbc:DueDate) or exists(//cac:PaymentTerms/cbc:Note))) or (. &lt;= 0)">[BR-CO-25]-In case the Amount due for payment (BT-115) is positive, either the Payment due date (BT-9) or the Payment terms (BT-20) shall be present.</assert>
    </rule>
    <rule context="cac:AccountingCustomerParty/cac:Party/cbc:EndpointID">
      <assert id="BR-63" flag="fatal" test="exists(@schemeID)">[BR-63]-The Buyer electronic address (BT-49) shall have a Scheme identifier.    </assert>
    </rule>
    <rule context="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress">
      <assert id="BR-11" flag="fatal" test="(cac:Country/cbc:IdentificationCode) != ''">[BR-11]-The Buyer postal address shall contain a Buyer country code (BT-55).</assert>
    </rule>
    <rule context="cac:PaymentMeans/cac:CardAccount">
      <assert id="BR-51" flag="fatal" test="string-length(cbc:PrimaryAccountNumberID)>=4 and string-length(cbc:PrimaryAccountNumberID)&lt;=6">[BR-51]-The last 4 to 6 digits of the Payment card primary account number (BT-87) shall be present if Payment card information (BG-18) is provided in the Invoice.</assert>
    </rule>
    <rule context="cac:Delivery/cac:DeliveryLocation/cac:Address">
      <assert id="BR-57" flag="fatal" test="exists(cac:Country/cbc:IdentificationCode)">[BR-57]-Each Deliver to address (BG-15) shall contain a Deliver to country code (BT-80).</assert>
    </rule>
    <rule context="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = false()]">
      <assert id="BR-31" flag="fatal" test="exists(cbc:Amount)">[BR-31]-Each Document level allowance (BG-20) shall have a Document level allowance amount (BT-92).</assert>
      <assert id="BR-32" flag="fatal" test="exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID)">[BR-32]-Each Document level allowance (BG-20) shall have a Document level allowance VAT category code (BT-95).</assert>
      <assert id="BR-33" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-33]-Each Document level allowance (BG-20) shall have a Document level allowance reason (BT-97) or a Document level allowance reason code (BT-98).</assert>
      <assert id="BR-CO-05" flag="fatal" test="true()">[BR-CO-05]-Document level allowance reason code (BT-98) and Document level allowance reason (BT-97) shall indicate the same type of allowance.</assert>
      <assert id="BR-CO-21" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-CO-21]-Each Document level allowance (BG-20) shall contain a Document level allowance reason (BT-97) or a Document level allowance reason code (BT-98), or both.</assert>
      <assert id="BR-DEC-01" flag="fatal" test="string-length(substring-after(cbc:Amount,'.'))&lt;=2">[BR-DEC-01]-The allowed maximum number of decimals for the Document level allowance amount (BT-92) is 2.</assert>
      <assert id="BR-DEC-02" flag="fatal" test="string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2">[BR-DEC-02]-The allowed maximum number of decimals for the Document level allowance base amount (BT-93) is 2.    </assert>
    </rule>
    <rule context="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = true()]">
      <assert id="BR-36" flag="fatal" test="exists(cbc:Amount)">[BR-36]-Each Document level charge (BG-21) shall have a Document level charge amount (BT-99).</assert>
      <assert id="BR-37" flag="fatal" test="exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID)">[BR-37]-Each Document level charge (BG-21) shall have a Document level charge VAT category code (BT-102).</assert>
      <assert id="BR-38" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-38]-Each Document level charge (BG-21) shall have a Document level charge reason (BT-104) or a Document level charge reason code (BT-105).    </assert>
      <assert id="BR-CO-06" flag="fatal" test="true()">[BR-CO-06]-Document level charge reason code (BT-105) and Document level charge reason (BT-104) shall indicate the same type of charge.</assert>
      <assert id="BR-CO-22" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-CO-22]-Each Document level charge (BG-21) shall contain a Document level charge reason (BT-104) or a Document level charge reason code (BT-105), or both.</assert>
      <assert id="BR-DEC-05" flag="fatal" test="string-length(substring-after(cbc:Amount,'.'))&lt;=2">[BR-DEC-05]-The allowed maximum number of decimals for the Document level charge amount (BT-99) is 2.</assert>
      <assert id="BR-DEC-06" flag="fatal" test="string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2">[BR-DEC-06]-The allowed maximum number of decimals for the Document level charge base amount (BT-100) is 2.    </assert>
    </rule>
    <rule context="cac:LegalMonetaryTotal">
      <assert id="BR-12" flag="fatal" test="exists(cbc:LineExtensionAmount)">[BR-12]-An Invoice shall have the Sum of Invoice line net amount (BT-106).</assert>
      <assert id="BR-13" flag="fatal" test="exists(cbc:TaxExclusiveAmount)">[BR-13]-An Invoice shall have the Invoice total amount without VAT (BT-109).</assert>
      <assert id="BR-14" flag="fatal" test="exists(cbc:TaxInclusiveAmount)">[BR-14]-An Invoice shall have the Invoice total amount with VAT (BT-112).</assert>
      <assert id="BR-15" flag="fatal" test="exists(cbc:PayableAmount)">[BR-15]-An Invoice shall have the Amount due for payment (BT-115).</assert>
      <assert id="BR-CO-10" flag="warning" test="(xs:decimal(cbc:LineExtensionAmount) = (round(sum(//(cac:InvoiceLine|cac:CreditNoteLine)/xs:decimal(cbc:LineExtensionAmount)) * 10 * 10) div 100))">[BR-CO-10]-Sum of Invoice line net amount (BT-106) = Σ Invoice line net amount (BT-131).</assert>
      <assert id="BR-CO-11" flag="fatal" test="xs:decimal(cbc:AllowanceTotalAmount) = (round(sum(../cac:AllowanceCharge[cbc:ChargeIndicator=false()]/xs:decimal(cbc:Amount)) * 10 * 10) div 100) or  (not(cbc:AllowanceTotalAmount) and not(../cac:AllowanceCharge[cbc:ChargeIndicator=false()]))">[BR-CO-11]-Sum of allowances on document level (BT-107) = Σ Document level allowance amount (BT-92).</assert>
      <assert id="BR-CO-12" flag="fatal" test="xs:decimal(cbc:ChargeTotalAmount) = (round(sum(../cac:AllowanceCharge[cbc:ChargeIndicator=true()]/xs:decimal(cbc:Amount)) * 10 * 10) div 100) or (not(cbc:ChargeTotalAmount) and not(../cac:AllowanceCharge[cbc:ChargeIndicator=true()]))">[BR-CO-12]-Sum of charges on document level (BT-108) = Σ Document level charge amount (BT-99).</assert>
      <assert id="BR-CO-13" flag="fatal" test="((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 ))  or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = xs:decimal(cbc:LineExtensionAmount)))">[BR-CO-13]-Invoice total amount without VAT (BT-109) = Σ Invoice line net amount (BT-131) - Sum of allowances on document level (BT-107) + Sum of charges on document level (BT-108).</assert>
      <assert id="BR-CO-16" flag="fatal" test="(xs:decimal(cbc:PrepaidAmount) and not(xs:decimal(cbc:PayableRoundingAmount)) and (xs:decimal(cbc:PayableAmount) = (round((xs:decimal(cbc:TaxInclusiveAmount) - xs:decimal(cbc:PrepaidAmount)) * 10 * 10) div 100))) or (not(xs:decimal(cbc:PrepaidAmount)) and not(xs:decimal(cbc:PayableRoundingAmount)) and xs:decimal(cbc:PayableAmount) = xs:decimal(cbc:TaxInclusiveAmount)) or (xs:decimal(cbc:PrepaidAmount) and xs:decimal(cbc:PayableRoundingAmount) and ((round((xs:decimal(cbc:PayableAmount) - xs:decimal(cbc:PayableRoundingAmount)) * 10 * 10) div 100) = (round((xs:decimal(cbc:TaxInclusiveAmount) - xs:decimal(cbc:PrepaidAmount)) * 10 * 10) div 100))) or (not(xs:decimal(cbc:PrepaidAmount)) and xs:decimal(cbc:PayableRoundingAmount) and ((round((xs:decimal(cbc:PayableAmount) - xs:decimal(cbc:PayableRoundingAmount)) * 10 * 10) div 100) = xs:decimal(cbc:TaxInclusiveAmount)))">[BR-CO-16]-Amount due for payment (BT-115) = Invoice total amount with VAT (BT-112) -Paid amount (BT-113) +Rounding amount (BT-114).</assert>
      <assert id="BR-DEC-09" flag="fatal" test="string-length(substring-after(cbc:LineExtensionAmount,'.'))&lt;=2">[BR-DEC-09]-The allowed maximum number of decimals for the Sum of Invoice line net amount (BT-106) is 2.</assert>
      <assert id="BR-DEC-10" flag="fatal" test="string-length(substring-after(cbc:AllowanceTotalAmount,'.'))&lt;=2">[BR-DEC-10]-The allowed maximum number of decimals for the Sum of allowanced on document level (BT-107) is 2.</assert>
      <assert id="BR-DEC-11" flag="fatal" test="string-length(substring-after(cbc:ChargeTotalAmount,'.'))&lt;=2">[BR-DEC-11]-The allowed maximum number of decimals for the Sum of charges on document level (BT-108) is 2.</assert>
      <assert id="BR-DEC-12" flag="fatal" test="string-length(substring-after(cbc:TaxExclusiveAmount,'.'))&lt;=2">[BR-DEC-12]-The allowed maximum number of decimals for the Invoice total amount without VAT (BT-109) is 2.    </assert>
      <assert id="BR-DEC-14" flag="fatal" test="string-length(substring-after(cbc:TaxInclusiveAmount,'.'))&lt;=2">[BR-DEC-14]-The allowed maximum number of decimals for the Invoice total amount with VAT (BT-112) is 2.</assert>
      <assert id="BR-DEC-16" flag="fatal" test="string-length(substring-after(cbc:PrepaidAmount,'.'))&lt;=2">[BR-DEC-16]-The allowed maximum number of decimals for the Paid amount (BT-113) is 2.</assert>
      <assert id="BR-DEC-17" flag="fatal" test="string-length(substring-after(cbc:PayableRoundingAmount,'.'))&lt;=2">[BR-DEC-17]-The allowed maximum number of decimals for the Rounding amount (BT-114) is 2.</assert>
      <assert id="BR-DEC-18" flag="fatal" test="string-length(substring-after(cbc:PayableAmount,'.'))&lt;=2">[BR-DEC-18]-The allowed maximum number of decimals for the Amount due for payment (BT-115) is 2.  </assert>
    </rule>
    <rule context="/ubl:Invoice | /cn:CreditNote">
      <assert id="BR-01" flag="fatal" test="(cbc:CustomizationID) != ''">[BR-01]-An Invoice shall have a Specification identifier (BT-24).   </assert>
      <assert id="BR-02" flag="fatal" test="(cbc:ID) !=''">[BR-02]-An Invoice shall have an Invoice number (BT-1).</assert>
      <assert id="BR-03" flag="fatal" test="(cbc:IssueDate) !=''">[BR-03]-An Invoice shall have an Invoice issue date (BT-2).</assert>
      <assert id="BR-04" flag="fatal" test="(cbc:InvoiceTypeCode) !='' or (cbc:CreditNoteTypeCode) !=''">[BR-04]-An Invoice shall have an Invoice type code (BT-3).</assert>
      <assert id="BR-05" flag="fatal" test="(cbc:DocumentCurrencyCode) !=''">[BR-05]-An Invoice shall have an Invoice currency code (BT-5).</assert>
      <assert id="BR-06" flag="fatal" test="(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) !=''">[BR-06]-An Invoice shall contain the Seller name (BT-27).</assert>
      <assert id="BR-07" flag="fatal" test="(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) !=''">[BR-07]-An Invoice shall contain the Buyer name (BT-44).</assert>
      <assert id="BR-08" flag="fatal" test="exists(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress)">[BR-08]-An Invoice shall contain the Seller postal address. </assert>
      <assert id="BR-10" flag="fatal" test="exists(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress)">[BR-10]-An Invoice shall contain the Buyer postal address (BG-8).</assert>
      <assert id="BR-16" flag="fatal" test="exists(cac:InvoiceLine) or exists(cac:CreditNoteLine)">[BR-16]-An Invoice shall have at least one Invoice line (BG-25)</assert>
      <assert id="BR-53" flag="fatal" test="every $taxcurrency in cbc:TaxCurrencyCode satisfies exists(//cac:TaxTotal/cbc:TaxAmount[@currencyID=$taxcurrency])">[BR-53]-If the VAT accounting currency code (BT-6) is present, then the Invoice total VAT amount in accounting currency (BT-111) shall be provided.</assert>
      <assert id="BR-AE-01" flag="fatal" test="((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'AE']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'AE'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'AE']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'AE']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'AE']))">[BR-AE-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Reverse charge" shall contain in the VAT Breakdown (BG-23) exactly one VAT category code (BT-118) equal with "VAT reverse charge".</assert>
      <assert id="BR-AE-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID)) and (exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID))) or not(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-AE-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Reverse charge" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) and/or the Buyer legal registration identifier (BT-47).</assert>
      <assert id="BR-AE-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID)) and (exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-AE-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Reverse charge" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) and/or the Buyer legal registration identifier (BT-47).</assert>
      <assert id="BR-AE-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID)) and (exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-AE-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Reverse charge" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) and/or the Buyer legal registration identifier (BT-47).</assert>
      <assert id="BR-CO-03" flag="fatal" test="(exists(cbc:TaxPointDate) and not(cac:InvoicePeriod/cbc:DescriptionCode)) or (not(cbc:TaxPointDate) and exists(cac:InvoicePeriod/cbc:DescriptionCode)) or (not(cbc:TaxPointDate) and not(cac:InvoicePeriod/cbc:DescriptionCode))">[BR-CO-03]-Value added tax point date (BT-7) and Value added tax point date code (BT-8) are mutually exclusive.</assert>
      <assert id="BR-CO-15" flag="fatal" test="every $Currency in cbc:DocumentCurrencyCode satisfies (cac:LegalMonetaryTotal/xs:decimal(cbc:TaxInclusiveAmount) = round( (cac:LegalMonetaryTotal/xs:decimal(cbc:TaxExclusiveAmount) + cac:TaxTotal/xs:decimal(cbc:TaxAmount[@currencyID=$Currency])) * 10 * 10) div 100)">[BR-CO-15]-Invoice total amount with VAT (BT-112) = Invoice total amount without VAT (BT-109) + Invoice total VAT amount (BT-110).</assert>
      <assert id="BR-CO-18" flag="fatal" test="exists(cac:TaxTotal/cac:TaxSubtotal)">[BR-CO-18]-An Invoice shall at least have one VAT breakdown group (BG-23).</assert>
      <assert id="BR-DEC-13" flag="fatal" test="(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode] and (string-length(substring-after(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode],'.'))&lt;=2)) or (not(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode]))">[BR-DEC-13]-The allowed maximum number of decimals for the Invoice total VAT amount (BT-110) is 2.</assert>
      <assert id="BR-DEC-15" flag="fatal" test="(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode] and (string-length(substring-after(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode],'.'))&lt;=2)) or (not(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode]))">[BR-DEC-15]-The allowed maximum number of decimals for the Invoice total VAT amount in accounting currency (BT-111) is 2.</assert>
      <assert id="BR-E-01" flag="fatal" test="((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'E']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'E'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'E']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'E']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'E']))">[BR-E-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Exempt from VAT" shall contain exactly one VAT breakdown (BG-23) with the VAT category code (BT-118) equal to "Exempt from VAT".</assert>
      <assert id="BR-E-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-E-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Exempt from VAT" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-E-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-E-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Exempt from VAT" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-E-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-E-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Exempt from VAT" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-G-01" flag="fatal" test="((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'G']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'G'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'G']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'G']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'G']))">[BR-G-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Export outside the EU" shall contain in the VAT breakdown (BG-23) exactly one VAT category code (BT-118) equal with "Export outside the EU".</assert>
      <assert id="BR-G-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-G-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Export outside the EU" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-G-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='G']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-G-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Export outside the EU" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-G-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='G']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-G-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Export outside the EU" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-IC-01" flag="warning" test="((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K']))">[BR-IC-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Intra-community supply" shall contain in the VAT breakdown (BG-23) exactly one VAT category code (BT-118) equal with "Intra-community supply".</assert>
      <assert id="BR-IC-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID)) and (exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'])">[BR-IC-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Intra-community supply" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48).</assert>
      <assert id="BR-IC-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID)) and (exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IC-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Intra-community supply" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48).</assert>
      <assert id="BR-IC-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID)) and (exists(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IC-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Intra-community supply" shall contain the Seller VAT Identifier (BT-31) or the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48).</assert>
      <assert id="BR-IC-11" flag="fatal" test="(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K'])  and (string-length(cac:Delivery/cbc:ActualDeliveryDate) > 1 or (cac:InvoicePeriod/*))) or (not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K']))">[BR-IC-11]-In an Invoice with a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" the Actual delivery date (BT-72) or the Invoicing period (BG-14) shall not be blank.</assert>
      <assert id="BR-IC-12" flag="fatal" test="(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K']) and (string-length(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode) >1)) or (not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'K']))">[BR-IC-12]-In an Invoice with a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" the Deliver to country code (BT-80) shall not be blank.</assert>
      <assert id="BR-IG-01" flag="fatal" test="((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'])) > 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cbc:ID = 'L']) > 0) or ((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'])) = 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) = 0)">[BR-IG-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "IGIC" shall contain in the VAT breakdown (BG-23) at least one VAT category code (BT-118) equal with "IGIC".</assert>
      <assert id="BR-IG-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IG-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IGIC" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-IG-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IG-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IGIC" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-IG-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[cbc:ID='L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IG-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IGIC" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-IP-01" flag="fatal" test="((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'])) > 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cbc:ID = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) > 0) or ((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'])) = 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) = 0)">[BR-IP-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "IPSI" shall contain in the VAT breakdown (BG-23) at least one VAT category code (BT-118) equal with "IPSI".</assert>
      <assert id="BR-IP-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IP-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IPSI" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-IP-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IP-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IPSI" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-IP-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-IP-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IPSI" shall contain the Seller VAT Identifier (BT-31), the Seller Tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-O-01" flag="fatal" test="((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']))">[BR-O-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Not subject to VAT" shall contain exactly one VAT breakdown group (BG-23) with the VAT category code (BT-118) equal to "Not subject to VAT".</assert>
      
	  <assert id="BR-O-03" flag="fatal" test="(exists((/ubl:Invoice|/cn:CreditNote)/cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (not(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) and not(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) and not(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists((/ubl:Invoice|/cn:CreditNote)/cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-O-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Not subject to VAT" shall not contain the Seller VAT identifier (BT-31), the Seller tax representative VAT identifier (BT-63) or the Buyer VAT identifier (BT-48).</assert>
      <assert id="BR-O-04" flag="fatal" test="(exists((/ubl:Invoice|/cn:CreditNote)/cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (not(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) and not(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID) and not(//cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists((/ubl:Invoice|/cn:CreditNote)/cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-O-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Not subject to VAT" shall not contain the Seller VAT identifier (BT-31), the Seller tax representative VAT identifier (BT-63) or the Buyer VAT identifier (BT-48).</assert>
      <assert id="BR-O-11" flag="fatal" test="(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']) and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O'])">[BR-O-11]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain other VAT breakdown groups (BG-23).    </assert>
      <assert id="BR-O-12" flag="fatal" test="(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O'])">[BR-O-12]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is not "Not subject to VAT".</assert>
      <assert id="BR-O-13" flag="fatal" test="(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O'])">[BR-O-13]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain Document level allowances (BG-20) where Document level allowance VAT category code (BT-95) is not "Not subject to VAT".</assert>
      <assert id="BR-O-14" flag="fatal" test="(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'O'])">[BR-O-14]-An Invoice that contains a VAT breakdown group (BG-23) with a VAT category code (BT-118) "Not subject to VAT" shall not contain Document level charges (BG-21) where Document level charge VAT category code (BT-102) is not "Not subject to VAT".</assert>
      <assert id="BR-S-01" flag="fatal" test="((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'])) > 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) > 0) or ((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'])) = 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) = 0)">[BR-S-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Standard rated" shall contain in the VAT breakdown (BG-23) at least one VAT category code (BT-118) equal with "Standard rated".</assert>
      <assert id="BR-S-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S']))">[BR-S-02]-An Invoice that contains an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Standard rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-S-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-S-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Standard rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-S-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-S-04]-An Invoice that contains a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Standard rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-Z-01" flag="fatal" test="((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'Z']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'Z'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'Z']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'Z']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID[normalize-space(.) = 'Z']))">[BR-Z-01]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the VAT category code (BT-151, BT-95 or BT-102) is "Zero rated" shall contain in the VAT breakdown (BG-23) exactly one VAT category code (BT-118) equal with "Zero rated".    </assert>
      <assert id="BR-Z-02" flag="fatal" test="(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-Z-02]-An Invoice that contains an Invoice line where the Invoiced item VAT category code (BT-151) is "Zero rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-Z-03" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-Z-03]-An Invoice that contains a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Zero rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
      <assert id="BR-Z-04" flag="fatal" test="(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']) and (exists(//cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID)or exists(//cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID))) or not(exists(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']))">[BR-Z-04]-An Invoice that contains a Document level charge where the Document level charge VAT category code (BT-102) is "Zero rated" shall contain the Seller VAT Identifier (BT-31), the Seller tax registration identifier (BT-32) and/or the Seller tax representative VAT identifier (BT-63).</assert>
    </rule>
    <rule context="cac:InvoiceLine | cac:CreditNoteLine">
      <assert id="BR-21" flag="fatal" test="(cbc:ID) != ''">[BR-21]-Each Invoice line (BG-25) shall have an Invoice line identifier (BT-126).</assert>
      <assert id="BR-22" flag="fatal" test="exists(cbc:InvoicedQuantity) or exists(cbc:CreditedQuantity)">[BR-22]-Each Invoice line (BG-25) shall have an Invoiced quantity (BT-129).</assert>
      <assert id="BR-23" flag="fatal" test="exists(cbc:InvoicedQuantity/@unitCode) or exists(cbc:CreditedQuantity/@unitCode)">[BR-23]-An Invoice line (BG-25) shall have an Invoiced quantity unit of measure code (BT-130).</assert>
      <assert id="BR-24" flag="fatal" test="exists(cbc:LineExtensionAmount)">[BR-24]-Each Invoice line (BG-25) shall have an Invoice line net amount (BT-131).</assert>
      <assert id="BR-25" flag="fatal" test="(cac:Item/cbc:Name) != ''">[BR-25]-Each Invoice line (BG-25) shall contain the Item name (BT-153).</assert>
      <assert id="BR-26" flag="fatal" test="exists(cac:Price/cbc:PriceAmount)">[BR-26]-Each Invoice line (BG-25) shall contain the Item net price (BT-146).</assert>
      <assert id="BR-27" flag="fatal" test="(cac:Price/cbc:PriceAmount) >= 0">[BR-27]-The Item net price (BT-146) shall NOT be negative.</assert>
      <assert id="BR-28" flag="fatal" test="(cac:Price/cac:AllowanceCharge/cbc:BaseAmount) >= 0 or not(exists(cac:Price/cac:AllowanceCharge/cbc:BaseAmount))">[BR-28]-The Item gross price (BT-148) shall NOT be negative.</assert>
      <assert id="BR-CO-04" flag="fatal" test="(cac:Item/cac:ClassifiedTaxCategory[cac:TaxScheme/(normalize-space(upper-case(cbc:ID))='VAT')]/cbc:ID)">[BR-CO-04]-Each Invoice line (BG-25) shall be categorized with an Invoiced item VAT category code (BT-151).</assert>
    </rule>
    <rule context="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()]">
      <assert id="BR-41" flag="fatal" test="exists(cbc:Amount)">[BR-41]-Each Invoice line allowance (BG-27) shall have an Invoice line allowance amount (BT-136).</assert>
      <assert id="BR-42" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-42]-Each Invoice line allowance (BG-27) shall have an Invoice line allowance reason (BT-139) or an Invoice line allowance reason code (BT-140).</assert>
      <assert id="BR-CO-07" flag="fatal" test="true()">[BR-CO-07]-Invoice line allowance reason code (BT-140) and Invoice line allowance reason (BT-139) shall indicate the same type of allowance reason.</assert>
      <assert id="BR-CO-23" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-CO-23]-Each Invoice line allowance (BG-27) shall contain an Invoice line allowance reason (BT-139) or an Invoice line allowance reason code (BT-140), or both.</assert>
      <assert id="BR-DEC-24" flag="fatal" test="string-length(substring-after(cbc:Amount,'.'))&lt;=2">[BR-DEC-24]-The allowed maximum number of decimals for the Invoice line allowance amount (BT-136) is 2.</assert>
      <assert id="BR-DEC-25" flag="fatal" test="string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2">[BR-DEC-25]-The allowed maximum number of decimals for the Invoice line allowance base amount (BT-137) is 2.    </assert>
    </rule>
    <rule context="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]">
      <assert id="BR-43" flag="fatal" test="exists(cbc:Amount)">[BR-43]-Each Invoice line charge (BG-28) shall have an Invoice line charge amount (BT-141).</assert>
      <assert id="BR-44" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-44]-Each Invoice line charge shall have an Invoice line charge reason or an invoice line allowance reason code. </assert>
      <assert id="BR-CO-08" flag="fatal" test="true()">[BR-CO-08]-Invoice line charge reason code (BT-145) and Invoice line charge reason (BT144) shall indicate the same type of charge reason.</assert>
      <assert id="BR-CO-24" flag="fatal" test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">[BR-CO-24]-Each Invoice line charge (BG-28) shall contain an Invoice line charge reason (BT-144) or an Invoice line charge reason code (BT-145), or both.</assert>
      <assert id="BR-DEC-27" flag="fatal" test="string-length(substring-after(cbc:Amount,'.'))&lt;=2">[BR-DEC-27]-The allowed maximum number of decimals for the Invoice line charge amount (BT-141) is 2.</assert>
      <assert id="BR-DEC-28" flag="fatal" test="string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2">[BR-DEC-28]-The allowed maximum number of decimals for the Invoice line charge base amount (BT-142) is 2.    </assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:InvoicePeriod | cac:CreditNoteLine/cac:InvoicePeriod">
      <assert id="BR-30" flag="fatal" test="(exists(cbc:EndDate) and exists(cbc:StartDate) and xs:date(cbc:EndDate) >= xs:date(cbc:StartDate)) or not(exists(cbc:StartDate)) or not(exists(cbc:EndDate))">[BR-30]-If both Invoice line period start date (BT-134) and Invoice line period end date (BT-135) are given then the Invoice line period end date (BT-135) shall be later or equal to the Invoice line period start date (BT-134).</assert>
      <assert id="BR-CO-20" flag="fatal" test="exists(cbc:StartDate) or exists(cbc:EndDate)">[BR-CO-20]-If Invoice line period (BG-26) is used, the Invoice line period start date (BT-134) or the Invoice line period end date (BT-135) shall be filled, or both.</assert>
    </rule>
    <rule context="cac:InvoicePeriod">
      <assert id="BR-29" flag="fatal" test="(exists(cbc:EndDate) and exists(cbc:StartDate) and xs:date(cbc:EndDate) >= xs:date(cbc:StartDate)) or not(exists(cbc:StartDate)) or not(exists(cbc:EndDate))">[BR-29]-If both Invoicing period start date (BT-73) and Invoicing period end date (BT-74) are given then the Invoicing period end date (BT-74) shall be later or equal to the Invoicing period start date (BT-73).</assert>
      <assert id="BR-CO-19" flag="fatal" test="exists(cbc:StartDate) or exists(cbc:EndDate) or (exists(cbc:DescriptionCode) and not(exists(cbc:StartDate)) and not(exists(cbc:EndDate)))">[BR-CO-19]-If Invoicing period (BG-14) is used, the Invoicing period start date (BT-73) or the Invoicing period end date (BT-74) shall be filled, or both.</assert>
    </rule>
    <rule context="//cac:AdditionalItemProperty">
      <assert id="BR-54" flag="fatal" test="exists(cbc:Name) and exists(cbc:Value)">[BR-54]-Each Item attribute (BG-32) shall contain an Item attribute name (BT-160) and an Item attribute value (BT-161).</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode | cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
      <assert id="BR-65" flag="fatal" test="exists(@listID)">[BR-65]-The Item classification identifier (BT-158) shall have a Scheme identifier.</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID | cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID">
      <assert id="BR-64" flag="fatal" test="exists(@schemeID)">[BR-64]-The Item standard identifier (BT-157) shall have a Scheme identifier.</assert>
    </rule>
    <rule context="/ubl:Invoice/cbc:Note | /cn:CreditNote/cac:Note">
      <assert id="BR-CL-08" flag="fatal" test="(contains(.,'#') and ( ( contains(' AAA AAB AAC AAD AAE AAF AAG AAI AAJ AAK AAL AAM AAN AAO AAP AAQ AAR AAS AAT AAU AAV AAW AAX AAY AAZ ABA ABB ABC ABD ABE ABF ABG ABH ABI ABJ ABK ABL ABM ABN ABO ABP ABQ ABR ABS ABT ABU ABV ABW ABX ABZ ACA ACB ACC ACD ACE ACF ACG ACH ACI ACJ ACK ACL ACM ACN ACO ACP ACQ ACR ACS ACT ACU ACV ACW ACX ACY ACZ ADA ADB ADC ADD ADE ADF ADG ADH ADI ADJ ADK ADL ADM ADN ADO ADP ADQ ADR ADS ADT ADU ADV ADW ADX ADY ADZ AEA AEB AEC AED AEE AEF AEG AEH AEI AEJ AEK AEL AEM AEN AEO AEP AEQ AER AES AET AEU AEV AEW AEX AEY AEZ AFA AFB AFC AFD AFE AFF AFG AFH AFI AFJ AFK AFL AFM AFN AFO AFP AFQ AFR AFS AFT AFU AFV AFW AFX AFY AFZ AGA AGB AGC AGD AGE AGF AGG AGH AGI AGJ AGK AGL AGM AGN AGO AGP AGQ AGR AGS AGT AGU AGV AGW AGX AGY AGZ AHA AHB AHC AHD AHE AHF AHG AHH AHI AHJ AHK AHL AHM AHN AHO AHP AHQ AHR AHS AHT AHU AHV AHW AHX AHY AHZ AIA AIB AIC AID AIE AIF AIG AIH AII AIJ AIK AIL AIM AIN AIO AIP AIQ AIR AIS AIT AIU AIV AIW AIX AIY AIZ AJA AJB ALC ALD ALE ALF ALG ALH ALI ALJ ALK ALL ALM ALN ALO ALP ALQ ARR ARS AUT AUU AUV AUW AUX AUY AUZ AVA AVB AVC AVD AVE AVF BAG BAH BAI BAJ BAK BAL BAM BAN BAO BAP BAQ BLC BLD BLE BLF BLG BLH BLI BLJ BLK BLL BLM BLN BLO BLP BLQ BLR BLS BLT BLU BLV BLW BLX BLY BLZ BMA BMB BMC BMD BME CCI CEX CHG CIP CLP CLR COI CUR CUS DAR DCL DEL DIN DOC DUT EUR FBC GBL GEN GS7 HAN HAZ ICN IIN IMI IND INS INV IRP ITR ITS LAN LIN LOI MCO MDH MKS ORI OSI PAC PAI PAY PKG PKT PMD PMT PRD PRF PRI PUR QIN QQD QUT RAH REG RET REV RQR SAF SIC SIN SLR SPA SPG SPH SPP SPT SRN SSR SUR TCA TDT TRA TRR TXD WHI ZZZ ',substring-before(substring-after(.,'#'),'#') ) ) )) or not(contains(.,'#'))">[BR-CL-08]-Invoiced note subject code SHOULD be coded using UNCL4451</assert>
    </rule>
    <rule context="cac:PayeeParty">
      <assert id="BR-17" flag="fatal" test="exists(cac:PartyName/cbc:Name) and (not(cac:PartyName/cbc:Name = ../cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) and not(cac:PartyIdentification/cbc:ID = ../cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID) and not(cac:PartyLegalEntity/cbc:RegistrationName = ../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName))">[BR-17]-The Payee name (BT-59) shall be provided in the Invoice, if the Payee (BG-10) is different from the Seller (BG-4)</assert>
    </rule>
    <rule context="cac:PaymentMeans[cbc:PaymentMeansCode='30' or cbc:PaymentMeansCode='58']/cac:PayeeFinancialAccount">
      <assert id="BR-50" flag="fatal" test="(cbc:ID) != ''">[BR-50]-A Payment account identifier (BT-84) shall be present if Credit transfer (BG-17) information is provided in the Invoice.</assert>
    </rule>
    <rule context="cac:PaymentMeans">
      <assert id="BR-49" flag="fatal" test="exists(cbc:PaymentMeansCode)">[BR-49]-A Payment instruction (BG-16) shall specify the Payment means type code (BT-81).</assert>
      <assert id="BR-61" flag="fatal" test="(exists(cac:PayeeFinancialAccount/cbc:ID) and ((normalize-space(cbc:PaymentMeansCode) = '30') or (normalize-space(cbc:PaymentMeansCode) = '58') )) or ((normalize-space(cbc:PaymentMeansCode) != '30') and (normalize-space(cbc:PaymentMeansCode) != '58'))">[BR-61]-If the Payment means type code (BT-81) means SEPA credit transfer, Local credit transfer or Non-SEPA international credit transfer, the Payment account identifier (BT-84) shall be present.</assert>
    </rule>
    <rule context="cac:BillingReference">
      <assert id="BR-55" flag="fatal" test="exists(cac:InvoiceDocumentReference/cbc:ID)">[BR-55]-Each Preceding Invoice reference (BG-3) shall contain a Preceding Invoice reference (BT-25).</assert>
    </rule>
    <rule context="cac:AccountingSupplierParty">
      <assert id="BR-CO-26" flag="fatal" test="exists(cac:Party/cac:PartyTaxScheme[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:CompanyID) or exists(cac:Party/cac:PartyIdentification/cbc:ID) or exists(cac:Party/cac:PartyLegalEntity/cbc:CompanyID)">[BR-CO-26]-In order for the buyer to automatically identify a supplier, the Seller identifier (BT-29), the Seller legal registration identifier (BT-30) and/or the Seller VAT identifier (BT-31) shall be present.  </assert>
    </rule>
    <rule context="cac:AccountingSupplierParty/cac:Party/cbc:EndpointID">
      <assert id="BR-62" flag="fatal" test="exists(@schemeID)">[BR-62]-The Seller electronic address (BT-34) shall have a Scheme identifier.</assert>
    </rule>
    <rule context="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress">
      <assert id="BR-09" flag="fatal" test="(cac:Country/cbc:IdentificationCode) != ''">[BR-09]-The Seller postal address (BG-5) shall contain a Seller country code (BT-40).</assert>
    </rule>
    <rule context="cac:TaxRepresentativeParty">
      <assert id="BR-18" flag="fatal" test="(cac:PartyName/cbc:Name) != ''">[BR-18]-The Seller tax representative name (BT-62) shall be provided in the Invoice, if the Seller (BG-4) has a Seller tax representative party (BG-11)</assert>
      <assert id="BR-19" flag="fatal" test="exists(cac:PostalAddress)">[BR-19]-The Seller tax representative postal address (BG-12) shall be provided in the Invoice, if the Seller (BG-4) has a Seller tax representative party (BG-11).</assert>
      <assert id="BR-56" flag="fatal" test="exists(cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'VAT')]/cbc:CompanyID)">[BR-56]-Each Seller tax representative party (BG-11) shall have a Seller tax representative VAT identifier (BT-63).    </assert>
    </rule>
    <rule context="cac:TaxRepresentativeParty/cac:PostalAddress">
      <assert id="BR-20" flag="fatal" test="(cac:Country/cbc:IdentificationCode) != ''">[BR-20]-The Seller tax representative postal address (BG-12) shall contain a Tax representative country code (BT-69), if the Seller (BG-4) has a Seller tax representative party (BG-11).</assert>
    </rule>
    <rule context="/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:Taxtotal">
      <assert id="BR-CO-14" flag="fatal" test="(xs:decimal(child::cbc:TaxAmount)= round((sum(cac:TaxSubtotal/xs:decimal(cbc:TaxAmount)) * 10 * 10)) div 100) or not(cac:TaxSubtotal)">[BR-CO-14]-Invoice total VAT amount (BT-110) = Σ VAT category tax amount (BT-117).</assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal">
      <assert id="BR-45" flag="fatal" test="exists(cbc:TaxableAmount)">[BR-45]-Each VAT breakdown (BG-23) shall have a VAT category taxable amount (BT-116).</assert>
      <assert id="BR-46" flag="fatal" test="exists(cbc:TaxAmount)">[BR-46]-Each VAT breakdown (BG-23) shall have a VAT category tax amount (BT-117).</assert>
      <assert id="BR-47" flag="fatal" test="exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:ID)">[BR-47]-Each VAT breakdown (BG-23) shall be defined through a VAT category code (BT-118).</assert>
      <assert id="BR-48" flag="fatal" test="exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/cbc:Percent) or (cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']/normalize-space(cbc:ID)='O')">[BR-48]-Each VAT breakdown (BG-23) shall have a VAT category rate (BT-119), except if the Invoice is not subject to VAT.</assert>
      
	  <assert id="BR-DEC-19" flag="fatal" test="string-length(substring-after(cbc:TaxableAmount,'.'))&lt;=2">[BR-DEC-19]-The allowed maximum number of decimals for the VAT category taxable amount (BT-116) is 2.</assert>
      <assert id="BR-DEC-20" flag="fatal" test="string-length(substring-after(cbc:TaxAmount,'.'))&lt;=2">[BR-DEC-20]-The allowed maximum number of decimals for the VAT category tax amount (BT-117) is 2.    </assert>
    </rule>
    <rule context="//cac:PartyTaxScheme[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-CO-09" flag="fatal" test="( contains( 'AD AE AF AG AI AL AM AN AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BL BJ BM BN BO BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CX CY CZ DE DJ DK DM DO DZ EC EE EG EH EL ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR ST SV SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW',substring(cbc:CompanyID,1,2) ) )">[BR-CO-09]-The Seller VAT identifier (BT-31), the Seller tax representative VAT identifier (BT-63) and the Buyer VAT identifier (BT-48) shall have a prefix in accordance with ISO code ISO 3166-1 alpha-2 by which the country of issue may be identified. Nevertheless, Greece may use the prefix ‘EL’.</assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-AE-08" flag="fatal" test="(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='AE']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='AE']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='AE']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='AE']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='AE']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='AE']/xs:decimal(cbc:Amount)))))">[BR-AE-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Reverse charge" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Reverse charge".</assert>
      <assert id="BR-AE-09" flag="fatal" test="../cbc:TaxAmount = 0">[BR-AE-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Reverse charge" shall be 0 (zero).</assert>
      <assert id="BR-AE-10" flag="fatal" test="exists(cbc:TaxExemptionReason) or (exists(cbc:TaxExemptionReasonCode) )">[BR-AE-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Reverse charge" shall have a VAT exemption reason code (BT-121), meaning "Reverse charge" or the VAT exemption reason text (BT-120) "Reverse charge" (or the equivalent standard text in another language).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-AE-06" flag="fatal" test="(cbc:Percent = 0)">[BR-AE-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Reverse charge" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-AE-07" flag="fatal" test="(cbc:Percent = 0)">[BR-AE-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Reverse charge" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'AE'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-AE-05" flag="fatal" test="(cbc:Percent = 0)">[BR-AE-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Reverse charge" the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-E-09" flag="fatal" test="../cbc:TaxAmount = 0">[BR-E-09]-The VAT category tax amount (BT-117) In a VAT breakdown (BG-23) where the VAT category code (BT-118) equals "Exempt from VAT" shall equal 0 (zero).</assert>
      <assert id="BR-E-10" flag="fatal" test="exists(cbc:TaxExemptionReason) or exists(cbc:TaxExemptionReasonCode)">[BR-E-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Exempt from VAT" shall have a VAT exemption reason code (BT-121) or a VAT exemption reason text (BT-120).    </assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-E-06" flag="fatal" test="(cbc:Percent = 0)">[BR-E-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Exempt from VAT", the Document level allowance VAT rate (BT-96) shall be 0 (zero).    </assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-E-07" flag="fatal" test="(cbc:Percent = 0)">[BR-E-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Exempt from VAT", the Document level charge VAT rate (BT-103) shall be 0 (zero).    </assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-E-05" flag="fatal" test="(cbc:Percent = 0)">[BR-E-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Exempt from VAT", the Invoiced item VAT rate (BT-152) shall be 0 (zero).    </assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-G-08" flag="fatal" test="(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)))))">[BR-G-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Export outside the EU" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Export outside the EU".</assert>
      <assert id="BR-G-09" flag="fatal" test="../cbc:TaxAmount = 0">[BR-G-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Export outside the EU" shall be 0 (zero).</assert>
      <assert id="BR-G-10" flag="fatal" test="exists(cbc:TaxExemptionReason) or (exists(cbc:TaxExemptionReasonCode) )">[BR-G-10]-A VAT breakdown (BG-23) with the VAT Category code (BT-118) "Export outside the EU" shall have a VAT exemption reason code (BT-121), meaning "Export outside the EU" or the VAT exemption reason text (BT-120) "Export outside the EU" (or the equivalent standard text in another language).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-G-06" flag="fatal" test="(cbc:Percent = 0)">[BR-G-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Export outside the EU" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-G-07" flag="fatal" test="(cbc:Percent = 0)">[BR-G-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Export outside the EU" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-G-05" flag="fatal" test="(cbc:Percent = 0)">[BR-G-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Export outside the EU" the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IC-08" flag="warning" test="(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='K']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='K']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='K']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='K']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='K']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='K']/xs:decimal(cbc:Amount)))))">[BR-IC-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Intra-community supply".</assert>
      <assert id="BR-IC-09" flag="fatal" test="../cbc:TaxAmount = 0">[BR-IC-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Intra-community supply" shall be 0 (zero).</assert>
      <assert id="BR-IC-10" flag="fatal" test="exists(cbc:TaxExemptionReason) or (exists(cbc:TaxExemptionReasonCode) )">[BR-IC-10]-A VAT breakdown (BG-23) with the VAT Category code (BT-118) "Intra-community supply" shall have a VAT exemption reason code (BT-121), meaning "Intra-community supply" or the VAT exemption reason text (BT-120) "Intra-community supply" (or the equivalent standard text in another language).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IC-06" flag="fatal" test="(cbc:Percent = 0)">[BR-IC-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Intra-community supply" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IC-07" flag="fatal" test="(cbc:Percent = 0)">[BR-IC-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Intra-community supply" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'K'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IC-05" flag="fatal" test="(cbc:Percent = 0)">[BR-IC-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Intracommunity supply" the Invoiced item VAT rate (BT-152) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IG-08" flag="fatal" test="every $rate in xs:decimal(round(cbc:Percent)) satisfies ((exists(//cac:InvoiceLine) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='L'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) > (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='L'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))))) or (exists(//cac:CreditNoteLine) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='L'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) > (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='L'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='L'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))))))">[BR-IG-08]-For each different value of VAT category rate (BT-119) where the VAT category code (BT-118) is "IGIC", the VAT category taxable amount (BT-116) in a VAT breakdown (BG-23) shall equal the sum of Invoice line net amounts (BT-131) plus the sum of document level charge amounts (BT-99) minus the sum of document level allowance amounts (BT-92) where the VAT category code (BT-151, BT-102, BT-95) is "IGIC" and the VAT rate (BT-152, BT-103, BT-96) equals the VAT category rate (BT-119).</assert>
      <assert id="BR-IG-09" flag="fatal" test="(abs(xs:decimal(../cbc:TaxAmount - 1))&lt;  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 ) and (abs(xs:decimal(../cbc:TaxAmount + 1))>  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 )">[BR-IG-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where VAT category code (BT-118) is "IGIC" shall equal the VAT category taxable amount (BT-116) multiplied by the VAT category rate (BT-119).</assert>
      <assert id="BR-IG-10" flag="fatal" test="not(cbc:TaxExemptionReason) and not(cbc:TaxExemptionReasonCode)">[BR-IG-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "IGIC" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).    </assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IG-06" flag="fatal" test="(cbc:Percent) >= 0">[BR-IG-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IGIC" the Document level allowance VAT rate (BT-96) shall be 0 (zero) or greater than zero.      </assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IG-07" flag="fatal" test="(cbc:Percent) >= 0">[BR-IG-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IGIC" the Document level charge VAT rate (BT-103) shall be 0 (zero) or greater than zero.</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']| cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'L'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IG-05" flag="fatal" test="(cbc:Percent) >= 0">[BR-IG-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IGIC" the invoiced item VAT rate (BT-152) shall be 0 (zero) or greater than zero.    </assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IP-08" flag="fatal" test="every $rate in xs:decimal(round(cbc:Percent)) satisfies ((exists(//cac:InvoiceLine) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='M'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) > (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='M'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))))) or (exists(//cac:CreditNoteLine) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='M'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) > (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='M'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(round(cbc:Percent)) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='M'][cac:TaxCategory/xs:decimal(round(cbc:Percent)) = $rate]/xs:decimal(cbc:Amount)))))))">[BR-IP-08]-For each different value of VAT category rate (BT-119) where the VAT category code (BT-118) is "IPSI", the VAT category taxable amount (BT-116) in a VAT breakdown (BG-23) shall equal the sum of Invoice line net amounts (BT-131) plus the sum of document level charge amounts (BT-99) minus the sum of document level allowance amounts (BT-92) where the VAT category code (BT-151, BT-102, BT-95) is "IPSI" and the VAT rate (BT-152, BT-103, BT-96) equals the VAT category rate (BT-119).</assert>
      <assert id="BR-IP-09" flag="fatal" test="(abs(xs:decimal(../cbc:TaxAmount - 1))&lt;  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 ) and (abs(xs:decimal(../cbc:TaxAmount + 1))>  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 )">[BR-IP-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where VAT category code (BT-118) is "IPSI" shall equal the VAT category taxable amount (BT-116) multiplied by the VAT category rate (BT-119).</assert>
      <assert id="BR-IP-10" flag="fatal" test="not(cbc:TaxExemptionReason) and not(cbc:TaxExemptionReasonCode)">[BR-IP-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "IPSI" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).     </assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IP-06" flag="fatal" test="(cbc:Percent) >= 0">[BR-IP-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "IPSI" the Document level allowance VAT rate (BT-96) shall be 0 (zero) or greater than zero.      </assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IP-07" flag="fatal" test="(cbc:Percent) >= 0">[BR-IP-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "IPSI" the Document level charge VAT rate (BT-103) shall be 0 (zero) or greater than zero.</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']| cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'M'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-IP-05" flag="fatal" test="(cbc:Percent) >= 0">[BR-IP-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "IPSI" the Invoiced item VAT rate (BT-152) shall be 0 (zero) or greater than zero.    </assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-O-08" flag="fatal" test="(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)))))">[BR-O-08]-In a VAT breakdown (BG-23) where the VAT category code (BT-118) is " Not subject to VAT" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Not subject to VAT".</assert>
      <assert id="BR-O-09" flag="fatal" test="../cbc:TaxAmount = 0">[BR-O-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where the VAT category code (BT-118) is "Not subject to VAT" shall be 0 (zero).</assert>
      <assert id="BR-O-10" flag="fatal" test="exists(cbc:TaxExemptionReason) or (exists(cbc:TaxExemptionReasonCode) )">[BR-O-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) " Not subject to VAT" shall have a VAT exemption reason code (BT-121), meaning " Not subject to VAT" or a VAT exemption reason text (BT-120) " Not subject to VAT" (or the equivalent standard text in another language).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-O-06" flag="fatal" test="not(cbc:Percent)">[BR-O-06]-A Document level allowance (BG-20) where VAT category code (BT-95) is "Not subject to VAT" shall not contain a Document level allowance VAT rate (BT-96).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-O-07" flag="fatal" test="not(cbc:Percent)">[BR-O-07]-A Document level charge (BG-21) where the VAT category code (BT-102) is "Not subject to VAT" shall not contain a Document level charge VAT rate (BT-103).</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-O-05" flag="fatal" test="not(cbc:Percent)">[BR-O-05]-An Invoice line (BG-25) where the VAT category code (BT-151) is "Not subject to VAT" shall not contain an Invoiced item VAT rate (BT-152).</assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-S-10" flag="fatal" test="not(cbc:TaxExemptionReason) and not(cbc:TaxExemptionReasonCode)">[BR-S-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Standard rate" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).    </assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-S-06" flag="fatal" test="(cbc:Percent) > 0">[BR-S-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Standard rated" the Document level allowance VAT rate (BT-96) shall be greater than zero.</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-S-07" flag="fatal" test="(cbc:Percent) > 0">[BR-S-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Standard rated" the Document level charge VAT rate (BT-103) shall be greater than zero.  </assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-S-05" flag="fatal" test="(cbc:Percent) > 0">[BR-S-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Standard rated" the Invoiced item VAT rate (BT-152) shall be greater than zero.    </assert>
    </rule>
    <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-Z-08" flag="fatal" test="(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)))))">[BR-Z-08]-In a VAT breakdown (BG-23) where VAT category code (BT-118) is "Zero rated" the VAT category taxable amount (BT-116) shall equal the sum of Invoice line net amount (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the VAT category codes (BT-151, BT-95, BT-102) are "Zero rated".</assert>
      <assert id="BR-Z-09" flag="fatal" test="../cbc:TaxAmount = 0">[BR-Z-09]-The VAT category tax amount (BT-117) in a VAT breakdown (BG-23) where VAT category code (BT-118) is "Zero rated" shall equal 0 (zero).</assert>
      <assert id="BR-Z-10" flag="fatal" test="not((cbc:TaxExemptionReason) or (cbc:TaxExemptionReasonCode))">[BR-Z-10]-A VAT breakdown (BG-23) with VAT Category code (BT-118) "Zero rated" shall not have a VAT exemption reason code (BT-121) or VAT exemption reason text (BT-120).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-Z-06" flag="fatal" test="(cbc:Percent = 0)">[BR-Z-06]-In a Document level allowance (BG-20) where the Document level allowance VAT category code (BT-95) is "Zero rated" the Document level allowance VAT rate (BT-96) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-Z-07" flag="fatal" test="(cbc:Percent = 0)">[BR-Z-07]-In a Document level charge (BG-21) where the Document level charge VAT category code (BT-102) is "Zero rated" the Document level charge VAT rate (BT-103) shall be 0 (zero).</assert>
    </rule>
    <rule context="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='VAT']">
      <assert id="BR-Z-05" flag="fatal" test="(cbc:Percent = 0)">[BR-Z-05]-In an Invoice line (BG-25) where the Invoiced item VAT category code (BT-151) is "Zero rated" the Invoiced item VAT rate (BT-152) shall be 0 (zero).    </assert>
    </rule>
  </pattern>
  <pattern id="ubl-syntax">
    <rule context="cac:AccountingSupplierParty/cac:Party">
      <assert id="ubl-SR-42" flag="warning" test="(count(cac:PartyTaxScheme) &lt;= 2)">[ubl-SR-42]-Party tax scheme shall occur maximum twice in accounting supplier party</assert>
    </rule>
    <rule context="cac:AdditionalDocumentReference">
      <assert id="ubl-SR-33" flag="warning" test="(count(cbc:DocumentDescription) &lt;= 1)">[ubl-SR-33]-Supporting document description shall occur maximum once</assert>
      <assert id="ubl-SR-43" flag="warning" test="((cbc:DocumentTypeCode='130') or ((name(/*) = 'CreditNote') and (cbc:DocumentTypeCode='50')) or (not(cbc:ID/@scheme) and not(cbc:DocumentTypeCode)))">[ubl-SR-43]-Scheme identifier shall only be used for invoiced object (document type code with value 130)</assert>
    </rule>
    <rule context="//*[ends-with(name(), 'BinaryObject')]">
      <assert id="ubl-DT-06" flag="fatal" test="(@mimeCode)">[ubl-DT-06]-Binary object elements shall contain the mime code attribute</assert>
      <assert id="ubl-DT-07" flag="fatal" test="(@filename)">[ubl-DT-07]-Binary object elements shall contain the file name attribute</assert>
    </rule>
    <rule context="cac:Delivery">
      <assert id="ubl-SR-25" flag="warning" test="(count(cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1)">[ubl-SR-25]-Deliver to party name shall occur maximum once</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator = false()]">
      <assert id="ubl-SR-30" flag="warning" test="(count(cbc:AllowanceChargeReason) &lt;= 1)">[ubl-SR-30]-Document level allowance reason shall occur maximum once</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator = true()]">
      <assert id="ubl-SR-31" flag="warning" test="(count(cbc:AllowanceChargeReason) &lt;= 1)">[ubl-SR-31]-Document level charge reason shall occur maximum once</assert>
    </rule>
    <rule context="/ubl:Invoice | /cn:CreditNote">
      <assert id="ubl-CR-001" flag="warning" test="not(ext:ublExtensions)">[ubl-CR-001]-A ubl invoice should not include extensions</assert>
      <assert id="ubl-CR-002" flag="warning" test="not(cbc:ublVersionID)">[ubl-CR-002]-A ubl invoice should not include the ublVersionID</assert>
      <assert id="ubl-CR-003" flag="warning" test="not(cbc:ProfileExecutionID)">[ubl-CR-003]-A ubl invoice should not include the ProfileExecutionID </assert>
      <assert id="ubl-CR-004" flag="warning" test="not(cbc:CopyIndicator)">[ubl-CR-004]-A ubl invoice should not include the CopyIndicator </assert>
      <assert id="ubl-CR-005" flag="warning" test="not(cbc:UUID)">[ubl-CR-005]-A ubl invoice should not include the UUID </assert>
      <assert id="ubl-CR-006" flag="warning" test="not(cbc:IssueTime)">[ubl-CR-006]-A ubl invoice should not include the IssueTime </assert>
      <assert id="ubl-CR-007" flag="warning" test="not(cbc:PricingCurrencyCode)">[ubl-CR-007]-A ubl invoice should not include the PricingCurrencyCode</assert>
      <assert id="ubl-CR-008" flag="warning" test="not(cbc:PaymentCurrencyCode)">[ubl-CR-008]-A ubl invoice should not include the PaymentCurrencyCode</assert>
      <assert id="ubl-CR-009" flag="warning" test="not(cbc:PaymentAlternativeCurrencyCode)">[ubl-CR-009]-A ubl invoice should not include the PaymentAlternativeCurrencyCode</assert>
      <assert id="ubl-CR-010" flag="warning" test="not(cbc:AccountingCostCode)">[ubl-CR-010]-A ubl invoice should not include the AccountingCostCode</assert>
      <assert id="ubl-CR-011" flag="warning" test="not(cbc:LineCountNumeric)">[ubl-CR-011]-A ubl invoice should not include the LineCountNumeric</assert>
      <assert id="ubl-CR-012" flag="warning" test="not(cac:InvoicePeriod/cbc:StartTime)">[ubl-CR-012]-A ubl invoice should not include the InvoicePeriod StartTime</assert>
      <assert id="ubl-CR-013" flag="warning" test="not(cac:InvoicePeriod/cbc:EndTime)">[ubl-CR-013]-A ubl invoice should not include the InvoicePeriod EndTime</assert>
      <assert id="ubl-CR-014" flag="warning" test="not(cac:InvoicePeriod/cbc:DurationMeasure)">[ubl-CR-014]-A ubl invoice should not include the InvoicePeriod DurationMeasure</assert>
      <assert id="ubl-CR-015" flag="warning" test="not(cac:InvoicePeriod/cbc:Description)">[ubl-CR-015]-A ubl invoice should not include the InvoicePeriod Description</assert>
      <assert id="ubl-CR-016" flag="warning" test="not(cac:OrderReference/cbc:CopyIndicator)">[ubl-CR-016]-A ubl invoice should not include the OrderReference CopyIndicator</assert>
      <assert id="ubl-CR-017" flag="warning" test="not(cac:OrderReference/cbc:UUID)">[ubl-CR-017]-A ubl invoice should not include the OrderReference UUID</assert>
      <assert id="ubl-CR-018" flag="warning" test="not(cac:OrderReference/cbc:IssueDate)">[ubl-CR-018]-A ubl invoice should not include the OrderReference IssueDate</assert>
      <assert id="ubl-CR-019" flag="warning" test="not(cac:OrderReference/cbc:IssueTime)">[ubl-CR-019]-A ubl invoice should not include the OrderReference IssueTime</assert>
      <assert id="ubl-CR-020" flag="warning" test="not(cac:OrderReference/cbc:CustomerReference)">[ubl-CR-020]-A ubl invoice should not include the OrderReference CustomerReference</assert>
      <assert id="ubl-CR-021" flag="warning" test="not(cac:OrderReference/cbc:OrderTypeCode)">[ubl-CR-021]-A ubl invoice should not include the OrderReference OrderTypeCode</assert>
      <assert id="ubl-CR-022" flag="warning" test="not(cac:OrderReference/cbc:DocumentReference)">[ubl-CR-022]-A ubl invoice should not include the OrderReference DocumentReference</assert>
      <assert id="ubl-CR-023" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator)">[ubl-CR-023]-A ubl invoice should not include the BillingReference CopyIndicator</assert>
      <assert id="ubl-CR-024" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID)">[ubl-CR-024]-A ubl invoice should not include the BillingReference UUID</assert>
      <assert id="ubl-CR-025" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime)">[ubl-CR-025]-A ubl invoice should not include the BillingReference IssueTime</assert>
      <assert id="ubl-CR-026" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode)">[ubl-CR-026]-A ubl invoice should not include the BillingReference DocumentTypeCode</assert>
      <assert id="ubl-CR-027" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType)">[ubl-CR-027]-A ubl invoice should not include the BillingReference DocumentType</assert>
      <assert id="ubl-CR-028" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:Xpath)">[ubl-CR-028]-A ubl invoice should not include the BillingReference Xpath</assert>
      <assert id="ubl-CR-029" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID)">[ubl-CR-029]-A ubl invoice should not include the BillingReference LanguageID</assert>
      <assert id="ubl-CR-030" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode)">[ubl-CR-030]-A ubl invoice should not include the BillingReference LocaleCode</assert>
      <assert id="ubl-CR-031" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID)">[ubl-CR-031]-A ubl invoice should not include the BillingReference VersionID</assert>
      <assert id="ubl-CR-032" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode)">[ubl-CR-032]-A ubl invoice should not include the BillingReference DocumentStatusCode</assert>
      <assert id="ubl-CR-033" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription)">[ubl-CR-033]-A ubl invoice should not include the BillingReference DocumenDescription</assert>
      <assert id="ubl-CR-034" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment)">[ubl-CR-034]-A ubl invoice should not include the BillingReference Attachment</assert>
      <assert id="ubl-CR-035" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod)">[ubl-CR-035]-A ubl invoice should not include the BillingReference ValidityPeriod</assert>
      <assert id="ubl-CR-036" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty)">[ubl-CR-036]-A ubl invoice should not include the BillingReference IssuerParty</assert>
      <assert id="ubl-CR-037" flag="warning" test="not(cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification)">[ubl-CR-037]-A ubl invoice should not include the BillingReference ResultOfVerification</assert>
      <assert id="ubl-CR-038" flag="warning" test="not(cac:BillingReference/cac:SelfBilledInvoiceDocumentReference)">[ubl-CR-038]-A ubl invoice should not include the BillingReference SelfBilledInvoiceDocumentReference</assert>
      <assert id="ubl-CR-039" flag="warning" test="not(cac:BillingReference/cac:CreditNoteDocumentReference)">[ubl-CR-039]-A ubl invoice should not include the BillingReference CreditNoteDocumentReference</assert>
      <assert id="ubl-CR-040" flag="warning" test="not(cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference)">[ubl-CR-040]-A ubl invoice should not include the BillingReference SelfBilledCreditNoteDocumentReference</assert>
      <assert id="ubl-CR-041" flag="warning" test="not(cac:BillingReference/cac:DebitNoteDocumentReference)">[ubl-CR-041]-A ubl invoice should not include the BillingReference DebitNoteDocumentReference</assert>
      <assert id="ubl-CR-042" flag="warning" test="not(cac:BillingReference/cac:ReminderDocumentReference)">[ubl-CR-042]-A ubl invoice should not include the BillingReference ReminderDocumentReference</assert>
      <assert id="ubl-CR-043" flag="warning" test="not(cac:BillingReference/cac:AdditionalDocumentReference)">[ubl-CR-043]-A ubl invoice should not include the BillingReference AdditionalDocumentReference</assert>
      <assert id="ubl-CR-044" flag="warning" test="not(cac:BillingReference/cac:BillingReferenceLine)">[ubl-CR-044]-A ubl invoice should not include the BillingReference BillingReferenceLine</assert>
      <assert id="ubl-CR-045" flag="warning" test="not(cac:DespatchDocumentReference/cbc:CopyIndicator)">[ubl-CR-045]-A ubl invoice should not include the DespatchDocumentReference CopyIndicator</assert>
      <assert id="ubl-CR-046" flag="warning" test="not(cac:DespatchDocumentReference/cbc:UUID)">[ubl-CR-046]-A ubl invoice should not include the DespatchDocumentReference UUID</assert>
      <assert id="ubl-CR-047" flag="warning" test="not(cac:DespatchDocumentReference/cbc:IssueDate)">[ubl-CR-047]-A ubl invoice should not include the DespatchDocumentReference IssueDate</assert>
      <assert id="ubl-CR-048" flag="warning" test="not(cac:DespatchDocumentReference/cbc:IssueTime)">[ubl-CR-048]-A ubl invoice should not include the DespatchDocumentReference IssueTime</assert>
      <assert id="ubl-CR-049" flag="warning" test="not(cac:DespatchDocumentReference/cbc:DocumentTypeCode)">[ubl-CR-049]-A ubl invoice should not include the DespatchDocumentReference DocumentTypeCode</assert>
      <assert id="ubl-CR-050" flag="warning" test="not(cac:DespatchDocumentReference/cbc:DocumentType)">[ubl-CR-050]-A ubl invoice should not include the DespatchDocumentReference DocumentType</assert>
      <assert id="ubl-CR-051" flag="warning" test="not(cac:DespatchDocumentReference/cbc:Xpath)">[ubl-CR-051]-A ubl invoice should not include the DespatchDocumentReference Xpath</assert>
      <assert id="ubl-CR-052" flag="warning" test="not(cac:DespatchDocumentReference/cbc:LanguageID)">[ubl-CR-052]-A ubl invoice should not include the DespatchDocumentReference LanguageID</assert>
      <assert id="ubl-CR-053" flag="warning" test="not(cac:DespatchDocumentReference/cbc:LocaleCode)">[ubl-CR-053]-A ubl invoice should not include the DespatchDocumentReference LocaleCode</assert>
      <assert id="ubl-CR-054" flag="warning" test="not(cac:DespatchDocumentReference/cbc:VersionID)">[ubl-CR-054]-A ubl invoice should not include the DespatchDocumentReference VersionID</assert>
      <assert id="ubl-CR-055" flag="warning" test="not(cac:DespatchDocumentReference/cbc:DocumentStatusCode)">[ubl-CR-055]-A ubl invoice should not include the DespatchDocumentReference DocumentStatusCode</assert>
      <assert id="ubl-CR-056" flag="warning" test="not(cac:DespatchDocumentReference/cbc:DocumentDescription)">[ubl-CR-056]-A ubl invoice should not include the DespatchDocumentReference DocumentDescription</assert>
      <assert id="ubl-CR-057" flag="warning" test="not(cac:DespatchDocumentReference/cac:Attachment)">[ubl-CR-057]-A ubl invoice should not include the DespatchDocumentReference Attachment</assert>
      <assert id="ubl-CR-058" flag="warning" test="not(cac:DespatchDocumentReference/cac:ValidityPeriod)">[ubl-CR-058]-A ubl invoice should not include the DespatchDocumentReference ValidityPeriod</assert>
      <assert id="ubl-CR-059" flag="warning" test="not(cac:DespatchDocumentReference/cac:IssuerParty)">[ubl-CR-059]-A ubl invoice should not include the DespatchDocumentReference IssuerParty</assert>
      <assert id="ubl-CR-060" flag="warning" test="not(cac:DespatchDocumentReference/cac:ResultOfVerification)">[ubl-CR-060]-A ubl invoice should not include the DespatchDocumentReference ResultOfVerification</assert>
      <assert id="ubl-CR-061" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:CopyIndicator)">[ubl-CR-061]-A ubl invoice should not include the ReceiptDocumentReference CopyIndicator</assert>
      <assert id="ubl-CR-062" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:UUID)">[ubl-CR-062]-A ubl invoice should not include the ReceiptDocumentReference UUID</assert>
      <assert id="ubl-CR-063" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:IssueDate)">[ubl-CR-063]-A ubl invoice should not include the ReceiptDocumentReference IssueDate</assert>
      <assert id="ubl-CR-064" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:IssueTime)">[ubl-CR-064]-A ubl invoice should not include the ReceiptDocumentReference IssueTime</assert>
      <assert id="ubl-CR-065" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:DocumentTypeCode)">[ubl-CR-065]-A ubl invoice should not include the ReceiptDocumentReference DocumentTypeCode</assert>
      <assert id="ubl-CR-066" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:DocumentType)">[ubl-CR-066]-A ubl invoice should not include the ReceiptDocumentReference DocumentType</assert>
      <assert id="ubl-CR-067" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:Xpath)">[ubl-CR-067]-A ubl invoice should not include the ReceiptDocumentReference Xpath</assert>
      <assert id="ubl-CR-068" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:LanguageID)">[ubl-CR-068]-A ubl invoice should not include the ReceiptDocumentReference LanguageID</assert>
      <assert id="ubl-CR-069" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:LocaleCode)">[ubl-CR-069]-A ubl invoice should not include the ReceiptDocumentReference LocaleCode</assert>
      <assert id="ubl-CR-070" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:VersionID)">[ubl-CR-070]-A ubl invoice should not include the ReceiptDocumentReference VersionID</assert>
      <assert id="ubl-CR-071" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:DocumentStatusCode)">[ubl-CR-071]-A ubl invoice should not include the ReceiptDocumentReference DocumentStatusCode</assert>
      <assert id="ubl-CR-072" flag="warning" test="not(cac:ReceiptDocumentReference/cbc:DocumentDescription)">[ubl-CR-072]-A ubl invoice should not include the ReceiptDocumentReference DocumentDescription</assert>
      <assert id="ubl-CR-073" flag="warning" test="not(cac:ReceiptDocumentReference/cac:Attachment)">[ubl-CR-073]-A ubl invoice should not include the ReceiptDocumentReference Attachment</assert>
      <assert id="ubl-CR-074" flag="warning" test="not(cac:ReceiptDocumentReference/cac:ValidityPeriod)">[ubl-CR-074]-A ubl invoice should not include the ReceiptDocumentReference ValidityPeriod</assert>
      <assert id="ubl-CR-075" flag="warning" test="not(cac:ReceiptDocumentReference/cac:IssuerParty)">[ubl-CR-075]-A ubl invoice should not include the ReceiptDocumentReference IssuerParty</assert>
      <assert id="ubl-CR-076" flag="warning" test="not(cac:ReceiptDocumentReference/cac:ResultOfVerification)">[ubl-CR-076]-A ubl invoice should not include the ReceiptDocumentReference ResultOfVerification</assert>
      <assert id="ubl-CR-077" flag="warning" test="not(cac:StatementDocumentReference)">[ubl-CR-077]-A ubl invoice should not include the StatementDocumentReference</assert>
      <assert id="ubl-CR-078" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:CopyIndicator)">[ubl-CR-078]-A ubl invoice should not include the OriginatorDocumentReference CopyIndicator</assert>
      <assert id="ubl-CR-079" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:UUID)">[ubl-CR-079]-A ubl invoice should not include the OriginatorDocumentReference UUID</assert>
      <assert id="ubl-CR-080" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:IssueDate)">[ubl-CR-080]-A ubl invoice should not include the OriginatorDocumentReference IssueDate</assert>
      <assert id="ubl-CR-081" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:IssueTime)">[ubl-CR-081]-A ubl invoice should not include the OriginatorDocumentReference IssueTime</assert>
      <assert id="ubl-CR-082" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:DocumentTypeCode)">[ubl-CR-082]-A ubl invoice should not include the OriginatorDocumentReference DocumentTypeCode</assert>
      <assert id="ubl-CR-083" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:DocumentType)">[ubl-CR-083]-A ubl invoice should not include the OriginatorDocumentReference DocumentType</assert>
      <assert id="ubl-CR-084" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:Xpath)">[ubl-CR-084]-A ubl invoice should not include the OriginatorDocumentReference Xpath</assert>
      <assert id="ubl-CR-085" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:LanguageID)">[ubl-CR-085]-A ubl invoice should not include the OriginatorDocumentReference LanguageID</assert>
      <assert id="ubl-CR-086" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:LocaleCode)">[ubl-CR-086]-A ubl invoice should not include the OriginatorDocumentReference LocaleCode</assert>
      <assert id="ubl-CR-087" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:VersionID)">[ubl-CR-087]-A ubl invoice should not include the OriginatorDocumentReference VersionID</assert>
      <assert id="ubl-CR-088" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:DocumentStatusCode)">[ubl-CR-088]-A ubl invoice should not include the OriginatorDocumentReference DocumentStatusCode</assert>
      <assert id="ubl-CR-089" flag="warning" test="not(cac:OriginatorDocumentReference/cbc:DocumentDescription)">[ubl-CR-089]-A ubl invoice should not include the OriginatorDocumentReference DocumentDescription</assert>
      <assert id="ubl-CR-090" flag="warning" test="not(cac:OriginatorDocumentReference/cac:Attachment)">[ubl-CR-090]-A ubl invoice should not include the OriginatorDocumentReference Attachment</assert>
      <assert id="ubl-CR-091" flag="warning" test="not(cac:OriginatorDocumentReference/cac:ValidityPeriod)">[ubl-CR-091]-A ubl invoice should not include the OriginatorDocumentReference ValidityPeriod</assert>
      <assert id="ubl-CR-092" flag="warning" test="not(cac:OriginatorDocumentReference/cac:IssuerParty)">[ubl-CR-092]-A ubl invoice should not include the OriginatorDocumentReference IssuerParty</assert>
      <assert id="ubl-CR-093" flag="warning" test="not(cac:OriginatorDocumentReference/cac:ResultOfVerification)">[ubl-CR-093]-A ubl invoice should not include the OriginatorDocumentReference ResultOfVerification</assert>
      <assert id="ubl-CR-094" flag="warning" test="not(cac:ContractDocumentReference/cbc:CopyIndicator)">[ubl-CR-094]-A ubl invoice should not include the ContractDocumentReference CopyIndicator</assert>
      <assert id="ubl-CR-095" flag="warning" test="not(cac:ContractDocumentReference/cbc:UUID)">[ubl-CR-095]-A ubl invoice should not include the ContractDocumentReference UUID</assert>
      <assert id="ubl-CR-096" flag="warning" test="not(cac:ContractDocumentReference/cbc:IssueDate)">[ubl-CR-096]-A ubl invoice should not include the ContractDocumentReference IssueDate</assert>
      <assert id="ubl-CR-097" flag="warning" test="not(cac:ContractDocumentReference/cbc:IssueTime)">[ubl-CR-097]-A ubl invoice should not include the ContractDocumentReference IssueTime</assert>
      <assert id="ubl-CR-098" flag="warning" test="not(cac:ContractDocumentReference/cbc:DocumentTypeCode)">[ubl-CR-098]-A ubl invoice should not include the ContractDocumentReference DocumentTypeCode</assert>
      <assert id="ubl-CR-099" flag="warning" test="not(cac:ContractDocumentReference/cbc:DocumentType)">[ubl-CR-099]-A ubl invoice should not include the ContractDocumentReference DocumentType</assert>
      <assert id="ubl-CR-100" flag="warning" test="not(cac:ContractDocumentReference/cbc:Xpath)">[ubl-CR-100]-A ubl invoice should not include the ContractDocumentReference Xpath</assert>
      <assert id="ubl-CR-101" flag="warning" test="not(cac:ContractDocumentReference/cbc:LanguageID)">[ubl-CR-101]-A ubl invoice should not include the ContractDocumentReference LanguageID</assert>
      <assert id="ubl-CR-102" flag="warning" test="not(cac:ContractDocumentReference/cbc:LocaleCode)">[ubl-CR-102]-A ubl invoice should not include the ContractDocumentReference LocaleCode</assert>
      <assert id="ubl-CR-103" flag="warning" test="not(cac:ContractDocumentReference/cbc:VersionID)">[ubl-CR-103]-A ubl invoice should not include the ContractDocumentReference VersionID</assert>
      <assert id="ubl-CR-104" flag="warning" test="not(cac:ContractDocumentReference/cbc:DocumentStatusCode)">[ubl-CR-104]-A ubl invoice should not include the ContractDocumentReference DocumentStatusCode</assert>
      <assert id="ubl-CR-105" flag="warning" test="not(cac:ContractDocumentReference/cbc:DocumentDescription)">[ubl-CR-105]-A ubl invoice should not include the ContractDocumentReference DocumentDescription</assert>
      <assert id="ubl-CR-106" flag="warning" test="not(cac:ContractDocumentReference/cac:Attachment)">[ubl-CR-106]-A ubl invoice should not include the ContractDocumentReference Attachment</assert>
      <assert id="ubl-CR-107" flag="warning" test="not(cac:ContractDocumentReference/cac:ValidityPeriod)">[ubl-CR-107]-A ubl invoice should not include the ContractDocumentReference ValidityPeriod</assert>
      <assert id="ubl-CR-108" flag="warning" test="not(cac:ContractDocumentReference/cac:IssuerParty)">[ubl-CR-108]-A ubl invoice should not include the ContractDocumentReference IssuerParty</assert>
      <assert id="ubl-CR-109" flag="warning" test="not(cac:ContractDocumentReference/cac:ResultOfVerification)">[ubl-CR-109]-A ubl invoice should not include the ContractDocumentReference ResultOfVerification</assert>
      <assert id="ubl-CR-110" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:CopyIndicator)">[ubl-CR-110]-A ubl invoice should not include the AdditionalDocumentReference CopyIndicator</assert>
      <assert id="ubl-CR-111" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:UUID)">[ubl-CR-111]-A ubl invoice should not include the AdditionalDocumentReference UUID</assert>
      <assert id="ubl-CR-112" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:IssueDate)">[ubl-CR-112]-A ubl invoice should not include the AdditionalDocumentReference IssueDate</assert>
      <assert id="ubl-CR-113" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:IssueTime)">[ubl-CR-113]-A ubl invoice should not include the AdditionalDocumentReference IssueTime</assert>
      <assert id="ubl-CR-114" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:DocumentType)">[ubl-CR-114]-A ubl invoice should not include the AdditionalDocumentReference DocumentType</assert>
      <assert id="ubl-CR-115" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:Xpath)">[ubl-CR-115]-A ubl invoice should not include the AdditionalDocumentReference Xpath</assert>
      <assert id="ubl-CR-116" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:LanguageID)">[ubl-CR-116]-A ubl invoice should not include the AdditionalDocumentReference LanguageID</assert>
      <assert id="ubl-CR-117" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:LocaleCode)">[ubl-CR-117]-A ubl invoice should not include the AdditionalDocumentReference LocaleCode</assert>
      <assert id="ubl-CR-118" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:VersionID)">[ubl-CR-118]-A ubl invoice should not include the AdditionalDocumentReference VersionID</assert>
      <assert id="ubl-CR-119" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:DocumentStatusCode)">[ubl-CR-119]-A ubl invoice should not include the AdditionalDocumentReference DocumentStatusCode</assert>
      <assert id="ubl-CR-121" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash)">[ubl-CR-121]-A ubl invoice should not include the AdditionalDocumentReference Attachment External DocumentHash</assert>
      <assert id="ubl-CR-122" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod)">[ubl-CR-122]-A ubl invoice should not include the AdditionalDocumentReference Attachment External HashAlgorithmMethod</assert>
      <assert id="ubl-CR-123" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate)">[ubl-CR-123]-A ubl invoice should not include the AdditionalDocumentReference Attachment External ExpiryDate</assert>
      <assert id="ubl-CR-124" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime)">[ubl-CR-124]-A ubl invoice should not include the AdditionalDocumentReference Attachment External ExpiryTime</assert>
      <assert id="ubl-CR-125" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode)">[ubl-CR-125]-A ubl invoice should not include the AdditionalDocumentReference Attachment External MimeCode</assert>
      <assert id="ubl-CR-126" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode)">[ubl-CR-126]-A ubl invoice should not include the AdditionalDocumentReference Attachment External FormatCode</assert>
      <assert id="ubl-CR-127" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode)">[ubl-CR-127]-A ubl invoice should not include the AdditionalDocumentReference Attachment External EncodingCode</assert>
      <assert id="ubl-CR-128" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode)">[ubl-CR-128]-A ubl invoice should not include the AdditionalDocumentReference Attachment External CharacterSetCode</assert>
      <assert id="ubl-CR-129" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName)">[ubl-CR-129]-A ubl invoice should not include the AdditionalDocumentReference Attachment External FileName</assert>
      <assert id="ubl-CR-130" flag="warning" test="not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description)">[ubl-CR-130]-A ubl invoice should not include the AdditionalDocumentReference Attachment External Descriprion</assert>
      <assert id="ubl-CR-131" flag="warning" test="not(cac:AdditionalDocumentReference/cac:ValidityPeriod)">[ubl-CR-131]-A ubl invoice should not include the AdditionalDocumentReference ValidityPeriod</assert>
      <assert id="ubl-CR-132" flag="warning" test="not(cac:AdditionalDocumentReference/cac:IssuerParty)">[ubl-CR-132]-A ubl invoice should not include the AdditionalDocumentReference IssuerParty</assert>
      <assert id="ubl-CR-133" flag="warning" test="not(cac:AdditionalDocumentReference/cac:ResultOfVerification)">[ubl-CR-133]-A ubl invoice should not include the AdditionalDocumentReference ResultOfVerification</assert>
      <assert id="ubl-CR-134" flag="warning" test="not(cac:ProjectReference/cbc:UUID)">[ubl-CR-134]-A ubl invoice should not include the ProjectReference UUID</assert>
      <assert id="ubl-CR-135" flag="warning" test="not(cac:ProjectReference/cbc:IssueDate)">[ubl-CR-135]-A ubl invoice should not include the ProjectReference IssueDate</assert>
      <assert id="ubl-CR-136" flag="warning" test="not(cac:ProjectReference/cac:WorkPhaseReference)">[ubl-CR-136]-A ubl invoice should not include the ProjectReference WorkPhaseReference</assert>
      <assert id="ubl-CR-137" flag="warning" test="not(cac:Signature)">[ubl-CR-137]-A ubl invoice should not include the Signature</assert>
      <assert id="ubl-CR-138" flag="warning" test="not(cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID)">[ubl-CR-138]-A ubl invoice should not include the AccountingSupplierParty CustomerAssignedAccountID</assert>
      <assert id="ubl-CR-139" flag="warning" test="not(cac:AccountingSupplierParty/cbc:AdditionalAccountID)">[ubl-CR-139]-A ubl invoice should not include the AccountingSupplierParty AdditionalAccountID</assert>
      <assert id="ubl-CR-140" flag="warning" test="not(cac:AccountingSupplierParty/cbc:DataSendingCapability)">[ubl-CR-140]-A ubl invoice should not include the AccountingSupplierParty DataSendingCapability</assert>
      <assert id="ubl-CR-141" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cbc:MarkCareIndicator)">[ubl-CR-141]-A ubl invoice should not include the AccountingSupplierParty Party MarkCareIndicator</assert>
      <assert id="ubl-CR-142" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cbc:MarkAttentionIndicator)">[ubl-CR-142]-A ubl invoice should not include the AccountingSupplierParty Party MarkAttentionIndicator</assert>
      <assert id="ubl-CR-143" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI)">[ubl-CR-143]-A ubl invoice should not include the AccountingSupplierParty Party WebsiteURI</assert>
      <assert id="ubl-CR-144" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cbc:LogoReferenceID)">[ubl-CR-144]-A ubl invoice should not include the AccountingSupplierParty Party LogoReferenceID</assert>
      <assert id="ubl-CR-145" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cbc:IndustryClassificationCode)">[ubl-CR-145]-A ubl invoice should not include the AccountingSupplierParty Party IndustryClassificationCode</assert>
      <assert id="ubl-CR-146" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:Language)">[ubl-CR-146]-A ubl invoice should not include the AccountingSupplierParty Party Language</assert>
      <assert id="ubl-CR-147" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID)">[ubl-CR-147]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress ID</assert>
      <assert id="ubl-CR-148" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode)">[ubl-CR-148]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress AddressTypeCode</assert>
      <assert id="ubl-CR-149" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode)">[ubl-CR-149]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress AddressFormatCode</assert>
      <assert id="ubl-CR-150" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox)">[ubl-CR-150]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress Postbox</assert>
      <assert id="ubl-CR-151" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor)">[ubl-CR-151]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress Floor</assert>
      <assert id="ubl-CR-152" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Room)">[ubl-CR-152]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress Room</assert>
      <assert id="ubl-CR-153" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName)">[ubl-CR-153]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress BlockName</assert>
      <assert id="ubl-CR-154" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName)">[ubl-CR-154]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress BuildingName</assert>
      <assert id="ubl-CR-155" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber)">[ubl-CR-155]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress BuildingNumber</assert>
      <assert id="ubl-CR-156" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail)">[ubl-CR-156]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress InhouseMail</assert>
      <assert id="ubl-CR-157" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Department)">[ubl-CR-157]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress Department</assert>
      <assert id="ubl-CR-158" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention)">[ubl-CR-158]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress MarkAttention</assert>
      <assert id="ubl-CR-159" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare)">[ubl-CR-159]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress MarkCare</assert>
      <assert id="ubl-CR-160" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification)">[ubl-CR-160]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress PlotIdentification</assert>
      <assert id="ubl-CR-161" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)">[ubl-CR-161]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress CitySubdivisionName</assert>
      <assert id="ubl-CR-162" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode)">[ubl-CR-162]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress CountrySubentityCode</assert>
      <assert id="ubl-CR-163" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Region)">[ubl-CR-163]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress Region</assert>
      <assert id="ubl-CR-164" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District)">[ubl-CR-164]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress District</assert>
      <assert id="ubl-CR-165" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset)">[ubl-CR-165]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress TimezoneOffset</assert>
      <assert id="ubl-CR-166" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name)">[ubl-CR-166]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress Country Name</assert>
      <assert id="ubl-CR-167" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate)">[ubl-CR-167]-A ubl invoice should not include the AccountingSupplierParty Party PostalAddress LocationCoordinate</assert>
      <assert id="ubl-CR-168" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PhysicalLocation)">[ubl-CR-168]-A ubl invoice should not include the AccountingSupplierParty Party PhysicalLocation</assert>
      <assert id="ubl-CR-169" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)">[ubl-CR-169]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme RegistrationName</assert>
      <assert id="ubl-CR-170" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)">[ubl-CR-170]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxLevelCode</assert>
      <assert id="ubl-CR-171" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)">[ubl-CR-171]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme ExemptionReasonCode</assert>
      <assert id="ubl-CR-172" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason)">[ubl-CR-172]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme ExemptionReason</assert>
      <assert id="ubl-CR-173" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)">[ubl-CR-173]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme RegistrationAddress</assert>
      <assert id="ubl-CR-174" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)">[ubl-CR-174]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme Name</assert>
      <assert id="ubl-CR-175" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)">[ubl-CR-175]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme TaxTypeCode</assert>
      <assert id="ubl-CR-176" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)">[ubl-CR-176]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme CurrencyCode</assert>
      <assert id="ubl-CR-177" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)">[ubl-CR-177]-A ubl invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme JurisdictionRegionAddress</assert>
      <assert id="ubl-CR-178" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate)">[ubl-CR-178]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationDate</assert>
      <assert id="ubl-CR-179" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate)">[ubl-CR-179]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationExpirationDate</assert>
      <assert id="ubl-CR-180" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode)">[ubl-CR-180]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity CompanyLegalFormCode</assert>
      <assert id="ubl-CR-181" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator)">[ubl-CR-181]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity SoleProprietorshipIndicator</assert>
      <assert id="ubl-CR-182" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode)">[ubl-CR-182]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity CompanyLiquidationStatusCode</assert>
      <assert id="ubl-CR-183" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporationStockAmount)">[ubl-CR-183]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity CorporationStockAmount</assert>
      <assert id="ubl-CR-184" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator)">[ubl-CR-184]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity FullyPaidSharesIndicator</assert>
      <assert id="ubl-CR-185" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress)">[ubl-CR-185]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationAddress</assert>
      <assert id="ubl-CR-186" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)">[ubl-CR-186]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity CorporateRegistrationScheme</assert>
      <assert id="ubl-CR-187" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadOfficeParty)">[ubl-CR-187]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity HeadOfficeParty</assert>
      <assert id="ubl-CR-188" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty)">[ubl-CR-188]-A ubl invoice should not include the AccountingSupplierParty Party PartyLegalEntity ShareholderParty</assert>
      <assert id="ubl-CR-189" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID)">[ubl-CR-189]-A ubl invoice should not include the AccountingSupplierParty Party Contact ID</assert>
      <assert id="ubl-CR-190" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax)">[ubl-CR-190]-A ubl invoice should not include the AccountingSupplierParty Party Contact Telefax</assert>
      <assert id="ubl-CR-191" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Note)">[ubl-CR-191]-A ubl invoice should not include the AccountingSupplierParty Party Contact Note</assert>
      <assert id="ubl-CR-192" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication)">[ubl-CR-192]-A ubl invoice should not include the AccountingSupplierParty Party Contact OtherCommunication</assert>
      <assert id="ubl-CR-193" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:Person)">[ubl-CR-193]-A ubl invoice should not include the AccountingSupplierParty Party Person</assert>
      <assert id="ubl-CR-194" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:AgentParty)">[ubl-CR-194]-A ubl invoice should not include the AccountingSupplierParty Party AgentParty</assert>
      <assert id="ubl-CR-195" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:ServiceProviderParty)">[ubl-CR-195]-A ubl invoice should not include the AccountingSupplierParty Party ServiceProviderParty</assert>
      <assert id="ubl-CR-196" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:PowerOfAttorney)">[ubl-CR-196]-A ubl invoice should not include the AccountingSupplierParty Party PowerOfAttorney</assert>
      <assert id="ubl-CR-197" flag="warning" test="not(cac:AccountingSupplierParty/cac:Party/cac:FinancialAccount)">[ubl-CR-197]-A ubl invoice should not include the AccountingSupplierParty Party FinancialAccount</assert>
      <assert id="ubl-CR-198" flag="warning" test="not(cac:AccountingSupplierParty/cac:DespatchContact)">[ubl-CR-198]-A ubl invoice should not include the AccountingSupplierParty DespatchContact</assert>
      <assert id="ubl-CR-199" flag="warning" test="not(cac:AccountingSupplierParty/cac:AccountingContact)">[ubl-CR-199]-A ubl invoice should not include the AccountingSupplierParty AccountingContact</assert>
      <assert id="ubl-CR-200" flag="warning" test="not(cac:AccountingSupplierParty/cac:SellerContact)">[ubl-CR-200]-A ubl invoice should not include the AccountingSupplierParty SellerContact</assert>
      <assert id="ubl-CR-201" flag="warning" test="not(cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID)">[ubl-CR-201]-A ubl invoice should not include the AccountingCustomerParty CustomerAssignedAccountID</assert>
      <assert id="ubl-CR-202" flag="warning" test="not(cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID)">[ubl-CR-202]-A ubl invoice should not include the AccountingCustomerParty SupplierAssignedAccountID</assert>
      <assert id="ubl-CR-203" flag="warning" test="not(cac:AccountingCustomerParty/cbc:AdditionalAccountID)">[ubl-CR-203]-A ubl invoice should not include the AccountingCustomerParty AdditionalAccountID</assert>
      <assert id="ubl-CR-204" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator)">[ubl-CR-204]-A ubl invoice should not include the AccountingCustomerParty Party MarkCareIndicator</assert>
      <assert id="ubl-CR-205" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator)">[ubl-CR-205]-A ubl invoice should not include the AccountingCustomerParty Party MarkAttentionIndicator</assert>
      <assert id="ubl-CR-206" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI)">[ubl-CR-206]-A ubl invoice should not include the AccountingCustomerParty Party WebsiteURI</assert>
      <assert id="ubl-CR-207" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID)">[ubl-CR-207]-A ubl invoice should not include the AccountingCustomerParty Party LogoReferenceID</assert>
      <assert id="ubl-CR-208" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cbc:IndustryClassificationCode)">[ubl-CR-208]-A ubl invoice should not include the AccountingCustomerParty Party IndustryClassificationCode</assert>
      <assert id="ubl-CR-209" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:Language)">[ubl-CR-209]-A ubl invoice should not include the AccountingCustomerParty Party Language</assert>
      <assert id="ubl-CR-210" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID)">[ubl-CR-210]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress ID</assert>
      <assert id="ubl-CR-211" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode)">[ubl-CR-211]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress AddressTypeCode</assert>
      <assert id="ubl-CR-212" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode)">[ubl-CR-212]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress AddressFormatCode</assert>
      <assert id="ubl-CR-213" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox)">[ubl-CR-213]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress Postbox</assert>
      <assert id="ubl-CR-214" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor)">[ubl-CR-214]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress Floor</assert>
      <assert id="ubl-CR-215" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room)">[ubl-CR-215]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress Room</assert>
      <assert id="ubl-CR-216" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName)">[ubl-CR-216]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress BlockName</assert>
      <assert id="ubl-CR-217" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName)">[ubl-CR-217]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress BuildingName</assert>
      <assert id="ubl-CR-218" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber)">[ubl-CR-218]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress BuildingNumber</assert>
      <assert id="ubl-CR-219" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail)">[ubl-CR-219]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress InhouseMail</assert>
      <assert id="ubl-CR-220" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Department)">[ubl-CR-220]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress Department</assert>
      <assert id="ubl-CR-221" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention)">[ubl-CR-221]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress MarkAttention</assert>
      <assert id="ubl-CR-222" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare)">[ubl-CR-222]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress MarkCare</assert>
      <assert id="ubl-CR-223" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification)">[ubl-CR-223]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress PlotIdentification</assert>
      <assert id="ubl-CR-224" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)">[ubl-CR-224]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress CitySubdivisionName</assert>
      <assert id="ubl-CR-225" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode)">[ubl-CR-225]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress CountrySubentityCode</assert>
      <assert id="ubl-CR-226" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region)">[ubl-CR-226]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress Region</assert>
      <assert id="ubl-CR-227" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District)">[ubl-CR-227]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress District</assert>
      <assert id="ubl-CR-228" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset)">[ubl-CR-228]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress TimezoneOffset</assert>
      <assert id="ubl-CR-229" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name)">[ubl-CR-229]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress Country Name</assert>
      <assert id="ubl-CR-230" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate)">[ubl-CR-230]-A ubl invoice should not include the AccountingCustomerParty Party PostalAddress LocationCoordinate</assert>
      <assert id="ubl-CR-231" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation)">[ubl-CR-231]-A ubl invoice should not include the AccountingCustomerParty Party PhysicalLocation</assert>
      <assert id="ubl-CR-232" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)">[ubl-CR-232]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme RegistrationName</assert>
      <assert id="ubl-CR-233" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)">[ubl-CR-233]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxLevelCode</assert>
      <assert id="ubl-CR-234" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)">[ubl-CR-234]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme ExemptionReasonCode</assert>
      <assert id="ubl-CR-235" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason)">[ubl-CR-235]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme ExemptionReason</assert>
      <assert id="ubl-CR-236" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)">[ubl-CR-236]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme RegistrationAddress</assert>
      <assert id="ubl-CR-237" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)">[ubl-CR-237]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme Name</assert>
      <assert id="ubl-CR-238" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)">[ubl-CR-238]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme TaxTypeCode</assert>
      <assert id="ubl-CR-239" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)">[ubl-CR-239]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme CurrencyCode</assert>
      <assert id="ubl-CR-240" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)">[ubl-CR-240]-A ubl invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme JurisdictionRegionAddress</assert>
      <assert id="ubl-CR-241" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate)">[ubl-CR-241]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationDate</assert>
      <assert id="ubl-CR-242" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate)">[ubl-CR-242]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationExpirationDate</assert>
      <assert id="ubl-CR-243" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode)">[ubl-CR-243]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLegalFormCode</assert>
      <assert id="ubl-CR-244" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm)">[ubl-CR-244]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLegalForm</assert>
      <assert id="ubl-CR-245" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator)">[ubl-CR-245]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity SoleProprietorshipIndicator</assert>
      <assert id="ubl-CR-246" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode)">[ubl-CR-246]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLiquidationStatusCode</assert>
      <assert id="ubl-CR-247" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporationStockAmount)">[ubl-CR-247]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity CorporationStockAmount</assert>
      <assert id="ubl-CR-248" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator)">[ubl-CR-248]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity FullyPaidSharesIndicator</assert>
      <assert id="ubl-CR-249" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress)">[ubl-CR-249]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationAddress</assert>
      <assert id="ubl-CR-250" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)">[ubl-CR-250]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity CorporateRegistrationScheme</assert>
      <assert id="ubl-CR-251" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadOfficeParty)">[ubl-CR-251]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity HeadOfficeParty</assert>
      <assert id="ubl-CR-252" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty)">[ubl-CR-252]-A ubl invoice should not include the AccountingCustomerParty Party PartyLegalEntity ShareholderParty</assert>
      <assert id="ubl-CR-253" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID)">[ubl-CR-253]-A ubl invoice should not include the AccountingCustomerParty Party Contact ID</assert>
      <assert id="ubl-CR-254" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax)">[ubl-CR-254]-A ubl invoice should not include the AccountingCustomerParty Party Contact Telefax</assert>
      <assert id="ubl-CR-255" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note)">[ubl-CR-255]-A ubl invoice should not include the AccountingCustomerParty Party Contact Note</assert>
      <assert id="ubl-CR-256" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication)">[ubl-CR-256]-A ubl invoice should not include the AccountingCustomerParty Party Contact OtherCommunication</assert>
      <assert id="ubl-CR-257" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:Person)">[ubl-CR-257]-A ubl invoice should not include the AccountingCustomerParty Party Person</assert>
      <assert id="ubl-CR-258" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:AgentParty)">[ubl-CR-258]-A ubl invoice should not include the AccountingCustomerParty Party AgentParty</assert>
      <assert id="ubl-CR-259" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:ServiceProviderParty)">[ubl-CR-259]-A ubl invoice should not include the AccountingCustomerParty Party ServiceProviderParty</assert>
      <assert id="ubl-CR-260" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:PowerOfAttorney)">[ubl-CR-260]-A ubl invoice should not include the AccountingCustomerParty Party PowerOfAttorney</assert>
      <assert id="ubl-CR-261" flag="warning" test="not(cac:AccountingCustomerParty/cac:Party/cac:FinancialAccount)">[ubl-CR-261]-A ubl invoice should not include the AccountingCustomerParty Party FinancialAccount</assert>
      <assert id="ubl-CR-262" flag="warning" test="not(cac:AccountingCustomerParty/cac:DeliveryContact)">[ubl-CR-262]-A ubl invoice should not include the AccountingCustomerParty DeliveryContact</assert>
      <assert id="ubl-CR-263" flag="warning" test="not(cac:AccountingCustomerParty/cac:AccountingContact)">[ubl-CR-263]-A ubl invoice should not include the AccountingCustomerParty AccountingContact</assert>
      <assert id="ubl-CR-264" flag="warning" test="not(cac:AccountingCustomerParty/cac:BuyerContact)">[ubl-CR-264]-A ubl invoice should not include the AccountingCustomerParty BuyerContact</assert>
      <assert id="ubl-CR-265" flag="warning" test="not(cac:PayeeParty/cbc:MarkCareIndicator)">[ubl-CR-265]-A ubl invoice should not include the PayeeParty MarkCareIndicator</assert>
      <assert id="ubl-CR-266" flag="warning" test="not(cac:PayeeParty/cbc:MarkAttentionIndicator)">[ubl-CR-266]-A ubl invoice should not include the PayeeParty MarkAttentionIndicator</assert>
      <assert id="ubl-CR-267" flag="warning" test="not(cac:PayeeParty/cbc:WebsiteURI)">[ubl-CR-267]-A ubl invoice should not include the PayeeParty WebsiteURI</assert>
      <assert id="ubl-CR-268" flag="warning" test="not(cac:PayeeParty/cbc:LogoReferenceID)">[ubl-CR-268]-A ubl invoice should not include the PayeeParty LogoReferenceID</assert>
      <assert id="ubl-CR-269" flag="warning" test="not(cac:PayeeParty/cbc:EndpointID)">[ubl-CR-269]-A ubl invoice should not include the PayeeParty EndpointID</assert>
      <assert id="ubl-CR-270" flag="warning" test="not(cac:PayeeParty/cbc:IndustryClassificationCode)">[ubl-CR-270]-A ubl invoice should not include the PayeeParty IndustryClassificationCode</assert>
      <assert id="ubl-CR-271" flag="warning" test="not(cac:PayeeParty/cac:Language)">[ubl-CR-271]-A ubl invoice should not include the PayeeParty Language</assert>
      <assert id="ubl-CR-272" flag="warning" test="not(cac:PayeeParty/cac:PostalAddress)">[ubl-CR-272]-A ubl invoice should not include the PayeeParty PostalAddress</assert>
      <assert id="ubl-CR-273" flag="warning" test="not(cac:PayeeParty/cac:PhysicalLocation)">[ubl-CR-273]-A ubl invoice should not include the PayeeParty PhysicalLocation</assert>
      <assert id="ubl-CR-274" flag="warning" test="not(cac:PayeeParty/cac:PartyTaxScheme)">[ubl-CR-274]-A ubl invoice should not include the PayeeParty PartyTaxScheme</assert>
      <assert id="ubl-CR-275" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName)">[ubl-CR-275]-A ubl invoice should not include the PayeeParty PartyLegalEntity RegistrationName</assert>
      <assert id="ubl-CR-276" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate)">[ubl-CR-276]-A ubl invoice should not include the PayeeParty PartyLegalEntity RegistrationDate</assert>
      <assert id="ubl-CR-277" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate)">[ubl-CR-277]-A ubl invoice should not include the PayeeParty PartyLegalEntity RegistrationExpirationDate</assert>
      <assert id="ubl-CR-278" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode)">[ubl-CR-278]-A ubl invoice should not include the PayeeParty PartyLegalEntity CompanyLegalFormCode</assert>
      <assert id="ubl-CR-279" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalForm)">[ubl-CR-279]-A ubl invoice should not include the PayeeParty PartyLegalEntity CompanyLegalForm</assert>
      <assert id="ubl-CR-280" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator)">[ubl-CR-280]-A ubl invoice should not include the PayeeParty PartyLegalEntity SoleProprietorshipIndicator</assert>
      <assert id="ubl-CR-281" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode)">[ubl-CR-281]-A ubl invoice should not include the PayeeParty PartyLegalEntity CompanyLiquidationStatusCode</assert>
      <assert id="ubl-CR-282" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporationStockAmount)">[ubl-CR-282]-A ubl invoice should not include the PayeeParty PartyLegalEntity CorporationStockAmount</assert>
      <assert id="ubl-CR-283" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator)">[ubl-CR-283]-A ubl invoice should not include the PayeeParty PartyLegalEntity FullyPaidSharesIndicator</assert>
      <assert id="ubl-CR-284" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress)">[ubl-CR-284]-A ubl invoice should not include the PayeeParty PartyLegalEntity RegistrationAddress</assert>
      <assert id="ubl-CR-285" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)">[ubl-CR-285]-A ubl invoice should not include the PayeeParty PartyLegalEntity CorporateRegistrationScheme</assert>
      <assert id="ubl-CR-286" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cac:HeadOfficeParty)">[ubl-CR-286]-A ubl invoice should not include the PayeeParty PartyLegalEntity HeadOfficeParty</assert>
      <assert id="ubl-CR-287" flag="warning" test="not(cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty)">[ubl-CR-287]-A ubl invoice should not include the PayeeParty PartyLegalEntity ShareholderParty</assert>
      <assert id="ubl-CR-288" flag="warning" test="not(cac:PayeeParty/cac:Contact)">[ubl-CR-288]-A ubl invoice should not include the PayeeParty Contact</assert>
      <assert id="ubl-CR-289" flag="warning" test="not(cac:PayeeParty/cac:Person)">[ubl-CR-289]-A ubl invoice should not include the PayeeParty Person</assert>
      <assert id="ubl-CR-290" flag="warning" test="not(cac:PayeeParty/cac:AgentParty)">[ubl-CR-290]-A ubl invoice should not include the PayeeParty AgentParty</assert>
      <assert id="ubl-CR-291" flag="warning" test="not(cac:PayeeParty/cac:ServiceProviderParty)">[ubl-CR-291]-A ubl invoice should not include the PayeeParty ServiceProviderParty</assert>
      <assert id="ubl-CR-292" flag="warning" test="not(cac:PayeeParty/cac:PowerOfAttorney)">[ubl-CR-292]-A ubl invoice should not include the PayeeParty PowerOfAttorney</assert>
      <assert id="ubl-CR-293" flag="warning" test="not(cac:PayeeParty/cac:FinancialAccount)">[ubl-CR-293]-A ubl invoice should not include the PayeeParty FinancialAccount</assert>
      <assert id="ubl-CR-294" flag="warning" test="not(cac:BuyerCustomerParty)">[ubl-CR-294]-A ubl invoice should not include the BuyerCustomerParty</assert>
      <assert id="ubl-CR-295" flag="warning" test="not(cac:SellerCustomerParty)">[ubl-CR-295]-A ubl invoice should not include the SellerCustomerParty</assert>
      <assert id="ubl-CR-296" flag="warning" test="not(cac:TaxRepresentativeParty/cbc:MarkCareIndicator)">[ubl-CR-296]-A ubl invoice should not include the TaxRepresentativeParty MarkCareIndicator</assert>
      <assert id="ubl-CR-297" flag="warning" test="not(cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator)">[ubl-CR-297]-A ubl invoice should not include the TaxRepresentativeParty MarkAttentionIndicator</assert>
      <assert id="ubl-CR-298" flag="warning" test="not(cac:TaxRepresentativeParty/cbc:WebsiteURI)">[ubl-CR-298]-A ubl invoice should not include the TaxRepresentativeParty WebsiteURI</assert>
      <assert id="ubl-CR-299" flag="warning" test="not(cac:TaxRepresentativeParty/cbc:LogoReferenceID)">[ubl-CR-299]-A ubl invoice should not include the TaxRepresentativeParty LogoReferenceID</assert>
      <assert id="ubl-CR-300" flag="warning" test="not(cac:TaxRepresentativeParty/cbc:EndpointID)">[ubl-CR-300]-A ubl invoice should not include the TaxRepresentativeParty EndpointID</assert>
      <assert id="ubl-CR-301" flag="warning" test="not(cac:TaxRepresentativeParty/cbc:IndustryClassificationCode)">[ubl-CR-301]-A ubl invoice should not include the TaxRepresentativeParty IndustryClassificationCode</assert>
      <assert id="ubl-CR-302" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyIdentification)">[ubl-CR-302]-A ubl invoice should not include the TaxRepresentativeParty PartyIdentification</assert>
      <assert id="ubl-CR-303" flag="warning" test="not(cac:TaxRepresentativeParty/cac:Language)">[ubl-CR-303]-A ubl invoice should not include the TaxRepresentativeParty Language</assert>
      <assert id="ubl-CR-304" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:ID)">[ubl-CR-304]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress ID</assert>
      <assert id="ubl-CR-305" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AddressTypeCode)">[ubl-CR-305]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress AddressTypeCode</assert>
      <assert id="ubl-CR-306" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AddressFormatCode)">[ubl-CR-306]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress AddressFormatCode</assert>
      <assert id="ubl-CR-307" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Postbox)">[ubl-CR-307]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress Postbox</assert>
      <assert id="ubl-CR-308" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Floor)">[ubl-CR-308]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress Floor</assert>
      <assert id="ubl-CR-309" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Room)">[ubl-CR-309]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress Room</assert>
      <assert id="ubl-CR-310" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BlockName)">[ubl-CR-310]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress BlockName</assert>
      <assert id="ubl-CR-311" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BuildingName)">[ubl-CR-311]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress BuildingName</assert>
      <assert id="ubl-CR-312" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BuildingNumber)">[ubl-CR-312]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress BuildingNumber</assert>
      <assert id="ubl-CR-313" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:InhouseMail)">[ubl-CR-313]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress InhouseMail</assert>
      <assert id="ubl-CR-314" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Department)">[ubl-CR-314]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress Department</assert>
      <assert id="ubl-CR-315" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:MarkAttention)">[ubl-CR-315]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress MarkAttention</assert>
      <assert id="ubl-CR-316" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:MarkCare)">[ubl-CR-316]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress MarkCare</assert>
      <assert id="ubl-CR-317" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:PlotIdentification)">[ubl-CR-317]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress PlotIdentification</assert>
      <assert id="ubl-CR-318" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CitySubdivisionName)">[ubl-CR-318]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress CitySubdivisionName</assert>
      <assert id="ubl-CR-319" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CountrySubentityCode)">[ubl-CR-319]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress CountrySubentityCode</assert>
      <assert id="ubl-CR-320" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Region)">[ubl-CR-320]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress Region</assert>
      <assert id="ubl-CR-321" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:District)">[ubl-CR-321]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress District</assert>
      <assert id="ubl-CR-322" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:TimezoneOffset)">[ubl-CR-322]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress TimezoneOffset</assert>
      <assert id="ubl-CR-323" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country/cbc:Name)">[ubl-CR-323]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress Country Name</assert>
      <assert id="ubl-CR-324" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PostalAddress/cac:LocationCoordinate)">[ubl-CR-324]-A ubl invoice should not include the TaxRepresentativeParty PostalAddress LocationCoordinate</assert>
      <assert id="ubl-CR-325" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PhysicalLocation)">[ubl-CR-325]-A ubl invoice should not include the TaxRepresentativeParty PhysicalLocation</assert>
      <assert id="ubl-CR-326" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName)">[ubl-CR-326]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme RegistrationName</assert>
      <assert id="ubl-CR-327" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode)">[ubl-CR-327]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxLevelCode</assert>
      <assert id="ubl-CR-328" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode)">[ubl-CR-328]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme ExemptionReasonCode</assert>
      <assert id="ubl-CR-329" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason)">[ubl-CR-329]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme ExemptionReason</assert>
      <assert id="ubl-CR-330" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress)">[ubl-CR-330]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme RegistrationAddress</assert>
      <assert id="ubl-CR-331" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)">[ubl-CR-331]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme Name</assert>
      <assert id="ubl-CR-332" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)">[ubl-CR-332]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme TaxTypeCode</assert>
      <assert id="ubl-CR-333" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)">[ubl-CR-333]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme CurrencyCode</assert>
      <assert id="ubl-CR-334" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)">[ubl-CR-334]-A ubl invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme JurisdictionRegionAddress</assert>
      <assert id="ubl-CR-335" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PartyLegalEntity)">[ubl-CR-335]-A ubl invoice should not include the TaxRepresentativeParty PartyLegalEntity</assert>
      <assert id="ubl-CR-336" flag="warning" test="not(cac:TaxRepresentativeParty/cac:Contact)">[ubl-CR-336]-A ubl invoice should not include the TaxRepresentativeParty Contact</assert>
      <assert id="ubl-CR-337" flag="warning" test="not(cac:TaxRepresentativeParty/cac:Person)">[ubl-CR-337]-A ubl invoice should not include the TaxRepresentativeParty Person</assert>
      <assert id="ubl-CR-338" flag="warning" test="not(cac:TaxRepresentativeParty/cac:AgentParty)">[ubl-CR-338]-A ubl invoice should not include the TaxRepresentativeParty AgentParty</assert>
      <assert id="ubl-CR-339" flag="warning" test="not(cac:TaxRepresentativeParty/cac:ServiceProviderParty)">[ubl-CR-339]-A ubl invoice should not include the TaxRepresentativeParty ServiceProviderParty</assert>
      <assert id="ubl-CR-340" flag="warning" test="not(cac:TaxRepresentativeParty/cac:PowerOfAttorney)">[ubl-CR-340]-A ubl invoice should not include the TaxRepresentativeParty PowerOfAttorney</assert>
      <assert id="ubl-CR-341" flag="warning" test="not(cac:TaxRepresentativeParty/cac:FinancialAccount)">[ubl-CR-341]-A ubl invoice should not include the TaxRepresentativeParty FinancialAccount</assert>
      <assert id="ubl-CR-342" flag="warning" test="not(cac:Delivery/cbc:ID)">[ubl-CR-342]-A ubl invoice should not include the Delivery ID</assert>
      <assert id="ubl-CR-343" flag="warning" test="not(cac:Delivery/cbc:Quantity)">[ubl-CR-343]-A ubl invoice should not include the Delivery Quantity</assert>
      <assert id="ubl-CR-344" flag="warning" test="not(cac:Delivery/cbc:MinimumQuantity)">[ubl-CR-344]-A ubl invoice should not include the Delivery MinimumQuantity</assert>
      <assert id="ubl-CR-345" flag="warning" test="not(cac:Delivery/cbc:MaximumQuantity)">[ubl-CR-345]-A ubl invoice should not include the Delivery MaximumQuantity</assert>
      <assert id="ubl-CR-346" flag="warning" test="not(cac:Delivery/cbc:ActualDeliveryTime)">[ubl-CR-346]-A ubl invoice should not include the Delivery ActualDeliveryTime</assert>
      <assert id="ubl-CR-347" flag="warning" test="not(cac:Delivery/cbc:LatestDeliveryDate)">[ubl-CR-347]-A ubl invoice should not include the Delivery LatestDeliveryDate</assert>
      <assert id="ubl-CR-348" flag="warning" test="not(cac:Delivery/cbc:LatestDeliveryTime)">[ubl-CR-348]-A ubl invoice should not include the Delivery LatestDeliveryTime</assert>
      <assert id="ubl-CR-349" flag="warning" test="not(cac:Delivery/cbc:ReleaseID)">[ubl-CR-349]-A ubl invoice should not include the Delivery ReleaseID</assert>
      <assert id="ubl-CR-350" flag="warning" test="not(cac:Delivery/cbc:TrackingID)">[ubl-CR-350]-A ubl invoice should not include the Delivery TrackingID</assert>
      <assert id="ubl-CR-351" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cbc:Description)">[ubl-CR-351]-A ubl invoice should not include the Delivery DeliveryLocation Description</assert>
      <assert id="ubl-CR-352" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cbc:Conditions)">[ubl-CR-352]-A ubl invoice should not include the Delivery DeliveryLocation Conditions</assert>
      <assert id="ubl-CR-353" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity)">[ubl-CR-353]-A ubl invoice should not include the Delivery DeliveryLocation CountrySubentity</assert>
      <assert id="ubl-CR-354" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode)">[ubl-CR-354]-A ubl invoice should not include the Delivery DeliveryLocation CountrySubentityCode</assert>
      <assert id="ubl-CR-355" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode)">[ubl-CR-355]-A ubl invoice should not include the Delivery DeliveryLocation LocationTypeCode</assert>
      <assert id="ubl-CR-356" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cbc:InformationURI)">[ubl-CR-356]-A ubl invoice should not include the Delivery DeliveryLocation InformationURI</assert>
      <assert id="ubl-CR-357" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cbc:Name)">[ubl-CR-357]-A ubl invoice should not include the Delivery DeliveryLocation Name</assert>
      <assert id="ubl-CR-358" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:ValidationPeriod)">[ubl-CR-358]-A ubl invoice should not include the Delivery DeliveryLocation ValidationPeriod</assert>
      <assert id="ubl-CR-359" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID)">[ubl-CR-359]-A ubl invoice should not include the Delivery DeliveryLocation Address ID</assert>
      <assert id="ubl-CR-360" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode)">[ubl-CR-360]-A ubl invoice should not include the Delivery DeliveryLocation Address AddressTypeCode</assert>
      <assert id="ubl-CR-361" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode)">[ubl-CR-361]-A ubl invoice should not include the Delivery DeliveryLocation Address AddressFormatCode</assert>
      <assert id="ubl-CR-362" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox)">[ubl-CR-362]-A ubl invoice should not include the Delivery DeliveryLocation Address Postbox</assert>
      <assert id="ubl-CR-363" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor)">[ubl-CR-363]-A ubl invoice should not include the Delivery DeliveryLocation Address Floor</assert>
      <assert id="ubl-CR-364" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room)">[ubl-CR-364]-A ubl invoice should not include the Delivery DeliveryLocation Address Room</assert>
      <assert id="ubl-CR-365" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName)">[ubl-CR-365]-A ubl invoice should not include the Delivery DeliveryLocation Address BlockName</assert>
      <assert id="ubl-CR-366" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName)">[ubl-CR-366]-A ubl invoice should not include the Delivery DeliveryLocation Address BuildingName</assert>
      <assert id="ubl-CR-367" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber)">[ubl-CR-367]-A ubl invoice should not include the Delivery DeliveryLocation Address BuildingNumber</assert>
      <assert id="ubl-CR-368" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail)">[ubl-CR-368]-A ubl invoice should not include the Delivery DeliveryLocation Address InhouseMail</assert>
      <assert id="ubl-CR-369" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department)">[ubl-CR-369]-A ubl invoice should not include the Delivery DeliveryLocation Address Department</assert>
      <assert id="ubl-CR-370" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention)">[ubl-CR-370]-A ubl invoice should not include the Delivery DeliveryLocation Address MarkAttention</assert>
      <assert id="ubl-CR-371" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare)">[ubl-CR-371]-A ubl invoice should not include the Delivery DeliveryLocation Address MarkCare</assert>
      <assert id="ubl-CR-372" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification)">[ubl-CR-372]-A ubl invoice should not include the Delivery DeliveryLocation Address PlotIdentification</assert>
      <assert id="ubl-CR-373" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName)">[ubl-CR-373]-A ubl invoice should not include the Delivery DeliveryLocation Address CitySubdivisionName</assert>
      <assert id="ubl-CR-374" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode)">[ubl-CR-374]-A ubl invoice should not include the Delivery DeliveryLocation Address CountrySubentityCode</assert>
      <assert id="ubl-CR-375" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region)">[ubl-CR-375]-A ubl invoice should not include the Delivery DeliveryLocation Address Region</assert>
      <assert id="ubl-CR-376" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District)">[ubl-CR-376]-A ubl invoice should not include the Delivery DeliveryLocation Address District</assert>
      <assert id="ubl-CR-377" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset)">[ubl-CR-377]-A ubl invoice should not include the Delivery DeliveryLocation Address TimezoneOffset</assert>
      <assert id="ubl-CR-378" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name)">[ubl-CR-378]-A ubl invoice should not include the Delivery DeliveryLocation Address Country Name</assert>
      <assert id="ubl-CR-379" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate)">[ubl-CR-379]-A ubl invoice should not include the Delivery DeliveryLocation Address LocationCoordinate</assert>
      <assert id="ubl-CR-380" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation)">[ubl-CR-380]-A ubl invoice should not include the Delivery DeliveryLocation SubsidiaryLocation</assert>
      <assert id="ubl-CR-381" flag="warning" test="not(cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate)">[ubl-CR-381]-A ubl invoice should not include the Delivery DeliveryLocation LocationCoordinate</assert>
      <assert id="ubl-CR-382" flag="warning" test="not(cac:Delivery/cac:AlternativeDeliveryLocation)">[ubl-CR-382]-A ubl invoice should not include the Delivery AlternativeDeliveryLocation</assert>
      <assert id="ubl-CR-383" flag="warning" test="not(cac:Delivery/cac:RequestedDeliveryPeriod)">[ubl-CR-383]-A ubl invoice should not include the Delivery RequestedDeliveryPeriod</assert>
      <assert id="ubl-CR-384" flag="warning" test="not(cac:Delivery/cac:PromisedDeliveryPeriod)">[ubl-CR-384]-A ubl invoice should not include the Delivery PromisedDeliveryPeriod</assert>
      <assert id="ubl-CR-385" flag="warning" test="not(cac:Delivery/cac:CarrierParty)">[ubl-CR-385]-A ubl invoice should not include the Delivery CarrierParty</assert>
      <assert id="ubl-CR-386" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator)">[ubl-CR-386]-A ubl invoice should not include the DeliveryParty MarkCareIndicator</assert>
      <assert id="ubl-CR-387" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator)">[ubl-CR-387]-A ubl invoice should not include the DeliveryParty MarkAttentionIndicator</assert>
      <assert id="ubl-CR-388" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI)">[ubl-CR-388]-A ubl invoice should not include the DeliveryParty WebsiteURI</assert>
      <assert id="ubl-CR-389" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID)">[ubl-CR-389]-A ubl invoice should not include the DeliveryParty LogoReferenceID</assert>
      <assert id="ubl-CR-390" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cbc:EndpointID)">[ubl-CR-390]-A ubl invoice should not include the DeliveryParty EndpointID</assert>
      <assert id="ubl-CR-391" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cbc:IndustryClassificationCode)">[ubl-CR-391]-A ubl invoice should not include the DeliveryParty IndustryClassificationCode</assert>
      <assert id="ubl-CR-392" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:PartyIdentification)">[ubl-CR-392]-A ubl invoice should not include the DeliveryParty PartyIdentification</assert>
      <assert id="ubl-CR-393" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:Language)">[ubl-CR-393]-A ubl invoice should not include the DeliveryParty Language</assert>
      <assert id="ubl-CR-394" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:PostalAddress)">[ubl-CR-394]-A ubl invoice should not include the DeliveryParty PostalAddress</assert>
      <assert id="ubl-CR-395" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation)">[ubl-CR-395]-A ubl invoice should not include the DeliveryParty PhysicalLocation</assert>
      <assert id="ubl-CR-396" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme)">[ubl-CR-396]-A ubl invoice should not include the DeliveryParty PartyTaxScheme</assert>
      <assert id="ubl-CR-397" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity)">[ubl-CR-397]-A ubl invoice should not include the DeliveryParty PartyLegalEntity</assert>
      <assert id="ubl-CR-398" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:Contact)">[ubl-CR-398]-A ubl invoice should not include the DeliveryParty Contact</assert>
      <assert id="ubl-CR-399" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:Person)">[ubl-CR-399]-A ubl invoice should not include the DeliveryParty Person</assert>
      <assert id="ubl-CR-400" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:AgentParty)">[ubl-CR-400]-A ubl invoice should not include the DeliveryParty AgentParty</assert>
      <assert id="ubl-CR-401" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:ServiceProviderParty)">[ubl-CR-401]-A ubl invoice should not include the DeliveryParty ServiceProviderParty</assert>
      <assert id="ubl-CR-402" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:PowerOfAttorney)">[ubl-CR-402]-A ubl invoice should not include the DeliveryParty PowerOfAttorney</assert>
      <assert id="ubl-CR-403" flag="warning" test="not(cac:Delivery/cac:DeliveryParty/cac:FinancialAccount)">[ubl-CR-403]-A ubl invoice should not include the DeliveryParty FinancialAccount</assert>
      <assert id="ubl-CR-404" flag="warning" test="not(cac:Delivery/cac:NotifyParty)">[ubl-CR-404]-A ubl invoice should not include the Delivery NotifyParty</assert>
      <assert id="ubl-CR-405" flag="warning" test="not(cac:Delivery/cac:Despatch)">[ubl-CR-405]-A ubl invoice should not include the Delivery Despatch</assert>
      <assert id="ubl-CR-407" flag="warning" test="not(cac:Delivery/cac:MinimumDeliveryUnit)">[ubl-CR-407]-A ubl invoice should not include the Delivery MinimumDeliveryUnit</assert>
      <assert id="ubl-CR-408" flag="warning" test="not(cac:Delivery/cac:MaximumDeliveryUnit)">[ubl-CR-408]-A ubl invoice should not include the Delivery MaximumDeliveryUnit</assert>
      <assert id="ubl-CR-409" flag="warning" test="not(cac:Delivery/cac:Shipment)">[ubl-CR-409]-A ubl invoice should not include the Delivery Shipment</assert>
      <assert id="ubl-CR-410" flag="warning" test="not(cac:DeliveryTerms)">[ubl-CR-410]-A ubl invoice should not include the DeliveryTerms</assert>
      <assert id="ubl-CR-411" flag="warning" test="not(cac:PaymentMeans/cbc:ID)">[ubl-CR-411]-A ubl invoice should not include the PaymentMeans ID</assert>
      <assert id="ubl-CR-412" flag="warning" test="not(cac:PaymentMeans/cbc:PaymentDueDate)">[ubl-CR-412]-A ubl invoice should not include the PaymentMeans PaymentDueDate</assert>
      <assert id="ubl-CR-413" flag="warning" test="not(cac:PaymentMeans/cbc:PaymentChannelCode)">[ubl-CR-413]-A ubl invoice should not include the PaymentMeans PaymentChannelCode</assert>
      <assert id="ubl-CR-414" flag="warning" test="not(cac:PaymentMeans/cbc:InstructionID)">[ubl-CR-414]-A ubl invoice should not include the PaymentMeans InstructionID</assert>
      <assert id="ubl-CR-415" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:CardTypeCode)">[ubl-CR-415]-A ubl invoice should not include the PaymentMeans CardAccount CardTypeCode</assert>
      <assert id="ubl-CR-416" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:ValidityStartDate)">[ubl-CR-416]-A ubl invoice should not include the PaymentMeans CardAccount ValidityStartDate</assert>
      <assert id="ubl-CR-417" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:ExpiryDate)">[ubl-CR-417]-A ubl invoice should not include the PaymentMeans CardAccount ExpiryDate</assert>
      <assert id="ubl-CR-418" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:IssuerID)">[ubl-CR-418]-A ubl invoice should not include the PaymentMeans CardAccount IssuerID</assert>
      <assert id="ubl-CR-419" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:IssuerNumberID)">[ubl-CR-419]-A ubl invoice should not include the PaymentMeans CardAccount IssuerNumberID</assert>
      <assert id="ubl-CR-420" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:CV2ID)">[ubl-CR-420]-A ubl invoice should not include the PaymentMeans CardAccount CV2ID</assert>
      <assert id="ubl-CR-421" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:CardChipCode)">[ubl-CR-421]-A ubl invoice should not include the PaymentMeans CardAccount CardChipCode</assert>
      <assert id="ubl-CR-422" flag="warning" test="not(cac:PaymentMeans/cac:CardAccount/cbc:ChipApplicationID)">[ubl-CR-422]-A ubl invoice should not include the PaymentMeans CardAccount ChipApplicationID</assert>
      <assert id="ubl-CR-424" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AliasName)">[ubl-CR-424]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount AliasName</assert>
      <assert id="ubl-CR-425" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountTypeCode)">[ubl-CR-425]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount AccountTypeCode</assert>
      <assert id="ubl-CR-426" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountFormatCode)">[ubl-CR-426]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount AccountFormatCode</assert>
      <assert id="ubl-CR-427" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:CurrencyCode)">[ubl-CR-427]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount CurrencyCode</assert>
      <assert id="ubl-CR-428" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote)">[ubl-CR-428]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount PaymentNote</assert>
      <assert id="ubl-CR-429" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name)">[ubl-CR-429]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch Name</assert>
      <assert id="ubl-CR-430" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name)">[ubl-CR-430]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch FinancialInstitution Name</assert>
      <assert id="ubl-CR-431" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address)">[ubl-CR-431]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch FinancialInstitution Address</assert>
      <assert id="ubl-CR-432" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:Address)">[ubl-CR-432]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch Address</assert>
      <assert id="ubl-CR-433" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:Country)">[ubl-CR-433]-A ubl invoice should not include the PaymentMeans PayeeFinancialAccount Country</assert>
      <assert id="ubl-CR-434" flag="warning" test="not(cac:PaymentMeans/cac:CreditAccount)">[ubl-CR-434]-A ubl invoice should not include the PaymentMeans CreditAccount</assert>
      <assert id="ubl-CR-435" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cbc:MandateTypeCode)">[ubl-CR-435]-A ubl invoice should not include the PaymentMeans PaymentMandate MandateTypeCode</assert>
      <assert id="ubl-CR-436" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cbc:MaximumPaymentInstructionsNumeric)">[ubl-CR-436]-A ubl invoice should not include the PaymentMeans PaymentMandate MaximumPaymentInstructionsNumeric</assert>
      <assert id="ubl-CR-437" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cbc:MaximumPaidAmount)">[ubl-CR-437]-A ubl invoice should not include the PaymentMeans PaymentMandate MaximumPaidAmount</assert>
      <assert id="ubl-CR-438" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cbc:SignatureID)">[ubl-CR-438]-A ubl invoice should not include the PaymentMeans PaymentMandate SignatureID</assert>
      <assert id="ubl-CR-439" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerParty)">[ubl-CR-439]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerParty</assert>
      <assert id="ubl-CR-440" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:Name)">[ubl-CR-440]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount Name</assert>
      <assert id="ubl-CR-441" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AliasName)">[ubl-CR-441]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AliasName</assert>
      <assert id="ubl-CR-442" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AccountTypeCode)">[ubl-CR-442]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AccountTypeCode</assert>
      <assert id="ubl-CR-443" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AccountFormatCode)">[ubl-CR-443]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AccountFormatCode</assert>
      <assert id="ubl-CR-444" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:CurrencyCode)">[ubl-CR-444]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount CurrencyCode</assert>
      <assert id="ubl-CR-445" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:PaymentNote)">[ubl-CR-445]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount PaymentNote</assert>
      <assert id="ubl-CR-446" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cac:FinancialInstitutionBranch)">[ubl-CR-446]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount FinancialInstitutionBranch</assert>
      <assert id="ubl-CR-447" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cac:Country)">[ubl-CR-447]-A ubl invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount Country</assert>
      <assert id="ubl-CR-448" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:ValidityPeriod)">[ubl-CR-448]-A ubl invoice should not include the PaymentMeans PaymentMandate ValidityPeriod</assert>
      <assert id="ubl-CR-449" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:PaymentReversalPeriod)">[ubl-CR-449]-A ubl invoice should not include the PaymentMeans PaymentMandate PaymentReversalPeriod</assert>
      <assert id="ubl-CR-450" flag="warning" test="not(cac:PaymentMeans/cac:PaymentMandate/cac:Clause)">[ubl-CR-450]-A ubl invoice should not include the PaymentMeans PaymentMandate Clause</assert>
      <assert id="ubl-CR-451" flag="warning" test="not(cac:PaymentMeans/cac:TradeFinancing)">[ubl-CR-451]-A ubl invoice should not include the PaymentMeans TradeFinancing</assert>
      <assert id="ubl-CR-452" flag="warning" test="not(cac:PaymentTerms/cbc:ID)">[ubl-CR-452]-A ubl invoice should not include the PaymentTerms ID</assert>
      <assert id="ubl-CR-453" flag="warning" test="not(cac:PaymentTerms/cbc:PaymentMeansID)">[ubl-CR-453]-A ubl invoice should not include the PaymentTerms PaymentMeansID</assert>
      <assert id="ubl-CR-454" flag="warning" test="not(cac:PaymentTerms/cbc:PrepaidPaymentReferenceID)">[ubl-CR-454]-A ubl invoice should not include the PaymentTerms PrepaidPaymentReferenceID</assert>
      <assert id="ubl-CR-455" flag="warning" test="not(cac:PaymentTerms/cbc:ReferenceEventCode)">[ubl-CR-455]-A ubl invoice should not include the PaymentTerms ReferenceEventCode</assert>
      
      <assert id="ubl-CR-457" flag="warning" test="not(cac:PaymentTerms/cbc:PenaltySurchargePercent)">[ubl-CR-457]-A ubl invoice should not include the PaymentTerms PenaltySurchargePercent</assert>
      <assert id="ubl-CR-458" flag="warning" test="not(cac:PaymentTerms/cbc:PaymentPercent)">[ubl-CR-458]-A ubl invoice should not include the PaymentTerms PaymentPercent</assert>
      
      <assert id="ubl-CR-460" flag="warning" test="not(cac:PaymentTerms/cbc:SettlementDiscountAmount)">[ubl-CR-460]-A ubl invoice should not include the PaymentTerms SettlementDiscountAmount</assert>
      <assert id="ubl-CR-461" flag="warning" test="not(cac:PaymentTerms/cbc:PenaltyAmount)">[ubl-CR-461]-A ubl invoice should not include the PaymentTerms PenaltyAmount</assert>
      <assert id="ubl-CR-462" flag="warning" test="not(cac:PaymentTerms/cbc:PaymentTermsDetailsURI)">[ubl-CR-462]-A ubl invoice should not include the PaymentTerms PaymentTermsDetailsURI</assert>
      
      <assert id="ubl-CR-464" flag="warning" test="not(cac:PaymentTerms/cbc:InstallmentDueDate)">[ubl-CR-464]-A ubl invoice should not include the PaymentTerms InstallmentDueDate</assert>
      <assert id="ubl-CR-465" flag="warning" test="not(cac:PaymentTerms/cbc:InvoicingPartyReference)">[ubl-CR-465]-A ubl invoice should not include the PaymentTerms InvoicingPartyReference</assert>
      <assert id="ubl-CR-466" flag="warning" test="not(cac:PaymentTerms/cac:SettlementPeriod)">[ubl-CR-466]-A ubl invoice should not include the PaymentTerms SettlementPeriod</assert>
      <assert id="ubl-CR-467" flag="warning" test="not(cac:PaymentTerms/cac:PenaltyPeriod)">[ubl-CR-467]-A ubl invoice should not include the PaymentTerms PenaltyPeriod</assert>
      <assert id="ubl-CR-468" flag="warning" test="not(cac:PaymentTerms/cac:ExchangeRate)">[ubl-CR-468]-A ubl invoice should not include the PaymentTerms ExchangeRate</assert>
      <assert id="ubl-CR-469" flag="warning" test="not(cac:PaymentTerms/cac:ValidityPeriod)">[ubl-CR-469]-A ubl invoice should not include the PaymentTerms ValidityPeriod</assert>
      <assert id="ubl-CR-470" flag="warning" test="not(cac:PrepaidPayment)">[ubl-CR-470]-A ubl invoice should not include the PrepaidPayment</assert>
      <assert id="ubl-CR-471" flag="warning" test="not(cac:AllowanceCharge/cbc:ID)">[ubl-CR-471]-A ubl invoice should not include the AllowanceCharge ID</assert>
      <assert id="ubl-CR-472" flag="warning" test="not(cac:AllowanceCharge/cbc:PrepaidIndicator)">[ubl-CR-472]-A ubl invoice should not include the AllowanceCharge PrepaidIndicator</assert>
      <assert id="ubl-CR-473" flag="warning" test="not(cac:AllowanceCharge/cbc:SequenceNumeric)">[ubl-CR-473]-A ubl invoice should not include the AllowanceCharge SequenceNumeric</assert>
      <assert id="ubl-CR-474" flag="warning" test="not(cac:AllowanceCharge/cbc:AccountingCostCode)">[ubl-CR-474]-A ubl invoice should not include the AllowanceCharge AccountingCostCode</assert>
      <assert id="ubl-CR-475" flag="warning" test="not(cac:AllowanceCharge/cbc:AccountingCost)">[ubl-CR-475]-A ubl invoice should not include the AllowanceCharge AccountingCost</assert>
      <assert id="ubl-CR-476" flag="warning" test="not(cac:AllowanceCharge/cbc:PerUnitAmount)">[ubl-CR-476]-A ubl invoice should not include the AllowanceCharge PerUnitAmount</assert>
      <assert id="ubl-CR-477" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:Name)">[ubl-CR-477]-A ubl invoice should not include the AllowanceCharge TaxCategory Name</assert>
      <assert id="ubl-CR-478" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure)">[ubl-CR-478]-A ubl invoice should not include the AllowanceCharge TaxCategory BaseUnitMeasure</assert>
      <assert id="ubl-CR-479" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount)">[ubl-CR-479]-A ubl invoice should not include the AllowanceCharge TaxCategory PerUnitAmount</assert>
      <assert id="ubl-CR-480" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode)">[ubl-CR-480]-A ubl invoice should not include the AllowanceCharge TaxCategory TaxExemptionReasonCode</assert>
      <assert id="ubl-CR-481" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason)">[ubl-CR-481]-A ubl invoice should not include the AllowanceCharge TaxCategory TaxExemptionReason</assert>
      <assert id="ubl-CR-482" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange)">[ubl-CR-482]-A ubl invoice should not include the AllowanceCharge TaxCategory TierRange</assert>
      <assert id="ubl-CR-483" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent)">[ubl-CR-483]-A ubl invoice should not include the AllowanceCharge TaxCategory TierRatePercent</assert>
      <assert id="ubl-CR-484" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name)">[ubl-CR-484]-A ubl invoice should not include the AllowanceCharge TaxCategory TaxScheme Name</assert>
      <assert id="ubl-CR-485" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)">[ubl-CR-485]-A ubl invoice should not include the AllowanceCharge TaxCategory TaxScheme TaxTypeCode</assert>
      <assert id="ubl-CR-486" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)">[ubl-CR-486]-A ubl invoice should not include the AllowanceCharge TaxCategory TaxScheme CurrencyCode</assert>
      <assert id="ubl-CR-487" flag="warning" test="not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress)">[ubl-CR-487]-A ubl invoice should not include the AllowanceCharge TaxCategory TaxScheme JurisdiccionRegionAddress</assert>
      <assert id="ubl-CR-488" flag="warning" test="not(cac:AllowanceCharge/cac:TaxTotal)">[ubl-CR-488]-A ubl invoice should not include the AllowanceCharge TaxTotal</assert>
      <assert id="ubl-CR-489" flag="warning" test="not(cac:AllowanceCharge/cac:PaymentMeans)">[ubl-CR-489]-A ubl invoice should not include the AllowanceCharge PaymentMeans</assert>
      <assert id="ubl-CR-490" flag="warning" test="not(cac:TaxExchangeRate)">[ubl-CR-490]-A ubl invoice should not include the TaxExchangeRate</assert>
      <assert id="ubl-CR-491" flag="warning" test="not(cac:PricingExchangeRate)">[ubl-CR-491]-A ubl invoice should not include the PricingExchangeRate</assert>
      <assert id="ubl-CR-492" flag="warning" test="not(cac:PaymentExchangeRate)">[ubl-CR-492]-A ubl invoice should not include the PaymentExchangeRate</assert>
      <assert id="ubl-CR-493" flag="warning" test="not(cac:PaymentAlternativeExchangeRate)">[ubl-CR-493]-A ubl invoice should not include the PaymentAlternativeExchangeRate</assert>
      <assert id="ubl-CR-494" flag="warning" test="not(cac:TaxTotal/cbc:RoundingAmount)">[ubl-CR-494]-A ubl invoice should not include the TaxTotal RoundingAmount</assert>
      <assert id="ubl-CR-495" flag="warning" test="not(cac:TaxTotal/cbc:TaxEvidenceIndicator)">[ubl-CR-495]-A ubl invoice should not include the TaxTotal TaxEvidenceIndicator</assert>
      <assert id="ubl-CR-496" flag="warning" test="not(cac:TaxTotal/cbc:TaxIncludedIndicator)">[ubl-CR-496]-A ubl invoice should not include the TaxTotal TaxIncludedIndicator</assert>
      <assert id="ubl-CR-497" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric)">[ubl-CR-497]-A ubl invoice should not include the TaxTotal TaxSubtotal CalulationSequenceNumeric</assert>
      
      <assert id="ubl-CR-499" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:Percent)">[ubl-CR-499]-A ubl invoice should not include the TaxTotal TaxSubtotal Percent</assert>
      <assert id="ubl-CR-500" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure)">[ubl-CR-500]-A ubl invoice should not include the TaxTotal TaxSubtotal BaseUnitMeasure</assert>
      <assert id="ubl-CR-501" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount)">[ubl-CR-501]-A ubl invoice should not include the TaxTotal TaxSubtotal PerUnitAmount</assert>
      <assert id="ubl-CR-502" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange)">[ubl-CR-502]-A ubl invoice should not include the TaxTotal TaxSubtotal TierRange</assert>
      <assert id="ubl-CR-503" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent)">[ubl-CR-503]-A ubl invoice should not include the TaxTotal TaxSubtotal TierRatePercent</assert>
      <assert id="ubl-CR-505" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure)">[ubl-CR-505]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory BaseUnitMeasure</assert>
      <assert id="ubl-CR-506" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount)">[ubl-CR-506]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory PerUnitAmount</assert>
      <assert id="ubl-CR-507" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange)">[ubl-CR-507]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory TierRange</assert>
      <assert id="ubl-CR-508" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent)">[ubl-CR-508]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory TierRatePercent</assert>
      <assert id="ubl-CR-509" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name)">[ubl-CR-509]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme Name</assert>
      <assert id="ubl-CR-510" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)">[ubl-CR-510]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme TaxTypeCode</assert>
      <assert id="ubl-CR-511" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)">[ubl-CR-511]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme CurrencyCode</assert>
      <assert id="ubl-CR-512" flag="warning" test="not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress)">[ubl-CR-512]-A ubl invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme JurisdiccionRegionAddress</assert>
      <assert id="ubl-CR-513" flag="warning" test="not(cac:WithholdingTaxTotal)">[ubl-CR-513]-A ubl invoice should not include the WithholdingTaxTotal</assert>
      <assert id="ubl-CR-514" flag="warning" test="not(cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount)">[ubl-CR-514]-A ubl invoice should not include the LegalMonetaryTotal PayableAlternativeAmount</assert>
      <assert id="ubl-CR-515" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:UUID)">[ubl-CR-515]-A ubl invoice should not include the InvoiceLine UUID</assert>
      <assert id="ubl-CR-516" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:TaxPointDate)">[ubl-CR-516]-A ubl invoice should not include the InvoiceLine TaxPointDate</assert>
      <assert id="ubl-CR-517" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:AccountingCostCode)">[ubl-CR-517]-A ubl invoice should not include the InvoiceLine AccountingCostCode</assert>
      <assert id="ubl-CR-518" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:PaymentPurposeCode)">[ubl-CR-518]-A ubl invoice should not include the InvoiceLine PaymentPurposeCode</assert>
      <assert id="ubl-CR-519" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:FreeOfChargeIndicator)">[ubl-CR-519]-A ubl invoice should not include the InvoiceLine FreeOfChargeIndicator</assert>
      <assert id="ubl-CR-520" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:StartTime)">[ubl-CR-520]-A ubl invoice should not include the InvoiceLine InvoicePeriod StartTime</assert>
      <assert id="ubl-CR-521" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:EndTime)">[ubl-CR-521]-A ubl invoice should not include the InvoiceLine InvoicePeriod EndTime</assert>
      <assert id="ubl-CR-522" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:DurationMeasure)">[ubl-CR-522]-A ubl invoice should not include the InvoiceLine InvoicePeriod DurationMeasure</assert>
      <assert id="ubl-CR-523" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:DescriptionCode)">[ubl-CR-523]-A ubl invoice should not include the InvoiceLine InvoicePeriod DescriptionCode</assert>
      <assert id="ubl-CR-524" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:Description)">[ubl-CR-524]-A ubl invoice should not include the InvoiceLine InvoicePeriod Description</assert>
      <assert id="ubl-CR-525" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:SalesOrderLineID)">[ubl-CR-525]-A ubl invoice should not include the InvoiceLine OrderLineReference SalesOrderLineID</assert>
      <assert id="ubl-CR-526" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:UUID)">[ubl-CR-526]-A ubl invoice should not include the InvoiceLine OrderLineReference UUID</assert>
      <assert id="ubl-CR-527" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:LineStatusCode)">[ubl-CR-527]-A ubl invoice should not include the InvoiceLine OrderLineReference LineStatusCode</assert>
      <assert id="ubl-CR-528" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:OrderReference)">[ubl-CR-528]-A ubl invoice should not include the InvoiceLine OrderLineReference OrderReference</assert>
      <assert id="ubl-CR-529" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DespatchLineReference)">[ubl-CR-529]-A ubl invoice should not include the InvoiceLine DespatchLineReference</assert>
      <assert id="ubl-CR-530" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:ReceiptLineReference)">[ubl-CR-530]-A ubl invoice should not include the InvoiceLine ReceiptLineReference</assert>
      <assert id="ubl-CR-531" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:BillingReference)">[ubl-CR-531]-A ubl invoice should not include the InvoiceLine BillingReference</assert>
      <assert id="ubl-CR-532" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:CopyIndicator)">[ubl-CR-532]-A ubl invoice should not include the InvoiceLine DocumentReference CopyIndicator</assert>
      <assert id="ubl-CR-533" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:UUID)">[ubl-CR-533]-A ubl invoice should not include the InvoiceLine DocumentReference UUID</assert>
      <assert id="ubl-CR-534" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:IssueDate)">[ubl-CR-534]-A ubl invoice should not include the InvoiceLine DocumentReference IssueDate</assert>
      <assert id="ubl-CR-535" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:IssueTime)">[ubl-CR-535]-A ubl invoice should not include the InvoiceLine DocumentReference IssueTime</assert>
      <assert id="ubl-CR-537" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentType)">[ubl-CR-537]-A ubl invoice should not include the InvoiceLine DocumentReference DocumentType</assert>
      <assert id="ubl-CR-538" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:Xpath)">[ubl-CR-538]-A ubl invoice should not include the InvoiceLine DocumentReference Xpath</assert>
      <assert id="ubl-CR-539" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:LanguageID)">[ubl-CR-539]-A ubl invoice should not include the InvoiceLine DocumentReference LanguageID</assert>
      <assert id="ubl-CR-540" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:LocaleCode)">[ubl-CR-540]-A ubl invoice should not include the InvoiceLine DocumentReference LocaleCode</assert>
      <assert id="ubl-CR-541" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:VersionID)">[ubl-CR-541]-A ubl invoice should not include the InvoiceLine DocumentReference VersionID</assert>
      <assert id="ubl-CR-542" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentStatusCode)">[ubl-CR-542]-A ubl invoice should not include the InvoiceLine DocumentReference DocumentStatusCode</assert>
      <assert id="ubl-CR-543" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentDescription)">[ubl-CR-543]-A ubl invoice should not include the InvoiceLine DocumentReference DocumentDescription</assert>
      <assert id="ubl-CR-544" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:Attachment)">[ubl-CR-544]-A ubl invoice should not include the InvoiceLine DocumentReference Attachment</assert>
      <assert id="ubl-CR-545" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:ValidityPeriod)">[ubl-CR-545]-A ubl invoice should not include the InvoiceLine DocumentReference ValidityPeriod</assert>
      <assert id="ubl-CR-546" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:IssuerParty)">[ubl-CR-546]-A ubl invoice should not include the InvoiceLine DocumentReference IssuerParty</assert>
      <assert id="ubl-CR-547" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:ResultOfVerification)">[ubl-CR-547]-A ubl invoice should not include the InvoiceLine DocumentReference ResultOfVerification</assert>
      <assert id="ubl-CR-548" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:PricingReference)">[ubl-CR-548]-A ubl invoice should not include the InvoiceLine PricingReference</assert>
      <assert id="ubl-CR-549" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OriginatorParty)">[ubl-CR-549]-A ubl invoice should not include the InvoiceLine OriginatorParty</assert>
      <assert id="ubl-CR-550" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Delivery)">[ubl-CR-550]-A ubl invoice should not include the InvoiceLine Delivery</assert>
      <assert id="ubl-CR-551" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:PaymentTerms)">[ubl-CR-551]-A ubl invoice should not include the InvoiceLine PaymentTerms</assert>
      <assert id="ubl-CR-552" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:ID)">[ubl-CR-552]-A ubl invoice should not include the InvoiceLine AllowanceCharge ID</assert>
      <assert id="ubl-CR-553" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:PrepaidIndicator)">[ubl-CR-553]-A ubl invoice should not include the InvoiceLine AllowanceCharge PrepaidIndicator</assert>
      <assert id="ubl-CR-554" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:SequenceNumeric)">[ubl-CR-554]-A ubl invoice should not include the InvoiceLine AllowanceCharge SequenceNumeric</assert>
      <assert id="ubl-CR-555" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:AccountingCostCode)">[ubl-CR-555]-A ubl invoice should not include the InvoiceLine AllowanceCharge AccountingCostCode</assert>
      <assert id="ubl-CR-556" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:AccountingCost)">[ubl-CR-556]-A ubl invoice should not include the InvoiceLine AllowanceCharge AccountingCost</assert>
      <assert id="ubl-CR-557" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:PerUnitAmount)">[ubl-CR-557]-A ubl invoice should not include the InvoiceLine AllowanceCharge PerUnitAmount</assert>
      <assert id="ubl-CR-558" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:TaxCategory)">[ubl-CR-558]-A ubl invoice should not include the InvoiceLine AllowanceCharge TaxCategory</assert>
      <assert id="ubl-CR-559" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:TaxTotal)">[ubl-CR-559]-A ubl invoice should not include the InvoiceLine AllowanceCharge TaxTotal</assert>
      <assert id="ubl-CR-560" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:PaymentMeans)">[ubl-CR-560]-A ubl invoice should not include the InvoiceLine AllowanceCharge PaymentMeans</assert>
      
      <assert id="ubl-CR-562" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:WithholdingTaxTotal)">[ubl-CR-562]-A ubl invoice should not include the InvoiceLine WithholdingTaxTotal</assert>
      <assert id="ubl-CR-563" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:PackQuantity)">[ubl-CR-563]-A ubl invoice should not include the InvoiceLine Item PackQuantity</assert>
      <assert id="ubl-CR-564" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:PackSizeNumeric)">[ubl-CR-564]-A ubl invoice should not include the InvoiceLine Item PackSizeNumeric</assert>
      <assert id="ubl-CR-565" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:CatalogueIndicator)">[ubl-CR-565]-A ubl invoice should not include the InvoiceLine Item CatalogueIndicator</assert>
      <assert id="ubl-CR-566" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:HazardousRiskIndicator)">[ubl-CR-566]-A ubl invoice should not include the InvoiceLine Item HazardousRiskIndicator</assert>
      <assert id="ubl-CR-567" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:AdditionalInformation)">[ubl-CR-567]-A ubl invoice should not include the InvoiceLine Item AdditionalInformation</assert>
      <assert id="ubl-CR-568" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:Keyword)">[ubl-CR-568]-A ubl invoice should not include the InvoiceLine Item Keyword</assert>
      <assert id="ubl-CR-569" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:BrandName)">[ubl-CR-569]-A ubl invoice should not include the InvoiceLine Item BrandName</assert>
      <assert id="ubl-CR-570" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:ModelName)">[ubl-CR-570]-A ubl invoice should not include the InvoiceLine Item ModelName</assert>
      <assert id="ubl-CR-571" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cbc:ExtendedID)">[ubl-CR-571]-A ubl invoice should not include the InvoiceLine Item BuyersItemIdentification ExtendedID</assert>
      <assert id="ubl-CR-572" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cbc:BareCodeSymbologyID)">[ubl-CR-572]-A ubl invoice should not include the InvoiceLine Item BuyersItemIdentification BareCodeSymbologyID</assert>
      <assert id="ubl-CR-573" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:PhysicalAttribute)">[ubl-CR-573]-A ubl invoice should not include the InvoiceLine Item BuyersItemIdentification PhysicalAttribute</assert>
      <assert id="ubl-CR-574" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:MeasurementDimension)">[ubl-CR-574]-A ubl invoice should not include the InvoiceLine Item BuyersItemIdentification MeasurementDimension</assert>
      <assert id="ubl-CR-575" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:IssuerParty)">[ubl-CR-575]-A ubl invoice should not include the InvoiceLine Item BuyersItemIdentification IssuerParty</assert>
      <assert id="ubl-CR-576" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID)">[ubl-CR-576]-A ubl invoice should not include the InvoiceLine Item SellersItemIdentification ExtendedID</assert>
      <assert id="ubl-CR-577" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cbc:BareCodeSymbologyID)">[ubl-CR-577]-A ubl invoice should not include the InvoiceLine Item SellersItemIdentification BareCodeSymbologyID</assert>
      <assert id="ubl-CR-578" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute)">[ubl-CR-578]-A ubl invoice should not include the InvoiceLine Item SellersItemIdentification PhysicalAttribute</assert>
      <assert id="ubl-CR-579" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension)">[ubl-CR-579]-A ubl invoice should not include the InvoiceLine Item SellersItemIdentification MeasurementDimension</assert>
      <assert id="ubl-CR-580" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:IssuerParty)">[ubl-CR-580]-A ubl invoice should not include the InvoiceLine Item SellersItemIdentification IssuerParty</assert>
      <assert id="ubl-CR-581" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ManufacturersItemIdentification)">[ubl-CR-581]-A ubl invoice should not include the InvoiceLine Item ManufacturersItemIdentification</assert>
      <assert id="ubl-CR-582" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID)">[ubl-CR-582]-A ubl invoice should not include the InvoiceLine Item StandardItemIdentification ExtendedID</assert>
      <assert id="ubl-CR-583" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cbc:BareCodeSymbologyID)">[ubl-CR-583]-A ubl invoice should not include the InvoiceLine Item StandardItemIdentification BareCodeSymbologyID</assert>
      <assert id="ubl-CR-584" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute)">[ubl-CR-584]-A ubl invoice should not include the InvoiceLine Item StandardItemIdentification PhysicalAttribute</assert>
      <assert id="ubl-CR-585" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension)">[ubl-CR-585]-A ubl invoice should not include the InvoiceLine Item StandardItemIdentification MeasurementDimension</assert>
      <assert id="ubl-CR-586" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:IssuerParty)">[ubl-CR-586]-A ubl invoice should not include the InvoiceLine Item StandardItemIdentification IssuerParty</assert>
      <assert id="ubl-CR-587" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CatalogueItemIdentification)">[ubl-CR-587]-A ubl invoice should not include the InvoiceLine Item CatalogueItemIdentification</assert>
      <assert id="ubl-CR-588" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemIdentification)">[ubl-CR-588]-A ubl invoice should not include the InvoiceLine Item AdditionalItemIdentification</assert>
      <assert id="ubl-CR-589" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CatalogueDocumentReference)">[ubl-CR-589]-A ubl invoice should not include the InvoiceLine Item CatalogueDocumentReference</assert>
      <assert id="ubl-CR-590" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ItemSpecificationDocumentReference)">[ubl-CR-590]-A ubl invoice should not include the InvoiceLine Item ItemSpecificationDocumentReference</assert>
      <assert id="ubl-CR-591" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:OriginCountry/cbc:Name)">[ubl-CR-591]-A ubl invoice should not include the InvoiceLine Item OriginCountry Name</assert>
      <assert id="ubl-CR-592" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:NatureCode)">[ubl-CR-592]-A ubl invoice should not include the InvoiceLine Item CommodityClassification NatureCode</assert>
      <assert id="ubl-CR-593" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode)">[ubl-CR-593]-A ubl invoice should not include the InvoiceLine Item CommodityClassification CargoTypeCode</assert>
      <assert id="ubl-CR-594" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:CommodityCode)">[ubl-CR-594]-A ubl invoice should not include the InvoiceLine Item CommodityClassification CommodityCode</assert>
      <assert id="ubl-CR-595" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:TransactionConditions)">[ubl-CR-595]-A ubl invoice should not include the InvoiceLine Item TransactionConditions</assert>
      <assert id="ubl-CR-596" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:HazardousItem)">[ubl-CR-596]-A ubl invoice should not include the InvoiceLine Item HazardousItem</assert>
      <assert id="ubl-CR-598" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure)">[ubl-CR-598]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory BaseUnitMeasure</assert>
      <assert id="ubl-CR-599" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount)">[ubl-CR-599]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory PerUnitAmount</assert>
      
      <assert id="ubl-CR-602" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange)">[ubl-CR-602]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory TierRange</assert>
      <assert id="ubl-CR-603" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent)">[ubl-CR-603]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory TierRatePercent</assert>
      <assert id="ubl-CR-604" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name)">[ubl-CR-604]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme Name</assert>
      <assert id="ubl-CR-605" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode)">[ubl-CR-605]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme TaxTypeCode</assert>
      <assert id="ubl-CR-606" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode)">[ubl-CR-606]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme CurrencyCode</assert>
      <assert id="ubl-CR-607" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress)">[ubl-CR-607]-A ubl invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme JurisdiccionRegionAddress</assert>
      <assert id="ubl-CR-608" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ID)">[ubl-CR-608]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty ID</assert>
      <assert id="ubl-CR-609" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:NameCode)">[ubl-CR-609]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty NameCode</assert>
      <assert id="ubl-CR-610" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod)">[ubl-CR-610]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty TestMethod</assert>
      <assert id="ubl-CR-611" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity)">[ubl-CR-611]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty ValueQuantity</assert>
      <assert id="ubl-CR-612" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier)">[ubl-CR-612]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty ValueQualifier</assert>
      <assert id="ubl-CR-613" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode)">[ubl-CR-613]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty ImportanceCode</assert>
      <assert id="ubl-CR-614" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ListValue)">[ubl-CR-614]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty ListValue</assert>
      <assert id="ubl-CR-615" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod)">[ubl-CR-615]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty UsabilityPeriod</assert>
      <assert id="ubl-CR-616" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup)">[ubl-CR-616]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty ItemPropertyGroup</assert>
      <assert id="ubl-CR-617" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension)">[ubl-CR-617]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty RangeDimension</assert>
      <assert id="ubl-CR-618" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange)">[ubl-CR-618]-A ubl invoice should not include the InvoiceLine Item AdditionalItemProperty ItemPropertyRange</assert>
      <assert id="ubl-CR-619" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ManufacturerParty)">[ubl-CR-619]-A ubl invoice should not include the InvoiceLine Item ManufacturerParty</assert>
      <assert id="ubl-CR-620" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:InformationContentProviderParty)">[ubl-CR-620]-A ubl invoice should not include the InvoiceLine Item InformationContentProviderParty</assert>
      <assert id="ubl-CR-621" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:OriginAddress)">[ubl-CR-621]-A ubl invoice should not include the InvoiceLine Item OriginAddress</assert>
      <assert id="ubl-CR-622" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ItemInstance)">[ubl-CR-622]-A ubl invoice should not include the InvoiceLine Item ItemInstance</assert>
      <assert id="ubl-CR-623" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Certificate)">[ubl-CR-623]-A ubl invoice should not include the InvoiceLine Item Certificate</assert>
      <assert id="ubl-CR-624" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Dimension)">[ubl-CR-624]-A ubl invoice should not include the InvoiceLine Item Dimension</assert>
      <assert id="ubl-CR-625" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceChangeReason)">[ubl-CR-625]-A ubl invoice should not include the InvoiceLine Item Price PriceChangeReason</assert>
      <assert id="ubl-CR-626" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceTypeCode)">[ubl-CR-626]-A ubl invoice should not include the InvoiceLine Item Price PriceTypeCode</assert>
      <assert id="ubl-CR-627" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceType)">[ubl-CR-627]-A ubl invoice should not include the InvoiceLine Item Price PriceType</assert>
      <assert id="ubl-CR-628" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:OrderableUnitFactorRate)">[ubl-CR-628]-A ubl invoice should not include the InvoiceLine Item Price OrderableUnitFactorRate</assert>
      <assert id="ubl-CR-629" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:ValidityPeriod)">[ubl-CR-629]-A ubl invoice should not include the InvoiceLine Item Price ValidityPeriod</assert>
      <assert id="ubl-CR-630" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceList)">[ubl-CR-630]-A ubl invoice should not include the InvoiceLine Item Price PriceList</assert>
      <assert id="ubl-CR-631" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:OrderableUnitFactorRate)">[ubl-CR-631]-A ubl invoice should not include the InvoiceLine Item Price OrderableUnitFactorRate</assert>
      <assert id="ubl-CR-632" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:ID)">[ubl-CR-632]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge ID</assert>
      <assert id="ubl-CR-633" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)">[ubl-CR-633]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge AllowanceChargeReasonCode</assert>
      <assert id="ubl-CR-634" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason)">[ubl-CR-634]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge AllowanceChargeReason</assert>
      <assert id="ubl-CR-635" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric)">[ubl-CR-635]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge MultiplierFactorNumeric</assert>
      <assert id="ubl-CR-636" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator)">[ubl-CR-636]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge PrepaidIndicator</assert>
      <assert id="ubl-CR-637" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric)">[ubl-CR-637]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge SequenceNumeric</assert>
      <assert id="ubl-CR-638" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode)">[ubl-CR-638]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge AccountingCostCode</assert>
      <assert id="ubl-CR-639" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AccountingCost)">[ubl-CR-639]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge AccountingCost</assert>
      <assert id="ubl-CR-640" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount)">[ubl-CR-640]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge PerUnitAmount</assert>
      <assert id="ubl-CR-641" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:TaxCategory)">[ubl-CR-641]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge TaxCategory</assert>
      <assert id="ubl-CR-642" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:TaxTotal)">[ubl-CR-642]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge TaxTotal</assert>
      <assert id="ubl-CR-643" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:PaymentMeans)">[ubl-CR-643]-A ubl invoice should not include the InvoiceLine Item Price AllowanceCharge PaymentMeans</assert>
      <assert id="ubl-CR-644" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:PricingExchangeRate)">[ubl-CR-644]-A ubl invoice should not include the InvoiceLine Item Price PricingExchangeRate</assert>
      <assert id="ubl-CR-645" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DeliveryTerms)">[ubl-CR-645]-A ubl invoice should not include the InvoiceLine DeliveryTerms</assert>
      <assert id="ubl-CR-646" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:SubInvoiceLine)">[ubl-CR-646]-A ubl invoice should not include the InvoiceLine SubInvoiceLine</assert>
      <assert id="ubl-CR-647" flag="warning" test="not((cac:InvoiceLine|cac:CreditNoteLine)/cac:ItemPriceExtension)">[ubl-CR-647]-A ubl invoice should not include the InvoiceLine ItemPriceExtension</assert>
      <assert id="ubl-CR-648" flag="warning" test="not(cbc:CustomizationID/@schemeID)">[ubl-CR-648]-A ubl invoice should not include the CustomizationID scheme identifier</assert>
      <assert id="ubl-CR-649" flag="warning" test="not(cbc:ProfileID/@schemeID)">[ubl-CR-649]-A ubl invoice should not include the ProfileID scheme identifier</assert>
      <assert id="ubl-CR-650" flag="warning" test="not(cbc:ID/@schemeID)">[ubl-CR-650]-A ubl invoice shall not include the Invoice ID scheme identifier</assert>
      <assert id="ubl-CR-651" flag="warning" test="not(cbc:SalesOrderID/@schemeID)">[ubl-CR-651]-A ubl invoice should not include the SalesOrderID scheme identifier</assert>
      <assert id="ubl-CR-652" flag="warning" test="not(//cac:PartyTaxScheme/cbc:CompanyID/@schemeID)">[ubl-CR-652]-A ubl invoice should not include the PartyTaxScheme CompanyID scheme identifier</assert>
      <assert id="ubl-CR-653" flag="warning" test="not(cac:PaymentMeans/cbc:PaymentID/@schemeID)">[ubl-CR-653]-A ubl invoice should not include the PaymentID scheme identifier</assert>
      <assert id="ubl-CR-654" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID/@schemeID)">[ubl-CR-654]-A ubl invoice should not include the PayeeFinancialAccount scheme identifier</assert>
      <assert id="ubl-CR-655" flag="warning" test="not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID/@schemeID)">[ubl-CR-655]-A ubl invoice shall not include the FinancialInstitutionBranch ID scheme identifier</assert>
      
      <assert id="ubl-CR-658" flag="warning" test="not(cbc:TaxCurrencyCode/@listID)">[ubl-CR-658]-A ubl invoice should not include the TaxCurrencyCode listID</assert>
      <assert id="ubl-CR-659" flag="warning" test="not(cac:AdditionalDocumentReference/cbc:DocumentTypeCode/@listID)">[ubl-CR-659]-A ubl invoice shall not include the AdditionalDocumentReference DocumentTypeCode listID</assert>
      <assert id="ubl-CR-660" flag="warning" test="not(//cac:Country/cbc:IdentificationCode/@listID)">[ubl-CR-660]-A ubl invoice should not include the Country Identification code listID</assert>
      <assert id="ubl-CR-661" flag="warning" test="not(cac:PaymentMeans/cbc:PaymentMeansCode/@listID)">[ubl-CR-661]-A ubl invoice should not include the PaymentMeansCode listID</assert>
      <assert id="ubl-CR-662" flag="warning" test="not(//cbc:AllowanceChargeReasonCode/@listID)">[ubl-CR-662]-A ubl invoice should not include the AllowanceChargeReasonCode listID</assert>
      <assert id="ubl-CR-663" flag="warning" test="not(//@unitCodeListID)">[ubl-CR-663]-A ubl invoice should not include the unitCodeListID</assert>
      <assert id="ubl-CR-664" flag="warning" test="not(//cac:FinancialInstitution)">[ubl-CR-664]-A ubl invoice should not include the FinancialInstitutionBranch FinancialInstitution</assert>
      <assert id="ubl-CR-665" flag="warning" test="not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  != '130' or not(cbc:DocumentTypeCode)]/cbc:ID/@schemeID)">[ubl-CR-665]-A ubl invoice should not include the AdditonalDocumentReference ID schemeID unless the ID equals '130'</assert>
      <assert id="ubl-CR-666" flag="warning" test="not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  = '130']/cac:Attachment)">[ubl-CR-666]-A ubl invoice should not include the AdditonalDocumentReference referring to an Invoice Object Identifier should not include an Attachment</assert>
      <assert id="ubl-CR-667" flag="warning" test="not(//cac:BuyersItemIdentification/cbc:ID/@schemeID)">[ubl-CR-667]-A ubl invoice should not include a Buyer Item Identification schemeID</assert>
      <assert id="ubl-CR-668" flag="warning" test="not(//cac:SellersItemIdentification/cbc:ID/@schemeID)">[ubl-CR-668]-A ubl invoice should not include a Sellers Item Identification schemeID</assert>
      <assert id="ubl-CR-669" flag="warning" test="not(//cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)">[ubl-CR-669]-A ubl invoice should not include a Price Allowance Reason Code</assert>
      <assert id="ubl-CR-670" flag="warning" test="not(//cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason)">[ubl-CR-670]-A ubl invoice should not include a Price Allowance Reason</assert>
      <assert id="ubl-CR-671" flag="warning" test="not(//cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric)">[ubl-CR-671]-A ubl invoice should not include a Price Allowance Multiplier Factor</assert>
      
      <assert id="ubl-DT-08" flag="warning" test="not(//@schemeName)">[ubl-DT-08]-Scheme name attribute should not be present</assert>
      <assert id="ubl-DT-09" flag="warning" test="not(//@schemeAgencyName)">[ubl-DT-09]-Scheme agency name attribute should not be present</assert>
      <assert id="ubl-DT-10" flag="warning" test="not(//@schemeDataURI)">[ubl-DT-10]-Scheme data uri attribute should not be present</assert>
      <assert id="ubl-DT-11" flag="warning" test="not(//@schemeURI)">[ubl-DT-11]-Scheme uri attribute should not be present</assert>
      <assert id="ubl-DT-12" flag="warning" test="not(//@format)">[ubl-DT-12]-Format attribute should not be present</assert>
      <assert id="ubl-DT-13" flag="warning" test="not(//@unitCodeListIdentifier)">[ubl-DT-13]-Unit code list identifier attribute should not be present</assert>
      <assert id="ubl-DT-14" flag="warning" test="not(//@unitCodeListAgencyIdentifier)">[ubl-DT-14]-Unit code list agency identifier attribute should not be present</assert>
      <assert id="ubl-DT-15" flag="warning" test="not(//@unitCodeListAgencyName)">[ubl-DT-15]-Unit code list agency name attribute should not be present</assert>
      <assert id="ubl-DT-16" flag="warning" test="not(//@listAgencyName)">[ubl-DT-16]-List agency name attribute should not be present</assert>
      <assert id="ubl-DT-17" flag="warning" test="not(//@listName)">[ubl-DT-17]-List name attribute should not be present</assert>
      <assert id="ubl-DT-18" flag="warning" test="count(//@name) - count(//cbc:PaymentMeansCode/@name) &lt;= 0">[ubl-DT-18]-Name attribute should not be present</assert>
      <assert id="ubl-DT-19" flag="warning" test="not(//@languageID)">[ubl-DT-19]-Language identifier attribute should not be present</assert>
      <assert id="ubl-DT-20" flag="warning" test="not(//@listURI)">[ubl-DT-20]-List uri attribute should not be present</assert>
      <assert id="ubl-DT-21" flag="warning" test="not(//@listSchemeURI)">[ubl-DT-21]-List scheme uri attribute should not be present</assert>
      <assert id="ubl-DT-22" flag="warning" test="not(//@languageLocaleID)">[ubl-DT-22]-Language local identifier attribute should not be present</assert>
      <assert id="ubl-DT-23" flag="warning" test="not(//@uri)">[ubl-DT-23]-Uri attribute should not be present</assert>
      <assert id="ubl-DT-24" flag="warning" test="not(//@currencyCodeListVersionID)">[ubl-DT-24]-Currency code list version id should not be present</assert>
      <assert id="ubl-DT-25" flag="warning" test="not(//@characterSetCode)">[ubl-DT-25]-CharacterSetCode attribute should not be present</assert>
      <assert id="ubl-DT-26" flag="warning" test="not(//@encodingCode)">[ubl-DT-26]-EncodingCode attribute should not be present</assert>
      <assert id="ubl-DT-27" flag="warning" test="not(//@schemeAgencyID)">[ubl-DT-27]-Scheme Agency ID attribute should not be present</assert>
      <assert id="ubl-DT-28" flag="warning" test="not(//@listAgencyID)">[ubl-DT-28]-List Agency ID attribute should not be present</assert>
      <assert id="ubl-SR-01" flag="warning" test="(count(cac:ContractDocumentReference/cbc:ID) &lt;= 1)">[ubl-SR-01]-Contract identifier shall occur maximum once.</assert>
      <assert id="ubl-SR-02" flag="warning" test="(count(cac:ReceiptDocumentReference/cbc:ID) &lt;= 1)">[ubl-SR-02]-Receive advice identifier shall occur maximum once</assert>
      <assert id="ubl-SR-03" flag="warning" test="(count(cac:DespatchDocumentReference/cbc:ID) &lt;= 1)">[ubl-SR-03]-Despatch advice identifier shall occur maximum once</assert>
      <assert id="ubl-SR-04" flag="warning" test="(count(cac:AdditionalDocumentReference[cbc:DocumentTypeCode='130']/cbc:ID) &lt;= 1)">[ubl-SR-04]-Invoice object identifier shall occur maximum once</assert>
      <assert id="ubl-SR-05" flag="warning" test="(count(cac:PaymentTerms/cbc:Note) &lt;= 1)">[ubl-SR-05]-Payment terms shall occur maximum once</assert>
      <assert id="ubl-SR-06" flag="warning" test="(count(cac:InvoiceDocumentReference) &lt;= 1)">[ubl-SR-06]-Preceding invoice reference shall occur maximum once</assert>
      <assert id="ubl-SR-08" flag="warning" test="(count(cac:InvoicePeriod) &lt;= 1)">[ubl-SR-08]-Invoice period shall occur maximum once</assert>
      <assert id="ubl-SR-09" flag="warning" test="(count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) &lt;= 1)">[ubl-SR-09]-Seller name shall occur maximum once</assert>
      <assert id="ubl-SR-10" flag="warning" test="(count(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) &lt;= 1)">[ubl-SR-10]-Seller trader name shall occur maximum once</assert>
      <assert id="ubl-SR-11" flag="warning" test="(count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1)">[ubl-SR-11]-Seller legal registration identifier shall occur maximum once</assert>
      <assert id="ubl-SR-12" flag="warning" test="(count(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)='VAT']/cbc:CompanyID) &lt;= 1)">[ubl-SR-12]-Seller VAT identifier shall occur maximum once</assert>
      <assert id="ubl-SR-13" flag="warning" test="(count(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)!='VAT']/cbc:ID) &lt;= 1)">[ubl-SR-13]-Seller tax registration shall occur maximum once</assert>
      <assert id="ubl-SR-14" flag="warning" test="(count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm) &lt;= 1)">[ubl-SR-14]-Seller additional legal information shall occur maximum once</assert>
      <assert id="ubl-SR-15" flag="warning" test="(count(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) &lt;= 1)">[ubl-SR-15]-Buyer name shall occur maximum once</assert>
      <assert id="ubl-SR-16" flag="warning" test="(count(cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID) &lt;= 1)">[ubl-SR-16]-Buyer identifier shall occur maximum once</assert>
      <assert id="ubl-SR-17" flag="warning" test="(count(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1)">[ubl-SR-17]-Buyer legal registration identifier shall occur maximum once</assert>
      <assert id="ubl-SR-18" flag="warning" test="(count(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)='VAT']/cbc:CompanyID) &lt;= 1)">[ubl-SR-18]-Buyer VAT identifier shall occur maximum once</assert>
      <assert id="ubl-SR-24" flag="warning" test="(count(cac:Delivery) &lt;= 1)">[ubl-SR-24]-Deliver to information shall occur maximum once</assert>
      <assert id="ubl-SR-29" flag="warning" test="(count(//cac:PartyIdentification/cbc:ID[upper-case(@schemeID) = 'SEPA']) &lt;= 1)">[ubl-SR-29]-Bank creditor reference shall occur maximum once</assert>
      <assert id="ubl-SR-39" flag="warning" test="(count(cac:ProjectReference/cbc:ID) &lt;= 1)">[ubl-SR-39]-Project reference shall occur maximum once.</assert>
      <assert id="ubl-SR-40" flag="warning" test="(count(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) &lt;= 1)">[ubl-SR-40]-Buyer trade name shall occur maximum once</assert>
      <assert id="ubl-SR-44" flag="warning" test="count(//cbc:PaymentID[not(preceding::cbc:PaymentID/. = .)]) &lt;= 1">[ubl-SR-44]-Payment ID shall occur maximum once</assert>
      <assert id="ubl-SR-45" flag="warning" test="(count(cac:PaymentMeans/cbc:PaymentDueDate) &lt;=1)">[ubl-SR-45]-Due Date shall occur maximum once</assert>
      <assert id="ubl-SR-46" flag="warning" test="(count(cac:PaymentMeans/cbc:PaymentMeansCode/@name) &lt;=1)">[ubl-SR-46]-Payment means text shall occur maximum once</assert>
      <assert id="ubl-SR-47" flag="warning" test="count(//cbc:PaymentMeansCode[not(preceding::cbc:PaymentMeansCode/. = .)]) &lt;= 1">[ubl-SR-47]-When there are more than one payment means code, they shall be equal</assert>
      <assert id="ubl-SR-49" flag="warning" test="(count(cac:InvoicePeriod/cbc:DescriptionCode) &lt;=1)">[ubl-SR-49]-Value tax point date shall occur maximum once</assert>
    </rule>
    <rule context="cac:InvoiceLine | cac:CreditNoteLine">
      <assert id="ubl-SR-34" flag="warning" test="(count(cbc:Note) &lt;= 1)">[ubl-SR-34]-Invoice line note shall occur maximum once</assert>
      <assert id="ubl-SR-35" flag="warning" test="(count(cac:OrderLineReference/cbc:LineID) &lt;= 1)">[ubl-SR-35]-Referenced purchase order line identifier shall occur maximum once</assert>
      <assert id="ubl-SR-36" flag="warning" test="(count(cac:InvoicePeriod) &lt;= 1)">[ubl-SR-36]-Invoice line period shall occur maximum once</assert>
      <assert id="ubl-SR-37" flag="warning" test="(count(cac:Price/cac:AllowanceCharge/cbc:Amount) &lt;= 1)">[ubl-SR-37]-Item price discount shall occur maximum once</assert>
      <assert id="ubl-SR-38" flag="warning" test="(count(cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason) &lt;= 1)">[ubl-SR-38]-Invoiced item VAT exemption reason text shall occur maximum once</assert>
      <assert id="ubl-SR-48" flag="warning" test="count(cac:Item/cac:ClassifiedTaxCategory) = 1">[ubl-SR-48]-Invoice lines shall have one and only one classified tax category.</assert>
      <assert id="ubl-SR-50" flag="warning" test="count(cac:Item/cbc:Description) &lt;= 1">[ubl-SR-50]-Item description shall occur maximum once</assert>
    </rule>
    <rule context="cac:PayeeParty">
      <assert id="ubl-SR-19" flag="warning" test="(count(cac:PartyName/cbc:Name) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName))">[ubl-SR-19]-Payee name shall occur maximum once, if the Payee is different from the Seller</assert>
      <assert id="ubl-SR-20" flag="warning" test="(count(cac:PartyIdentification/cbc:ID[upper-case(@schemeID) != 'SEPA']) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName))">[ubl-SR-20]-Payee identifier shall occur maximum once, if the Payee is different from the Seller</assert>
      <assert id="ubl-SR-21" flag="warning" test="(count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName))">[ubl-SR-21]-Payee legal registration identifier shall occur maximum once, if the Payee is different from the Seller</assert>
    </rule>
    <rule context="cac:PaymentMeans">
      <assert id="ubl-SR-26" flag="warning" test="(count(cbc:PaymentID) &lt;= 1)">[ubl-SR-26]-Payment reference shall occur maximum once</assert>
      <assert id="ubl-SR-27" flag="warning" test="(count(cbc:InstructionNote) &lt;= 1)">[ubl-SR-27]-Payment means text shall occur maximum once</assert>
      <assert id="ubl-SR-28" flag="warning" test="(count(cac:PaymentMandate/cbc:ID) &lt;= 1)">[ubl-SR-28]-Mandate reference identifier shall occur maximum once</assert>
    </rule>
    <rule context="cac:BillingReference">
      <assert id="ubl-SR-07" flag="warning" test="(cac:InvoiceDocumentReference/cbc:ID)">[ubl-SR-07]-If there is a preceding invoice reference, the preceding invoice number shall be present</assert>
    </rule>
    <rule context="cac:TaxRepresentativeParty">
      <assert id="ubl-SR-22" flag="warning" test="(count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1)">[ubl-SR-22]-Seller tax representative name shall occur maximum once, if the Seller has a tax representative</assert>
      <assert id="ubl-SR-23" flag="warning" test="(count(cac:Party/cac:PartyTaxScheme/cbc:CompanyID) &lt;= 1)">[ubl-SR-23]-Seller tax representative VAT identifier shall occur maximum once, if the Seller has a tax representative</assert>
    </rule>
    <rule context="cac:TaxSubtotal">
      <assert id="ubl-SR-32" flag="warning" test="(count(cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1)">[ubl-SR-32]-VAT exemption reason text shall occur maximum once</assert>
    </rule>
  </pattern>
  <pattern id="Codesmodel">
    <rule flag="fatal" context="cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode">
      <assert id="BR-CL-01" flag="fatal" test="(self::cbc:InvoiceTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 80 82 84 130 202 203 204 211 295 325 326 380 383 384 385 386 387 388 389 390 393 394 395 456 457 527 575 623 633 751 780 935 ', concat(' ', normalize-space(.), ' '))))) or (self::cbc:CreditNoteTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 81 83 261 262 296 308 381 396 420 458 532 ', concat(' ', normalize-space(.), ' ')))))">[BR-CL-01]-The document type code MUST be coded by the invoice and credit note related code lists of UNTDID 1001.</assert>
    </rule>
    <rule flag="fatal" context="cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount">
      <assert id="BR-CL-03" flag="fatal" test="((not(contains(normalize-space(@currencyID), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(@currencyID), ' '))))">[BR-CL-03]-currencyID MUST be coded using ISO code list 4217 alpha-3</assert>
    </rule>
    <rule flag="fatal" context="cbc:DocumentCurrencyCode">
      <assert id="BR-CL-04" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(.), ' '))))">[BR-CL-04]-Invoice currency code MUST be coded using ISO code list 4217 alpha-3</assert>
    </rule>
    <rule flag="fatal" context="cbc:TaxCurrencyCode">
      <assert id="BR-CL-05" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(.), ' '))))">[BR-CL-05]-Tax currency code MUST be coded using ISO code list 4217 alpha-3</assert>
    </rule>
    <rule flag="fatal" context="cac:InvoicePeriod/cbc:DescriptionCode">
      <assert id="BR-CL-06" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' 3 35 432 ', concat(' ', normalize-space(.), ' '))))">[BR-CL-06]-Value added tax point date code MUST be coded using a restriction of UNTDID 2005.</assert>
    </rule>
    <rule flag="fatal" context="cac:AdditionalDocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID] | cac:DocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID]">
      <assert id="BR-CL-07" flag="fatal" test="((not(contains(normalize-space(@schemeID), ' ')) and contains(' AAA AAB AAC AAD AAE AAF AAG AAH AAI AAJ AAK AAL AAM AAN AAO AAP AAQ AAR AAS AAT AAU AAV AAW AAX AAY AAZ ABA ABB ABC ABD ABE ABF ABG ABH ABI ABJ ABK ABL ABM ABN ABO ABP ABQ ABR ABS ABT ABU ABV ABW ABX ABY ABZ AC ACA ACB ACC ACD ACE ACF ACG ACH ACI ACJ ACK ACL ACN ACO ACP ACQ ACR ACT ACU ACV ACW ACX ACY ACZ ADA ADB ADC ADD ADE ADF ADG ADI ADJ ADK ADL ADM ADN ADO ADP ADQ ADT ADU ADV ADW ADX ADY ADZ AE AEA AEB AEC AED AEE AEF AEG AEH AEI AEJ AEK AEL AEM AEN AEO AEP AEQ AER AES AET AEU AEV AEW AEX AEY AEZ AF AFA AFB AFC AFD AFE AFF AFG AFH AFI AFJ AFK AFL AFM AFN AFO AFP AFQ AFR AFS AFT AFU AFV AFW AFX AFY AFZ AGA AGB AGC AGD AGE AGF AGG AGH AGI AGJ AGK AGL AGM AGN AGO AGP AGQ AGR AGS AGT AGU AGV AGW AGX AGY AGZ AHA AHB AHC AHD AHE AHF AHG AHH AHI AHJ AHK AHL AHM AHN AHO AHP AHQ AHR AHS AHT AHU AHV AHX AHY AHZ AIA AIB AIC AID AIE AIF AIG AIH AII AIJ AIK AIL AIM AIN AIO AIP AIQ AIR AIS AIT AIU AIV AIW AIX AIY AIZ AJA AJB AJC AJD AJE AJF AJG AJH AJI AJJ AJK AJL AJM AJN AJO AJP AJQ AJR AJS AJT AJU AJV AJW AJX AJY AJZ AKA AKB AKC AKD AKE AKF AKG AKH AKI AKJ AKK AKL AKM AKN AKO AKP AKQ AKR AKS AKT AKU AKV AKW AKX AKY AKZ ALA ALB ALC ALD ALE ALF ALG ALH ALI ALJ ALK ALL ALM ALN ALO ALP ALQ ALR ALS ALT ALU ALV ALW ALX ALY ALZ AMA AMB AMC AMD AME AMF AMG AMH AMI AMJ AMK AML AMM AMN AMO AMP AMQ AMR AMS AMT AMU AMV AMW AMX AMY AMZ ANA ANB ANC AND ANE ANF ANG ANH ANI ANJ ANK ANL ANM ANN ANO ANP ANQ ANR ANS ANT ANU ANV ANW ANX ANY AOA AOD AOE AOF AOG AOH AOI AOJ AOK AOL AOM AON AOO AOP AOQ AOR AOS AOT AOU AOV AOW AOX AOY AOZ AP APA APB APC APD APE APF APG APH API APJ APK APL APM APN APO APP APQ APR APS APT APU APV APW APX APY APZ AQA AQB AQC AQD AQE AQF AQG AQH AQI AQJ AQK AQL AQM AQN AQO AQP AQQ AQR AQS AQT AQU AQV AQW AQX AQY AQZ ARA ARB ARC ARD ARE ARF ARG ARH ARI ARJ ARK ARL ARM ARN ARO ARP ARQ ARR ARS ART ARU ARV ARW ARX ARY ARZ ASA ASB ASC ASD ASE ASF ASG ASH ASI ASJ ASK ASL ASM ASN ASO ASP ASQ ASR ASS AST ASU ASV ASW ASX ASY ASZ ATA ATB ATC ATD ATE ATF ATG ATH ATI ATJ ATK ATL ATM ATN ATO ATP ATQ ATR ATS ATT ATU ATV ATW ATX ATY ATZ AU AUA AUB AUC AUD AUE AUF AUG AUH AUI AUJ AUK AUL AUM AUN AUO AUP AUQ AUR AUS AUT AUU AUV AUW AUX AUY AUZ AV AVA AVB AVC AVD AVE AVF AVG AVH AVI AVJ AVK AVL AVM AVN AVO AVP AVQ AVR AVS AVT AVU AVV AVW AVX AVY AVZ AWA AWB AWC AWD AWE AWF AWG AWH AWI AWJ AWK AWL AWM AWN AWO AWP AWQ AWR AWS AWT AWU AWV AWW AWX AWY AWZ AXA AXB AXC AXD AXE AXF AXG AXH AXI AXJ AXK AXL AXM AXN AXO AXP AXQ AXR AXS BA BC BD BE BH BM BN BO BR BT BTP BW CAS CAT CAU CAV CAW CAX CAY CAZ CBA CBB CD CEC CED CFE CFF CFO CG CH CK CKN CM CMR CN CNO COF CP CR CRN CS CST CT CU CV CW CZ DA DAN DB DI DL DM DQ DR EA EB ED EE EEP EI EN EQ ER ERN ET EX FC FF FI FLW FN FO FS FT FV FX GA GC GD GDN GN HS HWB IA IB ICA ICE ICO II IL INB INN INO IP IS IT IV JB JE LA LAN LAR LB LC LI LO LRC LS MA MB MF MG MH MR MRN MS MSS MWB NA NF OH OI ON OP OR PB PC PD PE PF PI PK PL POR PP PQ PR PS PW PY RA RC RCN RE REN RF RR RT SA SB SD SE SEA SF SH SI SM SN SP SQ SRN SS STA SW SZ TB TCR TE TF TI TIN TL TN TP UAR UC UCN UN UO URI VA VC VGR VM VN VON VOR VP VR VS VT VV WE WM WN WR WS WY XA XC XP ZZZ ', concat(' ', normalize-space(@schemeID), ' '))))">[BR-CL-07]-Object identifier identification scheme identifier MUST be coded using a restriction of UNTDID 1153.</assert>
    </rule>
    <rule flag="fatal" context="cac:PartyIdentification/cbc:ID[@schemeID]">
      <assert id="BR-CL-10" flag="fatal" test="((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0001 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 ', concat(' ', normalize-space(@schemeID), ' '))))  or ((not(contains(normalize-space(@schemeID), ' ')) and contains(' SEPA ', concat(' ', normalize-space(@schemeID), ' '))) and ((ancestor::cac:AccountingSupplierParty) or (ancestor::cac:PayeeParty)))">[BR-CL-10]-Any identifier identification scheme identifier MUST be coded using one of the ISO 6523 ICD list.</assert>
    </rule>
    <rule flag="fatal" context="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]">
      <assert id="BR-CL-11" flag="fatal" test="((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0001 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 9956 ', concat(' ', normalize-space(@schemeID), ' '))))">[BR-CL-11]-Any registration identifier identification scheme identifier MUST be coded using one of the ISO 6523 ICD list.</assert>
    </rule>
    <rule flag="fatal" context="cac:CommodityClassification/cbc:ItemClassificationCode[@listID]">
      <assert id="BR-CL-13" flag="fatal" test="((not(contains(normalize-space(@listID), ' ')) and contains(' AA AB AC AD AE AF AG AH AI AJ AK AL AM AN AO AP AQ AR AS AT AU AV AW AX AY AZ BA BB BC BD BE BF BG BH BI BJ BK BL BM BN BO BP BQ BR BS BT BU BV BW BX BY BZ CC CG CL CR CV DR DW EC EF EN FS GB GN GS HS IB IN IS IT IZ MA MF MN MP NB ON PD PL PO PV QS RC RN RU RY SA SG SK SN SRS SRT SRU SRV SRW SRX SRY SRZ SS SSA SSB SSC SSD SSE SSF SSG SSH SSI SSJ SSK SSL SSM SSN SSO SSP SSQ SSR SSS SST SSU SSV SSW SSX SSY SSZ ST STA STB STC STD STE STF STG STH STI STJ STK STL STM STN STO STP STQ STR STS STT STU STV STW STX STY STZ SUA SUB SUC SUD SUE SUF SUG SUH SUI SUJ SUK SUL SUM TG TSN TSO TSP TSQ TSR TSS TST UA UP VN VP VS VX ZZZ ', concat(' ', normalize-space(@listID), ' '))))">[BR-CL-13]-Item classification identifier identification scheme identifier MUST be
      coded using one of the UNTDID 7143 list.</assert>
    </rule>
    <rule flag="fatal" context="cac:Country/cbc:IdentificationCode">
      <assert id="BR-CL-14" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW ', concat(' ', normalize-space(.), ' '))))">[BR-CL-14]-Country codes in an invoice MUST be coded using ISO code list 3166-1</assert>
    </rule>
    <rule flag="fatal" context="cac:OriginCountry/cbc:IdentificationCode">
      <assert id="BR-CL-15" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW ', concat(' ', normalize-space(.), ' '))))">[BR-CL-15]-Country codes in an invoice MUST be coded using ISO code list 3166-1</assert>
    </rule>
    <rule flag="fatal" context="cac:PaymentMeans/cbc:PaymentMeansCode">
      <assert id="BR-CL-16" flag="fatal" test="( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 70 74 75 76 77 78 91 92 93 94 95 96 97 ZZZ ',concat(' ',normalize-space(.),' ') ) ) )">[BR-CL-16]-Payment means in an invoice MUST be coded using UNCL4461 code list</assert>
    </rule>
    <rule flag="fatal" context="cac:TaxCategory/cbc:ID">
      <assert id="BR-CL-17" flag="fatal" test="( ( not(contains(normalize-space(.),' ')) and contains( ' AE L M E S Z G O K ',concat(' ',normalize-space(.),' ') ) ) )">[BR-CL-17]-Invoice tax categories MUST be coded using UNCL5305 code list</assert>
    </rule>
    <rule flag="fatal" context="cac:ClassifiedTaxCategory/cbc:ID">
      <assert id="BR-CL-18" flag="fatal" test="( ( not(contains(normalize-space(.),' ')) and contains( ' AE L M E S Z G O K ',concat(' ',normalize-space(.),' ') ) ) )">[BR-CL-18]-Invoice tax categories MUST be coded using UNCL5305 code list</assert>
    </rule>
    <rule flag="fatal" context="cac:AllowanceCharge[cbc:ChargeIndicator = false()]/cbc:AllowanceChargeReasonCode">
      <assert id="BR-CL-19" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' 41 42 60 62 63 64 65 66 67 68 70 71 88 95 100 102 103 104 ', concat(' ', normalize-space(.), ' '))))">[BR-CL-19]-Coded allowance reasons MUST belong to the UNCL 5189 code list</assert>
    </rule>
    <rule flag="fatal" context="cac:AllowanceCharge[cbc:ChargeIndicator = true()]/cbc:AllowanceChargeReasonCode">
      <assert id="BR-CL-20" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' AA AAA AAC AAD AAE AAF AAH AAI AAS AAT AAV AAY AAZ ABA ABB ABC ABD ABF ABK ABL ABN ABR ABS ABT ABU ACF ACG ACH ACI ACJ ACK ACL ACM ACS ADC ADE ADJ ADK ADL ADM ADN ADO ADP ADQ ADR ADT ADW ADY ADZ AEA AEB AEC AED AEF AEH AEI AEJ AEK AEL AEM AEN AEO AEP AES AET AEU AEV AEW AEX AEY AEZ AJ AU CA CAB CAD CAE CAF CAI CAJ CAK CAL CAM CAN CAO CAP CAQ CAR CAS CAT CAU CAV CAW CAX CAY CAZ CD CG CS CT DAB DAD DAC DAF DAG DAH DAI DAJ DAK DAL DAM DAN DAO DAP DAQ DL EG EP ER FAA FAB FAC FC FH FI GAA HAA HD HH IAA IAB ID IF IR IS KO L1 LA LAA LAB LF MAE MI ML NAA OA PA PAA PC PL RAB RAC RAD RAF RE RF RH RV SA SAA SAD SAE SAI SG SH SM SU TAB TAC TT TV V1 V2 WH XAA YY ZZZ ', concat(' ', normalize-space(.), ' '))))">[BR-CL-20]-Coded charge reasons MUST belong to the UNCL 7161 code list</assert>
    </rule>
    <rule flag="fatal" context="cac:StandardItemIdentification/cbc:ID[@schemeID]">
      <assert id="BR-CL-21" flag="fatal" test="((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0001 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 ', concat(' ', normalize-space(@schemeID), ' '))))">[BR-CL-21]-Item standard identifier scheme identifier MUST belong to the ISO 6523 ICD code list</assert>
    </rule>

    <rule flag="fatal" context="cbc:InvoicedQuantity[@unitCode] | cbc:BaseQuantity[@unitCode]">
      <assert id="BR-CL-23" flag="fatal" test="((not(contains(normalize-space(@unitCode), ' ')) and contains(' 10 11 13 14 15 20 21 22 23 24 25 27 28 33 34 35 37 38 40 41 56 57 58 59 60 61 64 66 74 76 77 78 80 81 84 85 87 89 91 1I 2A 2B 2C 2G 2H 2I 2J 2K 2L 2M 2N 2P 2Q 2R 2U 2X 2Y 2Z 3B 3C 4C 4G 4H 4K 4L 4M 4N 4O 4P 4Q 4R 4T 4U 4W 4X 5A 5B 5E 5J A1 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A2 A20 A21 A22 A23 A24 A25 A26 A27 A28 A29 A3 A30 A31 A32 A33 A34 A35 A36 A37 A38 A39 A4 A40 A41 A42 A43 A44 A45 A47 A48 A49 A5 A50 A51 A52 A53 A54 A55 A56 A57 A58 A59 A6 A60 A61 A62 A63 A64 A65 A66 A67 A68 A69 A7 A70 A71 A73 A74 A75 A76 A77 A78 A79 A8 A80 A81 A82 A83 A84 A85 A86 A87 A88 A89 A9 A90 A91 A93 A94 A95 A96 A97 A98 A99 AA AB ACR ACT AD AE AH AI AK AL AMH AMP ANN APZ AQ ARE AS ASM ASU ATM ATT AY AZ B1 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B3 B30 B31 B32 B33 B34 B35 B36 B37 B38 B39 B4 B40 B41 B42 B43 B44 B45 B46 B47 B48 B49 B50 B51 B52 B53 B54 B55 B56 B57 B58 B59 B60 B61 B62 B63 B64 B65 B66 B67 B68 B69 B7 B70 B71 B72 B73 B74 B75 B76 B77 B78 B79 B8 B80 B81 B82 B83 B84 B85 B86 B87 B88 B89 B90 B91 B92 B93 B94 B95 B96 B97 B98 B99 BAR BB BFT BHP BIL BLD BLL BP BQL BTU BUA BUI C0 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C20 C21 C22 C23 C24 C25 C26 C27 C28 C29 C3 C30 C31 C32 C33 C34 C35 C36 C37 C38 C39 C40 C41 C42 C43 C44 C45 C46 C47 C48 C49 C50 C51 C52 C53 C54 C55 C56 C57 C58 C59 C60 C61 C62 C63 C64 C65 C66 C67 C68 C69 C7 C70 C71 C72 C73 C74 C75 C76 C78 C79 C8 C80 C81 C82 C83 C84 C85 C86 C87 C88 C89 C9 C90 C91 C92 C93 C94 C95 C96 C97 C99 CCT CDL CEL CEN CG CGM CKG CLF CLT CMK CMQ CMT CNP CNT COU CTG CTM CTN CUR CWA CWI D03 D04 D1 D10 D11 D12 D13 D15 D16 D17 D18 D19 D2 D20 D21 D22 D23 D24 D25 D26 D27 D29 D30 D31 D32 D33 D34 D35 D36 D37 D38 D39 D41 D42 D43 D44 D45 D46 D47 D48 D49 D5 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D6 D60 D61 D62 D63 D65 D68 D69 D70 D71 D72 D73 D74 D75 D76 D77 D78 D80 D81 D82 D83 D85 D86 D87 D88 D89 D9 D91 D93 D94 D95 DAA DAD DAY DB DD DEC DG DJ DLT DMA DMK DMO DMQ DMT DN DPC DPR DPT DRA DRI DRL DT DTN DU DWT DX DZN DZP E01 E07 E08 E09 E10 E11 E12 E14 E15 E16 E17 E18 E19 E20 E21 E22 E23 E25 E27 E28 E30 E31 E32 E33 E34 E35 E36 E37 E38 E39 E4 E40 E41 E42 E43 E44 E45 E46 E47 E48 E49 E50 E51 E52 E53 E54 E55 E56 E57 E58 E59 E60 E61 E62 E63 E64 E65 E66 E67 E68 E69 E70 E71 E72 E73 E74 E75 E76 E77 E78 E79 E80 E81 E82 E83 E84 E85 E86 E87 E88 E89 E90 E91 E92 E93 E94 E95 E96 E97 E98 E99 EA EB EQ F01 F02 F03 F04 F05 F06 F07 F08 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F20 F21 F22 F23 F24 F25 F26 F27 F28 F29 F30 F31 F32 F33 F34 F35 F36 F37 F38 F39 F40 F41 F42 F43 F44 F45 F46 F47 F48 F49 F50 F51 F52 F53 F54 F55 F56 F57 F58 F59 F60 F61 F62 F63 F64 F65 F66 F67 F68 F69 F70 F71 F72 F73 F74 F75 F76 F77 F78 F79 F80 F81 F82 F83 F84 F85 F86 F87 F88 F89 F90 F91 F92 F93 F94 F95 F96 F97 F98 F99 FAH FAR FBM FC FF FH FIT FL FOT FP FR FS FTK FTQ G01 G04 G05 G06 G08 G09 G10 G11 G12 G13 G14 G15 G16 G17 G18 G19 G2 G20 G21 G23 G24 G25 G26 G27 G28 G29 G3 G30 G31 G32 G33 G34 G35 G36 G37 G38 G39 G40 G41 G42 G43 G44 G45 G46 G47 G48 G49 G50 G51 G52 G53 G54 G55 G56 G57 G58 G59 G60 G61 G62 G63 G64 G65 G66 G67 G68 G69 G70 G71 G72 G73 G74 G75 G76 G77 G78 G79 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G93 G94 G95 G96 G97 G98 G99 GB GBQ GDW GE GF GFI GGR GIA GIC GII GIP GJ GL GLD GLI GLL GM GO GP GQ GRM GRN GRO GRT GT GV GWH H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31 H32 H33 H34 H35 H36 H37 H38 H39 H40 H41 H42 H43 H44 H45 H46 H47 H48 H49 H50 H51 H52 H53 H54 H55 H56 H57 H58 H59 H60 H61 H62 H63 H64 H65 H66 H67 H68 H69 H70 H71 H72 H73 H74 H75 H76 H77 H78 H79 H80 H81 H82 H83 H84 H85 H87 H88 H89 H90 H91 H92 H93 H94 H95 H96 H98 H99 HA HAR HBA HBX HC HDW HEA HGM HH HIU HJ HKM HLT HM HMQ HMT HN HP HPA HTZ HUR IA IE INH INK INQ ISD IU IV J10 J12 J13 J14 J15 J16 J17 J18 J19 J2 J20 J21 J22 J23 J24 J25 J26 J27 J28 J29 J30 J31 J32 J33 J34 J35 J36 J38 J39 J40 J41 J42 J43 J44 J45 J46 J47 J48 J49 J50 J51 J52 J53 J54 J55 J56 J57 J58 J59 J60 J61 J62 J63 J64 J65 J66 J67 J68 J69 J70 J71 J72 J73 J74 J75 J76 J78 J79 J81 J82 J83 J84 J85 J87 J89 J90 J91 J92 J93 J94 J95 J96 J97 J98 J99 JE JK JM JNT JOU JPS JWL K1 K10 K11 K12 K13 K14 K15 K16 K17 K18 K19 K2 K20 K21 K22 K23 K24 K25 K26 K27 K28 K3 K30 K31 K32 K33 K34 K35 K36 K37 K38 K39 K40 K41 K42 K43 K45 K46 K47 K48 K49 K5 K50 K51 K52 K53 K54 K55 K58 K59 K6 K60 K61 K62 K63 K64 K65 K66 K67 K68 K69 K70 K71 K73 K74 K75 K76 K77 K78 K79 K80 K81 K82 K83 K84 K85 K86 K87 K88 K89 K90 K91 K92 K93 K94 K95 K96 K97 K98 K99 KA KAT KB KBA KCC KDW KEL KGM KGS KHY KHZ KI KIC KIP KJ KJO KL KLK KLX KMA KMH KMK KMQ KMT KNI KNS KNT KO KPA KPH KPO KPP KR KSD KSH KT KTN KUR KVA KVR KVT KW KWH KWO KWT KX L10 L11 L12 L13 L14 L15 L16 L17 L18 L19 L2 L20 L21 L23 L24 L25 L26 L27 L28 L29 L30 L31 L32 L33 L34 L35 L36 L37 L38 L39 L40 L41 L42 L43 L44 L45 L46 L47 L48 L49 L50 L51 L52 L53 L54 L55 L56 L57 L58 L59 L60 L63 L64 L65 L66 L67 L68 L69 L70 L71 L72 L73 L74 L75 L76 L77 L78 L79 L80 L81 L82 L83 L84 L85 L86 L87 L88 L89 L90 L91 L92 L93 L94 L95 L96 L98 L99 LA LAC LBR LBT LD LEF LF LH LK LM LN LO LP LPA LR LS LTN LTR LUB LUM LUX LY M1 M10 M11 M12 M13 M14 M15 M16 M17 M18 M19 M20 M21 M22 M23 M24 M25 M26 M27 M29 M30 M31 M32 M33 M34 M35 M36 M37 M38 M39 M4 M40 M41 M42 M43 M44 M45 M46 M47 M48 M49 M5 M50 M51 M52 M53 M55 M56 M57 M58 M59 M60 M61 M62 M63 M64 M65 M66 M67 M68 M69 M7 M70 M71 M72 M73 M74 M75 M76 M77 M78 M79 M80 M81 M82 M83 M84 M85 M86 M87 M88 M89 M9 M90 M91 M92 M93 M94 M95 M96 M97 M98 M99 MAH MAL MAM MAR MAW MBE MBF MBR MC MCU MD MGM MHZ MIK MIL MIN MIO MIU MLD MLT MMK MMQ MMT MND MON MPA MQH MQS MSK MTK MTQ MTR MTS MVA MWH N1 N10 N11 N12 N13 N14 N15 N16 N17 N18 N19 N20 N21 N22 N23 N24 N25 N26 N27 N28 N29 N3 N30 N31 N32 N33 N34 N35 N36 N37 N38 N39 N40 N41 N42 N43 N44 N45 N46 N47 N48 N49 N50 N51 N52 N53 N54 N55 N56 N57 N58 N59 N60 N61 N62 N63 N64 N65 N66 N67 N68 N69 N70 N71 N72 N73 N74 N75 N76 N77 N78 N79 N80 N81 N82 N83 N84 N85 N86 N87 N88 N89 N90 N91 N92 N93 N94 N95 N96 N97 N98 N99 NA NAR NCL NEW NF NIL NIU NL NMI NMP NPR NPT NQ NR NT NTT NU NX OA ODE OHM ON ONZ OT OZ OZA OZI P1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 P30 P31 P32 P33 P34 P35 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47 P48 P49 P5 P50 P51 P52 P53 P54 P55 P56 P57 P58 P59 P60 P61 P62 P63 P64 P65 P66 P67 P68 P69 P70 P71 P72 P73 P74 P75 P76 P77 P78 P79 P80 P81 P82 P83 P84 P85 P86 P87 P88 P89 P90 P91 P92 P93 P94 P95 P96 P97 P98 P99 PAL PD PFL PGL PI PLA PO PQ PR PS PT PTD PTI PTL Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q3 QA QAN QB QR QT QTD QTI QTL QTR R1 R9 RH RM ROM RP RPM RPS RT S3 S4 SAN SCO SCR SEC SET SG SHT SIE SMI SQ SQR SR STC STI STK STL STN STW SW SX SYR T0 T3 TAH TAN TI TIC TIP TKM TMS TNE TP TPR TQD TRL TST TTS U1 U2 UA UB UC VA VLT VP W2 WA WB WCD WE WEB WEE WG WHR WM WSD WTT WW X1 YDK YDQ YRD Z11 ZP ZZ X43 X44 X1A X1B X1D X1F X1G X1W X2C X3A X3H X4A X4B X4C X4D X4F X4G X4H X5H X5L X5M X6H X6P X7A X7B X8A X8B X8C XAA XAB XAC XAD XAE XAF XAG XAH XAI XAJ XAL XAM XAP XAT XAV XB4 XBA XBB XBC XBD XBE XBF XBG XBH XBI XBJ XBK XBL XBM XBN XBO XBP XBQ XBR XBS XBT XBU XBV XBW XBX XBY XBZ XCA XCB XCC XCD XCE XCF XCG XCH XCI XCJ XCK XCL XCM XCN XCO XCP XCQ XCR XCS XCT XCU XCV XCW XCX XCY XCZ XDA XDB XDC XDG XDH XDI XDJ XDK XDL XDM XDN XDP XDR XDS XDT XDU XDV XDW XDX XDY XEC XED XEE XEF XEG XEH XEI XEN XFB XFC XFD XFE XFI XFL XFO XFP XFR XFT XFW XFX XGB XGI XGL XGR XGU XGY XGZ XHA XHB XHC XHG XHN XHR XIA XIB XIC XID XIE XIF XIG XIH XIK XIL XIN XIZ XJB XJC XJG XJR XJT XJY XKG XKI XLE XLG XLT XLU XLV XLZ XMA XMB XMC XME XMR XMS XMT XMW XMX XNA XNE XNF XNG XNS XNT XNU XNV XOA XOB XOC XOD XOE XOF XOK XOT XOU XP2 XPA XPB XPC XPD XPE XPF XPG XPH XPI XPJ XPK XPL XPN XPO XPP XPR XPT XPU XPV XPX XPY XPZ XQA XQB XQC XQD XQF XQG XQH XQJ XQK XQL XQM XQN XQP XQQ XQR XQS XRD XRG XRJ XRK XRL XRO XRT XRZ XSA XSB XSC XSD XSE XSH XSI XSK XSL XSM XSO XSP XSS XST XSU XSV XSW XSY XSZ XT1 XTB XTC XTD XTE XTG XTI XTK XTL XTN XTO XTR XTS XTT XTU XTV XTW XTY XTZ XUC XUN XVA XVG XVI XVK XVL XVN XVO XVP XVQ XVR XVS XVY XWA XWB XWC XWD XWF XWG XWH XWJ XWK XWL XWM XWN XWP XWQ XWR XWS XWT XWU XWV XWW XWX XWY XWZ XXA XXB XXC XXD XXF XXG XXH XXJ XXK XYA XYB XYC XYD XYF XYG XYH XYJ XYK XYL XYM XYN XYP XYQ XYR XYS XYT XYV XYW XYX XYY XYZ XZA XZB XZC XZD XZF XZG XZH XZJ XZK XZL XZM XZN XZP XZQ XZR XZS XZT XZU XZV XZW XZX XZY XZZ ', concat(' ', normalize-space(@unitCode), ' '))))">[BR-CL-23]-Unit code MUST be coded according to the UN/ECE Recommendation 20 with
      Rec 21 extension</assert>
    </rule>
    <rule flag="fatal" context="cbc:EmbeddedDocumentBinaryObject[@mimeCode]">
      <assert id="BR-CL-24" flag="fatal" test="((@mimeCode = 'application/pdf' or @mimeCode = 'image/png' or @mimeCode = 'image/jpeg' or @mimeCode = 'text/csv' or @mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or @mimeCode = 'application/vnd.oasis.opendocument.spreadsheet'))">[BR-CL-24]-For Mime code in attribute use MIMEMediaType.</assert>
    </rule>
    <rule flag="fatal" context="cbc:EndpointID[@schemeID]">
      <assert id="BR-CL-25" flag="fatal" test="((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0007 0009 0037 0060 0088 0096 0097 0106 0130 0135 0142 0151 0183 0184 0190 0191 0192 0193 0195 0196 0198 0199 0200 0201 0202 0203 0204 9901 9902 9904 9905 9906 9907 9910 9913 9914 9915 9918 9919 9920 9922 9923 9924 9925 9926 9927 9928 9929 9930 9931 9932 9933 9934 9935 9936 9937 9938 9939 9940 9941 9942 9943 9944 9945 9946 9947 9948 9949 9950 9951 9952 9953 9955 9956 9957 9958 AN AQ AS AU EM ', concat(' ', normalize-space(@schemeID), ' '))))">[BR-CL-25]-Endpoint identifier scheme identifier MUST belong to the CEF EAS code list</assert>
    </rule>
  </pattern>

	<!-- START PEPPOL-EN16931-ubl -->
	<!-- Parameters -->
	<let name="profile" value="
      if (/*/cbc:ProfileID and matches(normalize-space(/*/cbc:ProfileID), 'urn:fdc:peppol.eu:2017:poacc:billing:([0-9]{2}):1.0')) then
        tokenize(normalize-space(/*/cbc:ProfileID), ':')[7]
      else
        'Unknown'"/>
	<let name="supplierCountry" value="
      if (/*/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/substring(cbc:CompanyID, 1, 2)) then
        upper-case(normalize-space(/*/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/substring(cbc:CompanyID, 1, 2)))
      else
        if (/*/cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/substring(cbc:CompanyID, 1, 2)) then
          upper-case(normalize-space(/*/cac:TaxRepresentativeParty/cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/substring(cbc:CompanyID, 1, 2)))
        else
          if (/*/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode) then
            upper-case(normalize-space(/*/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode))
          else
            'XX'"/>
	<!-- -->
	<let name="documentCurrencyCode" value="/*/cbc:DocumentCurrencyCode"/>
	<!-- Functions -->
	<function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:gln" as="xs:boolean">
		<param name="val"/>
		<variable name="length" select="string-length($val) - 1"/>
		<variable name="digits" select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
		<variable name="weightedSum" select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (1 + ((($i + 1) mod 2) * 2)))"/>
		<value-of select="(10 - ($weightedSum mod 10)) mod 10 = number(substring($val, $length + 1, 1))"/>
	</function>
	<function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:slack" as="xs:boolean">
		<param name="exp" as="xs:decimal"/>
		<param name="val" as="xs:decimal"/>
		<param name="slack" as="xs:decimal"/>
		<value-of select="xs:decimal($exp + $slack) &gt;= $val and xs:decimal($exp - $slack) &lt;= $val"/>
	</function>
	<function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:mod11" as="xs:boolean">
		<param name="val"/>
		<variable name="length" select="string-length($val) - 1"/>
		<variable name="digits" select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
		<variable name="weightedSum" select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (($i mod 6) + 2))"/>
		<value-of select="number($val) &gt; 0 and (11 - ($weightedSum mod 11)) mod 11 = number(substring($val, $length + 1, 1))"/>
	</function>
	<!-- Empty elements -->
	<pattern>
		<rule context="//*[not(*) and not(normalize-space())]">
			<assert id="PEPPOL-EN16931-R008" test="false()" flag="fatal">Document MUST not contain empty elements.</assert>
		</rule> 
	</pattern>
	<!--
    Transaction rules

    R00X - Document level
    R01X - Accounting customer
    R02X - Accounting supplier
    R04X - Allowance/Charge (document and line)
    R05X - Tax
    R06X - Payment
    R08X - Additonal document reference
    R1XX - Line level
    R11X - Invoice period
  -->
	<pattern>
		<!-- Document level -->
		<rule context="cn:CreditNote | ubl:Invoice">
			<assert id="PEPPOL-EN16931-R001" test="cbc:ProfileID" flag="warning">Business process MUST be provided.</assert>
			<assert id="PEPPOL-EN16931-R007" test="$profile != 'Unknown'" flag="fatal">Business process MUST be in the format 'urn:fdc:peppol.eu:2017:poacc:billing:NN:1.0' where NN indicates the process number.</assert>
			<assert id="PEPPOL-EN16931-R002" test="count(cbc:Note) &lt;= 1" flag="fatal">No more than one note is allowed on document level.</assert>
			<assert id="PEPPOL-EN16931-R003" test="cbc:BuyerReference or cac:OrderReference/cbc:ID" flag="fatal">A buyer reference or purchase order reference MUST be provided.</assert>
			<assert id="PEPPOL-EN16931-R004" test="starts-with(normalize-space(cbc:CustomizationID/text()), 'urn:cen.eu:en16931:2017#conformant#urn:UBL.BE:1.0.0.20180214')" flag="fatal">Specification identifier MUST have the value 'urn:cen.eu:en16931:2017#conformant#urn:UBL.BE:1.0.0.20180214'.</assert>
			<assert id="PEPPOL-EN16931-R053" test="count(cac:TaxTotal[cac:TaxSubtotal]) = 1" flag="fatal">Only one tax total with tax subtotals MUST be provided.</assert>
			<assert id="PEPPOL-EN16931-R054" test="count(cac:TaxTotal[not(cac:TaxSubtotal)]) = (if (cbc:TaxCurrencyCode) then 1 else 0)" flag="fatal">Only one tax total without tax subtotals MUST be provided when tax currency code is provided.</assert>
			<assert id="PEPPOL-EN16931-R055" test="not(cbc:TaxCurrencyCode) or (cac:TaxTotal/cbc:TaxAmount[@currencyID=normalize-space(../../cbc:TaxCurrencyCode)] &lt;= 0 and cac:TaxTotal/cbc:TaxAmount[@currencyID=normalize-space(../../cbc:DocumentCurrencyCode)] &lt;= 0) or (cac:TaxTotal/cbc:TaxAmount[@currencyID=normalize-space(../../cbc:TaxCurrencyCode)] &gt;= 0 and cac:TaxTotal/cbc:TaxAmount[@currencyID=normalize-space(../../cbc:DocumentCurrencyCode)] &gt;= 0) " flag="fatal">Invoice total VAT amount and Invoice total VAT amount in accounting currency MUST have the same operational sign</assert>
			<assert id="PEPPOL-EN16931-R006" test="(count(cac:AdditionalDocumentReference[cbc:DocumentTypeCode='130']) &lt;= 1)" flag="fatal">Only one invoiced object is allowed on document level</assert>
			<assert id="PEPPOL-EN16931-R080" test="(count(cac:AdditionalDocumentReference[cbc:DocumentTypeCode='50']) &lt;= 1)" flag="fatal">Only one project reference is allowed on document level</assert>
		</rule>
		<rule context="cbc:TaxCurrencyCode">
			<assert id="PEPPOL-EN16931-R005" test="not(normalize-space(text()) = normalize-space(../cbc:DocumentCurrencyCode/text()))" flag="fatal">VAT accounting currency code MUST be different from invoice currency code when provided.</assert>
		</rule>
		<!-- Accounting customer -->
		<rule context="cac:AccountingCustomerParty/cac:Party">
			<assert id="PEPPOL-EN16931-R010" test="cbc:EndpointID" flag="fatal">Buyer electronic address MUST be provided</assert>
		</rule>
		<!-- Accounting supplier -->
		<rule context="cac:AccountingSupplierParty/cac:Party">
			<assert id="PEPPOL-EN16931-R020" test="cbc:EndpointID" flag="fatal">Seller electronic address MUST be provided</assert>
		</rule>
		<!-- Allowance/Charge (document level/line level) -->
		<rule context="ubl:Invoice/cac:AllowanceCharge[cbc:MultiplierFactorNumeric and not(cbc:BaseAmount)] | ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge[cbc:MultiplierFactorNumeric and not(cbc:BaseAmount)] | cn:CreditNote/cac:AllowanceCharge[cbc:MultiplierFactorNumeric and not(cbc:BaseAmount)] | cn:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge[cbc:MultiplierFactorNumeric and not(cbc:BaseAmount)]">
			<assert id="PEPPOL-EN16931-R041" test="false()" flag="fatal">Allowance/charge base amount MUST be provided when allowance/charge percentage is provided.</assert>
		</rule>
		<rule context="ubl:Invoice/cac:AllowanceCharge[not(cbc:MultiplierFactorNumeric) and cbc:BaseAmount] | ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge[not(cbc:MultiplierFactorNumeric) and cbc:BaseAmount] | cn:CreditNote/cac:AllowanceCharge[not(cbc:MultiplierFactorNumeric) and cbc:BaseAmount] | cn:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge[not(cbc:MultiplierFactorNumeric) and cbc:BaseAmount]">
			<assert id="PEPPOL-EN16931-R042" test="false()" flag="fatal">Allowance/charge percentage MUST be provided when allowance/charge base amount is provided.</assert>
		</rule>
		<rule context="ubl:Invoice/cac:AllowanceCharge | ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge | cn:CreditNote/cac:AllowanceCharge | cn:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge">
			<assert id="PEPPOL-EN16931-R040" test="
          not(cbc:MultiplierFactorNumeric and cbc:BaseAmount) or u:slack(if (cbc:Amount) then
            cbc:Amount
          else
            0, (xs:decimal(cbc:BaseAmount) * xs:decimal(cbc:MultiplierFactorNumeric)) div 100, 0.02)" flag="fatal">Allowance/charge amount must equal base amount * percentage/100 if base amount and percentage exists</assert>
			<assert id="PEPPOL-EN16931-R043" test="normalize-space(cbc:ChargeIndicator/text()) = 'true' or normalize-space(cbc:ChargeIndicator/text()) = 'false'" flag="fatal">Allowance/charge ChargeIndicator value MUST equal 'true' or 'false'</assert>
		</rule>
		<!-- Payment -->
		<rule context="
        cac:PaymentMeans[some $code in tokenize('49 59', '\s')
          satisfies normalize-space(cbc:PaymentMeansCode) = $code]">
			<assert id="PEPPOL-EN16931-R061" test="cac:PaymentMandate/cbc:ID" flag="fatal">Mandate reference MUST be provided for direct debit.</assert>
		</rule>
		<!-- Currency -->
		<rule context="cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cac:TaxTotal[cac:TaxSubtotal]/cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount">
			<assert id="PEPPOL-EN16931-R051" test="@currencyID = $documentCurrencyCode" flag="fatal">All currencyID attributes must have the same value as the invoice currency code (BT-5), except for the invoice total VAT amount in accounting currency (BT-111).</assert>
		</rule>
		<!-- Line level - invoice period -->
		<rule context="ubl:Invoice[cac:InvoicePeriod/cbc:StartDate]/cac:InvoiceLine/cac:InvoicePeriod/cbc:StartDate | cn:CreditNote[cac:InvoicePeriod/cbc:StartDate]/cac:CreditNoteLine/cac:InvoicePeriod/cbc:StartDate">
			<assert id="PEPPOL-EN16931-R110" test="xs:date(text()) &gt;= xs:date(../../../cac:InvoicePeriod/cbc:StartDate)" flag="fatal">Start date of line period MUST be within invoice period.</assert>
		</rule>
		<rule context="ubl:Invoice[cac:InvoicePeriod/cbc:EndDate]/cac:InvoiceLine/cac:InvoicePeriod/cbc:EndDate | cn:CreditNote[cac:InvoicePeriod/cbc:EndDate]/cac:CreditNoteLine/cac:InvoicePeriod/cbc:EndDate">
			<assert id="PEPPOL-EN16931-R111" test="xs:date(text()) &lt;= xs:date(../../../cac:InvoicePeriod/cbc:EndDate)" flag="fatal">End date of line period MUST be within invoice period.</assert>
		</rule>
		<!-- Line level - line extension amount -->
		<rule context="cac:InvoiceLine | cac:CreditNoteLine">
			<let name="lineExtensionAmount" value="
          if (cbc:LineExtensionAmount) then
            xs:decimal(cbc:LineExtensionAmount)
          else
            0"/>
			<let name="quantity" value="
          if (/ubl:Invoice) then
            (if (cbc:InvoicedQuantity) then
              xs:decimal(cbc:InvoicedQuantity)
            else
              1)
          else
            (if (cbc:CreditedQuantity) then
              xs:decimal(cbc:CreditedQuantity)
            else
              1)"/>
			<let name="priceAmount" value="
          if (cac:Price/cbc:PriceAmount) then
            xs:decimal(cac:Price/cbc:PriceAmount)
          else
            0"/>
			<let name="baseQuantity" value="
          if (cac:Price/cbc:BaseQuantity and xs:decimal(cac:Price/cbc:BaseQuantity) != 0) then
            xs:decimal(cac:Price/cbc:BaseQuantity)
          else
            1"/>
			<let name="allowancesTotal" value="
          if (cac:AllowanceCharge[normalize-space(cbc:ChargeIndicator) = 'false']) then
            round(sum(cac:AllowanceCharge[normalize-space(cbc:ChargeIndicator) = 'false']/cbc:Amount/xs:decimal(.)) * 10 * 10) div 100
          else
            0"/>
			<let name="chargesTotal" value="
          if (cac:AllowanceCharge[normalize-space(cbc:ChargeIndicator) = 'true']) then
            round(sum(cac:AllowanceCharge[normalize-space(cbc:ChargeIndicator) = 'true']/cbc:Amount/xs:decimal(.)) * 10 * 10) div 100
          else
            0"/>
			<assert id="PEPPOL-EN16931-R120" test="u:slack($lineExtensionAmount, ($quantity * ($priceAmount div $baseQuantity)) + $chargesTotal - $allowancesTotal, 0.02)" flag="warning">Invoice line net amount MUST equal (Invoiced quantity * (Item net price/item price base quantity) + Sum of invoice line charge amount - sum of invoice line allowance amount</assert>
			<assert id="PEPPOL-EN16931-R121" test="not(cac:Price/cbc:BaseQuantity) or xs:decimal(cac:Price/cbc:BaseQuantity) &gt; 0" flag="fatal">Base quantity MUST be a positive number above zero.</assert>
			<assert id="PEPPOL-EN16931-R100" test="(count(cac:DocumentReference) &lt;= 1)" flag="fatal">Only one invoiced object is allowed pr line</assert>
			<assert id="PEPPOL-EN16931-R101" test="(not(cac:DocumentReference) or (cac:DocumentReference/cbc:DocumentTypeCode='130'))" flag="fatal">Element Document reference can only be used for Invoice line object</assert>
		</rule>
		<!-- Allowance (price level) -->
		<rule context="cac:Price/cac:AllowanceCharge">
			<assert id="PEPPOL-EN16931-R044" test="normalize-space(cbc:ChargeIndicator) = 'false'" flag="fatal">Charge on price level is NOT allowed.</assert>
			<assert id="PEPPOL-EN16931-R046" test="not(cbc:BaseAmount) or xs:decimal(../cbc:PriceAmount) = xs:decimal(cbc:BaseAmount) - xs:decimal(cbc:Amount)" flag="fatal">Item net price MUST equal (Gross price - Allowance amount) when gross price is provided.</assert>
		</rule>
		<!-- Price -->
		<rule context="cac:Price/cbc:BaseQuantity[@unitCode]">
			<let name="hasQuantity" value="../../cbc:InvoicedQuantity or ../../cbc:CreditedQuantity"/>
			<let name="quantity" value="
          if (/ubl:Invoice) then
            ../../cbc:InvoicedQuantity
          else
            ../../cbc:CreditedQuantity"/>
			<assert id="PEPPOL-EN16931-R130" test="not($hasQuantity) or @unitCode = $quantity/@unitCode" flag="fatal">Unit code of price base quantity MUST be same as invoiced quantity.</assert>
		</rule>
		<!-- Validation of ICD -->
		<rule context="cbc:EndpointID[@schemeID = '0088'] | cac:PartyIdentification/cbc:ID[@schemeID = '0088'] | cbc:CompanyID[@schemeID = '0088']">
			<assert id="PEPPOL-COMMON-R040"
					test="matches(normalize-space(), '^[0-9]+$') and u:gln(normalize-space())"
					flag="warning">GLN must have a valid format according to GS1 rules.</assert>
		</rule>
		<rule context="cbc:EndpointID[@schemeID = '0192'] | cac:PartyIdentification/cbc:ID[@schemeID = '0192'] | cbc:CompanyID[@schemeID = '0192']">
			<assert id="PEPPOL-COMMON-R041"
					test="matches(normalize-space(), '^[0-9]{9}$') and u:mod11(normalize-space())"
					flag="fatal">Norwegian organization number MUST be stated in the correct format.</assert>
		</rule>
		<rule context="cbc:EndpointID[@schemeID = '0184'] | cac:PartyIdentification/cbc:ID[@schemeID = '0184'] | cbc:CompanyID[@schemeID = '0184']">
			<assert id="PEPPOL-COMMON-R042"
					test="(string-length(text()) = 10) and (substring(text(), 1, 2) = 'DK') and (string-length(translate(substring(text(), 3, 8), '1234567890', '')) = 0)"
					flag="fatal">Danish organization number (CVR) MUST be stated in the correct format.</assert>
		</rule>

	</pattern>
	<!-- National rules -->
	<pattern>
		<!-- NORWAY -->
		<rule context="cac:AccountingSupplierParty/cac:Party[$supplierCountry = 'NO']">
			<assert id="NO-R-002" test="normalize-space(cac:PartyTaxScheme[normalize-space(cac:TaxScheme/cbc:ID) = 'TAX']/cbc:CompanyID) = 'Foretaksregisteret'" flag="warning">For Norwegian suppliers, most invoice issuers are required to append "Foretaksregisteret" to their
        invoice. "Dersom selger er aksjeselskap, allmennaksjeselskap eller filial av utenlandsk
        selskap skal også ordet «Foretaksregisteret» fremgå av salgsdokumentet, jf.
        foretaksregisterloven § 10-2."</assert>
			<assert id="NO-R-001" test="cac:PartyTaxScheme[normalize-space(cac:TaxScheme/cbc:ID) = 'VAT']/substring(cbc:CompanyID, 1, 2)='NO' and matches(cac:PartyTaxScheme[normalize-space(cac:TaxScheme/cbc:ID) = 'VAT']/substring(cbc:CompanyID,3), '^[0-9]{9}MVA$') 
          and u:mod11(substring(cac:PartyTaxScheme[normalize-space(cac:TaxScheme/cbc:ID) = 'VAT']/cbc:CompanyID, 3, 9)) or not(cac:PartyTaxScheme[normalize-space(cac:TaxScheme/cbc:ID) = 'VAT']/substring(cbc:CompanyID, 1, 2)='NO')" flag="fatal">For Norwegian suppliers, a VAT number MUST be the country code prefix NO followed by a valid Norwegian organization number (nine numbers) followed by the letters MVA.</assert>
		</rule>
	</pattern>
    
	<!-- DENMARK -->
	<pattern>
		<let name="DKSupplierCountry" value="concat(cn:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode, ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode)"/>
		<let name="DKCustomerCountry" value="concat(cn:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode, ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode)"/>

		<!-- Document level -->
		<rule context="cn:CreditNote[$DKSupplierCountry = 'DK'] | ubl:Invoice[$DKSupplierCountry = 'DK']">
			<assert id="DK-R-002"
					test="(normalize-space(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID/text()) != '')"
					flag="fatal">Danish suppliers MUST provide legal entity (CVR-number)</assert>

			<assert id="DK-R-014"
					test="not(((boolean(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID))
							   and (normalize-space(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID) != '0184'))
						)"
					flag="fatal">For Danish Suppliers it is mandatory to specify schemeID as "0184" (DK CVR-number) when PartyLegalEntity/CompanyID is used for AccountingSupplierParty</assert>

			<assert id="DK-R-015"
					test="not((normalize-space(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[1]/cac:TaxScheme/cbc:ID/text()) = 'VAT')
						and not ((string-length(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[1]/cbc:CompanyID/text()) = 10)
								 and (substring(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[1]/cbc:CompanyID/text(), 1, 2) = 'DK')
								 and (string-length(translate(substring(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[1]/cbc:CompanyID/text(), 3, 8), '1234567890', '')) = 0))
						or
						(normalize-space(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[2]/cac:TaxScheme/cbc:ID/text()) = 'VAT')
						and not ((string-length(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[2]/cbc:CompanyID/text()) = 10)
								 and (substring(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[2]/cbc:CompanyID/text(), 1, 2) = 'DK')
								 and (string-length(translate(substring(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[2]/cbc:CompanyID/text(), 3, 8), '1234567890', '')) = 0))
						)"
					flag="fatal">For Danish Suppliers, if specified, AccountingSupplierParty/PartyTaxScheme/CompanyID (DK VAT number) must start with DK followed by 8 digits</assert>

			<assert id="DK-R-016"
					test="not((boolean(/cn:CreditNote) and ($DKCustomerCountry = 'DK'))
						and (number(cac:LegalMonetaryTotal/cbc:PayableAmount/text()) &lt; 0)
						)"
					flag="fatal">For Danish Suppliers, a Credit note cannot have a negative total (PayableAmount)</assert>
		</rule>

		<rule context="cn:CreditNote[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification | cn:CreditNote[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification | ubl:Invoice[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification | ubl:Invoice[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification">
			<assert id="DK-R-013"
					test="not((boolean(cbc:ID))
						 and (normalize-space(cbc:ID/@schemeID) = '')
						)"
					flag="fatal">For Danish Suppliers it is mandatory to use schemeID when PartyIdentification/ID is used for AccountingCustomerParty or AccountingSupplierParty</assert>
		</rule>

		<rule context="ubl:Invoice[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']/cac:PaymentMeans" >
			<assert id="DK-R-005"
					test="contains(' 1 10 31 42 48 49 50 58 59 93 97 ', concat(' ', cbc:PaymentMeansCode, ' '))"
					flag="fatal">For Danish suppliers the following Payment means codes are allowed: 1, 10, 31, 42, 48, 49, 50, 58, 59, 93 and 97</assert>
			<assert id="DK-R-006"
					test="not(((cbc:PaymentMeansCode = '31') or (cbc:PaymentMeansCode = '42'))
						and not((normalize-space(cac:PayeeFinancialAccount/cbc:ID/text()) != '') and (normalize-space(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID/text()) != ''))
						)"
					flag="fatal">For Danish suppliers bank account and registration account is mandatory if payment means is 31 or 42</assert>
			<assert id="DK-R-007"
					test="not((cbc:PaymentMeansCode = '49')
						and not((normalize-space(cac:PaymentMandate/cbc:ID/text()) != '')
							   and (normalize-space(cac:PaymentMandate/cac:PayerFinancialAccount/cbc:ID/text()) != ''))
						)"
					flag="fatal">For Danish suppliers PaymentMandate/ID and PayerFinancialAccount/ID are mandatory when payment means is 49</assert>
			<assert id="DK-R-008"
					test="not((cbc:PaymentMeansCode = '50')
						and not(((substring(cbc:PaymentID, 1, 3) = '01#')
								  or (substring(cbc:PaymentID, 1, 3) = '04#')
								  or (substring(cbc:PaymentID, 1, 3) = '15#'))
								and (string-length(cac:PayeeFinancialAccount/cbc:ID/text()) = 7)
								)
						)"
					flag="fatal">For Danish Suppliers PaymentID is mandatory and MUST start with 01#, 04# or 15# (kortartkode), and PayeeFinancialAccount/ID (Giro kontonummer) is mandatory and must be 7 characters long, when payment means equals 50 (Giro)</assert>
			<assert id="DK-R-009"
					test="not((cbc:PaymentMeansCode = '50')
						and ((substring(cbc:PaymentID, 1, 3) = '04#')
							  or (substring(cbc:PaymentID, 1, 3)  = '15#'))
						and not(string-length(cbc:PaymentID) = 19)
						)"
					flag="fatal">For Danish Suppliers if the PaymentID is prefixed with 04# or 15# the 16 digits instruction Id must be added to the PaymentID eg. "04#1234567890123456" when Payment means equals 50 (Giro)</assert>
			<assert id="DK-R-010"
					test="not((cbc:PaymentMeansCode = '93')
						and not(((substring(cbc:PaymentID, 1, 3) = '71#')
								  or (substring(cbc:PaymentID, 1, 3) = '73#')
								  or (substring(cbc:PaymentID, 1, 3) = '75#'))
								and (string-length(cac:PayeeFinancialAccount/cbc:ID/text()) = 8)
								)
						)"
					flag="fatal">For Danish Suppliers the PaymentID is mandatory and MUST start with 71#, 73# or 75# (kortartkode) and PayeeFinancialAccount/ID (Kreditornummer) is mandatory and must be exactly 8 characters long, when Payment means equals 93 (FIK)</assert>
			<assert id="DK-R-011"
					test="not((cbc:PaymentMeansCode = '93')
						and ((substring(cbc:PaymentID, 1, 3) = '71#')
							  or (substring(cbc:PaymentID, 1, 3)  = '75#'))
						and not((string-length(cbc:PaymentID) = 18)
							  or (string-length(cbc:PaymentID) = 19))
						)"
					flag="fatal">For Danish Suppliers if the PaymentID is prefixed with 71# or 75# the 15-16 digits instruction Id must be added to the PaymentID eg. "71#1234567890123456" when payment Method equals 93 (FIK)</assert>
		</rule>

		<!-- Line level -->
		<rule context="cn:CreditNote[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']/cac:CreditNoteLine | ubl:Invoice[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']/cac:InvoiceLine">
			<assert id="DK-R-003"
					test="not((cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode/@listID = 'TST')
						and not((cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode/@listVersionID = '19.05.01')
							   or (cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode/@listVersionID = '19.0501')
							   )
						)"
					flag="warning">If ItemClassification is provided from Danish suppliers, UNSPSC version 19.0501 should be used.</assert>
		</rule>

		<!-- Mix level -->
		<rule context="cac:AllowanceCharge[$DKSupplierCountry = 'DK' and $DKCustomerCountry = 'DK']">
			<assert id="DK-R-004"
					test="not((cbc:AllowanceChargeReasonCode = 'ZZZ')
						and not((string-length(normalize-space(cbc:AllowanceChargeReason/text())) = 4)
								and (number(cbc:AllowanceChargeReason) &gt;= 0)
								and (number(cbc:AllowanceChargeReason) &lt;= 9999))
						)"
					flag="fatal">When specifying non-VAT Taxes, Danish suppliers MUST use the AllowanceChargeReasonCode="ZZZ" and the 4-digit Tax category MUST be specified in 'AllowanceChargeReason'</assert>
		</rule>
	</pattern>

	<!-- ITALY -->
	<pattern>
		<rule context="cac:AccountingSupplierParty/cac:Party[$supplierCountry = 'IT']/cac:PartyTaxScheme[normalize-space(cac:TaxScheme/cbc:ID) != 'VAT']">
			<assert id="IT-R-001" test="matches(normalize-space(cbc:CompanyID),'^[A-Z0-9]{11,16}$')" flag="fatal"> [IT-R-001] BT-32 (Seller tax registration identifier) - For Italian suppliers BT-32 minimum length 11 and maximum length shall be 16.  Per i fornitori italiani il BT-32 deve avere una lunghezza tra 11 e 16 caratteri</assert>
		</rule>
		<rule context="cac:AccountingSupplierParty/cac:Party[$supplierCountry = 'IT']">
			<assert id="IT-R-002" test="cac:PostalAddress/cbc:StreetName" flag="fatal">[IT-R-002] BT-35 (Seller address line 1) - Italian suppliers MUST provide the postal address line 1 - I fornitori italiani devono indicare l'indirizzo postale.</assert>
			<assert id="IT-R-003" test="cac:PostalAddress/cbc:CityName" flag="fatal">[IT-R-003] BT-37 (Seller city) - Italian suppliers MUST provide the postal address city - I fornitori italiani devono indicare la città di residenza.</assert>
			<assert id="IT-R-004" test="cac:PostalAddress/cbc:PostalZone" flag="fatal">"> [IT-R-004] BT-38 (Seller post code) - Italian suppliers MUST provide the postal address post code - I fornitori italiani devono indicare il CAP di residenza.</assert>
		</rule>
	</pattern>
	<!-- SWEDEN -->
	<pattern>
		<rule context="//cac:AccountingSupplierParty/cac:Party[cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE' and cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/substring(cbc:CompanyID, 1, 2) = 'SE']">
			<assert id="SE-R-001" test="string-length(normalize-space(cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/cbc:CompanyID)) = 14" flag="fatal">For Swedish suppliers, Swedish VAT-numbers must consist of 14 characters.</assert>
			<assert id="SE-R-002" test="string(number(substring(cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/cbc:CompanyID, 3, 12))) != 'NaN'" flag="fatal">For Swedish suppliers, the Swedish VAT-numbers must have the trailing 12 characters in numeric form</assert>
		</rule>
		<rule context="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity[../cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE' and cbc:CompanyID]">
			<assert id="SE-R-003" test="string(number(cbc:CompanyID)) != 'NaN'" flag="warning">Swedish organisation numbers should be numeric.</assert>
			<assert id="SE-R-004" test="string-length(normalize-space(cbc:CompanyID)) = 10" flag="warning">Swedish organisation numbers consist of 10 characters.</assert>
		</rule>
		<rule context="//cac:AccountingSupplierParty/cac:Party[cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE' and exists(cac:PartyLegalEntity/cbc:CompanyID)]/cac:PartyTaxScheme[normalize-space(upper-case(cac:TaxScheme/cbc:ID)) != 'VAT']/cbc:CompanyID">
			<assert id="SE-R-005" test="normalize-space(upper-case(.)) = 'GODKÄND FÖR F-SKATT'" flag="fatal">For Swedish suppliers, when using Seller tax registration identifier, 'Godkänd för F-skatt' must be stated</assert>
		</rule>
		<rule context="//cac:TaxCategory[//cac:AccountingSupplierParty/cac:Party[cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE' and cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/substring(cbc:CompanyID, 1, 2) = 'SE'] and cbc:ID = 'S'] | //cac:ClassifiedTaxCategory[//cac:AccountingSupplierParty/cac:Party[cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE' and cac:PartyTaxScheme[cac:TaxScheme/cbc:ID = 'VAT']/substring(cbc:CompanyID, 1, 2) = 'SE'] and cbc:ID = 'S']">
			<assert id="SE-R-006" test="number(cbc:Percent) = 25 or number(cbc:Percent) = 12 or number(cbc:Percent) = 6" flag="fatal">For Swedish suppliers, only standard VAT rate of 6, 12 or 25 are used</assert>
		</rule>
		<rule context="//cac:PaymentMeans[//cac:AccountingSupplierParty/cac:Party[cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE'] and normalize-space(cbc:PaymentMeansCode) = '30' and normalize-space(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID) = 'SE:PLUSGIRO']/cac:PayeeFinancialAccount/cbc:ID">
			<assert id="SE-R-007" test="string(number(normalize-space(.))) != 'NaN'" flag="warning">For Swedish suppliers using Plusgiro, the Account ID must be numeric </assert>
			<assert id="SE-R-010" test="string-length(normalize-space(.)) &gt;= 2 and string-length(normalize-space(.)) &lt;= 8" flag="warning">For Swedish suppliers using Plusgiro, the Account ID must have 2-8 characters</assert>
		</rule>
		<rule context="//cac:PaymentMeans[//cac:AccountingSupplierParty/cac:Party[cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE'] and normalize-space(cbc:PaymentMeansCode) = '30' and normalize-space(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID) = 'SE:BANKGIRO']/cac:PayeeFinancialAccount/cbc:ID">
			<assert id="SE-R-008" test="string(number(normalize-space(.))) != 'NaN'" flag="warning">For Swedish suppliers using Bankgiro, the Account ID must be numeric </assert>
			<assert id="SE-R-009" test="string-length(normalize-space(.)) = 7 or string-length(normalize-space(.)) = 8" flag="warning">For Swedish suppliers using Bankgiro, the Account ID must have 7-8 characters</assert>
		</rule>
		<rule context="//cac:PaymentMeans[//cac:AccountingSupplierParty/cac:Party[cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'SE'] and (cbc:PaymentMeansCode = normalize-space('50') or cbc:PaymentMeansCode = normalize-space('56'))]">
			<assert id="SE-R-011" test="false()" flag="warning">For Swedish suppliers using Swedish Bankgiro or Plusgiro, the proper way to indicate this is to use Code 30 for PaymentMeans and FinancialInstitutionBranch ID with code SE:BANKGIRO or SE:PLUSGIRO</assert>
		</rule>
	</pattern>
	<!-- Restricted code lists and formatting -->
	<pattern>
		<let name="ISO3166" value="tokenize('AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW', '\s')"/>
		<let name="ISO4217" value="tokenize('AFN EUR ALL DZD USD AOA XCD XCD ARS AMD AWG AUD AZN BSD BHD BDT BBD BYN BZD XOF BMD INR BTN BOB BOV USD BAM BWP NOK BRL USD BND BGN XOF BIF CVE KHR XAF CAD KYD XAF XAF CLP CLF CNY AUD AUD COP COU KMF CDF XAF NZD CRC XOF HRK CUP CUC ANG CZK DKK DJF XCD DOP USD EGP SVC USD XAF ERN ETB FKP DKK FJD XPF XAF GMD GEL GHS GIP DKK XCD USD GTQ GBP GNF XOF GYD HTG USD AUD HNL HKD HUF ISK INR IDR XDR IRR IQD GBP ILS JMD JPY GBP JOD KZT KES AUD KPW KRW KWD KGS LAK LBP LSL ZAR LRD LYD CHF MOP MKD MGA MWK MYR MVR XOF USD MRO MUR XUA MXN MXV USD MDL MNT XCD MAD MZN MMK NAD ZAR AUD NPR XPF NZD NIO XOF NGN NZD AUD USD NOK OMR PKR USD PAB USD PGK PYG PEN PHP NZD PLN USD QAR RON RUB RWF SHP XCD XCD XCD WST STD SAR XOF RSD SCR SLL SGD ANG XSU SBD SOS ZAR SSP LKR SDG SRD NOK SZL SEK CHF CHE CHW SYP TWD TJS TZS THB USD XOF NZD TOP TTD TND TRY TMT USD AUD UGX UAH AED GBP USD USD USN UYU UYI UZS VUV VEF VND USD USD XPF MAD YER ZMW ZWL XBA XBB XBC XBD XTS XXX XAU XPD XPT XAG', '\s')"/>
		<let name="MIMECODE" value="tokenize('application/pdf image/png image/jpeg text/csv application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.oasis.opendocument.spreadsheet', '\s')"/>
		<let name="UNCL2005" value="tokenize('3 35 432', '\s')"/>
		<let name="UNCL5189" value="tokenize('41 42 60 62 63 64 65 66 67 68 70 71 88 95 100 102 103 104 105', '\s')"/>
		<let name="UNCL7161" value="tokenize('AA AAA AAC AAD AAE AAF AAH AAI AAS AAT AAV AAY AAZ ABA ABB ABC ABD ABF ABK ABL ABN ABR ABS ABT ABU ACF ACG ACH ACI ACJ ACK ACL ACM ACS ADC ADE ADJ ADK ADL ADM ADN ADO ADP ADQ ADR ADT ADW ADY ADZ AEA AEB AEC AED AEF AEH AEI AEJ AEK AEL AEM AEN AEO AEP AES AET AEU AEV AEW AEX AEY AEZ AJ AU CA CAB CAD CAE CAF CAI CAJ CAK CAL CAM CAN CAO CAP CAQ CAR CAS CAT CAU CAV CAW CD CG CS CT DAB DAD DL EG EP ER FAA FAB FAC FC FH FI GAA HAA HD HH IAA IAB ID IF IR IS KO L1 LA LAA LAB LF MAE MI ML NAA OA PA PAA PC PL RAB RAC RAD RAF RE RF RH RV SA SAA SAD SAE SAI SG SH SM SU TAB TAC TT TV V1 V2 WH XAA YY ZZZ', '\s')"/>
		<let name="UNCL5305" value="tokenize('AE E S Z G O K L M', '\s')"/>
		<let name="eaid" value="tokenize('0002 0007 0009 0037 0060 0088 0096 0097 0106 0135 0142 0151 0183 0184 0190 0191 0192 0193 0195 0196 0198 0199 0200 0201 0202 9901 9902 9904 9905 9906 9907 9910 9913 9914 9915 9917 9918 9919 9920 9921 9922 9923 9924 9925 9926 9927 9928 9929 9930 9931 9932 9933 9934 9935 9936 9937 9938 9939 9940 9941 9942 9943 9944 9945 9946 9947 9948 9949 9950 9951 9952 9953 9955 9956 9957 9958', '\s')"/>
		<rule context="cbc:EmbeddedDocumentBinaryObject[@mimeCode]">
			<assert id="PEPPOL-EN16931-CL001" test="
          some $code in $MIMECODE
            satisfies @mimeCode = $code" flag="fatal">Mime code must be according to subset of IANA code list.</assert>
		</rule>
		<rule context="cac:AllowanceCharge[cbc:ChargeIndicator = 'false']/cbc:AllowanceChargeReasonCode">
			<assert id="PEPPOL-EN16931-CL002" test="
          some $code in $UNCL5189
            satisfies normalize-space(text()) = $code" flag="fatal">Reason code MUST be according to subset of UNCL 5189 D.16B.</assert>
		</rule>
		<rule context="cac:AllowanceCharge[cbc:ChargeIndicator = 'true']/cbc:AllowanceChargeReasonCode">
			<assert id="PEPPOL-EN16931-CL003" test="
          some $code in $UNCL7161
            satisfies normalize-space(text()) = $code" flag="fatal">Reason code MUST be according to UNCL 7161 D.16B.</assert>
		</rule>
		<rule context="cac:InvoicePeriod/cbc:DescriptionCode">
			<assert id="PEPPOL-EN16931-CL006" test="
          some $code in $UNCL2005
            satisfies normalize-space(text()) = $code" flag="fatal">Invoice period description code must be according to UNCL 2005 D.16B.</assert>
		</rule>
		<rule context="cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount">
			<assert id="PEPPOL-EN16931-CL007" test="
          some $code in $ISO4217
            satisfies @currencyID = $code" flag="fatal">Currency code must be according to ISO 4217:2005</assert>
		</rule>
		<rule context="cbc:InvoiceTypeCode">
			<assert id="PEPPOL-EN16931-P0100" test="
          $profile != '01' or (some $code in tokenize('380 383 386 393 82 80 84 395 575 623 780', '\s')
            satisfies normalize-space(text()) = $code)" flag="fatal">Invoice type code MUST be set according to the profile.</assert>
		</rule>
		<rule context="cbc:CreditNoteTypeCode">
			<assert id="PEPPOL-EN16931-P0101" test="
          $profile != '01' or (some $code in tokenize('381 396 81 83 532', '\s')
            satisfies normalize-space(text()) = $code)" flag="fatal">Credit note type code MUST be set according to the profile.</assert>
		</rule>
		<rule context="cbc:IssueDate | cbc:DueDate | cbc:TaxPointDate | cbc:StartDate | cbc:EndDate | cbc:ActualDeliveryDate">
			<assert id="PEPPOL-EN16931-F001" test="string-length(text()) = 10 and (string(.) castable as xs:date)" flag="fatal">A date
        MUST be formatted YYYY-MM-DD.</assert>
		</rule>
		<rule context="cbc:EndpointID[@schemeID]">
			<assert id="PEPPOL-EN16931-CL008" test="
        some $code in $eaid
        satisfies @schemeID = $code" flag="warning">Electronic address identifier scheme must be from the codelist "Electronic Address Identifier Scheme"</assert>
		</rule>
	</pattern>

	<!--Start ubl BE Schematron-->
	<!--Start pattern based on abstract model-->
	<pattern id="ubl-model-BE">
		<!--The Belgian Legal mentions-->
		<let name="BELM" value="tokenize('BELM-001 BELM-002 BELM-003 BELM-004 BELM-005 BELM-006 BELM-007 BELM-008', '\s')"/>
		<let name="BELMText" value="tokenize('Special ruling - travelagencies;Bijzondere regeling - reisbureaus;Special ruling - used goods;Bijzondere regeling - gebruikte goederen;	Special ruling - art objects;Bijzondere regeling - kunstvoorwerpen;Special ruling - antiques;Bijzondere regeling - antiquiteiten;Small company under exempt from taxes ruling;Kleine onderneming onderworpen aan de vrijstellingsregeling van belasting;Invoice issued by the receiver;Factuur uitgereikt door de afnemer;Copy issued at request from the customer;Dubbel uitgereikt op vraag van de klant;VAT to be refunded to the state to the extent that it was deducted;BTW terug te storten aan de staat in de mate waarin ze oorspronkelijk in aftrek werd gebracht', ';')"/>
		<!--The Belgian Tax Category Codes-->
		<let name="BTCC" value="tokenize('00;01;02;03;45;NA;FD;SC;00/44;03/SE;MA;46/GO;47/TO;47/AS;47/DI;47/SE;44;46/TR;47/EX;47/EI;47/EE;NS', ';')"/>
		<!--The Belgian VAT exemption reason codes-->
		<let name="BVERC" value="tokenize('BETE-45;BETE-EX;BETE-FD;BETE-SC;BETE-00/44;BETE-03/SE;BETE-MA;BETE-46/GO;BETE-47/TO;BETE-47/AS;BETE-47/DI;BETE-47/SE;BETE-44;BETE-46/TR;BETE-47/EX;BETE-47/EI;BETE-47/EE;BETE-NS', ';')"/>
		<let name="BVERCText" value="tokenize('Reverse charge - Contractor;Exempt;Financial discount;Small company;0% Clause 44;Standard exchange;Margin;Intra-community supply - Goods;Intra-community supply - Manufacturing cost;Intra-community supply - Assembly;Intra-community supply - Distance;Intra-community supply - Services;Intra-community supply - Services B2B;Intra-community supply - Triangle a-B-c;Export non E.U.;Indirect export;Export via E.U.;Not subject to VAT', ';')"/>

		<rule context="/*">
			<assert test="(count(cac:AdditionalDocumentReference) >= 2)"
					 flag="fatal"
					 id="ubl-BE-01">[ubl-BE-01]-At least two AdditionalDocumentReference elements must be present.
				</assert>
		</rule>

		<rule context="//cac:AdditionalDocumentReference">
			<assert test="(count(//cbc:DocumentDescription[text() = 'CommercialInvoice']) + count(//cbc:DocumentDescription[text() = 'CreditNote'])  = 1)"
				 flag="fatal"
				 id="ubl-BE-02">[ubl-BE-02]- cbc:DocumentType : CommercialInvoice or CreditNote must be specified
			</assert>
			<assert test="(count(//cbc:ID[text() = 'UBL.BE']) = 1)"
				 flag="fatal"
				 id="ubl-BE-03">[ubl-BE-03]-At least one element with cbc:ID "UBL.BE" should be present.
			</assert>
		</rule>

		<rule context="//cac:AdditionalDocumentReference/cbc:ID">
			<assert test="(count(../cbc:DocumentDescription) = 1)"
					 flag="fatal"
					 id="ubl-BE-04">[ubl-BE-04]-cbc:DocumentType must be present
			</assert>
		</rule>

		<rule context="//cac:Delivery/cac:DeliveryTerms">
			<assert test="some $code in $BELM satisfies normalize-space(data(cbc:ID)) = $code"
					 flag="fatal"
					 id="ubl-BE-05">[ubl-BE-05]-cac:Delivery/cac:DeliveryTerms/cbc:ID must be in BELM list  : <value-of select="data(cbc:ID)"/>
			</assert>
			<assert test="some $code in $BELMText satisfies data(cbc:SpecialTerms) = $code"
					 flag="fatal"
					 id="ubl-BE-06">[ubl-BE-06]-cac:Delivery/cac:DeliveryTerms/cbc:SpecialTerms must be in BELM Text list : <value-of select="data(cbc:SpecialTerms)"/>
			</assert>
		</rule>

		<rule context="//cac:PaymentTerms">
			<let name="SettlementDiscountPercent" value="if (cbc:SettlementDiscountPercent) then xs:decimal(cbc:SettlementDiscountPercent) else -1"/>
			<assert test="(($SettlementDiscountPercent &gt;0 and $SettlementDiscountPercent &lt;100) or $SettlementDiscountPercent = -1)"
					 flag="fatal"
					 id="ubl-BE-07">[ubl-BE-07]-cbc:SettlementDiscountPercent must be numeric and between 0 and 100
			</assert>
			<assert test="if (cbc:SettlementDiscountPercent) then  xs:decimal(cbc:Amount) else 1 &gt;0"
					 flag="fatal"
					 id="ubl-BE-08">[ubl-BE-08]-cbc:SettlementDiscountPercent Amount must be filled in
			</assert>
			<assert test="if (cbc:SettlementDiscountPercent) then string-length(cbc:PaymentDueDate) = 10 and (string(cbc:PaymentDueDate) castable as xs:date) else 1"
					 flag="fatal"
					 id="ubl-BE-09">[ubl-BE-09]-cbc:PaymentDueDate must be filled in and must be a date must be formatted YYYY-MM-DD.
			</assert>
		</rule>

		<rule context="//cac:InvoiceLine | //cac:CreditNoteLine">
			<assert test="(count(cac:TaxTotal) = 1)"
					 flag="fatal"
					 id="ubl-BE-14">[ubl-BE-14]-Invoice/cac:InvoiceLine/cac:TaxTotal/cbc:TaxAmount is Mandatory.
			</assert>
		</rule>

		<rule context="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory">
			<assert test="some $code in $BTCC satisfies normalize-space(data(cbc:Name)) = $code"
					 flag="fatal"
					 id="ubl-BE-10">[ubl-BE-10]-cac:cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name must be in BTCC list  : <value-of select="data(cbc:Name)"/>
			</assert>
			<assert test="if (cbc:TaxExemptionReasonCode) then some $code in $BVERC satisfies normalize-space(data(cbc:TaxExemptionReasonCode)) = $code else 1"
					 flag="fatal"
					 id="ubl-BE-11">[ubl-BE-11]-cbc:TaxExemptionReasonCode must be in BVERC list  : <value-of select="data(cbc:TaxExemptionReasonCode)"/>
			</assert>
			<assert test="if (cbc:TaxExemptionReasonCode) then some $code in $BVERCText satisfies normalize-space(data(cbc:TaxExemptionReason)) = $code else 1"
					 flag="fatal"
					 id="ubl-BE-12">[ubl-BE-12]-cbc:TaxExemptionReason must be in BVERCText list  : <value-of select="data(cbc:TaxExemptionReason)"/>
			</assert>
		</rule>

		<rule context="//cac:InvoiceLine/cac:TaxTotal | //cac:CreditNoteLine/cac:TaxTotal">
			<let name="TaxAmount" value="if (cbc:TaxAmount) then xs:decimal(cbc:TaxAmount) else -1"/>
			<assert test="abs($TaxAmount) &gt;=0"
					 flag="fatal"
					 id="ubl-BE-13">[ubl-BE-13]-cac:InvoiceLine/cac:TaxTotal/cbc:TaxAmount must be present and numeric : <value-of select="xs:decimal(cbc:TaxAmount)"/>
			</assert>
		</rule>
		
		<rule context="//cac:ClassifiedTaxCategory">
			<assert test="(count(cbc:Name) = 1)"
					 flag="fatal"
					 id="ubl-BE-15">[ubl-BE-15]-cac:ClassifiedTaxCategory/cbc:Name must be present.
			</assert>
		</rule>

	</pattern>
</schema>