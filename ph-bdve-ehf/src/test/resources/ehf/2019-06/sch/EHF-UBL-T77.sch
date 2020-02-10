<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:u="utils"
        schemaVersion="iso"
        queryBinding="xslt2">

  <title>Norwegian rules for EHF Punch Out</title>

  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
       prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
       prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"
       prefix="ubl"/>

  <pattern xmlns:ns2="http://www.schematron-quickfix.com/validator/process">
      <rule context="/ubl:Catalogue">
         <assert test="cbc:UBLVersionID" flag="warning" id="EHF-T77-B00101">Element 'cbc:UBLVersionID' MUST be provided.</assert>
         <assert test="cbc:CustomizationID" flag="warning" id="EHF-T77-B00102">Element 'cbc:CustomizationID' MUST be provided.</assert>
         <assert test="cbc:ProfileID" flag="warning" id="EHF-T77-B00103">Element 'cbc:ProfileID' MUST be provided.</assert>
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B00104">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:IssueDate" flag="warning" id="EHF-T77-B00105">Element 'cbc:IssueDate' MUST be provided.</assert>
         <assert test="cbc:IssueTime" flag="warning" id="EHF-T77-B00106">Element 'cbc:IssueTime' MUST be provided.</assert>
         <assert test="cac:ProviderParty" flag="warning" id="EHF-T77-B00107">Element 'cac:ProviderParty' MUST be provided.</assert>
         <assert test="cac:CatalogueLine" flag="warning" id="EHF-T77-B00108">Element 'cac:CatalogueLine' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cbc:UBLVersionID">
         <assert test="normalize-space(text()) = '2.1'"
                 flag="warning"
                 id="EHF-T77-B00201">Element 'cbc:UBLVersionID' MUST contain value '2.1'.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cbc:CustomizationID"/>
      <rule context="/ubl:Catalogue/cbc:ProfileID"/>
      <rule context="/ubl:Catalogue/cbc:ID"/>
      <rule context="/ubl:Catalogue/cbc:ActionCode"/>
      <rule context="/ubl:Catalogue/cbc:IssueDate"/>
      <rule context="/ubl:Catalogue/cbc:IssueTime"/>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod">
         <assert test="cbc:EndDate" flag="warning" id="EHF-T77-B00901">Element 'cbc:EndDate' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate"/>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndTime"/>
      <rule context="/ubl:Catalogue/cac:ReferencedContract">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B01201">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty">
         <assert test="cbc:EndpointID" flag="warning" id="EHF-T77-B01401">Element 'cbc:EndpointID' MUST be provided.</assert>
         <assert test="cac:PartyName" flag="warning" id="EHF-T77-B01402">Element 'cac:PartyName' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cbc:EndpointID"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B01701">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T77-B02001">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:Contact">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B02201">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:Contact/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B02401">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:RequiredItemLocationQuantity"
                 flag="warning"
                 id="EHF-T77-B02402">Element 'cac:RequiredItemLocationQuantity' MUST be provided.</assert>
         <assert test="cac:Item" flag="warning" id="EHF-T77-B02403">Element 'cac:Item' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod">
         <assert test="cbc:StartDate" flag="warning" id="EHF-T77-B02701">Element 'cbc:StartDate' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartDate"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity">
         <assert test="cac:Price" flag="warning" id="EHF-T77-B02901">Element 'cac:Price' MUST be provided.</assert>
         <assert test="cac:DeliveryUnit" flag="warning" id="EHF-T77-B02902">Element 'cac:DeliveryUnit' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure">
         <assert test="@unitCode" flag="warning" id="EHF-T77-B03001">Attribute 'unitCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price">
         <assert test="cbc:PriceAmount" flag="warning" id="EHF-T77-B03201">Element 'cbc:PriceAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T77-B03301">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T77-B03501">Attribute 'unitCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit">
         <assert test="cbc:BatchQuantity" flag="warning" id="EHF-T77-B03701">Element 'cbc:BatchQuantity' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit/cbc:BatchQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T77-B03801">Attribute 'unitCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item">
         <assert test="cbc:Name" flag="warning" id="EHF-T77-B04001">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cac:CommodityClassification"
                 flag="warning"
                 id="EHF-T77-B04002">Element 'cac:CommodityClassification' MUST be provided.</assert>
         <assert test="cac:ClassifiedTaxCategory" flag="warning" id="EHF-T77-B04003">Element 'cac:ClassifiedTaxCategory' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B04301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B04601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B04901">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B05201">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment">
         <assert test="cbc:EmbeddedDocumentBinaryObject"
                 flag="warning"
                 id="EHF-T77-B05801">Element 'cbc:EmbeddedDocumentBinaryObject' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
         <assert test="@mimeCode" flag="warning" id="EHF-T77-B05901">Attribute 'mimeCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry">
         <assert test="cbc:IdentificationCode" flag="warning" id="EHF-T77-B06101">Element 'cbc:IdentificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification">
         <assert test="cbc:ItemClassificationCode"
                 flag="warning"
                 id="EHF-T77-B06401">Element 'cbc:ItemClassificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B06701">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:Percent" flag="warning" id="EHF-T77-B06702">Element 'cbc:Percent' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T77-B06703">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty">
         <assert test="cbc:Name" flag="warning" id="EHF-T77-B07301">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cbc:Value" flag="warning" id="EHF-T77-B07302">Element 'cbc:Value' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty">
         <assert test="cac:PartyName" flag="warning" id="EHF-T77-B07901">Element 'cac:PartyName' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T77-B08001">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate">
         <assert test="cbc:ID" flag="warning" id="EHF-T77-B08201">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:CertificateTypeCode" flag="warning" id="EHF-T77-B08202">Element 'cbc:CertificateTypeCode' MUST be provided.</assert>
         <assert test="cbc:CertificateType" flag="warning" id="EHF-T77-B08203">Element 'cbc:CertificateType' MUST be provided.</assert>
         <assert test="cac:IssuerParty" flag="warning" id="EHF-T77-B08204">Element 'cac:IssuerParty' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty">
         <assert test="cac:PartyName" flag="warning" id="EHF-T77-B08601">Element 'cac:PartyName' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T77-B08701">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name"/>
   </pattern>
  <pattern>
  

      <rule context="ubl:Catalogue">
         <assert id="EHF-T77-R001" test="cbc:ProfileID" flag="fatal">Punch out MUST have a profile identification.</assert>
      </rule>

      <rule context="cac:Item">
         <assert id="EHF-T77-R220" test="cac:ClassifiedTaxCategory" flag="fatal">Tax category on line level MUST exists.</assert>
      </rule>

      <rule context="cac:AdditionalItemProperty">
         <assert id="EHF-T77-R210" test="cbc:Value" flag="fatal">Additional item property MUST have a value.</assert>
      </rule>
   </pattern>

</schema>
