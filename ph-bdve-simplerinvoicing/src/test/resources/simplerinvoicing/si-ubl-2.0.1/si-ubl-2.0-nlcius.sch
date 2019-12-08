<!--
     These rules are based on the specification in
     https://stpe.nl/media/stpe.nl-gebruiksinstructie-basisfactuur-v1.0.pdf
     (pages 87 and on)
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="syntax">
  <!-- A few definitions to make later statements more readable -->
  <!-- These rules are generally only for SI-UBL 2.0 / NLCIUS -->
  <let name="customizationID" value="/*/cbc:CustomizationID" />
  <let name="is_SI-UBL-2.0" value="$customizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:nen.nl:nlcius:v1.0'" />
  <!-- A number of rules only apply when the supplier is in the Netherlands -->
  <let name="supplierCountry" value="if (/*/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode) then upper-case(normalize-space(/*/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode)) else 'XX'" />
  <let name="supplierIsNL" value="$supplierCountry = 'NL'" />

  <!-- We generally divide these rules into two cases, depending on
       whether the supplier is from the Netherlands.
       Since all rules fall under one of these two, we make two general
       context shortcuts:
       1. '$si' for any supplier
       2. '$sinl' for suppliers in the netherlands
  -->
  <let name="s" value="$supplierIsNL and $is_SI-UBL-2.0" />




  <rule context="cac:AccountingSupplierParty/cac:Party[$s]">
    <assert id="BR-NL-1" test="contains(concat(' ', string-join(cac:PartyLegalEntity/cbc:CompanyID/@schemeID, ' '), ' '), ' 0106 ') or contains(concat(' ', string-join(cac:PartyLegalEntity/cbc:CompanyID/@schemeID, ' '), ' '), ' 0190 ')" flag="fatal">[BR-NL-1] For suppliers in the Netherlands the supplier MUST provide either a KVK or OIN number for its legal entity identifier (cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID with schemeID 0106 or 0190)</assert>
  </rule>
  <rule context="/*[$s]">
    <assert id="BR-NL-2" test="(cbc:BuyerReference) or (cac:OrderReference/cbc:ID)" flag="fatal">[BR-NL-2] For suppliers in the Netherlands, the invoice MUST contain either the buyer reference (cbc:BuyerReference) or the order reference (cac:OrderReference/cbc:ID)</assert>
  </rule>
  <rule context="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress[$s]">
    <assert id="BR-NL-3" test="cbc:StreetName and
                    cbc:CityName and
                    cbc:PostalZone" flag="fatal">[BR-NL-3] For suppliers in the Netherlands the supplier's address (cac:AccountingSupplierParty/cac:Party/cac:PostalAddress) MUST contain street name (cbc:StreetName), city (cbc:CityName) and postal zone (cbc:PostalZone)</assert>
  </rule>
  <rule context="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress[$s]">
    <assert id="BR-NL-4" test="cac:Country/cbc:IdentificationCode != 'NL' or (
                    cbc:StreetName and
                    cbc:CityName and
                    cbc:PostalZone)" flag="fatal">[BR-NL-4] For suppliers in the Netherlands, if the customer is in the Netherlands, the customer address (cac:AccountingCustomerParty/cac:Party/cac:PostalAddress) MUST contain the street name (cbc:StreetName), the city (cbc:CityName) and the postal zone (cbc:PostalZone)</assert>
  </rule>
  <rule context="cac:TaxRepresentativeParty/cac:PostalAddress[$s]">
    <assert id="BR-NL-5" test="(cac:Country/cbc:IdentificationCode != 'NL') or
                    (cbc:StreetName and
                     cbc:CityName and
                     cbc:PostalZone)" flag="fatal">[BR-NL-5] For suppliers in the Netherlands, if the fiscal representative is in the Netherlands, the representative's address (cac:TaxRepresentativeParty/cac:PostalAddress) MUST contain street name (cbc:StreetName), city (cbc:CityName) and postal zone (cbc:PostalZone)</assert>
  </rule>
  <!-- BR-NL-6 is not specified; BR-NL-7 and BR-NL-8 are specified below -->
  <rule context="cbc:InvoiceTypeCode[$s]">
    <assert id="BR-NL-7" test=". = 380 or
                    . = 381 or
                    . = 384 or
                    . = 389" flag="fatal">[BR-NL-7] The invoice type code (cbc:InvoiceTypeCode) MUST have one of the following values: 380, 381, 384, 389</assert>
    <assert id="BR-NL-8" test=". != 381 or
                    /ubl:CreditNote" flag="fatal">[BR-NL-8] If the invoice type code (cbc:InvoiceTypeCode) is 381, the document MUST use the CreditNote scheme</assert>
    <assert id="BR-NL-8" test=". != 381 or
                    /ubl:Invoice" flag="fatal">[BR-NL-8] If the invoice type code (cbc:InvoiceTypeCode) is 380, 384 or 389, the document MUST use the Invoice scheme</assert>
    <assert id="BR-NL-9" test="(. != 384) or
                    /*/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID" flag="fatal">[BR-NL-9] For suppliers in the Netherlands, if the document is a corrective invoice (cbc:InvoiceTypeCode = 384), the document MUST contain an invoice reference (cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID)</assert>
  </rule>
  <rule context="cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity[$s]">
    <assert id="BR-NL-10" test="
        not(//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NL')
        or
        contains(concat(' ', string-join(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID, ' '), ' '), ' 0106 ')
        or
        contains(concat(' ', string-join(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID, ' '), ' '), ' 0190 ')
    " flag="fatal">[BR-NL-10] For suppliers in the Netherlands, if the customer is in the Netherlands, the customer's legal entity identifier (cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID) MUST be either a KVK (schemeID=0106) or OIN number (schemeID=0190)</assert>
  </rule>
  <rule context="cac:LegalMonetaryTotal[$s]">
    <assert id="BR-NL-11" test="xs:decimal(cbc:PayableAmount) &lt;= 0.0 or (//cac:PaymentMeans)" flag="fatal">[BR-NL-11] For suppliers in the Netherlands, the supplier MUST provide a means of payment (cac:PaymentMeans) if the payment is from customer to supplier</assert>
  </rule>
  <rule context="cac:PaymentMeans[$s]">
    <assert id="BR-NL-12" test="cbc:PaymentMeansCode = 30 or
              cbc:PaymentMeansCode = 48 or
              cbc:PaymentMeansCode = 49 or
              cbc:PaymentMeansCode = 57 or
              cbc:PaymentMeansCode = 58 or
              cbc:PaymentMeansCode = 59" flag="fatal">[BR-NL-12] For suppliers in the Netherlands, the payment means code (cac:PaymentMeans/cbc:PaymentMeansCode) MUST be one of 30, 48, 49, 57, 58 or 59</assert>

    <!-- check if payment means code is 58 or 59 -->
    <!-- NOTE: this should be tested well... -->
    <assert id="BR-NL-31" test="not((cbc:PaymentMeansCode = 58 or cbc:PaymentMeansCode = 59)) or not(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID)" flag="warning">[BR-NL-31] The use of a payment service provider identifier (cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID) is not recommended for SEPA payments (cac:PaymentMeans/cbc:PaymentMeansCode = 58 or 59)</assert>
    <!-- should move BR-NL-32 to its own context too, then add BR-NL-34 there -->

  </rule>
  <!--
       Recommendations specific for NL
       Invoices that fail these rules result in warnings, but should not be rejected
  -->
  <rule context="cbc:TaxCurrencyCode[$s]">
    <assert id="BR-NL-19" test="false" flag="warning">[BR-NL-19] The use of a tax currency code (cbc:TaxCurrencyCode) is not recommended</assert>
  </rule>
  <rule context="cbc:TaxPointDate[$s]">
    <assert id="BR-NL-20" test="false" flag="warning">[BR-NL-20] The use of a tax point date (cbc:TaxPointDate) is not recommended, and its value will be ignored</assert>
  </rule>
  <rule context="cac:InvoicePeriod/cbc:DescriptionCode[$s]">
    <assert id="BR-NL-21" test="false" flag="warning">[BR-NL-21] The use of a tax point date code (cac:InvoicePeriod/cbc:DescriptionCode) is not recommended, and its value will be ignored</assert>
  </rule>
  <!-- BR-NL-22 skipped, since there does not appear to be an equivalent for BT-21 in UBL 2.1 (cbc:Note is freeform) -->
  <!-- BT-NL-23 skipped, since a ProfileID is actually necessary for automatic lookups in the
       PEPPOL infrastructure -->
  <rule context="cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate[$s]">
    <assert id="BR-NL-24" test="false" flag="warning">[BR-NL-24] The use of a preceding invoice issue date (cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate) is not recommended</assert>
  </rule>
  <rule context="cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[$s]">
    <assert id="BR-NL-25" test="not(cbc:CompanyID) or cac:TaxScheme/cbc:ID = 'VAT'" flag="warning">[BR-NL-25] The use of a seller tax registration identifier (cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) is not recommended when the tax scheme is not VAT, since this is not applicable to suppliers in the Netherlands</assert>
  </rule>
  <rule context="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm[$s]">
    <assert id="BR-NL-26" test="false" flag="warning">[BR-NL-26] The use of the seller additional legal information field (cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm) is not recommended, since this is not applicable for suppliers in the Netherlands</assert>
  </rule>
  <rule context="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line[$s]">
    <assert id="BR-NL-27-1" test="false" flag="warning">[BR-NL-27] The use of the seller address line 3 (cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line) is not recommended</assert>
  </rule>
  <rule context="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line[$s]">
    <assert id="BR-NL-27-2" test="false" flag="warning">[BR-NL-27] The use of the customer address line 3 (cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line) is not recommended</assert>
  </rule>
  <rule context="cac:TaxRepresentativeParty/cac:PostalAddress/cac:AddressLine/cbc:Line[$s]">
    <assert id="BR-NL-27-3" test="false" flag="warning">[BR-NL-27] The use of the tax representative address line 3 (cac:TaxRepresentativePart/cac:PostalAddress/cac:AddressLine/cbc:Line) is not recommended</assert>
  </rule>
  <rule context="cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine/cbc:Line[$s]">
    <assert id="BR-NL-27-4" test="false" flag="warning">[BR-NL-27] The use of the delivery address line 3 (cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine/cbc:Line) is not recommended</assert>
  </rule>
  <rule context="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[$s]">
    <assert id="BR-NL-28-1" test="false" flag="warning">[BR-NL-28] The use of a country subdivision (cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity) is not recommended</assert>
  </rule>
  <rule context="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[$s]">
    <assert id="BR-NL-28-2" test="false" flag="warning">[BR-NL-28] The use of a country subdivision (cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity) is not recommended</assert>
  </rule>
  <rule context="cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CountrySubentity[$s]">
    <assert id="BR-NL-28-3" test="false" flag="warning">[BR-NL-28] The use of a country subdivision (cac:TaxRepresentativePart/cac:PostalAddress/cbc:CountrySubentity) is not recommended</assert>
  </rule>
  <rule context="cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity[$s]">
    <assert id="BR-NL-28-4" test="false" flag="warning">[BR-NL-28] The use of a country subdivision (cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity) is not recommended</assert>
  </rule>
  <rule context="cac:PaymentMeans/cbc:PaymentMeansCode[$s]">
    <assert id="BR-NL-29" test="not(@name)" flag="warning">[BR-NL-29] The use of a payment means text (cac:PaymentMeans/cbc:PaymentMeansCode/@name) is not recommended</assert>
  </rule>
  <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:Name[$s]">
    <assert id="BR-NL-30" test="false" flag="warning">[BR-NL-30] The use of a payment account name (cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:Name) is not recommended</assert>
  </rule>
  <rule context="cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[$s]">
    <assert id="BR-NL-32-1" test="false" flag="warning">[BR-NL-32] The use of an allowance reason code (cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) is not recommended</assert>
  </rule>
  <rule context="cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[$s]">
    <assert id="BR-NL-32-2" test="false" flag="warning">[BR-NL-32] The use of an allowance reason code (cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) is not recommended</assert>
  </rule>
  <rule context="cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[$s]">
    <assert id="BR-NL-32-3" test="false" flag="warning">[BR-NL-32] The use of an allowance reason code (cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) is not recommended</assert>
    <!-- TODO: this test needs checking and testing -->
  </rule>
  <rule context="cac:TaxTotal/cbc:TaxAmount[$s]">
    <assert id="BR-NL-33" test="@currencyID = //cbc:DocumentCurrencyCode" flag="warning">[BR-NL-33] The use of a tax total in accounting currency (cac:TaxTotal/cbc:TaxAmount/@currencyID different than DocumentCurrencyCode) is not recommended</assert>
  </rule>
  <rule context="cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[$s]">
    <assert id="BR-NL-32-1" test="false" flag="warning">[BR-NL-34] The use of a charge reason code (cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) is not recommended</assert>
  </rule>
  <rule context="cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[$s]">
    <assert id="BR-NL-32-2" test="false" flag="warning">[BR-NL-34] The use of a charge reason code (cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) is not recommended</assert>
  </rule>
  <rule context="cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode[$s]">
    <assert id="BR-NL-32-3" test="false" flag="warning">[BR-NL-34] The use of a charge reason code (cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) is not recommended</assert>
  </rule>
  <rule context="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode[$s]">
    <assert id="BR-NL-35" test="false" flag="warning">[BR-NL-35] The use of a tax exemption reason code (cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode) is not recommended</assert>
  </rule>
</pattern>
