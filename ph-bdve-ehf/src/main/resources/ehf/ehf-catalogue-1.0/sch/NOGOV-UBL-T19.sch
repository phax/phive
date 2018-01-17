<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

   <title>Norwegian rules for EHF Catalogue</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" prefix="ubl"/>

   <pattern>
      <rule context="/ubl:Catalogue">
         <assert id="NOGOV-T19-R001"
                 test="cbc:ActionCode or count(cac:CatalogueLine/cbc:ActionCode) = count(cac:CatalogueLine)"
                 flag="fatal">[NOGOV-T19-R001]-A Catalogue must contain ActionCode on either Header or Line level</assert>
         <assert id="NOGOV-T19-R002"
                 test="not(cac:ValidityPeriod/cbc:EndDate) or current-date() &lt;= xs:date(cac:ValidityPeriod/cbc:EndDate)"
                 flag="fatal">[NOGOV-T19-R002]-A Catalogue must have a validity period enddate grater or equal to the current date</assert>
         <assert id="NOGOV-T19-R008"
                 test="cac:ValidityPeriod"
                 flag="fatal">[NOGOV-T19-R008]-A cataloge MUST have a validity period.</assert>
         <assert id="NOGOV-T19-R012"
                 test="cbc:VersionID"
                 flag="warning">[NOGOV-T19-R012]-A catalogue should have a catalogue version.</assert>
      </rule>
      <rule context="/ubl:Catalogue/cac:ValidityPeriod">
         <assert id="NOGOV-T19-R009"
                 test="cbc:StartDate"
                 flag="fatal">[NOGOV-T19-R009]-A catalogue MUST have a validity start date.</assert>
      </rule>
      <rule context="cac:ReceiverParty">
         <assert id="NOGOV-T19-R010"
                 test="cbc:EndpointID"
                 flag="fatal">[NOGOV-T19-R010]-A catalogue MUST have an endpoint ID for receiver.</assert>
      </rule>
      <rule context="cac:SellerSupplierParty/cac:Party">
         <assert id="NOGOV-T19-R013"
                 test="cbc:EndpointID"
                 flag="warning">[NOGOV-T19-R013]-A catalogue should have an endpoint ID for seller.</assert>
      </rule>
      <rule context="cac:TaxScheme">
         <assert id="NOGOV-T19-R011"
                 test="cbc:ID"
                 flag="fatal">[NOGOV-T19-R011]-Every tax scheme MUST be defined through an identifier.</assert>
      </rule>
      <rule context="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]">
        <assert id="NOGOV-T19-R024"
                test="@schemeID = 'NO:ORGNR'"
                flag="fatal">[NOGOV-T19-R024]-CompanyID for legal entity qualifier must have value 'NO:ORGNR' when provided.</assert>
      </rule>
      <rule context="cac:CatalogueLine">
         <assert id="NOGOV-T19-R003"
                 test="cbc:OrderableIndicator"
                 flag="fatal">[NOGOV-T19-R003]-A Catalogue line MUST have an orderable indicator</assert>
         <assert id="NOGOV-T19-R004"
                 test="cac:Item"
                 flag="fatal">[NOGOV-T19-R004]-A Catalogue line MUST have item/article information</assert>
      </rule>
      <rule context="cac:CatalogueLine/cac:Item">
         <assert id="NOGOV-T19-R005"
                 test="cbc:Name"
                 flag="fatal">[NOGOV-T19-R005]-A Catalogue item MUST have a name</assert>
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
