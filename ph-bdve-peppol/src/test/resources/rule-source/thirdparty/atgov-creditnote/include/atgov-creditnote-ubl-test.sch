<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!
Schematron tests for binding UBL and transaction T14-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T14" id="UBL-T14">
  <param name="ATGOV-T14-R001" value="(cac:Contact/cbc:ElectronicMail)" />
  <param name="ATGOV-T14-R002" value="count(cac:CreditNoteLine) &lt; 999" />
  <param name="ATGOV-T14-R003" value="(cac:OrderReference/cbc:ID)" />
  <param name="ATGOV-T14-R004" value="((cbc:Note) and cbc:SettlementDiscountPercent and cac:SettlementPeriod) or not ((cbc:Note))" />
  <param name="ATGOV-T14-R005" value="count(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID) = 1" />
  <param name="ATGOV-T14-R007" value="(cbc:PaymentMeansCode = '30' or cbc:PaymentMeansCode = '31' or cbc:PaymentMeansCode = '42'  or cbc:PaymentMeansCode = '49' or cbc:PaymentMeansCode = '58' or cbc:PaymentMeansCode = '59') and  (cac:PayeeFinancialAccount/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and  (cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID = 'BIC')" />
  <param name="ATGOV-T14-R008" value="((string(number(//cac:OrderReference/cbc:ID)) != 'NaN') and (cac:OrderLineReference/cbc:LineID)) or not ((string(number(//cac:OrderReference/cbc:ID)) != 'NaN'))" />
  <param name="ATGOV-T14-R009" value="count(cac:PaymentTerms/cac:SettlementPeriod) &lt;= 2" />
  <param name="ATGOV-T14-R010" value="((cbc:SettlementDiscountPercent) and number(cbc:SettlementDiscountPercent) > 0 and number(cbc:SettlementDiscountPercent) &lt; 100) or not ((cbc:SettlementDiscountPercent))" />
  <param name="ATGOV-T14-R012" value="((cac:Attachment/cbc:EmbeddedDocumentBinaryObject) and cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.ms-excel' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/pdf' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'image/png' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/xml' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'text/xml') or not ((cac:Attachment/cbc:EmbeddedDocumentBinaryObject))" />
  <param name="ATGOV-T14-R013" value="count(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject) &lt;= 200" />
  <param name="ATGOV-T14-R014" value="string-length(string-join(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/text(),'')) * 3 div 4 &lt;= 15728640" />
  <param name="ATGOV-T14-R015" value="(number(cbc:LineExtensionAmount) >= -999999999999.99 and number(cbc:LineExtensionAmount) &lt;= 999999999999.99)" />
  <param name="ATGOV-T14-R016" value="number(cac:LegalMonetaryTotal/cbc:PayableAmount) &lt;= 999999999.99" />
  <param name="ATGOV-T14-R018" value="((cac:Price/cbc:PriceAmount) and matches(cac:Price/cbc:PriceAmount/text(),&quot;^[-+]?[0-9]*(\.[0-9]{0,4})?$&quot;)) or not ((cac:Price/cbc:PriceAmount))" />
  <param name="CreditNoteLine" value="/ubl:CreditNote/cac:CreditNoteLine" />
  <param name="CreditNote" value="/ubl:CreditNote" />
  <param name="Payment_Means" value="/ubl:CreditNote/cac:PaymentMeans" />
  <param name="Supplier" value="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party" />
  <param name="Payment_Terms" value="/ubl:CreditNote/cac:PaymentTerms" />
  <param name="Attachments" value="/ubl:CreditNote/cac:AdditionalDocumentReference" />
</pattern>
