<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!
Schematron tests for binding UBL and transaction T10-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T10" id="UBL-T10">
  <param name="ATNAT-T10-R001" value="(number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 10000 and cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not (number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 10000)" />
  <param name="ATNAT-T10-R002" value="((cac:TaxScheme/cbc:ID = 'VAT') and (number(cbc:Percent) = 0) and (cbc:ID = 'E') or (cbc:ID = 'AE')) or not ((cac:TaxScheme/cbc:ID = 'VAT') and (number(cbc:Percent) = 0))" />
  <param name="ATNAT-T10-R003" value="(cac:Delivery/cbc:ActualDeliveryDate) or (cac:InvoicePeriod/cbc:StartDate and cac:InvoicePeriod/cbc:EndDate)" />
  <param name="ATNAT-T10-R004" value="((//cac:TaxCategory/cbc:ID = 'AE') and cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not ((//cac:TaxCategory/cbc:ID = 'AE'))" />
  <param name="ATNAT-T10-R005" value="(number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 400 and cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not (number(//cbc:TaxInclusiveAmount[@currencyID='EUR']) > 400)" />
  <param name="ATNAT-T10-R006" value="((cac:TaxScheme/cbc:ID = 'VAT') and (cbc:ID = 'AE') and number(../cbc:TaxAmount) = 0) or not ((cac:TaxScheme/cbc:ID = 'VAT') and (cbc:ID = 'AE'))" />
  <param name="ATNAT-T10-R007" value="(cac:TaxCategory) and (cac:TaxCategory/cbc:Percent)" />
  <param name="ATNAT-T10-R008" value="count(cac:Attachment/cac:ExternalReference) = 0" />
  <param name="Invoice" value="/ubl:Invoice" />
  <param name="Tax_Category" value="//cac:TaxCategory" />
  <param name="AllowanceCharge" value="/ubl:Invoice/cac:AllowanceCharge" />
  <param name="Attachments" value="/ubl:Invoice/cac:AdditionalDocumentReference" />
</pattern>
