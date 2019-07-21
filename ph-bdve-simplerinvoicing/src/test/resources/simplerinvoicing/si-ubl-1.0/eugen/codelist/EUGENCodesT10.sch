<?xml version="1.0" encoding="ISO-8859-1"?><pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CodesT10">
<!--
  This implementation supports genericode code lists with no instance
  meta data.
-->
<!--
    Start of synthesis of rules from code list context associations.
Version 0.3
-->

<!-- Version check -->
<rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm010:ver1.0:#urn:www.peppol.eu:bis:peppol4a:ver1.0#urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm010:ver1.0:#urn:www.peppol.eu:bis:peppol4a:ver1.0#urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x'))]">
  <assert test="true()" />
</rule>
<!-- end of version check -->

<rule context="cac:FinancialInstitution/cbc:ID//@schemeID" flag="warning">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' BIC ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[PCL-010-002]-If FinancialAccountID is IBAN then Financial InstitutionID SHOULD be BIC code.</assert>
</rule>

<rule context="cac:PostalAddress/cbc:ID//@schemeID" flag="warning">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[PCL-010-003]-Postal address identifiers SHOULD be GLN.</assert>
</rule>

<rule context="cac:Delivery/cac:DeliveryLocation/cbc:ID//@schemeID" flag="warning">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[PCL-010-004]-Location identifiers SHOULD be GLN</assert>
</rule>

<rule context="cac:Item/cac:StandardItemIdentification/cbc:ID//@schemeID" flag="warning">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GTIN ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[PCL-010-005]-Standard item identifiers SHOULD be GTIN.</assert>
</rule>

<rule context="cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode//@listID" flag="warning">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' UNSPSC eCLASS CPV ',concat(' ',normalize-space(.),' ') ) ) )" flag="warning">[PCL-010-006]-Commodity classification SHOULD be one of UNSPSC, eClass or CPV.</assert>
</rule>

<rule context="cac:PartyIdentification/cbc:ID//@schemeID" flag="fatal">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN DUNS IBAN DK:CPR DK:CVR DK:P DK:SE DK:VANS IT:VAT IT:CF IT:FTI IT:SIA IT:SECETI NO:ORGNR NO:VAT HU:VAT SE:ORGNR FI:OVT EU:VAT EU:REID FR:SIRET AT:VAT AT:GOV AT:CID IS:KT IBAN AT:KUR ES:VAT ',concat(' ',normalize-space(.),' ') ) ) )" flag="fatal">[PCL-010-008]-Party Identifiers MUST use the PEPPOL PartyID list</assert>
</rule>

<rule context="cbc:EndpointID//@schemeID" flag="fatal">
  <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' GLN DUNS IBAN DK:CPR DK:CVR DK:P DK:SE DK:VANS IT:VAT IT:CF IT:FTI IT:SIA IT:SECETI NO:ORGNR NO:VAT HU:VAT SE:ORGNR FI:OVT EU:VAT EU:REID FR:SIRET AT:VAT AT:GOV AT:CID IS:KT IBAN AT:KUR ES:VAT ',concat(' ',normalize-space(.),' ') ) ) )" flag="fatal">[PCL-010-009]-Endpoint Identifiers MUST use the PEPPOL PartyID list.</assert>
</rule>
<!--
    End of synthesis of rules from code list context associations.
-->
</pattern>
