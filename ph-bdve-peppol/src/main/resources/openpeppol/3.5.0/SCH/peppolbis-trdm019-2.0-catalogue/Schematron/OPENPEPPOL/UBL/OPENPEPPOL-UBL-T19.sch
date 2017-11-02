<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T19 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T19" id="UBL-T19">
  <param name="EUGEN-T19-R043" value="@schemeID"/>
  <param name="EUGEN-T19-R044" value="@schemeID"/>
  <param name="EUGEN-T19-R045" value="@listID = 'ACTIONCODE:BII2'"/>
  <param name="EUGEN-T19-R046" value="@listID = 'ACTIONCODE:PEPPOL'"/>
  <param name="EUGEN-T19-R047" value="@listID = 'ISO3166-1:Alpha2'"/>
  <param name="EUGEN-T19-R048" value="not(attribute::unitCode) or (attribute::unitCode and attribute::unitCodeListID = 'UNECERec20')"/>
  <param name="EUGEN-T19-R049" value="@schemeID  = 'UNCL5305'"/>
  <param name="EUGEN-T19-R050" value="@listID = 'GS17009:PEPPOL'"/>
  <param name="EUGEN-T19-R051" value="@listID = 'UNCL8273'"/>
  <param name="EUGEN-T19-R053" value="@schemeID  = 'UNCL6313'"/>
  <param name="EUGEN-T19-R054" value="not(count(//*[not(node()[not(self::comment())])]) &gt; 0)"/>
  <param name="EUGEN-T19-R055" value="count(parent::cac:Item/cbc:Description[(@languageID = current()/@languageID) or not(@languageID)]) = 1"/>
  <param name="Endpoint" value="//cbc:EndpointID"/>
  <param name="Party_Identifier" value="//cac:PartyIdentification/cbc:ID"/>
  <param name="Line_level_action_code" value="//cac:CatalogueLine/cbc:ActionCode"/>
  <param name="Header_level_action_code" value="/ubl:Catalogue/cbc:ActionCode"/>
  <param name="Country_Identification_Code" value="//cac:Country/cbc:IdentificationCode"/>
  <param name="Unit_Code" value="//*[contains(name(),'Quantity')]"/>
  <param name="Classified_Tax_Category_Identifier" value="//cac:ClassifiedTaxCategory/cbc:ID"/>
  <param name="Package_Level_Code" value="//cbc:PackageLevelCode"/>
  <param name="UNDG_Code" value="//cbc:UNDGCode"/>
  <param name="Attribute_identifier_scheme" value="//cbc:AttributeID"/>
  <param name="catalogue" value="/ubl:Catalogue"/>
  <param name="Item_Description" value ="//cac:CatalogueLine/cac:Item/cbc:Description"/>
</pattern>
