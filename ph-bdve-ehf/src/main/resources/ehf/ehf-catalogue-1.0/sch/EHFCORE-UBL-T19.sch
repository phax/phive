<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso">
  <title>Schema for EHF Katalog; 1.0; 2</title>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" prefix="ext"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" prefix="qdt"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" prefix="ccts-cct"/>
  <ns uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
  <pattern>
    <rule context="/p1:Catalogue">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:UBLVersionID)=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:CustomizationID)=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:ProfileID)=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:ValidityPeriod)=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:ReferencedContract)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:WarrantyInformation)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComplementaryRelatedItem">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ContractorCustomerParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:ManufacturerParty)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:ItemInstance)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:Value)=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:ValueQualifier)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ListValue">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:BuyersItemIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CatalogueDocumentReference">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CatalogueItemIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:Attachment">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentDescription">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentType">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:DocumentTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:Contact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:Language">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:Person">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:Signature">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:Remarks[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:NatureCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Description[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:AdditionalTemperature">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:ContactParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:EmergencyTemperature">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:FlashpointTemperature">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:HazardousGoodsTransit">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cac:SecondaryHazard">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:AdditionalInformation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:CategoryName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:EmergencyProceduresCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardousCategoryCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:LowerOrangeHazardPlacardID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:MarkingID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:MedicalFirstAidGuideCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:NetVolumeMeasure">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:NetWeightMeasure">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:PlacardEndorsement">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:PlacardNotation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:TechnicalName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UpperOrangeHazardPlacardID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:InformationContentProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cac:AdditionalItemProperty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:ExpiryDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:ManufactureDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:ManufactureTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:ProductTraceID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:RegistrationID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:SerialID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:DocumentDescription)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:ResultOfVerification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:CopyIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentStatusCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentType">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:LanguageID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:LocaleCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:XPath">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:Contact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:Language">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:Person">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginAddress">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:AdditionalInformation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:BrandName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:BrandName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:CatalogueIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:HazardousRiskIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:Keyword[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:ModelName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackSizeNumeric[@format]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:KeywordItemProperty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:ReplacementRelatedItem">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTaxCategory">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DependentPriceReference">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Package">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:AllowanceCharge">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PriceList">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:PricingExchangeRate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:OrderableUnitFactorRate[@format]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceChangeReason">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:HazardousRiskIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:TradingRestrictions">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:SellerSupplierParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:WarrantyParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cac:WarrantyValidityPeriod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ActionCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:LifeCycleStatusCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCode">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="@unitCodeListID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity[@unitCodeListAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity[@unitCodeListAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:Note">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:OrderQuantityIncrementNumeric[@format]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:OrderableUnit[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:OrderableUnit[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:PackLevelCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:CatalogueLine/cbc:WarrantyInformation[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:BuyerContact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:DeliveryContact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PostalAddress">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ContractorCustomerParty/cbc:SupplierAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:DocumentReference">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:Contact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:Language">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:HeadParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:ShareholderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:Person">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ProviderParty/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:Contact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:Language">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:HeadParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:ShareholderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CorporateStockAmount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:Person">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReceiverParty/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cbc:ID)=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cac:ContractDocumentReference">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cac:ContractualDelivery">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cac:NominationPeriod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cac:ValidityPeriod">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ContractTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ContractType[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ContractType[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:NominationDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:NominationTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:Note">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ReferencedContract/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:AccountingContact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:DespatchContact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party">
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyIdentification)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
      <assert flag="warning" id="EHFCORE_T19_R002" test="count(cac:PartyName)&lt;=1">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:AgentParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Language">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Person">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Department">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:ID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@schemeID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cac:SellerContact">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cbc:AdditionalAccountID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SellerSupplierParty/cbc:DataSendingCapability">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:Signature">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:IssueDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:Note">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:PreviousVersionID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:RevisionDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:RevisionTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:SourceCatalogueReference/cbc:VersionID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:TradingTerms/cac:ApplicableAddress">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:TradingTerms/cbc:Information[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:TradingTerms/cbc:Reference">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:DescriptionCode">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:DurationMeasure">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:EndTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cac:ValidityPeriod/cbc:StartTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode">
      <assert flag="warning" id="EHFCORE_T19_R002" test="@listID">[EHFCORE-T19-R002]-Cardinality SHOULD be according to EHF specifications.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@languageID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@listAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@listAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@listName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@listSchemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@listURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@listVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ActionCode[@name]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:CustomizationID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:Description">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:IssueTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:LineCountNumeric">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:Name[@languageLocaleID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:Note">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:PreviousVersionID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileExecutionID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:ProfileID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:RevisionDate">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:RevisionTime">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UBLVersionID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:UUID">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:VersionID[@schemeAgencyID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:VersionID[@schemeAgencyName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:VersionID[@schemeDataURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:VersionID[@schemeID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:VersionID[@schemeName]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:VersionID[@schemeURI]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/cbc:VersionID[@schemeVersionID]">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:Catalogue/ext:UBLExtensions">
      <assert flag="warning" id="EHFCORE_T19_R001" test="true()">[EHFCORE-T19-R001]-Elements used SHOULD be according to EHF specifications</assert>
    </rule>
  </pattern>
</schema>
