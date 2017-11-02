<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T77" id="UBL-T77">
	<param name="BII3-T77-R001" value="(cbc:CustomizationID)"/>
	<param name="BII3-T77-R002" value="(cbc:ProfileID)"/>
	<param name="BII3-T77-R003" value="(cbc:IssueDate)"/>
	<param name="BII3-T77-R004" value="(cbc:IssueTime)"/>
	<param name="BII3-T77-R005" value="(cbc:ID)"/>
	<param name="BII3-T77-R009" value="(cbc:ID)"/>
	<param name="BII3-T77-R010" value="number(cac:RequiredItemLocationQuantity/cac:DeliveryUnit/cbc:BatchQuantity)&gt;=0"/>
	<param name="BII3-T77-R011" value="number(cbc:PriceAmount) &gt;=0"/>
	<param name="BII3-T77-R012" value="(cac:SellersItemIdentification) or (cac:StandardItemIdentification)"/>
	<param name="BII3-T77-R013" value="(cbc:Name)"/>
	<param name="BII3-T77-R015" value="count(cac:ClassifiedTaxCategory)=1"/>
	<param name="BII3-T77-R016" value="(cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount/@currencyID)"/>
	<param name="BII3-T77-R017" value="count(cac:ValidityPeriod/cbc:EndDate) &lt;= 1"/>
	<param name="BII3-T77-R018" value="count(cac:PartyName/cbc:Name) = 1"/>
	<param name="BII3-T77-R019" value="count(cac:PartyIdentification) = 1"/>
	<param name="BII3-T77-R020" value="count(cac:PartyName/cbc:Name) = 1"/>
	<param name="BII3-T77-R021" value="count(cac:RequiredItemLocationQuantity/cac:DeliveryUnit/cbc:BatchQuantity) = 1"/>
	<param name="BII3-T77-R022" value="count(cac:ComponentRelatedItem/cbc:ID) &lt;= 1"/>
	<param name="BII3-T77-R023" value="count(cbc:Description) &lt;= 1"/>
	<param name="BII3-T77-R024" value="count(cac:ManufacturersItemIdentification/cbc:ID) &lt;= 1"/>
	<param name="BII3-T77-R025" value="count(cac:ItemSpecificationDocumentReference) &lt;= 1"/>
	<param name="BII3-T77-R026" value="count(cac:ItemSpecificationDocumentReference/cbc:DocumentDescription) &lt;= 1"/>
	<param name="BII3-T77-R027" value="count(cac:ManufacturerParty/cac:PartyName/cbc:Name) &lt;= 1"/>
	<param name="BII3-T77-R028" value="count(cac:ClassifiedTaxCategory/cbc:ID) = 1"/>
	<param name="BII3-T77-R029" value="count(cac:ClassifiedTaxCategory/cbc:Percent) = 1"/>
	<param name="BII3-T77-R030" value="count(cbc:CommodityClassification) &lt;= 1"/>
	<param name="BII3-T77-R031" value="(@listID)"/>
	<param name="Catalogue_Provider" value="//cac:ProviderParty"/>
	<param name="Catalogue_Receiver" value="//cac:ReceiverParty"/>
	<param name="Catalogue_Line" value="//cac:CatalogueLine"/>
	<param name="Catalogue" value="/ubl:Catalogue"/>
	<param name="Item_Price" value="//cac:RequiredItemLocationQuantity/cac:Price"/>
	<param name="Item_Commodity" value="//cac:CommodityClassification/cbc:ItemClassificationCode"/>
	<param name="Item" value="//cac:Item"/>
</pattern>