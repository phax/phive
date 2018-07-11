<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:u="utils"
        schemaVersion="iso" queryBinding="xslt2">

   <title>Sjekk mot norsk bokf. lov</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" prefix="ubl"/>
   <ns uri="utils" prefix="u"/>

   <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:twodec">
     <param name="val"/>
     <value-of select="round($val * 100) div 100"/>
   </function>

   <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:slack" as="xs:boolean">
     <param name="exp"/>
     <param name="val"/>
     <param name="slack"/>
     <value-of select="$exp + xs:decimal($slack) &gt;= $val and $exp - xs:decimal($slack) &lt;= $val"/>
   </function>

   <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:cat2str">
     <param name="cat"/>
     <value-of select="concat(normalize-space($cat/cbc:ID), '-', round(xs:decimal($cat/cbc:Percent) * 1000000))"/>
   </function>

   <pattern>
      <let name="taxCategories" value="for $cat in /ubl:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return u:cat2str($cat)"/>

      <rule context="ubl:CreditNote">
         <assert id="NONAT-T14-R009"
                 test="not(cac:PayeeParty) or cac:PayeeParty/cac:PartyName/cbc:Name"
                 flag="fatal">[NONAT-T14-R009]-If payee information is provided then the payee name MUST be specified.</assert>
         <assert id="NONAT-T14-R021"
                 test="local-name(/*) = 'CreditNote' and (((//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID) or (//cac:BillingReference/cac:CreditNoteDocumentReference/cbc:ID)) or (//cbc:ProfileID = 'urn:www.cenbii.eu:profile:biixx:ver2.0'))"
                 flag="fatal">[NONAT-T14-R021]-A creditnote transaction T14 in Profile other than xx MUST have an invoice or creditnote reference identifier.</assert>
         <assert id="NONAT-T14-R018"
                 test="cac:TaxTotal"
                 flag="fatal">[NONAT-T14-R018]-A Credit Note MUST contain tax information</assert>
         <assert id="NONAT-T14-R005"
                 test="not(cbc:IssueDate) or current-date() &gt;= cbc:IssueDate"
                 flag="warning">[NONAT-T14-R005]-Issue date of a creditnote should be today or earlier.</assert>
      </rule>
      <rule context="cbc:UBLVersionID">
         <assert id="NONAT-T14-R016"
                 test="normalize-space(.) = '2.1'"
                 flag="fatal">[NONAT-T14-R016]-UBL version must be 2.1</assert>
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
         <assert id="NONAT-T14-R014"
                 test="cbc:CompanyID"
                 flag="fatal">[NONAT-T14-R014]-Company identifier MUST be specified when describing a company legal entity.</assert>
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

         <assert id="NONAT-T14-R008"
                 test="cbc:AllowanceChargeReason"
                 flag="warning">[NONAT-T14-R008]-AllowanceChargeReason text SHOULD be specified for all allowances and charges</assert>
         <assert id="NONAT-T14-R031"
                 test="not(cac:TaxCategory/cbc:Percent) or (some $cat in $taxCategories satisfies $cat = $category)"
                 flag="fatal">[NONAT-T14-R031]-Tax category for allowance and charge MUST match provided tax categories on document level.</assert>
      </rule>
      <rule context="cac:CreditNoteLine">
         <let name="sumCharge" value="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='true']/cbc:Amount)" />
         <let name="sumAllowance" value="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='false']/cbc:Amount)"/>
         <let name="baseQuantity" value="xs:decimal(if (cac:Price/cbc:BaseQuantity and xs:decimal(cac:Price/cbc:BaseQuantity) != 0) then cac:Price/cbc:BaseQuantity else 1)"/>
         <let name="pricePerUnit" value="xs:decimal(cac:Price/cbc:PriceAmount) div $baseQuantity"/>
         <let name="quantity" value="xs:decimal(cbc:CreditedQuantity)"/>
         <let name="lineExtensionAmount" value="number(cbc:LineExtensionAmount)"/>
         <let name="quiet" value="not(cbc:CreditedQuantity) or not(cac:Price/cbc:PriceAmount)"/>
         <let name="category" value="u:cat2str(cac:Item/cac:ClassifiedTaxCategory)"/>

         <assert id="NONAT-T14-R012"
                 test="cac:Item/cbc:Name"
                 flag="fatal">[NONAT-T14-R012]-Each credit note line MUST contain the product/service name</assert>
         <assert id="NONAT-T14-R011"
                 test="cac:Price/cbc:PriceAmount"
                 flag="fatal">[NONAT-T14-R011]-Credit Note line MUST contain the item price</assert>
         <assert id="NONAT-T14-R024"
                 test="$quiet or u:slack($lineExtensionAmount, u:twodec(u:twodec($pricePerUnit * $quantity) + u:twodec($sumCharge) - u:twodec($sumAllowance)), 0.02)"
                 flag="fatal">[NONAT-T14-R024]-Credit note line amount MUST be equal to the price amount multiplied by the quantity, plus charges minus allowances at the line level.</assert>
         <assert id="NONAT-T14-R030"
                 test="not(cac:Item/cac:ClassifiedTaxCategory/cbc:Percent) or (some $cat in $taxCategories satisfies $cat = $category)"
                 flag="fatal">[NONAT-T14-R030]-Tax category on line level MUST match provided tax categories on document level.</assert>
      </rule>

      <rule context="cac:Price/cbc:BaseQuantity">
        <assert id="NONAT-T14-R033"
                test="xs:decimal(.) &gt; 0"
                flag="fatal">[NONAT-T10-R033]-Base quantity must be a positive value higher than zero.</assert>
      </rule>

      <rule context="cac:TaxSubtotal">
         <let name="category" value="cac:TaxCategory/cbc:ID/normalize-space(text())"/>
         <let name="sumLineExtensionAmount" value="xs:decimal(sum(/ubl:CreditNote/cac:CreditNoteLine[normalize-space(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) = $category]/cbc:LineExtensionAmount))"/>
         <let name="sumAllowance" value="xs:decimal(sum(/ubl:CreditNote/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'false']/cbc:Amount))"/>
         <let name="sumCharge" value="xs:decimal(sum(/ubl:CreditNote/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'true']/cbc:Amount))"/>

         <assert id="NONAT-T14-R029"
                 test="xs:decimal(cbc:TaxableAmount) = u:twodec($sumLineExtensionAmount - $sumAllowance + $sumCharge)"
                 flag="fatal">[NONAT-T14-R029]-Taxable amount in a tax subtotal MUST be the sum of line extension amount of all credit note lines and allowances and charges on document level with the same tax category.</assert>
      </rule>

      <!-- TAXATION -->

      <rule context="cac:TaxScheme/cbc:ID">
         <assert id="NONAT-T14-R010"
                 test="normalize-space(.) = 'VAT'"
                 flag="fatal">[NONAT-T14-R010]-Credit Note tax schemes MUST be 'VAT'</assert>
      </rule>
      <rule context="cac:TaxScheme">
         <assert id="NONAT-T14-R013"
                 test="cbc:ID"
                 flag="fatal">[NONAT-T14-R013]-Every tax scheme MUST be defined through an identifier.</assert>
      </rule>

   </pattern>
</schema>
