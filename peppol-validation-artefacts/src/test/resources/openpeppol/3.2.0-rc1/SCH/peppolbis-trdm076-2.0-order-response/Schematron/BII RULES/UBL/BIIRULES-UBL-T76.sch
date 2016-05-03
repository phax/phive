<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T76 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T76" id="UBL-T76">
  <param name="BII2-T76-R001" value="(cbc:CustomizationID)"/>
  <param name="BII2-T76-R002" value="(cbc:ProfileID)"/>
  <param name="BII2-T76-R003" value="(cac:LineItem/cbc:ID)"/>
  <param name="BII2-T76-R004" value="(cbc:IssueDate)"/>
  <param name="BII2-T76-R006" value="(cbc:ID)"/>
  <param name="BII2-T76-R021" value="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T76-R022" value="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T76-R032" value="(cac:OrderReference/cbc:ID)"/>
  <param name="BII2-T76-R033" value="(//cbc:OrderResponseCode)"/>
  <param name="BII2-T76-R034" value="(//cac:OrderLineReference/cbc:LineID)"/>
  <param name="order_response_line" value="//cac:OrderLine"/>
  <param name="order_response" value="/ubl:OrderResponse"/>
  <param name="Buyer" value="//cac:BuyerCustomerParty"/>
  <param name="Seller" value="//cac:SellerSupplierParty"/>
</pattern>
