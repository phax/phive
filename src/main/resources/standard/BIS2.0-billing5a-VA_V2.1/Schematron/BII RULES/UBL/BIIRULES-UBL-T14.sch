<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T14 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T14" id="UBL-T14">
  <param name="BII2-T14-R001" value="(cbc:CustomizationID)"/>
  <param name="BII2-T14-R002" value="(cbc:ProfileID)"/>
  <param name="BII2-T14-R003" value="(cbc:ID)"/>
  <param name="BII2-T14-R004" value="(cbc:IssueDate)"/>
  <param name="BII2-T14-R005" value="(cbc:DocumentCurrencyCode)"/>
  <param name="BII2-T14-R006" value="(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T14-R008" value="(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T14-R010" value="(cac:LegalMonetaryTotal/cbc:LineExtensionAmount)"/>
  <param name="BII2-T14-R011" value="(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)"/>
  <param name="BII2-T14-R012" value="(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount)"/>
  <param name="BII2-T14-R013" value="(cac:LegalMonetaryTotal/cbc:PayableAmount)"/>
  <param name="BII2-T14-R014" value="(cac:CreditNoteLine)"/>
  <param name="BII2-T14-R015" value="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) or not(cac:CreditNoteLine/cac:TaxTotal)"/>
  <param name="BII2-T14-R017" value="(cbc:ID)"/>
  <param name="BII2-T14-R018" value="(cbc:CreditedQuantity)"/>
  <param name="BII2-T14-R019" value="(cbc:CreditedQuantity/@unitCode)"/>
  <param name="BII2-T14-R020" value="(cbc:LineExtensionAmount)"/>
  <param name="BII2-T14-R021" value="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or  (cac:Item/cac:SellersItemIdentification/cbc:ID)"/>
  <param name="BII2-T14-R023" value="(cbc:StartDate)"/>
  <param name="BII2-T14-R024" value="(cbc:EndDate)"/>
  <param name="BII2-T14-R025" value="(cbc:AllowanceChargeReason)"/>
  <param name="BII2-T14-R026" value="(//cac:TaxScheme/cbc:ID = 'VAT') or not(/ubl:CreditNote/cac:TaxTotal/cbc:TaxAmount)"/>
  <param name="BII2-T14-R027" value="(cbc:TaxableAmount)"/>
  <param name="BII2-T14-R028" value="(cbc:TaxAmount)"/>
  <param name="BII2-T14-R029" value="(cac:TaxCategory/cbc:ID)"/>
  <param name="BII2-T14-R030" value="(cac:TaxCategory/cbc:Percent) or not(cac:TaxCategory/cbc:ID = 'S')"/>
  <param name="BII2-T14-R031" value="(cbc:StartDate and cbc:EndDate) and (number(translate(cbc:StartDate,'-','')) &lt;= number(translate(cbc:EndDate,'-','')))"/>
  <param name="BII2-T14-R032" value="(cac:StandardItemIdentification/cbc:ID/@schemeID) or not(cac:StandardItemIdentification)"/>
  <param name="BII2-T14-R033" value="(cbc:ItemClassificationCode/@listID)"/>
  <param name="BII2-T14-R034" value="number(cac:Price/cbc:PriceAmount) &gt;= 0"/>
  <param name="BII2-T14-R035" value="number(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount) &gt;= 0"/>
  <param name="BII2-T14-R037" value="number(cac:LegalMonetaryTotal/cbc:PayableAmount) &gt;= 0"/>
  <param name="BII2-T14-R043" value="(/ubl:CreditNote/cac:TaxTotal/*/*/*/cbc:ID = 'VAT') and (cac:TaxCategory/cbc:ID)"/>
  <param name="BII2-T14-R044" value="(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/*/cbc:ID = 'VAT')"/>
  <param name="BII2-T14-R045" value="(cac:TaxCategory/cbc:TaxExemptionReason) or not ((cac:TaxCategory/cbc:ID='E') or (cac:TaxCategory/cbc:ID='AE'))"/>
  <param name="BII2-T14-R046" value="(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) or not(/ubl:CreditNote/cac:TaxTotal/*/*/*/cbc:ID='VAT')"/>
  <param name="BII2-T14-R047" value="(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/cbc:ID = 'AE')"/>
  <param name="BII2-T14-R048" value="count(child::cac:TaxTotal/*/*/cbc:ID) = count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) or count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) = 0"/>
  <param name="BII2-T14-R049" value="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount = (cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount)"/>
  <param name="BII2-T14-R050" value="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount = 0) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount)"/>
  <param name="BII2-T14-R051" value="number(cbc:LineExtensionAmount) = number(round(sum(//cac:CreditNoteLine/cbc:LineExtensionAmount) * 10 * 10) div 100)"/>
  <param name="BII2-T14-R052" value="((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 ))  or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = number(cbc:LineExtensionAmount)))"/>
  <param name="BII2-T14-R053" value="((cbc:PayableRoundingAmount) and (number(cbc:TaxInclusiveAmount) = (round((number(cbc:TaxExclusiveAmount) + number(sum(/ubl:CreditNote/cac:TaxTotal/cbc:TaxAmount)) + number(cbc:PayableRoundingAmount)) *10 * 10) div 100))) or (number(cbc:TaxInclusiveAmount) = round(( number(cbc:TaxExclusiveAmount) + number(sum(/ubl:CreditNote/cac:TaxTotal/cbc:TaxAmount))) * 10 * 10) div 100)"/>
  <param name="BII2-T14-R054" value="cbc:AllowanceTotalAmount = (round(sum(/ubl:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;false&quot;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:AllowanceTotalAmount)"/>
  <param name="BII2-T14-R055" value="cbc:ChargeTotalAmount = (round(sum(/ubl:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;true&quot;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:ChargeTotalAmount)"/>
  <param name="BII2-T14-R056" value="((cbc:PrepaidAmount) and (number(cbc:PayableAmount) = (round((cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or number(cbc:PayableAmount) = number(cbc:TaxInclusiveAmount)) or ((cbc:PrepaidAmount) and (cbc:PayableRoundingAmount) and ((number(cbc:PayableAmount) -number(cbc:PayableRoundingAmount)) = (round((cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or (number(cbc:PayableAmount) - number(cbc:PayableRoundingAmount))= number(cbc:TaxInclusiveAmount))"/>
  <param name="BII2-T14-R058" value="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) and (round(sum(cac:TaxTotal//cac:TaxSubtotal/cbc:TaxableAmount) *10 * 10) div 100 = number(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount))) or  not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']))"/>
  <param name="Payment_Means" value="//cac:PaymentMeans"/>
  <param name="VAT_category" value="//cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']"/>
  <param name="Credit_Note_Line" value="//cac:CreditNoteLine"/>
  <param name="Credit_Note_Period_Information" value="//cac:InvoicePeriod"/>
  <param name="Allowance_Charge" value="/ubl:CreditNote/cac:AllowanceCharge"/>
  <param name="Credit_Note" value="/ubl:CreditNote"/>
  <param name="Total_Credit_Note" value="//cac:LegalMonetaryTotal"/>
</pattern>
