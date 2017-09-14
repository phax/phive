<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T16 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T16" id="UBL-T16">
  <param name="BII2-T16-R001" value="(cbc:CustomizationID)"/>
  <param name="BII2-T16-R002" value="(cbc:ProfileID)"/>
  <param name="BII2-T16-R003" value="(cbc:ID)"/>
  <param name="BII2-T16-R004" value="(cbc:IssueDate)"/>
  <param name="BII2-T16-R005" value="(cac:OrderReference/cbc:ID)"/>
  <param name="BII2-T16-R006" value="(cac:DespatchSupplierParty)"/>
  <param name="BII2-T16-R007" value="(cac:Party/cac:PartyName/cbc:Name)"/>
  <param name="BII2-T16-R008" value="(cac:DeliveryCustomerParty)"/>
  <param name="BII2-T16-R009" value="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T16-R011" value="(cbc:ID)"/>
  <param name="BII2-T16-R012" value="(cac:DespatchLine)"/>
  <param name="BII2-T16-R013" value="(cbc:ID)"/>
  <param name="BII2-T16-R016" value="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or  (cac:Item/cac:SellersItemIdentification/cbc:ID)"/>
  <param name="BII2-T16-R017" value="(cbc:DeliveredQuantity)"/>
  <param name="BII2-T16-R018" value="(//cac:StandardItemIdentification/cbc:ID/@schemeID) or not(//cac:StandardItemIdentification)"/>
  <param name="BII2-T16-R019" value="(cbc:DeliveredQuantity) &gt;= 0"/>
  <param name="BII2-T16-R020" value="(cbc:DeliveredQuantity/@unitCode)"/>
  <param name="BII2-T16-R021" value="((cbc:OutstandingQuantity) and (cbc:OutstandingReason)) or not(cbc:OutstandingQuantity)"/>
  <param name="despatching_Party" value="//cac:DespatchSupplierParty"/>
  <param name="Consignee_Party" value="//cac:DeliveryCustomerParty"/>
  <param name="despatch_delivery_address" value="//cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress"/>
  <param name="despatched_shipment" value="//cac:Shipment"/>
  <param name="despatch_advice_Line" value="//cac:DespatchLine"/>
  <param name="Item" value="//cac:Item"/>
  <param name="despatch_advice" value="/ubl:DespatchAdvice"/>
</pattern>
