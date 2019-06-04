<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:u="utils"
        schemaVersion="iso"
        queryBinding="xslt2">

   <title>Norwegian rules for EHF Catalogue</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
       prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
       prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"
       prefix="ubl"/>
   <ns prefix="xs"   uri="http://www.w3.org/2001/XMLSchema"/>

   <pattern xmlns:ns2="http://www.schematron-quickfix.com/validator/process">
      <rule context="/ubl:Catalogue">
         <assert test="cbc:UBLVersionID" flag="warning" id="EHF-T19-B00101">Element 'cbc:UBLVersionID' MUST be provided.</assert>
         <assert test="cbc:CustomizationID" flag="warning" id="EHF-T19-B00102">Element 'cbc:CustomizationID' MUST be provided.</assert>
         <assert test="cbc:ProfileID" flag="warning" id="EHF-T19-B00103">Element 'cbc:ProfileID' MUST be provided.</assert>
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B00104">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:IssueDate" flag="warning" id="EHF-T19-B00105">Element 'cbc:IssueDate' MUST be provided.</assert>
         <assert test="cac:ValidityPeriod" flag="warning" id="EHF-T19-B00106">Element 'cac:ValidityPeriod' MUST be provided.</assert>
         <assert test="cac:ProviderParty" flag="warning" id="EHF-T19-B00107">Element 'cac:ProviderParty' MUST be provided.</assert>
         <assert test="cac:ReceiverParty" flag="warning" id="EHF-T19-B00108">Element 'cac:ReceiverParty' MUST be provided.</assert>
         <assert test="cac:CatalogueLine" flag="warning" id="EHF-T19-B00109">Element 'cac:CatalogueLine' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cbc:UBLVersionID">
         <assert test="normalize-space(text()) = '2.1'"
                 flag="warning"
                 id="EHF-T19-B00201">Element 'cbc:UBLVersionID' MUST contain value '2.1'.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cbc:CustomizationID"/>
      <rule context="/ubl:Catalogue/cbc:ProfileID"/>
      <rule context="/ubl:Catalogue/cbc:ID"/>
      <rule context="/ubl:Catalogue/cbc:ActionCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B00601">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cbc:Name"/>
      <rule context="/ubl:Catalogue/cbc:IssueDate"/>
      <rule context="/ubl:Catalogue/cbc:VersionID"/>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod"/>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:StartDate"/>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate"/>
      <rule context="/ubl:Catalogue/cac:ReferencedContract">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B01501">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:IssueDate"/>
      <rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:ContractType"/>
      <rule context="/ubl:Catalogue/cac:SourceCatalogueReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B01901">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:SourceCatalogueReference/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B02301">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B02501">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B02601">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T19-B02801">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B03701">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B04101">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"/>
      <rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B04601">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReceiverParty"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B04901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B05101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B05201">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T19-B05401">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B06301">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B06701">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"/>
      <rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B07201">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B07601">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B07801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B07901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T19-B08101">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B09001">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax"/>
      <rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B09901">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B10101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B10201">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T19-B10401">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telephone"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telefax"/>
      <rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      <rule context="/ubl:Catalogue/cbc:TradingTermsType"/>
      <rule context="/ubl:Catalogue/cbc:TradingTermsType/cbc:Information"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B11501">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:Item" flag="warning" id="EHF-T19-B11502">Element 'cac:Item' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ActionCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B11701">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderableIndicator"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderableUnit"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B12201">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B12202">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderQuantityIncrementNumeric"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B12601">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B12602">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B12901">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B12902">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:WarrantyInformation"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:PackLevelCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B13401">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartDate"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:EndDate"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:PriceAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T19-B14001">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B14201">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B14202">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B14701">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B14702">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B15201">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B15202">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B15701">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B15702">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B16201">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B16202">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B16601">Attribute 'unitCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B16801">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B16802">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B17101">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B17102">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:StreetName"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AdditionalStreetName"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CityName"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PostalZone"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentity"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B18101">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price">
         <assert test="cbc:PriceAmount" flag="warning" id="EHF-T19-B18301">Element 'cbc:PriceAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T19-B18401">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B18601">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B18602">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:OrderableUnitFactorRate"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:StartDate"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:EndDate"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B19701">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B19702">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackSizeNumeric"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Keyword"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:BrandName"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellerItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B20601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellerItemIdentification/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B20801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B21001">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B21301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
         <assert test="@mimeCode" flag="warning" id="EHF-T19-B22001">Attribute 'mimeCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B22501">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B22801">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode">
         <assert test="@listID" flag="warning" id="EHF-T19-B23601">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory">
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T19-B23901">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B24001">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty">
         <assert test="cbc:Name" flag="warning" id="EHF-T19-B24501">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cbc:Value" flag="warning" id="EHF-T19-B24502">Element 'cbc:Value' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B25001">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T19-B25002">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:BestBeforeDate"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B26101">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:CertificateTypeCode" flag="warning" id="EHF-T19-B26102">Element 'cbc:CertificateTypeCode' MUST be provided.</assert>
         <assert test="cbc:CertificateType" flag="warning" id="EHF-T19-B26103">Element 'cbc:CertificateType' MUST be provided.</assert>
         <assert test="cac:IssuerParty" flag="warning" id="EHF-T19-B26104">Element 'cac:IssuerParty' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:Remarks"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T19-B26901">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T19-B27101">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension">
         <assert test="cbc:AttributeID" flag="warning" id="EHF-T19-B27301">Element 'cbc:AttributeID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID">
         <assert test="@schemeID" flag="warning" id="EHF-T19-B27401">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Measure">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B27601">Attribute 'unitCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Description"/>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MinimumMeasure">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B28001">Attribute 'unitCode' MUST be present.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MaximumMeasure">
         <assert test="@unitCode" flag="warning" id="EHF-T19-B28201">Attribute 'unitCode' MUST be present.</assert>
      </rule>
   </pattern>
   <pattern>
      <rule context="/ubl:Catalogue">
         <assert id="NOGOV-T19-R001"
                 test="cbc:ActionCode or count(cac:CatalogueLine/cbc:ActionCode) = count(cac:CatalogueLine)"
                 flag="fatal">[NOGOV-T19-R001]-A Catalogue must contain ActionCode on either Header or Line level</assert>
         <assert id="NOGOV-T19-R002"
                 test="not(cac:ValidityPeriod/cbc:EndDate) or current-date() &lt;= xs:date(cac:ValidityPeriod/cbc:EndDate)"
                 flag="fatal">[NOGOV-T19-R002]-A Catalogue must have a validity period enddate grater or equal to the current date</assert>
         <assert id="NOGOV-T19-R008" test="cac:ValidityPeriod" flag="fatal">[NOGOV-T19-R008]-A cataloge MUST have a validity period.</assert>
         <assert id="NOGOV-T19-R012" test="cbc:VersionID" flag="warning">[NOGOV-T19-R012]-A catalogue should have a catalogue version.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod">
         <assert id="NOGOV-T19-R009" test="cbc:StartDate" flag="fatal">[NOGOV-T19-R009]-A catalogue MUST have a validity start date.</assert>
      </rule>
      <rule context="cac:ReceiverParty">
         <assert id="NOGOV-T19-R010" test="cbc:EndpointID" flag="fatal">[NOGOV-T19-R010]-A catalogue MUST have an endpoint ID for receiver.</assert>
      </rule>
      <rule context="cac:SellerSupplierParty/cac:Party">
         <assert id="NOGOV-T19-R013" test="cbc:EndpointID" flag="warning">[NOGOV-T19-R013]-A catalogue should have an endpoint ID for seller.</assert>
      </rule>
      <rule context="cac:TaxScheme">
         <assert id="NOGOV-T19-R011" test="cbc:ID" flag="fatal">[NOGOV-T19-R011]-Every tax scheme MUST be defined through an identifier.</assert>
      </rule>
      <rule context="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]">
         <assert id="NOGOV-T19-R024" test="@schemeID = 'NO:ORGNR'" flag="fatal">[NOGOV-T19-R024]-CompanyID for legal entity qualifier must have value 'NO:ORGNR' when provided.</assert>
      </rule>
      <rule context="cac:CatalogueLine">
         <assert id="NOGOV-T19-R003" test="cbc:OrderableIndicator" flag="fatal">[NOGOV-T19-R003]-A Catalogue line MUST have an orderable indicator</assert>
         <assert id="NOGOV-T19-R004" test="cac:Item" flag="fatal">[NOGOV-T19-R004]-A Catalogue line MUST have item/article information</assert>
      </rule>
      <rule context="cac:CatalogueLine/cac:Item">
         <assert id="NOGOV-T19-R005" test="cbc:Name" flag="fatal">[NOGOV-T19-R005]-A Catalogue item MUST have a name</assert>
      </rule>
      <rule context="cbc:ProfileID">
         <assert id="EHFPROFILE-T19-R001"
                 test=". = 'urn:www.cenbii.eu:profile:bii01:ver2.0'"
                 flag="fatal">[EHFPROFILE-T19-R001]-A catalogue must only be used in profile 1</assert>
      </rule>
      <rule context="cbc:DocumentTypeCode[@listID='urn:gs1:gdd:cl:ReferencedFileTypeCode']">
         <assert id="NOGOV-T19-R020"
                 test="some $code in tokenize('360_DEGREE_IMAGE ASSEMBLY_INSTRUCTIONS AUDIO CERTIFICATION CHEMICAL_ASSESSMENT_SUMMARY CHEMICAL_SAFETY_REPORT CHILD_NUTRITION_LABEL CONSUMER_HANDLING_AND_STORAGE CROSSSECTION_VIEW DIET_CERTIFICATE DOCUMENT DOP_SHEET DRUG_FACT_LABEL ENERGY_LABEL GROUP_CHARACTERISTIC_SHEET HAZARDOUS_SUBSTANCES_DATA IFU INTERNAL_VIEW LOGO MARKETING_INFORMATION MATERIAL_SAMPLES MOBILE_DEVICE_IMAGE NUTRITION_FACT_LABEL ORGANIC_CERTIFICATE OTHER_EXTERNAL_INFORMATION OUT_OF_PACKAGE_IMAGE PACKAGING_ARTWORK PLANOGRAM PRODUCT_FORMULATION_STATEMENT PRODUCT_IMAGE PRODUCT_LABEL_IMAGE PRODUCT_WEBSITE QR_CODE QUALITY_CONTROL_PLAN RECIPE_WEBSITE REGULATORY_INSPECTION_AUDIT RISK_ANALYSIS_DOCUMENT SAFETY_DATA_SHEET SAFETY_SUMMARY_SHEET SAMPLE_SHIPPING_ORDER SUMMARY_OF_PRODUCT_CHARACTERISTICS TESTING_METHODOLOGY_RESULTS TRADE_ITEM_DESCRIPTION TRADE_ITEM_IMAGE_WITH_DIMENSIONS VIDEO WARRANTY_INFORMATION WEBSITE ZOOM_VIEW', '\s') satisfies $code = normalize-space(.)"
                 flag="fatal">[NOGOV-T19-R020]-Use of ReferencedFileTypeCode version 5 code list requires to use the codes defined in the code list.</assert>
      </rule>
      <rule context="cac:AdditionalItemProperty[normalize-space(cbc:Name) = 'STERILE']">
         <assert id="NOGOV-T19-R021"
                 test="normalize-space(cbc:Value) = 'NO' or cbc:ValueQualifier"
                 flag="warning">[NOGOV-T19-R021]-Use of ValueQualifier is recommended for values except 'NO'.</assert>
         <assert id="NOGOV-T19-R022"
                 test="some $code in tokenize('gs1:SterilisationTypeCode', '\s') satisfies $code = normalize-space(cbc:ValueQualifier)"
                 flag="warning">[NOGOV-T19-R022]-Non-recommended code list is specified as qualifier.</assert>
      </rule>
      <rule context="cac:AdditionalItemProperty[normalize-space(cbc:ValueQualifier) = 'gs1:SterilisationTypeCode']/cbc:Value">
         <assert id="NOGOV-T19-R023"
                 test="some $code in tokenize('AUTOCLAVE BETA_RADIATION CHLORINE_DIOXIDE DRY_HEAT ELECTRON_BEAM_IRRADIATION ETHANOL ETO_ETHYLENE_OXIDE FORMALDEHYDE GAMMA_RADIATION GLUTARALDEHYDE HIGH_INTENSITY_OR_PULSE_LIGHT HIGH_LEVEL_DISINFECTANT HYDROGEN_PEROXIDE LIQUID_CHEMICAL MICROWAVE_RADIATION NITROGEN_DIOXIDE OZONE PERACETIC_ACID PLASMA SOUND_WAVES SUPERCRITICAL_CARBON_DIOXIDE UNSPECIFIED UV_LIGHT', '\s') satisfies $code = normalize-space(.)"
                 flag="fatal">[NOGOV-T19-R023]-Use of SterilisationTypeCode version 2 code list requires to use the codes defined in the code list.</assert>
      </rule>
   </pattern>

</schema>
