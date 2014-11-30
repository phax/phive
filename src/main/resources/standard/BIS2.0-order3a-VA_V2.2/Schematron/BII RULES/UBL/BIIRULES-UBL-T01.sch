<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T01 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T01" id="UBL-T01">
  <param name="BII2-T01-R001" value="(cbc:CustomizationID)"/>
  <param name="BII2-T01-R002" value="(cbc:ProfileID)"/>
  <param name="BII2-T01-R003" value="(cac:LineItem/cbc:ID)"/>
  <param name="BII2-T01-R004" value="(cbc:IssueDate)"/>
  <param name="BII2-T01-R005" value="(cac:ValidityPeriod/cbc:EndDate)"/>
  <param name="BII2-T01-R006" value="(cbc:ID)"/>
  <param name="BII2-T01-R007" value="(cbc:AllowanceChargeReason)"/>
  <param name="BII2-T01-R009" value="(cbc:DocumentCurrencyCode)"/>
  <param name="BII2-T01-R010" value="number(cac:LineItem/cbc:Quantity) &gt;= 0"/>
  <param name="BII2-T01-R011" value="number(cac:LineItem/cac:Price/cbc:PriceAmount) &gt;= 0"/>
  <param name="BII2-T01-R012" value="number(cbc:PayableAmount) &gt;= 0"/>
  <param name="BII2-T01-R013" value="number(cbc:LineExtensionAmount) &gt;= 0"/>
  <param name="BII2-T01-R014" value="number(cbc:LineExtensionAmount) = number(round(sum(/ubl:Order/cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount) * 10 * 10) div 100)"/>
  <param name="BII2-T01-R015" value="(cbc:AllowanceTotalAmount and cbc:AllowanceTotalAmount = (round(sum(/ubl:Order/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;false&quot;]/cbc:Amount) * 10 * 10) div 100)) or not(cbc:AllowanceTotalAmount)"/>
  <param name="BII2-T01-R016" value="(cbc:ChargeTotalAmount and cbc:ChargeTotalAmount = (round(sum(/ubl:Order/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;true&quot;]/cbc:Amount) * 10 * 10) div 100)) or not(cbc:ChargeTotalAmount)"/>
  <param name="BII2-T01-R017" value="(/ubl:Order/cac:TaxTotal/cbc:TaxAmount) and ((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:PayableAmount) = (number(cbc:LineExtensionAmount) + number(/ubl:Order/cac:TaxTotal/cbc:TaxAmount) + number(cbc:ChargeTotalAmount) - number(cbc:AllowanceTotalAmount)))) or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:PayableAmount) = number(cbc:LineExtensionAmount) + number(/ubl:Order/cac:TaxTotal/cbc:TaxAmount)  - number(cbc:AllowanceTotalAmount))) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:PayableAmount) = number(cbc:LineExtensionAmount) + number(/ubl:Order/cac:TaxTotal/cbc:TaxAmount)  + number(cbc:ChargeTotalAmount))) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:PayableAmount) = number(cbc:LineExtensionAmount) + number(/ubl:Order/cac:TaxTotal/cbc:TaxAmount))) or not(/ubl:Order/cac:TaxTotal/cbc:TaxAmount) and ((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and  (number(cbc:PayableAmount) = (number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount) - number(cbc:AllowanceTotalAmount)))) or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:PayableAmount) = number(cbc:LineExtensionAmount)  - number(cbc:AllowanceTotalAmount))) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:PayableAmount) = number(cbc:LineExtensionAmount)  + number(cbc:ChargeTotalAmount))) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:PayableAmount) = number(cbc:LineExtensionAmount)))"/>
  <param name="BII2-T01-R018" value="(cac:TaxTotal and cac:TaxTotal/cbc:TaxAmount = (round(sum(/ubl:Order/cac:OrderLine/cac:LineItem/cbc:TotalTaxAmount) * 10 * 10) div 100)) or not(/ubl:Order/cac:OrderLine/cac:LineItem/cbc:TotalTaxAmount)"/>
  <param name="BII2-T01-R019" value="(cbc:Name)"/>
  <param name="BII2-T01-R020" value="(cbc:Value)"/>
  <param name="BII2-T01-R021" value="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T01-R022" value="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T01-R023" value="(cac:Party/cac:PostalAddress/cbc:StreetName) and (cac:Party/cac:PostalAddress/cbc:CityName) and (cac:Party/cac:PostalAddress/cbc:PostalZone) and (cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode)  "/>
  <param name="BII2-T01-R024" value="(cac:Party/cac:PostalAddress/cbc:StreetName) and (cac:Party/cac:PostalAddress/cbc:CityName) and (cac:Party/cac:PostalAddress/cbc:PostalZone) and (cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode)  "/>
  <param name="BII2-T01-R025" value="(cbc:ID) or ((cbc:CityName) and (cbc:PostalZone) and (cac:Country/cbc:IdentificationCode))"/>
  <param name="BII2-T01-R026" value="(cac:StandardItemIdentification/cbc:ID/@schemeID) or not(cac:StandardItemIdentification)"/>
  <param name="BII2-T01-R027" value="(cac:CommodityClassification/cbc:ItemClassificationCode/@listID)"/>
  <param name="BII2-T01-R029" value="(cac:LineItem/cbc:Quantity)"/>
  <param name="BII2-T01-R030" value="(cac:LineItem/cbc:Quantity/@unitCode)"/>
  <param name="BII2-T01-R031" value="(cac:LineItem/cac:Item/cbc:Name) or (cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID) or  (cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID)"/>
  <param name="Order_Line" value="//cac:OrderLine"/>
  <param name="Order" value="/ubl:Order"/>
  <param name="Allowance_Charges" value="//cac:AllowanceCharge"/>
  <param name="Expected_totals" value="//cac:AnticipatedMonetaryTotal"/>
  <param name="Item_property" value="//cac:AdditionalItemProperty"/>
  <param name="Seller" value="//cac:SellerSupplierParty"/>
  <param name="Buyer" value="//cac:BuyerCustomerParty"/>
  <param name="Delivery_Address" value="//cac:DeliveryLocation/cac:Address"/>
  <param name="Item" value="//cac:Item"/>
</pattern>
