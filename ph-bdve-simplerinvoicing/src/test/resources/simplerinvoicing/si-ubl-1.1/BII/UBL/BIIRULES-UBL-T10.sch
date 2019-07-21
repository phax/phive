<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T10 -->
<!-- (2009). Invinet Sistemes -->

<!--
  Author: Marcel Diepstra
  It seems that BII2-T10-R043 description is not corresponding with the xpath check
  A few changes were made for ensuring that some complex calculation rules do not fire if elements are missing. Since these rules can be confusing
	if elements are missing altogether. It then makes more sense to just let the rules fire that fail when these elements are missing.
	These are rules: BII2-T10-R053
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="BII-T10" id="BII-UBL-T10">
    <!-- Version check -->
    <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.1'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.1'))]">
        <assert test="true()" />
    </rule>
    <!-- End of version check -->
  <param name="BII2-T10-R001" value="(cbc:CustomizationID)"/>
  <param name="BII2-T10-R002" value="(cbc:ProfileID)"/>
  <param name="BII2-T10-R003" value="(cbc:ID)"/>
  <param name="BII2-T10-R004" value="(cbc:IssueDate)"/>
  <param name="BII2-T10-R005" value="(cbc:DocumentCurrencyCode)"/>
  <param name="BII2-T10-R006" value="(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T10-R008" value="(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T10-R010" value="(cac:LegalMonetaryTotal/cbc:LineExtensionAmount)"/>
  <param name="BII2-T10-R011" value="(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)"/>
  <param name="BII2-T10-R012" value="(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount)"/>
  <param name="BII2-T10-R013" value="(cac:LegalMonetaryTotal/cbc:PayableAmount)"/>
  <param name="BII2-T10-R014" value="(cac:InvoiceLine)"/>
  <param name="BII2-T10-R015" value="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) or not(cac:InvoiceLine/cac:TaxTotal)"/>
  <param name="BII2-T10-R017" value="(cbc:ID)"/>
  <param name="BII2-T10-R018" value="(cbc:InvoicedQuantity)"/>
  <param name="BII2-T10-R019" value="(cbc:InvoicedQuantity/@unitCode)"/>
  <param name="BII2-T10-R020" value="cbc:LineExtensionAmount"/>
  <param name="BII2-T10-R021" value="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or  (cac:Item/cac:SellersItemIdentification/cbc:ID)"/>
  <param name="BII2-T10-R023" value="(cbc:StartDate)"/>
  <param name="BII2-T10-R024" value="(cbc:EndDate)"/>
  <!-- BII2-T10-R025 is adapted for Simplerinvoicing -->
  <param name="BII2-T10-R025" value="cbc:AllowanceChargeReason or cbc:AllowanceChargeReasonCode"/>
  <param name="BII2-T10-R026" value="(//cac:TaxScheme/cbc:ID = 'VAT') or not(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)"/>
  <param name="BII2-T10-R027" value="(cbc:TaxableAmount)"/>
  <param name="BII2-T10-R028" value="(cbc:TaxAmount)"/>
  <param name="BII2-T10-R029" value="(cac:TaxCategory/cbc:ID)"/>
  <param name="BII2-T10-R030" value="(cac:TaxCategory/cbc:Percent) or not(cac:TaxCategory/cbc:ID = 'S')"/>
  <param name="BII2-T10-R031" value="(cbc:StartDate and cbc:EndDate) and (number(translate(cbc:StartDate,'-','')) &lt;= number(translate(cbc:EndDate,'-','')))"/>
  <param name="BII2-T10-R032" value="(cac:StandardItemIdentification/cbc:ID/@schemeID) or not(cac:StandardItemIdentification)"/>
  <param name="BII2-T10-R033" value="cbc:ItemClassificationCode/@listID"/>
  <!-- BII2-T10-R034 is removed for Simplerinvoicing --><!--param name="BII2-T10-R034" value="number(cac:Price/cbc:PriceAmount) &gt;= 0"-->
  <!-- BII2-T10-R035 is removed for Simplerinvoicing -->
  <!-- param name="BII2-T10-R035" value="/ubl:Invoice/cbc:InvoiceTypeCode != 380 or not(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount) or number(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount) &gt;= 0”-->
  <!-- BII2-T10-R037 is removed for Simplerinvoicing -->
  <!-- param name="BII2-T10-R037" value="/ubl:Invoice/cbc:InvoiceTypeCode != 380 or number(cac:LegalMonetaryTotal/cbc:PayableAmount) &gt;= 0”-->
  <param name="BII2-T10-R039" value="((cbc:PaymentMeansCode = '31') and (cac:PayeeFinancialAccount/cbc:ID)) or (string(cbc:PaymentMeansCode) != '31')"/>
  <param name="BII2-T10-R040" value="(cac:PayeeFinancialAccount/cbc:ID/@schemeID and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID) or (cac:PayeeFinancialAccount/cbc:ID/@schemeID != 'IBAN') or (not(cac:PayeeFinancialAccount/cbc:ID/@schemeID))"/>
  <param name="BII2-T10-R041" value="(cbc:PaymentMeansCode)"/>
  <param name="BII2-T10-R042" value="(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID='BIC') and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') or not(cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN')"/>
  <!-- BII2-T10-R043 is adapted for Simplerinvoicing -->
  <!--<param name="BII2-T10-R043" value="((/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID = 'VAT') and (//cac:TaxCategory/cbc:ID)) or not(/ubl:Invoice/cac:TaxTotal)"/>-->
  <param name="BII2-T10-R043" value="((/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID = 'VAT') and (cac:TaxCategory/cbc:ID)) or not(/ubl:Invoice/cac:TaxTotal)"/>
  <param name="BII2-T10-R044" value="(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/*/cbc:ID = 'VAT')"/>
   <!-- BII2-T10-R045 is removed for Simplerinvoicing --><!--param name="BII2-T10-R045" value="(cac:TaxCategory/cbc:TaxExemptionReason) or not ((cac:TaxCategory/cbc:ID='E') or (cac:TaxCategory/cbc:ID='AE'))"/-->
   <!-- BII2-T10-R046 is removed for Simplerinvoicing --><!--param name="BII2-T10-R046" value="(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) or not(/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID='VAT')"/-->
  <param name="BII2-T10-R047" value="(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/cbc:ID = 'AE')"/>
  <param name="BII2-T10-R048" value="count(child::cac:TaxTotal/*/*/cbc:ID) = count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) or count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) = 0"/>
  <param name="BII2-T10-R049" value="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount = (cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount)"/>
  <param name="BII2-T10-R050" value="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount = 0) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount)"/>
  <param name="BII2-T10-R051" value="number(cbc:LineExtensionAmount) = number(round(sum(//cac:InvoiceLine/cbc:LineExtensionAmount) * 10 * 10) div 100)"/>
  <param name="BII2-T10-R052" value="((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 ))  or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = number(cbc:LineExtensionAmount)))"/>
  <!--
  <param name="BII2-T10-R053" value="not(cbc:TaxInclusiveAmount) or ((cbc:PayableRoundingAmount) and (number(cbc:TaxInclusiveAmount) = (round((number(cbc:TaxExclusiveAmount) + number(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)) + number(cbc:PayableRoundingAmount)) *10 * 10) div 100))) or ((cbc:TaxInclusiveAmount) and number(cbc:TaxInclusiveAmount) = round(( number(cbc:TaxExclusiveAmount) + number(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount))) * 10 * 10) div 100)"/>
-->
  <param name="BII2-T10-R053" value="not(cbc:TaxInclusiveAmount) or ((cbc:PayableRoundingAmount) and (  (round(xs:decimal(cbc:TaxInclusiveAmount) * 10 * 10) div 100) = (round((xs:decimal(cbc:TaxExclusiveAmount) + xs:decimal(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)) + xs:decimal(cbc:PayableRoundingAmount)) *10 * 10) div 100))) or ((cbc:TaxInclusiveAmount) and (round(xs:decimal(cbc:TaxInclusiveAmount) * 10 * 10) div 100) = round(( xs:decimal(cbc:TaxExclusiveAmount) + xs:decimal(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount))) * 10 * 10) div 100)"/>
  <param name="BII2-T10-R054" value="cbc:AllowanceTotalAmount = (round(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;false&quot;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:AllowanceTotalAmount)"/>
  <param name="BII2-T10-R055" value="cbc:ChargeTotalAmount = (round(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;true&quot;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:ChargeTotalAmount)"/>
  <param name="BII2-T10-R056" value="not(cbc:TaxInclusiveAmount) or ((cbc:PrepaidAmount) and (number(cbc:PayableAmount) = (round( (cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or (not(cbc:PrepaidAmount) and number(cbc:PayableAmount) = number(cbc:TaxInclusiveAmount))) or ((cbc:PrepaidAmount) and (cbc:PayableRoundingAmount) and ((number(cbc:PayableAmount) -number(cbc:PayableRoundingAmount)) = (round( (cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or (number(cbc:PayableAmount) - number(cbc:PayableRoundingAmount))= number(cbc:TaxInclusiveAmount))"/>
  <param name="BII2-T10-R058" value="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) and (round(sum(cac:TaxTotal//cac:TaxSubtotal/cbc:TaxableAmount) *10 * 10) div 100 = number(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount))) or  not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']))"/>
  <param name="Payment_Means" value="//cac:PaymentMeans"/>
  <param name="VAT_category" value="//cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']"/>
  <param name="Invoice_Line" value="//cac:InvoiceLine"/>
  <param name="Invoice_Period_Information" value="//cac:InvoicePeriod"/>
  <param name="Allowance_Charge" value="/ubl:Invoice/cac:AllowanceCharge"/>
  <param name="Invoice" value="/ubl:Invoice"/>
  <param name="Total_Invoice" value="//cac:LegalMonetaryTotal"/>
</pattern>
