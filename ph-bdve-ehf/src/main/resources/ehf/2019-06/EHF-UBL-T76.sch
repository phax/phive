<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:u="utils"
        schemaVersion="iso"
        queryBinding="xslt2">

   <title>Norwegian rules for EHF Order Response</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
       prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
       prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"
       prefix="ubl"/>

   <pattern xmlns:ns2="http://www.schematron-quickfix.com/validator/process">
      <rule context="/ubl:OrderResponse">
         <assert test="cbc:UBLVersionID" flag="warning" id="EHF-T76-B00101">Element 'cbc:UBLVersionID' MUST be provided.</assert>
         <assert test="cbc:CustomizationID" flag="warning" id="EHF-T76-B00102">Element 'cbc:CustomizationID' MUST be provided.</assert>
         <assert test="cbc:ProfileID" flag="warning" id="EHF-T76-B00103">Element 'cbc:ProfileID' MUST be provided.</assert>
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B00104">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:IssueDate" flag="warning" id="EHF-T76-B00105">Element 'cbc:IssueDate' MUST be provided.</assert>
         <assert test="cbc:OrderResponseCode" flag="warning" id="EHF-T76-B00106">Element 'cbc:OrderResponseCode' MUST be provided.</assert>
         <assert test="cbc:DocumentCurrencyCode" flag="warning" id="EHF-T76-B00107">Element 'cbc:DocumentCurrencyCode' MUST be provided.</assert>
         <assert test="cac:OrderReference" flag="warning" id="EHF-T76-B00108">Element 'cac:OrderReference' MUST be provided.</assert>
         <assert test="cac:SellerSupplierParty" flag="warning" id="EHF-T76-B00109">Element 'cac:SellerSupplierParty' MUST be provided.</assert>
         <assert test="cac:BuyerCustomerParty" flag="warning" id="EHF-T76-B00110">Element 'cac:BuyerCustomerParty' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cbc:UBLVersionID">
         <assert test="normalize-space(text()) = '2.1'"
                 flag="warning"
                 id="EHF-T76-B00201">Element 'cbc:UBLVersionID' MUST contain value '2.1'.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cbc:CustomizationID"/>
      <rule context="/ubl:OrderResponse/cbc:ProfileID"/>
      <rule context="/ubl:OrderResponse/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cbc:IssueDate"/>
      <rule context="/ubl:OrderResponse/cbc:IssueTime"/>
      <rule context="/ubl:OrderResponse/cbc:OrderResponseCode">
         <assert test="@listID" flag="warning" id="EHF-T76-B00801">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cbc:Note"/>
      <rule context="/ubl:OrderResponse/cbc:DocumentCurrencyCode">
         <assert test="@listID" flag="warning" id="EHF-T76-B01101">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderReference">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B01301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderReference/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty">
         <assert test="cac:Party" flag="warning" id="EHF-T76-B01501">Element 'cac:Party' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party"/>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T76-B01701">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B01901">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T76-B02001">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T76-B02201">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact"/>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name"/>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax"/>
      <rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty">
         <assert test="cac:Party" flag="warning" id="EHF-T76-B02901">Element 'cac:Party' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party"/>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID">
         <assert test="@schemeID" flag="warning" id="EHF-T76-B03101">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B03301">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T76-B03401">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName">
         <assert test="cbc:Name" flag="warning" id="EHF-T76-B03601">Element 'cbc:Name' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name"/>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B03801">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cac:Delivery">
         <assert test="cac:PromisedDeliveryPeriod"
                 flag="warning"
                 id="EHF-T76-B04001">Element 'cac:PromisedDeliveryPeriod' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod"/>
      <rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate"/>
      <rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine">
         <assert test="cac:LineItem" flag="warning" id="EHF-T76-B04401">Element 'cac:LineItem' MUST be provided.</assert>
         <assert test="cac:OrderLineReference" flag="warning" id="EHF-T76-B04402">Element 'cac:OrderLineReference' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B04501">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:LineStatusCode" flag="warning" id="EHF-T76-B04502">Element 'cbc:LineStatusCode' MUST be provided.</assert>
         <assert test="cac:Item" flag="warning" id="EHF-T76-B04503">Element 'cac:Item' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode">
         <assert test="@listID" flag="warning" id="EHF-T76-B04801">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity">
         <assert test="@unitCode" flag="warning" id="EHF-T76-B05001">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T76-B05002">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery">
         <assert test="cac:PromisedDeliveryPeriod"
                 flag="warning"
                 id="EHF-T76-B05301">Element 'cac:PromisedDeliveryPeriod' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price">
         <assert test="cbc:PriceAmount" flag="warning" id="EHF-T76-B05701">Element 'cbc:PriceAmount' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceAmount">
         <assert test="@currencyID" flag="warning" id="EHF-T76-B05801">Attribute 'currencyID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T76-B06001">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T76-B06002">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellerItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B06501">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellerItemIdentification/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B06701">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T76-B06801">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B07001">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:Item" flag="warning" id="EHF-T76-B07002">Element 'cac:Item' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellerItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B07401">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellerItemIdentification/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B07601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T76-B07701">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification">
         <assert test="cbc:ItemClassificationCode"
                 flag="warning"
                 id="EHF-T76-B07901">Element 'cbc:ItemClassificationCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
         <assert test="@listID" flag="warning" id="EHF-T76-B08001">Attribute 'listID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B08201">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cac:TaxScheme" flag="warning" id="EHF-T76-B08202">Element 'cac:TaxScheme' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID">
         <assert test="@schemeID" flag="warning" id="EHF-T76-B08301">Attribute 'schemeID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme">
         <assert test="cbc:ID" flag="warning" id="EHF-T76-B08601">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty">
         <assert test="cbc:Name" flag="warning" id="EHF-T76-B08801">Element 'cbc:Name' MUST be provided.</assert>
         <assert test="cbc:Value" flag="warning" id="EHF-T76-B08802">Element 'cbc:Value' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity">
         <assert test="@unitCode" flag="warning" id="EHF-T76-B09101">Attribute 'unitCode' MUST be present.</assert>
         <assert test="@unitCodeListID" flag="warning" id="EHF-T76-B09102">Attribute 'unitCodeListID' MUST be present.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier"/>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:OrderLineReference">
         <assert test="cbc:LineID" flag="warning" id="EHF-T76-B09501">Element 'cbc:LineID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID"/>
   </pattern>
   <pattern>
      <rule context="cac:BuyerCustomerParty">
         <assert id="NOGOV-T76-R005" test="cac:Party/cbc:EndpointID" flag="warning">[NOGOV-T76-R005]-A buyer should have an EndpointID.</assert>
      </rule>
      <rule context="cac:SellerSupplierParty">
         <assert id="NOGOV-T76-R006" test="cac:Party/cbc:EndpointID" flag="warning">[NOGOV-T76-R006]-A seller should have an EndpointID.</assert>
      </rule>
      <rule context="cac:TaxScheme">
         <assert id="NOGOV-T76-R008" test="cbc:ID" flag="fatal">[NOGOV-T76-R008]-Every tax scheme MUST be defined through an identifier.</assert>
      </rule>
      <rule context="cac:Delivery">
         <assert id="NOGOV-T76-R004" test="cac:PromisedDeliveryPeriod" flag="fatal">[NOGOV-T76-R004]-Information on promised delivery period must be filled if element Delivery exists.</assert>
      </rule>
      <rule context="cac:Item/cac:AdditionalItemProperty">
         <assert id="NOGOV-T76-R009" test="cbc:Value" flag="fatal">[NOGOV-T76-R009]-Value must be filled if additional item property is present.</assert>
      </rule>
      <rule context="cbc:ProfileID">
         <assert id="EHFPROFILE-T76-R001"
                 test=". = 'urn:www.cenbii.eu:profile:bii28:ver2.0'"
                 flag="fatal">[EHFPROFILE-T76-R001]-An order response must only be used in profile 28</assert>
      </rule>
   </pattern>

</schema>
