<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T01 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T01" id="UBL-T01">
  <param name="EUGEN-T01-R011" value="@schemeID"/>
  <param name="EUGEN-T01-R012" value="@schemeID"/>
  <param name="EUGEN-T01-R013" value="@listID='UNCL1001' or @listID='UNCLD1001' "/>
  <param name="EUGEN-T01-R014" value="@listID='ISO4217'"/>
  <param name="EUGEN-T01-R015" value="@listID = 'ISO3166-1:Alpha2'"/>
  <param name="EUGEN-T01-R016" value="not(attribute::unitCode) or (attribute::unitCode and attribute::unitCodeListID = 'UNECERec20')"/>
  <param name="EUGEN-T01-R017" value="@schemeID  = 'UNCL5305'"/>
  <param name="Order_Line" value="//cac:OrderLine"/>
  <param name="Order_Type" value="//cbc:OrderTypeCode"/>
  <param name="Order" value="/ubl:Order"/>
  <param name="Allowance_Charges" value="//cac:AllowanceCharge"/>
  <param name="Expected_totals" value="//cac:AnticipatedMonetaryTotal"/>
  <param name="Item_property" value="//cac:AdditionalItemProperty"/>
  <param name="Seller" value="//cac:SellerSupplierParty"/>
  <param name="Buyer" value="//cac:BuyerCustomerParty"/>
  <param name="Delivery_Address" value="//cac:DeliveryLocation"/>
  <param name="Item" value="//cac:Item"/>
  <param name="Endpoint" value="//cbc:EndpointID"/>
  <param name="Party_Identifier" value="//cac:PartyIdentification/cbc:ID"/>
  <param name="Document_Currency" value="//cbc:DocumentCurrencyCode"/>
  <param name="Country_identification" value="//cac:Country/cbc:IdentificationCode"/>
  <param name="Unit_Code" value="//*[contains(name(),'Quantity')]"/>
  <param name="Tax_Category_Identifier" value="//cac:ClassifiedTaxCategory/cbc:ID"/>
</pattern>
