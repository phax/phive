<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:u="utils"
        schemaVersion="iso"
        queryBinding="xslt2">

    <title>Norwegian rules for EHF Invoice</title>

    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
       prefix="cbc"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
       prefix="cac"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
       prefix="ubl"/>
    <ns uri="utils" prefix="u"/>

    <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:twodec">
      <param name="val"/>
      <value-of select="round($val * 100) div 100"/>
   </function>
    <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:slack"
             as="xs:boolean">
      <param name="exp"/>
      <param name="val"/>
      <param name="slack"/>
      <value-of select="$exp + xs:decimal($slack) &gt;= $val and $exp - xs:decimal($slack) &lt;= $val"/>
   </function>
    <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:cat2str">
      <param name="cat"/>
      <value-of select="concat(normalize-space($cat/cbc:ID), '-', round(xs:decimal($cat/cbc:Percent) * 1000000))"/>
   </function>

    <let name="isZ01" value="/ubl:Invoice/cbc:InvoiceTypeCode = 'Z01'"/>
    <let name="isZ02" value="/ubl:Invoice/cbc:InvoiceTypeCode = 'Z02'"/>

    <pattern xmlns:ns2="http://www.schematron-quickfix.com/validator/process">
      <rule context="/ubl:Invoice">
         <assert test="cbc:UBLVersionID" flag="warning" id="EHF-T10-B00101">Element 'cbc:UBLVersionID' MUST be provided.</assert>
         <assert test="cbc:CustomizationID" flag="warning" id="EHF-T10-B00102">Element 'cbc:CustomizationID' MUST be provided.</assert>
         <assert test="cbc:ProfileID" flag="warning" id="EHF-T10-B00103">Element 'cbc:ProfileID' MUST be provided.</assert>
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B00104">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:IssueDate" flag="warning" id="EHF-T10-B00105">Element 'cbc:IssueDate' MUST be provided.</assert>
         <assert test="cbc:InvoiceTypeCode" flag="warning" id="EHF-T10-B00106">Element 'cbc:InvoiceTypeCode' MUST be provided.</assert>
         <assert test="cbc:DocumentCurrencyCode" flag="warning" id="EHF-T10-B00107">Element 'cbc:DocumentCurrencyCode' MUST be provided.</assert>
         <assert test="cac:AccountingSupplierParty"
                 flag="warning"
                 id="EHF-T10-B00108">Element 'cac:AccountingSupplierParty' MUST be provided.</assert>
         <assert test="cac:AccountingCustomerParty"
                 flag="warning"
                 id="EHF-T10-B00109">Element 'cac:AccountingCustomerParty' MUST be provided.</assert>
         <assert test="cac:TaxTotal" flag="warning" id="EHF-T10-B00110">Element 'cac:TaxTotal' MUST be provided.</assert>
         <assert test="cac:LegalMonetaryTotal" flag="warning" id="EHF-T10-B00111">Element 'cac:LegalMonetaryTotal' MUST be provided.</assert>
         <assert test="cac:InvoiceLine" flag="warning" id="EHF-T10-B00112">Element 'cac:InvoiceLine' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cbc:UBLVersionID">
         <assert test="normalize-space(text()) = '2.1'"
                 flag="warning"
                 id="EHF-T10-B00201">Element 'cbc:UBLVersionID' MUST contain value '2.1'.</assert>
      </rule>
      <rule context="/ubl:Invoice/cbc:CustomizationID"/>
      <rule context="/ubl:Invoice/cbc:ProfileID"/>
      <rule context="/ubl:Invoice/cbc:ID"/>
      <rule context="/ubl:Invoice/cbc:IssueDate"/>
      <rule context="/ubl:Invoice/cbc:InvoiceTypeCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B00701">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cbc:Note"/>
      <rule context="/ubl:Invoice/cbc:TaxPointDate"/>
      <rule context="/ubl:Invoice/cbc:DocumentCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B01101">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cbc:TaxCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B01301">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cbc:AccountingCost"/>
      <rule context="/ubl:Invoice/cac:InvoicePeriod">
         <assert test="cbc:StartDate" flag="warning" id="EHF-T10-B01601">Element 'cbc:StartDate' MUST be provided.</assert>
         <assert test="cbc:EndDate" flag="warning" id="EHF-T10-B01602">Element 'cbc:EndDate' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoicePeriod/cbc:StartDate"/>
      <rule context="/ubl:Invoice/cac:InvoicePeriod/cbc:EndDate"/>
      <rule context="/ubl:Invoice/cac:OrderReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B01901">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:OrderReference/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:ContractDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B02101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:ContractDocumentReference/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:ContractDocumentReference/cbc:DocumentTypeCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B02301">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:ContractDocumentReference/cbc:DocumentType"/>
      <rule context="/ubl:Invoice/cac:AdditionalDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B02601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cbc:DocumentType"/>
      <rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment"/>
      <rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
         <assert test="@mimeCode" flag="warning" id="EHF-T10-B03001">Attribute 'mimeCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference"/>
      <rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty">
         <assert test="cac:Party" flag="warning" id="EHF-T10-B03401">Element 'cac:Party' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party">
         <assert test="cac:PartyName" flag="warning" id="EHF-T10-B03501">Element 'cac:PartyName' MUST be provided.</assert>
         <assert test="cac:PostalAddress" flag="warning" id="EHF-T10-B03502">Element 'cac:PostalAddress' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B03601">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B03801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B03901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T10-B04101">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress">
         <assert test="cbc:CityName" flag="warning" id="EHF-T10-B04301">Element 'cbc:CityName' MUST be provided.</assert>
         <assert test="cbc:PostalZone" flag="warning" id="EHF-T10-B04302">Element 'cbc:PostalZone' MUST be provided.</assert>
         <assert test="cac:Country" flag="warning" id="EHF-T10-B04303">Element 'cac:Country' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T10-B04901">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B05001">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme">
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T10-B05201">Element 'cbc:CompanyID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T10-B05202">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B05301">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B05501">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity">
         <assert test="cbc:RegistrationName" flag="warning" id="EHF-T10-B05701">Element 'cbc:RegistrationName' MUST be provided.</assert>
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T10-B05702">Element 'cbc:CompanyID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B05901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T10-B06401">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B06501">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax"/>
      <rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty">
         <assert test="cac:Party" flag="warning" id="EHF-T10-B07301">Element 'cac:Party' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party">
         <assert test="cac:PartyName" flag="warning" id="EHF-T10-B07401">Element 'cac:PartyName' MUST be provided.</assert>
         <assert test="cac:PostalAddress" flag="warning" id="EHF-T10-B07402">Element 'cac:PostalAddress' MUST be provided.</assert>
         <assert test="cac:Contact" flag="warning" id="EHF-T10-B07403">Element 'cac:Contact' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B07501">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B07701">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B07801">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T10-B08001">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress">
         <assert test="cbc:CityName" flag="warning" id="EHF-T10-B08201">Element 'cbc:CityName' MUST be provided.</assert>
         <assert test="cbc:PostalZone" flag="warning" id="EHF-T10-B08202">Element 'cbc:PostalZone' MUST be provided.</assert>
         <assert test="cac:Country" flag="warning" id="EHF-T10-B08203">Element 'cac:Country' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T10-B08801">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B08901">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme">
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T10-B09101">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B09201">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B09401">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity">
         <assert test="cbc:RegistrationName" flag="warning" id="EHF-T10-B09601">Element 'cbc:RegistrationName' MUST be provided.</assert>
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T10-B09602">Element 'cbc:CompanyID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B09801">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B10501">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax"/>
      <rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      <rule context="/ubl:Invoice/cac:PayeeParty"/>
      <rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B11201">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B11301">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T10-B11501">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyLegalEntity"/>
      <rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B11801">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty">
         <assert test="cac:PartyName" flag="warning" id="EHF-T10-B12001">Element 'cac:PartyName' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T10-B12101">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress">
         <assert test="cac:Country" flag="warning" id="EHF-T10-B12301">Element 'cac:Country' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme">
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T10-B13101">Element 'cbc:CompanyID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T10-B13102">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B13201">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B13401">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:Delivery">
         <assert test="cbc:ActualDeliveryDate" flag="warning" id="EHF-T10-B13601">Element 'cbc:ActualDeliveryDate' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:Delivery/cbc:ActualDeliveryDate"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B13901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country"/>
      <rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B14801">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:PaymentTerms"/>
      <rule context="/ubl:Invoice/cac:PaymentTerms/cbc:Note"/>
      <rule context="/ubl:Invoice/cac:AllowanceCharge">
         <assert test="cbc:ChargeIndicator" flag="warning" id="EHF-T10-B15201">Element 'cbc:ChargeIndicator' MUST be provided.</assert>
         <assert test="cbc:Amount" flag="warning" id="EHF-T10-B15202">Element 'cbc:Amount' MUST be provided.</assert>
         <assert test="cac:TaxCategory" flag="warning" id="EHF-T10-B15203">Element 'cac:TaxCategory' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator"/>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B15401">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason"/>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:Amount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B15701">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B15901">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T10-B15902">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B16001">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent"/>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B16301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:TaxExchangeRate">
         <assert test="cbc:SourceCurrencyCode" flag="warning" id="EHF-T10-B16501">Element 'cbc:SourceCurrencyCode' MUST be provided.</assert>
         <assert test="cbc:TargetCurrencyCode" flag="warning" id="EHF-T10-B16502">Element 'cbc:TargetCurrencyCode' MUST be provided.</assert>
         <assert test="cbc:CalculationRate" flag="warning" id="EHF-T10-B16503">Element 'cbc:CalculationRate' MUST be provided.</assert>
         <assert test="cbc:MathematicOperatorCode"
                 flag="warning"
                 id="EHF-T10-B16504">Element 'cbc:MathematicOperatorCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:SourceCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B16601">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:TargetCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B16801">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:CalculationRate"/>
      <rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:MathematicOperatorCode">
         <assert test="normalize-space(text()) = 'Multiply'"
                 flag="warning"
                 id="EHF-T10-B17101">Element 'cbc:MathematicOperatorCode' MUST contain value 'Multiply'.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:Date"/>
      <rule context="/ubl:Invoice/cac:TaxTotal">
         <assert test="cbc:TaxAmount" flag="warning" id="EHF-T10-B17301">Element 'cbc:TaxAmount' MUST be provided.</assert>
         <assert test="cac:TaxSubtotal" flag="warning" id="EHF-T10-B17302">Element 'cac:TaxSubtotal' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B17401">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal">
         <assert test="cbc:TaxableAmount" flag="warning" id="EHF-T10-B17601">Element 'cbc:TaxableAmount' MUST be provided.</assert>
         <assert test="cbc:TaxAmount" flag="warning" id="EHF-T10-B17602">Element 'cbc:TaxAmount' MUST be provided.</assert>
         <assert test="cac:TaxCategory" flag="warning" id="EHF-T10-B17603">Element 'cac:TaxCategory' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B17701">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B17901">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B18101">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B18301">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:Percent" flag="warning" id="EHF-T10-B18302">Element 'cbc:Percent' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T10-B18303">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B18401">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent"/>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason"/>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B18801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal">
         <assert test="cbc:LineExtensionAmount" flag="warning" id="EHF-T10-B19001">Element 'cbc:LineExtensionAmount' MUST be provided.</assert>
         <assert test="cbc:TaxExclusiveAmount" flag="warning" id="EHF-T10-B19002">Element 'cbc:TaxExclusiveAmount' MUST be provided.</assert>
         <assert test="cbc:TaxInclusiveAmount" flag="warning" id="EHF-T10-B19003">Element 'cbc:TaxInclusiveAmount' MUST be provided.</assert>
         <assert test="cbc:PayableAmount" flag="warning" id="EHF-T10-B19004">Element 'cbc:PayableAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B19101">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B19301">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B19501">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B19701">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B19901">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PrepaidAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B20101">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B20301">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B20501">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B20701">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:InvoicedQuantity" flag="warning" id="EHF-T10-B20702">Element 'cbc:InvoicedQuantity' MUST be provided.</assert>
         <assert test="cbc:LineExtensionAmount" flag="warning" id="EHF-T10-B20703">Element 'cbc:LineExtensionAmount' MUST be provided.</assert>
         <assert test="cac:Item" flag="warning" id="EHF-T10-B20704">Element 'cac:Item' MUST be provided.</assert>
         <assert test="cac:Price" flag="warning" id="EHF-T10-B20705">Element 'cac:Price' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cbc:Note"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cbc:InvoicedQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T10-B21001">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T10-B21002">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cbc:LineExtensionAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B21301">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cbc:AccountingCost"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod/cbc:StartDate"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod/cbc:EndDate"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:OrderLineReference">
         <assert test="cbc:LineID" flag="warning" id="EHF-T10-B21901">Element 'cbc:LineID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:OrderLineReference/cbc:LineID"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery">
         <assert test="cbc:ActualDeliveryDate" flag="warning" id="EHF-T10-B22101">Element 'cbc:ActualDeliveryDate' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cbc:ActualDeliveryDate"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address">
         <assert test="cac:Country" flag="warning" id="EHF-T10-B22601">Element 'cac:Country' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T10-B23201">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T10-B23301">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge">
         <assert test="cbc:ChargeIndicator" flag="warning" id="EHF-T10-B23501">Element 'cbc:ChargeIndicator' MUST be provided.</assert>
         <assert test="cbc:Amount" flag="warning" id="EHF-T10-B23502">Element 'cbc:Amount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:ChargeIndicator"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReason"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:Amount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B23801">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:TaxTotal">
         <assert test="cbc:TaxAmount" flag="warning" id="EHF-T10-B24001">Element 'cbc:TaxAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:TaxTotal/cbc:TaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B24101">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item">
         <assert test="cbc:Name" flag="warning" id="EHF-T10-B24301">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cac:ClassifiedTaxCategory" flag="warning" id="EHF-T10-B24302">Element 'cac:ClassifiedTaxCategory' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cbc:Description"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:SellerItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B24601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:SellerItemIdentification/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:StandardItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B24801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:OriginCountry">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T10-B25101">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:CommodityClassification">
         <assert test="cbc:ItemClassificationCode"
                 flag="warning"
                 id="EHF-T10-B25401">Element 'cbc:ItemClassificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B25701">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T10-B25702">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T10-B26101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty">
         <assert test="cbc:Name" flag="warning" id="EHF-T10-B26301">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cbc:Value" flag="warning" id="EHF-T10-B26302">Element 'cbc:Value' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:Value"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T10-B26701">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T10-B27001">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price">
         <assert test="cbc:PriceAmount" flag="warning" id="EHF-T10-B27201">Element 'cbc:PriceAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cbc:PriceAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B27301">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cbc:BaseQuantity"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge">
         <assert test="cbc:ChargeIndicator" flag="warning" id="EHF-T10-B27601">Element 'cbc:ChargeIndicator' MUST be provided.</assert>
         <assert test="cbc:Amount" flag="warning" id="EHF-T10-B27602">Element 'cbc:Amount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:ChargeIndicator"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric"/>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:Amount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B28001">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T10-B28201">Attribute 'currencyID' MUST be present.</assert>
      </rule>
   </pattern>
    <pattern>
      <let name="isB2C"
           value="$isZ01 or //cac:AdditionalDocumentReference/cbc:DocumentType = 'elektroniskB2Cfaktura'"/>
      <let name="documentCurrencyCode"
           value="/ubl:Invoice/cbc:DocumentCurrencyCode"/>

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
         <assert id="NOGOV-T10-R012" test="cbc:PaymentID" flag="warning">[NOGOV-T10-R012]-Payment Identifier (KID number) SHOULD be used according to EHF.</assert>
      </rule>
      <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'BBAN']">
         <assert id="NOGOV-T10-R032" test="matches(., '^[0-9]+$')" flag="fatal">[NOGOV-T10-R032]-Only numbers are allowed as bank account number if scheme is BBAN.</assert>
      </rule>
      <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'IBAN']">
         <assert id="NOGOV-T10-R033" test="matches(., '^NO[0-9]+$')" flag="warning">[NOGOV-T10-R033]-IBAN number is not for a Norwegain bank account</assert>
      </rule>
      <rule context="cac:OrderReference">
         <assert id="NOGOV-T10-R013" test="cbc:ID" flag="warning">[NOGOV-T10-R013]-An association to Order Reference SHOULD be provided according to EHF.</assert>
      </rule>
      <rule context="cac:InvoiceLine">
         <assert id="NOGOV-T10-R003" test="cbc:AccountingCost" flag="warning">[NOGOV-T10-R003]-The buyer's accounting code applied to the Invoice Line SHOULD be provided according to EHF.</assert>
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
         <assert id="NOGOV-T10-R022" test="cbc:IdentificationCode" flag="warning">[NOGOV-T10-R022]-Identification code MUST be specified when describing origin country.</assert>
      </rule>
      <rule context="cac:ManufacturerParty">
         <assert id="NOGOV-T10-R024" test="cac:PartyName/cbc:Name" flag="warning">[NOGOV-T10-R024]-Name MUST be specified when describing a manufacturer party.</assert>
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
         <assert id="NOGOV-T10-R016" test="cbc:InvoiceTypeCode" flag="fatal">[NOGOV-T10-R016]-An EHF invoice MUST have an invoice type code.</assert>
         <assert id="NOGOV-T10-R019" test="cac:PaymentMeans" flag="fatal">[NOGOV-T10-R019]-An invoice MUST have payment means information.</assert>
      </rule>
      <rule context="ubl:Invoice/cac:PaymentTerms">
         <assert id="NOGOV-T10-R020" test="cbc:Note" flag="fatal">[NOGOV-T10-R020]-Note MUST be specified when describing Payment terms.</assert>
      </rule>
      <rule context="cac:TaxRepresentativeParty">
         <assert id="NOGOV-T10-R017" test="cac:PartyName/cbc:Name" flag="fatal">[NOGOV-T10-R017]-Name MUST be specified when describing a Tax Representative</assert>
         <assert id="NOGOV-T10-R018"
                 test="cac:PartyTaxScheme/cbc:CompanyID"
                 flag="fatal">[NOGOV-T10-R018]-Company identifier MUST be specified when describing a Tax Representative</assert>
      </rule>
      <rule context="ubl:Invoice/cac:TaxTotal">
         <assert id="NOGOV-T10-R021" test="cac:TaxSubtotal" flag="fatal">[NOGOV-T10-R021]-An invoice MUST have Tax Subtotal specifications.</assert>
         <assert id="NOGOV-T10-R038"
                 test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T10-R038]-Total tax amount cannot have more than 2 decimals</assert>
         <assert id="NOGOV-T10-R041"
                 test="count(distinct-values(cac:TaxSubtotal/cac:TaxCategory/cbc:ID/normalize-space(text()))) = count(cac:TaxSubtotal)"
                 flag="fatal">[NOGOV-T10-R041]-Multiple tax subtotals per tax category code is not allowed.</assert>
      </rule>
      <rule context="cbc:Amount | cbc:TaxableAmount | cbc:TaxAmount | cbc:LineExtensionAmount | cbc:PriceAmount | cbc:BaseAmount | cac:LegalMonetaryTotal/cbc:*">
      

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
         <assert id="NOGOV-T10-R007" test="cac:Contact/cbc:ID" flag="fatal">[NOGOV-T10-R007]-A contact reference identifier MUST be provided for AccountingCustomerParty according to EHF.</assert>
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
    <pattern>
      <let name="taxCategoryPercents"
           value="for $cat in /ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return u:cat2str($cat)"/>
      <let name="taxCategories"
           value="for $cat in /ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return normalize-space($cat/cbc:ID)"/>

      <rule context="ubl:Invoice">
         <assert id="NONAT-T10-R012" test="cac:TaxTotal" flag="fatal">[NONAT-T10-R012]-An invoice MUST contain tax information</assert>
         <assert id="NONAT-T10-R002"
                 test="cac:PaymentMeans/cbc:PaymentDueDate"
                 flag="fatal">[NONAT-T10-R002]-Payment due date MUST be provided in the invoice according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 5"</assert>
         <assert id="NONAT-T10-R013"
                 test="not(cac:PayeeParty) or cac:PayeeParty/cac:PartyName/cbc:Name"
                 flag="fatal">[NONAT-T10-R013]-If payee information is provided then the payee name MUST be specified.</assert>
         <assert id="NONAT-T10-R009"
                 test="not(cbc:IssueDate) or current-date() &gt;= cbc:IssueDate"
                 flag="warning">[NONAT-T10-R009]-Issue date of an invoice should be today or earlier.</assert>
         <assert id="NONAT-T10-R003"
                 test="$isZ02 or //cac:Delivery/cbc:ActualDeliveryDate"
                 flag="warning">[NONAT-T10-R003]-The actual delivery date SHOULD be provided in the invoice according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 4 and § 5-1-4", see also “NOU 2002:20, point 9.4.1.4”"</assert>
         <assert id="NONAT-T10-R004"
                 test="$isZ02 or //cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName and //cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone and //cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode"
                 flag="warning">[NONAT-T10-R004]-A Delivery address in an invoice SHOULD contain at least, city, zip code and country code according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 4 and § 5-1-4", see also “NOU 2002:20, point 9.4.1.4”</assert>
      </rule>
      <rule context="cbc:UBLVersionID">
         <assert id="NONAT-T10-R020" test="normalize-space(.) = '2.1'" flag="fatal">[NONAT-T10-R020]-UBL version  must be 2.1</assert>
      </rule>
      <rule context="cac:AccountingSupplierParty/cac:Party">
         <assert id="NONAT-T10-R001"
                 test="$isZ02 or cac:PartyLegalEntity/cbc:CompanyID"
                 flag="fatal">[NONAT-T10-R001]-The Norwegian legal registration ID for the supplier MUST be provided according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 2"</assert>
         <assert id="NONAT-T10-R008"
                 test="$isZ02 or cac:PartyLegalEntity/cbc:RegistrationName"
                 flag="fatal">[NONAT-T10-R008]-The Norwegian legal registration name for the supplier MUST be provided according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 2"</assert>
         <assert id="NONAT-T10-R006"
                 test="cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode"
                 flag="fatal">[NONAT-T10-R006]-A supplier postal address in an invoice MUST contain at least city name, zip code and country code.</assert>
      </rule>
      <rule context="cac:AccountingCustomerParty/cac:Party">
         <assert id="NONAT-T10-R007"
                 test="cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode"
                 flag="fatal">[NONAT-T10-R007]-A customer postal address in an invoice MUST contain at least city name, zip code and country code.</assert>
      </rule>
      <rule context="cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeID]">
         <assert id="NONAT-T10-R010"
                 test="some $v in tokenize('GLN GSRN', '\s') satisfies $v = @schemeID"
                 flag="warning">[NONAT-T10-R010]-Location identifiers SHOULD be GLN or GSRN</assert>
      </rule>
      <rule context="cac:PartyLegalEntity">
         <assert id="NONAT-T10-R018" test="cbc:CompanyID" flag="fatal">[NONAT-T10-R018]-Company identifier MUST be specified when describing a company legal entity.</assert>
      </rule>
      <rule context="cac:PayeeFinancialAccount/cbc:ID[@schemeID]">
         <assert id="NONAT-T10-R024"
                 test="some $v in tokenize('IBAN BBAN LOCAL', '\s') satisfies $v = @schemeID"
                 flag="fatal">[NONAT-T10-R024]-A payee account identifier scheme MUST be either IBAN, BBAN or LOCAL</assert>
      </rule>
      <rule context="cac:LegalMonetaryTotal">
         <assert id="NONAT-T10-R023"
                 test="number(cbc:TaxInclusiveAmount) &gt;= 0"
                 flag="warning">[NONAT-T10-R023]-Tax inclusive amount in an invoice SHOULD NOT be negative</assert>
         <assert id="NONAT-T10-R022"
                 test="number(cbc:PayableAmount) &gt;= 0"
                 flag="warning">[NONAT-T10-R022]-Total payable amount in an invoice SHOULD NOT be negative</assert>
      </rule>
      <rule context="cac:AllowanceCharge">
         <assert id="NONAT-T10-R011" test="cbc:AllowanceChargeReason" flag="warning">[NONAT-T10-R011]-AllowanceChargeReason text SHOULD be specified for all allowances and charges</assert>
      </rule>
      <rule context="cac:InvoiceLine">
         <let name="sumCharge"
              value="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='true']/cbc:Amount)"/>
         <let name="sumAllowance"
              value="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='false']/cbc:Amount)"/>
         <let name="baseQuantity"
              value="xs:decimal(if (cac:Price/cbc:BaseQuantity and xs:decimal(cac:Price/cbc:BaseQuantity) != 0) then cac:Price/cbc:BaseQuantity else 1)"/>
         <let name="pricePerUnit"
              value="xs:decimal(cac:Price/cbc:PriceAmount) div $baseQuantity"/>
         <let name="quantity" value="xs:decimal(cbc:InvoicedQuantity)"/>
         <let name="lineExtensionAmount" value="number(cbc:LineExtensionAmount)"/>
         <let name="quiet"
              value="not(cbc:InvoicedQuantity) or not(cac:Price/cbc:PriceAmount)"/>

         <assert id="NONAT-T10-R016" test="cac:Item/cbc:Name" flag="fatal">[NONAT-T10-R016]-Each invoice line MUST contain the product/service name</assert>
         <assert id="NONAT-T10-R015" test="cac:Price/cbc:PriceAmount" flag="fatal">[NONAT-T10-R015]-Invoice lines MUST contain the item price</assert>
         <assert id="NONAT-T10-R026"
                 test="$quiet or u:slack($lineExtensionAmount, u:twodec(u:twodec($pricePerUnit * $quantity) + u:twodec($sumCharge) - u:twodec($sumAllowance)), 0.02)"
                 flag="fatal">[NONAT-T10-R026]-Invoice line amount MUST be equal to the price amount multiplied by the quantity plus charges minus allowances at line level.</assert>
      </rule>

      <rule context="cac:Price/cbc:BaseQuantity">
         <assert id="NONAT-T10-R033" test="xs:decimal(.) &gt; 0" flag="fatal">[NONAT-T10-R033]-Base quantity must be a positive value higher than zero.</assert>
      </rule>

      <rule context="cac:TaxSubtotal">
         <let name="category" value="normalize-space(cac:TaxCategory/cbc:ID)"/>
         <let name="sumLineExtensionAmount"
              value="xs:decimal(sum(/ubl:Invoice/cac:InvoiceLine[normalize-space(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) = $category]/cbc:LineExtensionAmount))"/>
         <let name="sumAllowance"
              value="xs:decimal(sum(/ubl:Invoice/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'false']/cbc:Amount))"/>
         <let name="sumCharge"
              value="xs:decimal(sum(/ubl:Invoice/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'true']/cbc:Amount))"/>

         <assert id="NONAT-T10-R029"
                 test="xs:decimal(cbc:TaxableAmount) = u:twodec($sumLineExtensionAmount - $sumAllowance + $sumCharge)"
                 flag="fatal">[NONAT-T10-R029]-Taxable amount in a tax subtotal MUST be the sum of line extension amount of all invoice lines and allowances and charges on document level with the same tax category.</assert>
      </rule>

   

      <rule context="cac:AllowanceCharge/cac:TaxCategory[cbc:Percent] | cac:Item/cac:ClassifiedTaxCategory[cbc:Percent]">
         <let name="category" value="u:cat2str(.)"/>

         <assert id="NONAT-T10-R031"
                 test="some $cat in $taxCategoryPercents satisfies $cat = $category"
                 flag="fatal">[NONAT-T10-R031]-Tax categories MUST match provided tax categories on document level.</assert>
      </rule>
      <rule context="cac:AllowanceCharge/cac:TaxCategory | cac:Item/cac:ClassifiedTaxCategory">
         <assert id="NONAT-T10-R032"
                 test="some $cat in $taxCategories satisfies $cat = cbc:ID"
                 flag="fatal">[NONAT-T10-R032]-Tax categories MUST match provided tax categories on document level.</assert>
      </rule>
      <rule context="cac:TaxScheme">
         <assert id="NONAT-T10-R017" test="cbc:ID" flag="fatal">[NONAT-T10-R017]-Every tax scheme MUST be defined through an identifier.</assert>
      </rule>
      <rule context="cac:TaxScheme/cbc:ID">
         <assert id="NONAT-T10-R014" test="normalize-space(.) = 'VAT'" flag="fatal">[NONAT-T10-R014]-Invoice tax schemes MUST be 'VAT'</assert>
      </rule>

   </pattern>

</schema>
