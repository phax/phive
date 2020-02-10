<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:u="utils"
        schemaVersion="iso"
        queryBinding="xslt2">

   <title>Norwegian rules for EHF Credit Note</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
       prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
       prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
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

   <pattern xmlns:ns2="http://www.schematron-quickfix.com/validator/process">
      <rule context="/ubl:CreditNote">
         <assert test="cbc:UBLVersionID" flag="warning" id="EHF-T14-B00101">Element 'cbc:UBLVersionID' MUST be provided.</assert>
         <assert test="cbc:CustomizationID" flag="warning" id="EHF-T14-B00102">Element 'cbc:CustomizationID' MUST be provided.</assert>
         <assert test="cbc:ProfileID" flag="warning" id="EHF-T14-B00103">Element 'cbc:ProfileID' MUST be provided.</assert>
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B00104">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:IssueDate" flag="warning" id="EHF-T14-B00105">Element 'cbc:IssueDate' MUST be provided.</assert>
         <assert test="cbc:DocumentCurrencyCode" flag="warning" id="EHF-T14-B00106">Element 'cbc:DocumentCurrencyCode' MUST be provided.</assert>
         <assert test="cac:AccountingSupplierParty"
                 flag="warning"
                 id="EHF-T14-B00107">Element 'cac:AccountingSupplierParty' MUST be provided.</assert>
         <assert test="cac:AccountingCustomerParty"
                 flag="warning"
                 id="EHF-T14-B00108">Element 'cac:AccountingCustomerParty' MUST be provided.</assert>
         <assert test="cac:TaxTotal" flag="warning" id="EHF-T14-B00109">Element 'cac:TaxTotal' MUST be provided.</assert>
         <assert test="cac:LegalMonetaryTotal" flag="warning" id="EHF-T14-B00110">Element 'cac:LegalMonetaryTotal' MUST be provided.</assert>
         <assert test="cac:CreditNoteLine" flag="warning" id="EHF-T14-B00111">Element 'cac:CreditNoteLine' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cbc:UBLVersionID">
         <assert test="normalize-space(text()) = '2.1'"
                 flag="warning"
                 id="EHF-T14-B00201">Element 'cbc:UBLVersionID' MUST contain value '2.1'.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cbc:CustomizationID"/>
      <rule context="/ubl:CreditNote/cbc:ProfileID"/>
      <rule context="/ubl:CreditNote/cbc:ID"/>
      <rule context="/ubl:CreditNote/cbc:IssueDate"/>
      <rule context="/ubl:CreditNote/cbc:TaxPointDate"/>
      <rule context="/ubl:CreditNote/cbc:Note"/>
      <rule context="/ubl:CreditNote/cbc:DocumentCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B00901">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cbc:TaxCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B01101">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cbc:AccountingCost"/>
      <rule context="/ubl:CreditNote/cac:InvoicePeriod"/>
      <rule context="/ubl:CreditNote/cac:InvoicePeriod/cbc:StartDate"/>
      <rule context="/ubl:CreditNote/cac:InvoicePeriod/cbc:EndDate"/>
      <rule context="/ubl:CreditNote/cac:OrderReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B01701">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:OrderReference/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:BillingReference"/>
      <rule context="/ubl:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B02001">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate"/>
      <rule context="/ubl:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B02301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:IssueDate"/>
      <rule context="/ubl:CreditNote/cac:ContractDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B02601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:ContractDocumentReference/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B02801">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:ContractDocumentReference/cbc:DocumentType"/>
      <rule context="/ubl:CreditNote/cac:AdditionalDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B03101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AdditionalDocumentReference/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType"/>
      <rule context="/ubl:CreditNote/cac:AdditionalDocumentReference/cac:Attachment"/>
      <rule context="/ubl:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
         <assert test="@mimeCode" flag="warning" id="EHF-T14-B03501">Attribute 'mimeCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference">
         <assert test="cbc:URI" flag="warning" id="EHF-T14-B03701">Element 'cbc:URI' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty">
         <assert test="cac:Party" flag="warning" id="EHF-T14-B03901">Element 'cac:Party' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party">
         <assert test="cac:PostalAddress" flag="warning" id="EHF-T14-B04001">Element 'cac:PostalAddress' MUST be provided.</assert>
         <assert test="cac:PartyLegalEntity" flag="warning" id="EHF-T14-B04002">Element 'cac:PartyLegalEntity' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B04101">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B04301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B04401">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T14-B04601">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress">
         <assert test="cbc:CityName" flag="warning" id="EHF-T14-B04801">Element 'cbc:CityName' MUST be provided.</assert>
         <assert test="cbc:PostalZone" flag="warning" id="EHF-T14-B04802">Element 'cbc:PostalZone' MUST be provided.</assert>
         <assert test="cac:Country" flag="warning" id="EHF-T14-B04803">Element 'cac:Country' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T14-B05401">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B05501">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme">
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T14-B05701">Element 'cbc:CompanyID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T14-B05702">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B05901">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity">
         <assert test="cbc:RegistrationName" flag="warning" id="EHF-T14-B06101">Element 'cbc:RegistrationName' MUST be provided.</assert>
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T14-B06102">Element 'cbc:CompanyID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B06301">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax"/>
      <rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty">
         <assert test="cac:Party" flag="warning" id="EHF-T14-B07701">Element 'cac:Party' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party">
         <assert test="cac:PartyName" flag="warning" id="EHF-T14-B07801">Element 'cac:PartyName' MUST be provided.</assert>
         <assert test="cac:PostalAddress" flag="warning" id="EHF-T14-B07802">Element 'cac:PostalAddress' MUST be provided.</assert>
         <assert test="cac:Contact" flag="warning" id="EHF-T14-B07803">Element 'cac:Contact' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B07901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B08101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B08201">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T14-B08401">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress">
         <assert test="cbc:CityName" flag="warning" id="EHF-T14-B08601">Element 'cbc:CityName' MUST be provided.</assert>
         <assert test="cbc:PostalZone" flag="warning" id="EHF-T14-B08602">Element 'cbc:PostalZone' MUST be provided.</assert>
         <assert test="cac:Country" flag="warning" id="EHF-T14-B08603">Element 'cac:Country' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T14-B09201">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B09301">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme">
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T14-B09501">Element 'cbc:CompanyID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T14-B09502">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B09601">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B09801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity">
         <assert test="cbc:RegistrationName" flag="warning" id="EHF-T14-B10001">Element 'cbc:RegistrationName' MUST be provided.</assert>
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T14-B10002">Element 'cbc:CompanyID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B10201">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B10401">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax"/>
      <rule context="/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      <rule context="/ubl:CreditNote/cac:PayeeParty"/>
      <rule context="/ubl:CreditNote/cac:PayeeParty/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B11101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B11201">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PayeeParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T14-B11401">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:PayeeParty/cac:PartyLegalEntity">
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T14-B11601">Element 'cbc:CompanyID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B11701">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxRepresentativeParty">
         <assert test="cac:PartyName" flag="warning" id="EHF-T14-B11901">Element 'cac:PartyName' MUST be provided.</assert>
         <assert test="cac:PartyTaxScheme" flag="warning" id="EHF-T14-B11902">Element 'cac:PartyTaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxRepresentativeParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T14-B12001">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme">
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T14-B12201">Element 'cbc:CompanyID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T14-B12202">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B12301">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B12501">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:Delivery"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cbc:ActualDeliveryDate"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B13001">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity"/>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T14-B13801">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B13901">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentMeans">
         <assert test="cbc:PaymentMeansCode" flag="warning" id="EHF-T14-B14101">Element 'cbc:PaymentMeansCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B14201">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cbc:PaymentDueDate"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cbc:PaymentChannelCode"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cbc:PaymentID"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B14701">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B14801">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B15001">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:StreetName"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:AdditionalStreetName"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CityName"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:PostalZone"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cbc:CountrySubentity"/>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T14-B16201">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B16301">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentTerms">
         <assert test="cbc:Note" flag="warning" id="EHF-T14-B16501">Element 'cbc:Note' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:PaymentTerms/cbc:Note"/>
      <rule context="/ubl:CreditNote/cac:TaxExchangeRate">
         <assert test="cbc:SourceCurrencyCode" flag="warning" id="EHF-T14-B16701">Element 'cbc:SourceCurrencyCode' MUST be provided.</assert>
         <assert test="cbc:TargetCurrencyCode" flag="warning" id="EHF-T14-B16702">Element 'cbc:TargetCurrencyCode' MUST be provided.</assert>
         <assert test="cbc:CalculationRate" flag="warning" id="EHF-T14-B16703">Element 'cbc:CalculationRate' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxExchangeRate/cbc:SourceCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B16801">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxExchangeRate/cbc:TargetCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B17001">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxExchangeRate/cbc:CalculationRate"/>
      <rule context="/ubl:CreditNote/cac:TaxExchangeRate/cbc:MathematicOperatorCode"/>
      <rule context="/ubl:CreditNote/cac:TaxExchangeRate/cbc:Date"/>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge">
         <assert test="cbc:ChargeIndicator" flag="warning" id="EHF-T14-B17501">Element 'cbc:ChargeIndicator' MUST be provided.</assert>
         <assert test="cbc:Amount" flag="warning" id="EHF-T14-B17502">Element 'cbc:Amount' MUST be provided.</assert>
         <assert test="cac:TaxCategory" flag="warning" id="EHF-T14-B17503">Element 'cac:TaxCategory' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cbc:ChargeIndicator"/>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode"/>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason"/>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cbc:Amount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B18001">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cac:TaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B18201">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T14-B18202">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent"/>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B18601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:TaxTotal">
         <assert test="cbc:TaxAmount" flag="warning" id="EHF-T14-B18801">Element 'cbc:TaxAmount' MUST be provided.</assert>
         <assert test="cac:TaxSubtotal" flag="warning" id="EHF-T14-B18802">Element 'cac:TaxSubtotal' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cbc:TaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B18901">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
         <assert test="cbc:TaxableAmount" flag="warning" id="EHF-T14-B19101">Element 'cbc:TaxableAmount' MUST be provided.</assert>
         <assert test="cbc:TaxAmount" flag="warning" id="EHF-T14-B19102">Element 'cbc:TaxAmount' MUST be provided.</assert>
         <assert test="cac:TaxCategory" flag="warning" id="EHF-T14-B19103">Element 'cac:TaxCategory' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B19201">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B19401">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B19601">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B19801">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:Percent" flag="warning" id="EHF-T14-B19802">Element 'cbc:Percent' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T14-B19803">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T14-B19901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent"/>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason"/>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B20301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal">
         <assert test="cbc:LineExtensionAmount" flag="warning" id="EHF-T14-B20501">Element 'cbc:LineExtensionAmount' MUST be provided.</assert>
         <assert test="cbc:TaxExclusiveAmount" flag="warning" id="EHF-T14-B20502">Element 'cbc:TaxExclusiveAmount' MUST be provided.</assert>
         <assert test="cbc:TaxInclusiveAmount" flag="warning" id="EHF-T14-B20503">Element 'cbc:TaxInclusiveAmount' MUST be provided.</assert>
         <assert test="cbc:PayableAmount" flag="warning" id="EHF-T14-B20504">Element 'cbc:PayableAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B20601">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B20801">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B21001">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B21201">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B21401">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:PrepaidAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B21601">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B21801">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B22001">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B22201">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:CreditedQuantity" flag="warning" id="EHF-T14-B22202">Element 'cbc:CreditedQuantity' MUST be provided.</assert>
         <assert test="cbc:LineExtensionAmount" flag="warning" id="EHF-T14-B22203">Element 'cbc:LineExtensionAmount' MUST be provided.</assert>
         <assert test="cac:Item" flag="warning" id="EHF-T14-B22204">Element 'cac:Item' MUST be provided.</assert>
         <assert test="cac:Price" flag="warning" id="EHF-T14-B22205">Element 'cac:Price' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cbc:Note"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T14-B22501">Attribute 'unitCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cbc:LineExtensionAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B22801">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cbc:AccountingCost"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:StartDate"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:EndDate"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:OrderLineReference">
         <assert test="cbc:LineID" flag="warning" id="EHF-T14-B23401">Element 'cbc:LineID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:BillingReference"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B23701">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B23901">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B24101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cbc:ActualDeliveryDate"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T14-B25401">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T14-B25501">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:TaxTotal">
         <assert test="cbc:TaxAmount" flag="warning" id="EHF-T14-B25701">Element 'cbc:TaxAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B25801">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge">
         <assert test="cbc:ChargeIndicator" flag="warning" id="EHF-T14-B26001">Element 'cbc:ChargeIndicator' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:ChargeIndicator"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:Amount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B26301">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item">
         <assert test="cbc:Name" flag="warning" id="EHF-T14-B26501">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cac:ClassifiedTaxCategory" flag="warning" id="EHF-T14-B26502">Element 'cac:ClassifiedTaxCategory' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellerItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B26801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellerItemIdentification/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B27001">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification">
         <assert test="cbc:ItemClassificationCode"
                 flag="warning"
                 id="EHF-T14-B27601">Element 'cbc:ItemClassificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B27901">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T14-B27902">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T14-B28301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty">
         <assert test="cbc:Name" flag="warning" id="EHF-T14-B28501">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cbc:Value" flag="warning" id="EHF-T14-B28502">Element 'cbc:Value' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty/cbc:Value"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T14-B28901">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity">
         <assert test="cbc:CompanyID" flag="warning" id="EHF-T14-B29101">Element 'cbc:CompanyID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity/cbc:CompanyID"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price">
         <assert test="cbc:PriceAmount" flag="warning" id="EHF-T14-B29401">Element 'cbc:PriceAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B29501">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge">
         <assert test="cbc:ChargeIndicator" flag="warning" id="EHF-T14-B29801">Element 'cbc:ChargeIndicator' MUST be provided.</assert>
         <assert test="cbc:Amount" flag="warning" id="EHF-T14-B29802">Element 'cbc:Amount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:ChargeIndicator"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric"/>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:Amount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B30201">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T14-B30401">Attribute 'currencyID' MUST be present.</assert>
      </rule>
   </pattern>
   <pattern>
      <let name="isB2C"
           value="//cac:AdditionalDocumentReference/cbc:DocumentType = 'elektroniskB2Cfaktura'"/>
      <let name="documentCurrencyCode"
           value="/ubl:CreditNote/cbc:DocumentCurrencyCode"/>

      <rule context="cbc:ProfileID">
         <assert id="EHFPROFILE-T14-R001"
                 test="some $p in tokenize('urn:www.cenbii.eu:profile:bii05:ver2.0 urn:www.cenbii.eu:profile:biixx:ver2.0 urn:www.cenbii.eu:profile:biixy:ver2.0', '\s') satisfies $p = normalize-space(.)"
                 flag="fatal">[EHFPROFILE-T14-R001]-A credit note transaction T14 must only be used with profiles 5, xx or xy.</assert>
      </rule>
      <rule context="ubl:CreditNote">
         <assert id="NOGOV-T14-R003"
                 test="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount != 0) and (cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or (cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount = 0) or not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT'])))"
                 flag="fatal">[NOGOV-T14-R003]-If the VAT total amount in a credit note exists it MUST contain the suppliers VAT number.</assert>
         <assert id="NOGOV-T14-R021"
                 test="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'true'])"
                 flag="fatal">[NOGOV-T14-R021]-If charge is present on document level, total charge must be stated.</assert>
         <assert id="NOGOV-T14-R022"
                 test="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'false'])"
                 flag="fatal">[NOGOV-T14-R022]-If allowance is present on document level, total allowance must be stated.</assert>
         <assert id="EHFPROFILE-T14-R002"
                 test="local-name(/*) = 'CreditNote' and (((//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID) or (//cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID)) or (//cbc:ProfileID = 'urn:www.cenbii.eu:profile:biixx:ver2.0'))"
                 flag="fatal">[EHFPROFILE-T14-R002]-A creditnote transaction T14 in Profile other than xx MUST have an invoice or creditnote reference identifier.</assert>
      </rule>
      <rule context="cac:AccountingSupplierParty/cac:Party">
         <assert id="NOGOV-T14-R001" test="cac:Contact/cbc:ID" flag="warning">[NOGOV-T14-R001]-A contact reference identifier SHOULD be provided for AccountingSupplierParty according to EHF.</assert>
      </rule>
      <rule context="cbc:Amount | cbc:TaxableAmount | cbc:TaxAmount | cbc:LineExtensionAmount | cbc:PriceAmount | cbc:BaseAmount | cac:LegalMonetaryTotal/cbc:*">
      

         <assert id="NOGOV-T14-R005"
                 test="not(@currencyID) or @currencyID = $documentCurrencyCode"
                 flag="fatal">[NOGOV-T14-R005]-The attribute currencyID must have the same value as DocumentCurrencyCode, except the attribute for TransactionCurrencyTaxAmount.</assert>
         <assert id="NOGOV-T14-R024"
                 test="not(parent::node()/local-name() = 'LegalMonetaryTotal') or string-length(substring-after(., '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T14-R024]-Document level amounts cannot have more than 2 decimals</assert>
      </rule>
      <rule context="cac:Item">
         <assert id="NOGOV-T14-R002"
                 test="cac:SellersItemIdentification/cbc:ID"
                 flag="warning">[NOGOV-T14-R002]-The sellers ID for the item SHOULD be provided according to EHF.</assert>
      </rule>
      <rule context="cac:AccountingCustomerParty/cac:Party">
         <assert id="NOGOV-T14-R004"
                 test="$isB2C or cac:PartyLegalEntity/cbc:CompanyID"
                 flag="fatal">[NOGOV-T14-R004]-PartyLegalEntity for AccountingCustomerParty MUST be provided according to EHF.</assert>
         <assert id="NOGOV-T14-R008"
                 test="$isB2C or cac:PartyLegalEntity/cbc:RegistrationName"
                 flag="fatal">[NOGOV-T14-R008]-Registration name for AccountingCustomerParty MUST be provided according to EHF.</assert>
         <assert id="NOGOV-T14-R006"
                 test="cac:PartyIdentification/cbc:ID"
                 flag="warning">[NOGOV-T14-R006]-A customer number for AccountingCustomerParty SHOULD be provided according to EHF.</assert>
         <assert id="NOGOV-T14-R007" test="cac:Contact/cbc:ID" flag="fatal">[NOGOV-T14-R007]-A contact reference identifier MUST be provided for AccountingCustomerParty according to EHF.</assert>
      </rule>
      <rule context="ubl:CreditNote/cac:TaxTotal">
         <assert id="NOGOV-T14-R018" test="cac:TaxSubtotal" flag="fatal">[NOGOV-T14-R018]-A credit note MUST have Tax Subtotal specifications.</assert>
         <assert id="NOGOV-T14-R025"
                 test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T14-R025]-Total tax amount cannot have more than 2 decimals</assert>
         <assert id="NOGOV-T14-R041"
                 test="count(distinct-values(cac:TaxSubtotal/cac:TaxCategory/cbc:ID/normalize-space(text()))) = count(cac:TaxSubtotal)"
                 flag="fatal">[NOGOV-T14-R041]-Multiple tax subtotals per tax category code is not allowed.</assert>
      </rule>
      <rule context="cac:TaxRepresentativeParty">
         <assert id="NOGOV-T14-R017"
                 test="cac:PartyTaxScheme/cbc:CompanyID"
                 flag="fatal">[NOGOV-T14-R017]-Company identifier MUST be specified when describing a Tax Representative</assert>
      </rule>
      <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'BBAN']">
         <assert id="NOGOV-T14-R015" test="matches(., '^[0-9]+$')" flag="fatal">[NOGOV-T14-R015]-Only numbers are allowed as bank account number if scheme is BBAN.</assert>
      </rule>
      <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'IBAN']">
         <assert id="NOGOV-T14-R016"
                 test="matches(., '^[A-Z]{2}[0-9]+$')"
                 flag="warning">[NOGOV-T14-R016]-IBAN number is not for a Norwegain bank account</assert>
      </rule>
      <rule context="cac:CommodityClassification">
         <assert id="NOGOV-T14-R019"
                 test="cbc:ItemClassificationCode"
                 flag="warning">[NOGOV-T14-R019]-Item classification code MUST be specified when describing commodity classification.</assert>
      </rule>
      <rule context="cac:TaxSubtotal">
         <assert id="NOGOV-T14-R026"
                 test="string-length(substring-after(cbc:TaxableAmount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T14-R026]-Tax subtotal amounts cannot have more than 2 decimals</assert>
         <assert id="NOGOV-T14-R026"
                 test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T14-R026]-Tax subtotal amounts cannot have more than 2 decimals</assert>
      </rule>
      <rule context="ubl:CreditNote/cac:AllowanceCharge">
         <assert id="NOGOV-T14-R027"
                 test="string-length(substring-after(cbc:Amount, '.')) &lt;= 2"
                 flag="fatal">[NOGOV-T14-R027]-Allowance or charge amounts on document level cannot have more than 2 decimals</assert>
      </rule>
   </pattern>
   <pattern>
      <let name="taxCategories"
           value="for $cat in /ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return u:cat2str($cat)"/>

      <rule context="ubl:CreditNote">
         <assert id="NONAT-T14-R009"
                 test="not(cac:PayeeParty) or cac:PayeeParty/cac:PartyName/cbc:Name"
                 flag="fatal">[NONAT-T14-R009]-If payee information is provided then the payee name MUST be specified.</assert>
         <assert id="NONAT-T14-R021"
                 test="local-name(/*) = 'CreditNote' and (((//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID) or (//cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID)) or (//cbc:ProfileID = 'urn:www.cenbii.eu:profile:biixx:ver2.0'))"
                 flag="fatal">[NONAT-T14-R021]-A creditnote transaction T14 in Profile other than xx MUST have an invoice or creditnote reference identifier.</assert>
         <assert id="NONAT-T14-R018" test="cac:TaxTotal" flag="fatal">[NONAT-T14-R018]-A Credit Note MUST contain tax information</assert>
         <assert id="NONAT-T14-R005"
                 test="not(cbc:IssueDate) or current-date() &gt;= cbc:IssueDate"
                 flag="warning">[NONAT-T14-R005]-Issue date of a creditnote should be today or earlier.</assert>
      </rule>
      <rule context="cbc:UBLVersionID">
         <assert id="NONAT-T14-R016" test="normalize-space(.) = '2.1'" flag="fatal">[NONAT-T14-R016]-UBL version must be 2.1</assert>
      </rule>
      <rule context="cac:AccountingSupplierParty/cac:Party">
         <assert id="NONAT-T14-R001"
                 test="(cac:PartyLegalEntity/cbc:CompanyID != '') and (//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO') or not((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO'))"
                 flag="fatal">[NONAT-T14-R001]-PartyLegalEntity for AccountingSupplierParty MUST be provided according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 2"</assert>
         <assert id="NONAT-T14-R006"
                 test="(cac:PartyLegalEntity/cbc:RegistrationName != '') and (//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO') or not((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO'))"
                 flag="fatal">[NONAT-T14-R006]-The Norwegian legal registration name for the supplier MUST be provided according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 2"</assert>
         <assert id="NONAT-T14-R003"
                 test="(cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode) and (//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO') or not((//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO'))"
                 flag="fatal">[NONAT-T14-R003]-A supplier postal address in a credit note MUST contain at least city name, zip code and country code.</assert>
      </rule>
      <rule context="cac:AccountingCustomerParty/cac:Party">
         <assert id="NONAT-T14-R004"
                 test="(cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode and (cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO')) or not(cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NO')"
                 flag="fatal">[NONAT-T14-R004]-A customer postal address in a credit note MUST contain at least, city name, zip code and country code.</assert>
      </rule>
      <rule context="cac:PartyLegalEntity">
         <assert id="NONAT-T14-R014" test="cbc:CompanyID" flag="fatal">[NONAT-T14-R014]-Company identifier MUST be specified when describing a company legal entity.</assert>
      </rule>
      <rule context="cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeID]">
         <assert id="NONAT-T14-R007"
                 test="some $v in tokenize('GLN GSRN', '\s') satisfies $v = @schemeID"
                 flag="warning">[NONAT-T14-R007]-Location identifiers SHOULD be GLN or GSRN</assert>
      </rule>
      <rule context="cac:PayeeFinancialAccount/cbc:ID[@schemeID]">
         <assert id="NONAT-T14-R022"
                 test="some $v in tokenize('IBAN BBAN LOCAL', '\s') satisfies $v = @schemeID"
                 flag="fatal">[NONAT-T14-R022]-A payee account identifier scheme MUST be either IBAN, BBAN or LOCAL</assert>
      </rule>
      <rule context="cac:LegalMonetaryTotal">
         <assert id="NONAT-T14-R020"
                 test="number(cbc:TaxInclusiveAmount) &gt;= 0"
                 flag="warning">[NONAT-T14-R020]-Tax inclusive amount in a credit note SHOULD NOT be negative</assert>
         <assert id="NONAT-T14-R019"
                 test="number(cbc:PayableAmount) &gt;= 0"
                 flag="warning">[NONAT-T14-R019]-Total payable amount in a credit note SHOULD NOT be negative</assert>
      </rule>
      <rule context="cac:AllowanceCharge">
         <let name="category" value="u:cat2str(cac:TaxCategory)"/>

         <assert id="NONAT-T14-R008" test="cbc:AllowanceChargeReason" flag="warning">[NONAT-T14-R008]-AllowanceChargeReason text SHOULD be specified for all allowances and charges</assert>
         <assert id="NONAT-T14-R031"
                 test="not(cac:TaxCategory/cbc:Percent) or (some $cat in $taxCategories satisfies $cat = $category)"
                 flag="fatal">[NONAT-T14-R031]-Tax category for allowance and charge MUST match provided tax categories on document level.</assert>
      </rule>
      <rule context="cac:CreditNoteLine">
         <let name="sumCharge"
              value="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='true']/cbc:Amount)"/>
         <let name="sumAllowance"
              value="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='false']/cbc:Amount)"/>
         <let name="baseQuantity"
              value="xs:decimal(if (cac:Price/cbc:BaseQuantity and xs:decimal(cac:Price/cbc:BaseQuantity) != 0) then cac:Price/cbc:BaseQuantity else 1)"/>
         <let name="pricePerUnit"
              value="xs:decimal(cac:Price/cbc:PriceAmount) div $baseQuantity"/>
         <let name="quantity" value="xs:decimal(cbc:CreditedQuantity)"/>
         <let name="lineExtensionAmount" value="number(cbc:LineExtensionAmount)"/>
         <let name="quiet"
              value="not(cbc:CreditedQuantity) or not(cac:Price/cbc:PriceAmount)"/>
         <let name="category" value="u:cat2str(cac:Item/cac:ClassifiedTaxCategory)"/>

         <assert id="NONAT-T14-R012" test="cac:Item/cbc:Name" flag="fatal">[NONAT-T14-R012]-Each credit note line MUST contain the product/service name</assert>
         <assert id="NONAT-T14-R011" test="cac:Price/cbc:PriceAmount" flag="fatal">[NONAT-T14-R011]-Credit Note line MUST contain the item price</assert>
         <assert id="NONAT-T14-R024"
                 test="$quiet or u:slack($lineExtensionAmount, u:twodec(u:twodec($pricePerUnit * $quantity) + u:twodec($sumCharge) - u:twodec($sumAllowance)), 0.02)"
                 flag="fatal">[NONAT-T14-R024]-Credit note line amount MUST be equal to the price amount multiplied by the quantity, plus charges minus allowances at the line level.</assert>
         <assert id="NONAT-T14-R030"
                 test="not(cac:Item/cac:ClassifiedTaxCategory/cbc:Percent) or (some $cat in $taxCategories satisfies $cat = $category)"
                 flag="fatal">[NONAT-T14-R030]-Tax category on line level MUST match provided tax categories on document level.</assert>
      </rule>

      <rule context="cac:Price/cbc:BaseQuantity">
         <assert id="NONAT-T14-R033" test="xs:decimal(.) &gt; 0" flag="fatal">[NONAT-T10-R033]-Base quantity must be a positive value higher than zero.</assert>
      </rule>

      <rule context="cac:TaxSubtotal">
         <let name="category" value="cac:TaxCategory/cbc:ID/normalize-space(text())"/>
         <let name="sumLineExtensionAmount"
              value="xs:decimal(sum(/ubl:CreditNote/cac:CreditNoteLine[normalize-space(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) = $category]/cbc:LineExtensionAmount))"/>
         <let name="sumAllowance"
              value="xs:decimal(sum(/ubl:CreditNote/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'false']/cbc:Amount))"/>
         <let name="sumCharge"
              value="xs:decimal(sum(/ubl:CreditNote/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'true']/cbc:Amount))"/>

         <assert id="NONAT-T14-R029"
                 test="xs:decimal(cbc:TaxableAmount) = u:twodec($sumLineExtensionAmount - $sumAllowance + $sumCharge)"
                 flag="fatal">[NONAT-T14-R029]-Taxable amount in a tax subtotal MUST be the sum of line extension amount of all credit note lines and allowances and charges on document level with the same tax category.</assert>
      </rule>

   

      <rule context="cac:TaxScheme/cbc:ID">
         <assert id="NONAT-T14-R010" test="normalize-space(.) = 'VAT'" flag="fatal">[NONAT-T14-R010]-Credit Note tax schemes MUST be 'VAT'</assert>
      </rule>
      <rule context="cac:TaxScheme">
         <assert id="NONAT-T14-R013" test="cbc:ID" flag="fatal">[NONAT-T14-R013]-Every tax scheme MUST be defined through an identifier.</assert>
      </rule>

   </pattern>

</schema>
