<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    schemaVersion="iso">
  <title>BII2 CORE restrictions for Credit Note Transaction (T14) UBL-CreditNote-2.1</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:BuyerContact">
      <report flag="warning" test=".">
	Element 'cac:BuyerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party">
      <report flag="warning" test=".">
	Element 'cac:Party' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:DespatchContact">
      <report flag="warning" test=".">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party">
      <report flag="warning" test=".">
	Element 'cac:Party' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:SellerContact">
      <report flag="warning" test=".">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:DataSendingCapability">
      <report flag="warning" test=".">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <report flag="warning" test=".">
	Element 'cbc:DocumentHash' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <report flag="warning" test=".">
	Element 'cbc:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <report flag="warning" test=".">
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <report flag="warning" test=".">
	Element 'cbc:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <report flag="warning" test=".">
	Element 'cbc:FormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <report flag="warning" test=".">
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <report flag="warning" test=".">
	Element 'cbc:MimeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:PaymentMeans">
      <report flag="warning" test=".">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure">
      <report flag="warning" test=".">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent">
      <report flag="warning" test="@format">
	Attribute '@format' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason">
      <report flag="warning" test=".">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange">
      <report flag="warning" test=".">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent">
      <report flag="warning" test=".">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure">
      <report flag="warning" test=".">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent">
      <report flag="warning" test="@format">
	Attribute '@format' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange">
      <report flag="warning" test=".">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent">
      <report flag="warning" test=".">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure">
      <report flag="warning" test=".">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric">
      <report flag="warning" test=".">
	Element 'cbc:CalculationSequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:Percent">
      <report flag="warning" test=".">
	Element 'cbc:Percent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange">
      <report flag="warning" test=".">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent">
      <report flag="warning" test=".">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount">
      <report flag="warning" test=".">
	Element 'cbc:TransactionCurrencyTaxAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount">
      <report flag="warning" test=".">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxIncludedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCost">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:BaseAmount">
      <report flag="warning" test=".">
	Element 'cbc:BaseAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:AdditionalDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:BillingReferenceLine">
      <report flag="warning" test=".">
	Element 'cac:BillingReferenceLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CreditNoteDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:DebitNoteDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:ReminderDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:Channel">
      <report flag="warning" test=".">
	Element 'cbc:Channel' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:ChannelCode">
      <report flag="warning" test=".">
	Element 'cbc:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:Value">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ElectronicMail">
      <report flag="warning" test=".">
	Element 'cbc:ElectronicMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telefax">
      <report flag="warning" test=".">
	Element 'cbc:Telefax' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telephone">
      <report flag="warning" test=".">
	Element 'cbc:Telephone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:DeliveryContact">
      <report flag="warning" test=".">
	Element 'cac:DeliveryContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <report flag="warning" test=".">
	Element 'cac:OtherCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress">
      <report flag="warning" test=".">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyName">
      <report flag="warning" test=".">
	Element 'cac:PartyName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
      <report flag="warning" test=".">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
      <report flag="warning" test=".">
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cbc:AdditionalAccountID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentType">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:PaymentMeans">
      <report flag="warning" test=".">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxCategory">
      <report flag="warning" test=".">
	Element 'cac:TaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxTotal">
      <report flag="warning" test=".">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCost">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:BaseAmount">
      <report flag="warning" test=".">
	Element 'cbc:BaseAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:AdditionalDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cac:AllowanceCharge">
      <report flag="warning" test=".">
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:Amount">
      <report flag="warning" test=".">
	Element 'cbc:Amount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CreditNoteDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:DebitNoteDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:ReminderDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery">
      <report flag="warning" test=".">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DespatchLineReference">
      <report flag="warning" test=".">
	Element 'cac:DespatchLineReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DiscrepancyResponse">
      <report flag="warning" test=".">
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:Attachment">
      <report flag="warning" test=".">
	Element 'cac:Attachment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:ResultOfVerification">
      <report flag="warning" test=".">
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentDescription">
      <report flag="warning" test=".">
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentType">
      <report flag="warning" test=".">
	Element 'cbc:DocumentType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:IssueDate">
      <report flag="warning" test=".">
	Element 'cbc:IssueDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:LanguageID">
      <report flag="warning" test=".">
	Element 'cbc:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:LocaleCode">
      <report flag="warning" test=".">
	Element 'cbc:LocaleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:VersionID">
      <report flag="warning" test=".">
	Element 'cbc:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:XPath">
      <report flag="warning" test=".">
	Element 'cbc:XPath' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty">
      <report flag="warning" test=".">
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:BuyersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Certificate">
      <report flag="warning" test=".">
	Element 'cac:Certificate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
      <report flag="warning" test=".">
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent">
      <report flag="warning" test="@format">
	Attribute '@format' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
      <report flag="warning" test=".">
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
      <report flag="warning" test=".">
	Element 'cbc:TierRange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
      <report flag="warning" test=".">
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:NatureCode">
      <report flag="warning" test=".">
	Element 'cbc:NatureCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Dimension">
      <report flag="warning" test=".">
	Element 'cac:Dimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:HazardousItem">
      <report flag="warning" test=".">
	Element 'cac:HazardousItem' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:InformationContentProviderParty">
      <report flag="warning" test=".">
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemInstance">
      <report flag="warning" test=".">
	Element 'cac:ItemInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemSpecificationDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty">
      <report flag="warning" test=".">
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturersItemIdentification">
      <report flag="warning" test=".">
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginAddress">
      <report flag="warning" test=".">
	Element 'cac:OriginAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
      <report flag="warning" test=".">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <report flag="warning" test=".">
	Element 'cac:IssuerParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <report flag="warning" test=".">
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <report flag="warning" test=".">
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <report flag="warning" test=".">
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
      <report flag="warning" test=".">
	Element 'cbc:ExtendedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:TransactionConditions">
      <report flag="warning" test=".">
	Element 'cac:TransactionConditions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:AdditionalInformation">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:BrandName">
      <report flag="warning" test=".">
	Element 'cbc:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:CatalogueIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:HazardousRiskIndicator">
      <report flag="warning" test=".">
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Keyword">
      <report flag="warning" test=".">
	Element 'cbc:Keyword' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:ModelName">
      <report flag="warning" test=".">
	Element 'cbc:ModelName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackQuantity">
      <report flag="warning" test=".">
	Element 'cbc:PackQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackSizeNumeric">
      <report flag="warning" test=".">
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cac:OrderReference">
      <report flag="warning" test=".">
	Element 'cac:OrderReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:SalesOrderLineID">
      <report flag="warning" test=".">
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OriginatorParty">
      <report flag="warning" test=".">
	Element 'cac:OriginatorParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:PaymentMeans">
      <report flag="warning" test=".">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory">
      <report flag="warning" test=".">
	Element 'cac:TaxCategory' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal">
      <report flag="warning" test=".">
	Element 'cac:TaxTotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCost">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCost' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason">
      <report flag="warning" test=".">
	Element 'cbc:AllowanceChargeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
      <report flag="warning" test=".">
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount">
      <report flag="warning" test=".">
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PriceList">
      <report flag="warning" test=".">
	Element 'cac:PriceList' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PricingExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:ValidityPeriod">
      <report flag="warning" test=".">
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity">
      <report flag="warning" test="@unitCode">
	Attribute '@unitCode' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListID">
	Attribute '@unitCodeListID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyID">
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyName">
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:OrderableUnitFactorRate">
      <report flag="warning" test=".">
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceChangeReason">
      <report flag="warning" test=".">
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceType">
      <report flag="warning" test=".">
	Element 'cbc:PriceType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PricingReference">
      <report flag="warning" test=".">
	Element 'cac:PricingReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:ReceiptLineReference">
      <report flag="warning" test=".">
	Element 'cac:ReceiptLineReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:SubCreditNoteLine">
      <report flag="warning" test=".">
	Element 'cac:SubCreditNoteLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal">
      <report flag="warning" test=".">
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:RoundingAmount">
      <report flag="warning" test=".">
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxEvidenceIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxIncludedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCost">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity">
      <report flag="warning" test="@unitCodeListID">
	Attribute '@unitCodeListID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyID">
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@unitCodeListAgencyName">
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:FreeOfChargeIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FreeOfChargeIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:Note">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:PaymentPurposeCode">
      <report flag="warning" test=".">
	Element 'cbc:PaymentPurposeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:TaxPointDate">
      <report flag="warning" test=".">
	Element 'cbc:TaxPointDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:Delivery">
      <report flag="warning" test=".">
	Element 'cac:Delivery' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:DeliveryTerms">
      <report flag="warning" test=".">
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:DespatchDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:DespatchDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:DiscrepancyResponse">
      <report flag="warning" test=".">
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:Description">
      <report flag="warning" test=".">
	Element 'cbc:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DescriptionCode">
      <report flag="warning" test=".">
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DurationMeasure">
      <report flag="warning" test=".">
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:EndTime">
      <report flag="warning" test=".">
	Element 'cbc:EndTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:StartTime">
      <report flag="warning" test=".">
	Element 'cbc:StartTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount">
      <report flag="warning" test=".">
	Element 'cbc:PayableAlternativeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount">
      <report flag="warning" test=".">
	Element 'cbc:PayableRoundingAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:OrderReference">
      <report flag="warning" test=".">
	Element 'cac:OrderReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:OriginatorDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:OriginatorDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress">
      <report flag="warning" test=".">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyTaxScheme">
      <report flag="warning" test=".">
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PayeeParty/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PaymentAlternativeExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PaymentAlternativeExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PaymentExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PaymentExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PaymentMeans">
      <report flag="warning" test=".">
	Element 'cac:PaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PaymentTerms">
      <report flag="warning" test=".">
	Element 'cac:PaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:PricingExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:ReceiptDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:ReceiptDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:AccountingContact">
      <report flag="warning" test=".">
	Element 'cac:AccountingContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:DespatchContact">
      <report flag="warning" test=".">
	Element 'cac:DespatchContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:Channel">
      <report flag="warning" test=".">
	Element 'cbc:Channel' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:ChannelCode">
      <report flag="warning" test=".">
	Element 'cbc:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:Value">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <report flag="warning" test=".">
	Element 'cbc:Note' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <report flag="warning" test=".">
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty">
      <report flag="warning" test=".">
	Element 'cac:HeadParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IdentificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <report flag="warning" test=".">
	Element 'cbc:PostalZone' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <report flag="warning" test=".">
	Element 'cbc:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty">
      <report flag="warning" test=".">
	Element 'cac:ShareholderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <report flag="warning" test=".">
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <report flag="warning" test=".">
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <report flag="warning" test=".">
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <report flag="warning" test=".">
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress">
      <report flag="warning" test=".">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <report flag="warning" test=".">
	Element 'cac:AddressLine' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <report flag="warning" test=".">
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <report flag="warning" test=".">
	Element 'cbc:BlockName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <report flag="warning" test=".">
	Element 'cbc:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <report flag="warning" test=".">
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <report flag="warning" test=".">
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <report flag="warning" test=".">
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Department">
      <report flag="warning" test=".">
	Element 'cbc:Department' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District">
      <report flag="warning" test=".">
	Element 'cbc:District' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <report flag="warning" test=".">
	Element 'cbc:Floor' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <report flag="warning" test=".">
	Element 'cbc:InhouseMail' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttention' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <report flag="warning" test=".">
	Element 'cbc:MarkCare' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <report flag="warning" test=".">
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <report flag="warning" test=".">
	Element 'cbc:Postbox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region">
      <report flag="warning" test=".">
	Element 'cbc:Region' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room">
      <report flag="warning" test=".">
	Element 'cbc:Room' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <report flag="warning" test=".">
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:SellerContact">
      <report flag="warning" test=".">
	Element 'cac:SellerContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cbc:AdditionalAccountID">
      <report flag="warning" test=".">
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
      <report flag="warning" test=".">
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:SellerSupplierParty/cbc:DataSendingCapability">
      <report flag="warning" test=".">
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:Signature">
      <report flag="warning" test=".">
	Element 'cac:Signature' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:StatementDocumentReference">
      <report flag="warning" test=".">
	Element 'cac:StatementDocumentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxExchangeRate">
      <report flag="warning" test=".">
	Element 'cac:TaxExchangeRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:AgentParty">
      <report flag="warning" test=".">
	Element 'cac:AgentParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Contact">
      <report flag="warning" test=".">
	Element 'cac:Contact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:FinancialAccount">
      <report flag="warning" test=".">
	Element 'cac:FinancialAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Language">
      <report flag="warning" test=".">
	Element 'cac:Language' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyIdentification">
      <report flag="warning" test=".">
	Element 'cac:PartyIdentification' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyLegalEntity">
      <report flag="warning" test=".">
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress">
      <report flag="warning" test=".">
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <report flag="warning" test=".">
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID">
      <report flag="warning" test=".">
	Element 'cbc:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
      <report flag="warning" test=".">
	Element 'cbc:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason">
      <report flag="warning" test=".">
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName">
      <report flag="warning" test=".">
	Element 'cbc:RegistrationName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Person">
      <report flag="warning" test=".">
	Element 'cac:Person' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PhysicalLocation">
      <report flag="warning" test=".">
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PostalAddress">
      <report flag="warning" test=".">
	Element 'cac:PostalAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PowerOfAttorney">
      <report flag="warning" test=".">
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:ServiceProviderParty">
      <report flag="warning" test=".">
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:EndpointID">
      <report flag="warning" test=".">
	Element 'cbc:EndpointID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:IndustryClassificationCode">
      <report flag="warning" test=".">
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:LogoReferenceID">
      <report flag="warning" test=".">
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkCareIndicator">
      <report flag="warning" test=".">
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:WebsiteURI">
      <report flag="warning" test=".">
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
      <report flag="warning" test=".">
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxEvidenceIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxIncludedIndicator">
      <report flag="warning" test=".">
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:AccountingCost">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:AccountingCostCode">
      <report flag="warning" test=".">
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:CopyIndicator">
      <report flag="warning" test=".">
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:CreditNoteTypeCode">
      <report flag="warning" test=".">
	Element 'cbc:CreditNoteTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:CustomizationID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:DocumentCurrencyCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:IssueTime">
      <report flag="warning" test=".">
	Element 'cbc:IssueTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:LineCountNumeric">
      <report flag="warning" test=".">
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:Note">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@languageLocaleID">
	Attribute '@languageLocaleID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:PaymentAlternativeCurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:PaymentAlternativeCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:PaymentCurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:PaymentCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:PricingCurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:PricingCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:ProfileExecutionID">
      <report flag="warning" test=".">
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:ProfileID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:TaxCurrencyCode">
      <report flag="warning" test=".">
	Element 'cbc:TaxCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:UBLVersionID">
      <report flag="warning" test=".">
	Element 'cbc:UBLVersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/cbc:UUID">
      <report flag="warning" test=".">
	Element 'cbc:UUID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:CreditNote/ext:UBLExtensions">
      <report flag="warning" test=".">
	Element 'ext:UBLExtensions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
</schema>
