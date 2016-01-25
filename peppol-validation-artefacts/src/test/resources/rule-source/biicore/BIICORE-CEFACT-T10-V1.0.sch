<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    schemaVersion="iso">
  <title>BII2 CORE restrictions for Invoice Transaction (T10)  CrossIndustryInvoice_4p0-D11A</title>
  <ns uri="urn:un:unece:uncefact:codelist:standard:5:ISO42173A:2011-08-31" prefix="clm5ISO42173A"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:6:0133:40106" prefix="clm60133"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:6:3055:D11A" prefix="clm63055"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:6:Recommendation20:7" prefix="clm6Recommendation20"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccessRightsType:D11A" prefix="clm210AccountingE704"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingAccountBalanceReopeningType:D11A" prefix="clm210AccountingE602"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingAccountClassification:D11A" prefix="clm210AccountingE902"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingAccountNatureType:D11A" prefix="clm210AccountingE502"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingAccountStatus:D11A" prefix="clm210AccountingE305"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingAccountType:D11A" prefix="clm210AccountingE501"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingAmountQualifierType:D11A" prefix="clm210AccountingE603"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingAmountType:D11A" prefix="clm210AccountingE601"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingContact:D11A" prefix="clm210AccountingE023"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingDocumentType:D11A" prefix="clm210AccountingE006"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingEntryCategory:D11A" prefix="clm210AccountingE202"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingEntryLineCategory:D11A" prefix="clm210AccountingE203"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingEntryLineSource:D11A" prefix="clm210AccountingE302"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingEntryProcessing:D11A" prefix="clm210AccountingE201"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingJournal:D11A" prefix="clm210AccountingE012"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingJournalCategory:D11A" prefix="clm210AccountingE013"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingPeriodFunctionType:D11A" prefix="clm210AccountingE703"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingPerquisite:D11A" prefix="clm210AccountingE021"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AccountingVoucherMedium:D11A" prefix="clm210AccountingE101"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AdditionalPostponement:D11A" prefix="clm210AccountingE904"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AddressFormatType:D11A" prefix="clm210AccountingE011"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AlternateCurrencyAmount:D11A" prefix="clm210AccountingE304"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AmortizationMethod:D11A" prefix="clm210AccountingE204"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:AmountWeightType:D11A" prefix="clm210AccountingE702"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:CertificateType:D11A" prefix="clm210AccountingE004"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:FinancialAccountType:D11A" prefix="clm210AccountingE016"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:FinancialInstitutionRole:D11A" prefix="clm210AccountingE015"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:LifetimeEndCost:D11A" prefix="clm210LifetimeEndCostE206"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:OrganizationFunctionType:D11A" prefix="clm210OrganizationFunctionTypeE706"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:PartyType:D11A" prefix="clm210PartyTypeE705"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:RefundMethod:D11A" prefix="clm210RefundMethodE022"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:ScenarioType:D11A" prefix="clm210ScenarioTypeE018"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:SoftwareUserType:D11A" prefix="clm210SoftwareUserTypeE019"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:EDIFICASEU:TaxExemptionReason:D11A" prefix="clm210AccountingE307"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:IANA:CharacterSetCode:2010-11-04" prefix="clmIANACharacterSetCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:IANA:MIMEMediaType:2011-09-23" prefix="clmIANAMIMEMediaType"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:ISO:ISO2AlphaLanguageCode:20061027" prefix="clm5ISO63912A"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ActionCode:D10B" prefix="clm61229LineStatusCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AddressType:D10B" prefix="clm63131"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AdjustmentReasonDescriptionCode:D10B" prefix="clm64465"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AdjustmentReasonDescriptionCodeFinancial:D10B" prefix="clm64465AdjustmentReasonCodeFinancial"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AgencyIdentificationCodeCargoOperationalCategory:D10A" prefix="clm63055CargoOperationalCategory"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AgencyIdentificationCodeGoodsTypeCode:D10A" prefix="clm63055GoodsTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AgencyIdentificationCodeTransportEquipmentSizeTypeCode:D10A" prefix="clm63055TransportEquipmentSizeTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AllowanceChargeIdentificationCode:D10B" prefix="clm65189AllowanceChargeID"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AllowanceChargeReasonCode:D10B" prefix="clm64465AllowanceChargeReasonCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:AutomaticDataCaptureMethodCode:D10B" prefix="clm67233AutomaticDataCaptureMethodCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CargoOperationalCategoryCode:D10B" prefix="clm67085b"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CargoTypeClassificationCode:D10B" prefix="clm67085"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CargoTypeCode:1996Rev2Final" prefix="clm6Recommendation21AnnexI"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CommodityIdentificationCode:D10B" prefix="clm67357"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CommunicationMeansTypeCode:D10B" prefix="clm63155CommunicationChannelCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ContactFunctionCode:D10B" prefix="clm63139ContactTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ContractTypeCode:D10B" prefix="clm69651"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ContractorType:D10B" prefix="clm6ContractorType"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CostManagementCode:D10B" prefix="clm69653"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CostReportingCode:D10B" prefix="clm69655"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:CustomsDutyRegimeTypeCode:D10B" prefix="clm69213"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DangerousGoodsPackingCode:D10B" prefix="clm68339"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DangerousGoodsRegulationCode:D10B" prefix="clm68273"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DateTimePeriodFunctionCode:D10B" prefix="clm62005DateTimePeriodFunctionCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DeliveryPlanCommitmentLevelCode:D10B" prefix="clm64017CommitmentLevelCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DeliveryTermsCode:2000" prefix="clm64053"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DeliveryTermsFunctionCode:D10B" prefix="clm64055DeliveryTermsFunctionCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DimensionTypeCode:D10B" prefix="clm66145"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentNameCode:D10B" prefix="clm61001"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentNameCodeAccounting:D10B" prefix="clm61001Accounting"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentNameCodeBilling:D10B" prefix="clm61001Billing"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentNameCodeInvoice:D10B" prefix="clm61001Invoice"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentNameCodeQuotation:D10B" prefix="clm61001DocumentTypeCodeQuotation"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentNameCodeRemittance:D10B" prefix="clm61001DocumentTypeCodeRemittance"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentNameCodeScheduling:D10B" prefix="clm61001DocumentTypeCodeScheduling"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DocumentStatusCode:D10B" prefix="clm61373"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DutyTaxFeeTypeCode:D10B" prefix="clm65153"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:DutyorTaxorFeeCategoryCode:D10B" prefix="clm65305"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:EarnedValueCalculationMethod:D10B" prefix="clm69657"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:EquipmentSizeTypeDescriptionCode:D10B" prefix="clm68155"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:EquipmentSupplierCode:D10B" prefix="clm68077"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:EventTimeReferenceCode:D10B" prefix="clm62475"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:EventTimeReferenceCodePaymentTermsEvent:D10B" prefix="clm62475PaymentTermsEvent"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:FreightChargeQuantityUnitBasisCode:D10B" prefix="clm6TDED6131"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:FreightChargeTariffCode:D10B" prefix="clm65243"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:FundingTypeCode:D10B" prefix="clm69659"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:GoodsTypeCode:D10B" prefix="clm6TDED7357"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:GoodsTypeExtensionCode:D10B" prefix="clm6TDED7361"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:GovernmentActionCode:D10B" prefix="clm69417"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:HierarchicalStructureTypeCode:D10B" prefix="clm69661"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:LocationFunctionCode:D10B" prefix="clm63227"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MarkingInstructionCode:D10B" prefix="clm64233"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MeasuredAttributeCode:D10B" prefix="clm66313"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MeasurementUnitCommonCodeAirflow:4" prefix="clm6Recommendation20Airflow"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MeasurementUnitCommonCodeDuration:4" prefix="clm6Recommendation20Duration"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MeasurementUnitCommonCodeLinear:4" prefix="clm6Recommendation20Linear"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MeasurementUnitCommonCodeTemperature:4" prefix="clm6Recommendation20Temperature"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MeasurementUnitCommonCodeVolume:4" prefix="clm6Recommendation20Volume"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MeasurementUnitCommonCodeWeight:4" prefix="clm6Recommendation20Weight"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MessageFunctionCode:D10B" prefix="clm61225MessageFunctionTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:MessageFunctionCodeAcknowledgement:D10B" prefix="clm61225Acknowledgement"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ObligationGuaranteeCode:D10B" prefix="clm6TDED4377"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PackageTypeCode:2006" prefix="clm67065"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PackagingLevelCode:D10B" prefix="clm67075"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PackagingMarkingCode:D10B" prefix="clm67233PackagingMarkingCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PartyRoleCode:D10B" prefix="clm63035"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PartyRoleCodeChargePaying:D10B" prefix="clm63035ChargePaying"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PaymentGuaranteeMeansCode:D10B" prefix="clm64431"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PaymentMeansChannelCode:D10B" prefix="clm64435"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PaymentMeansCode:D10B" prefix="clm64461"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PaymentMethodCode:D10B" prefix="clm64439"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PaymentTermsTypeCode:D10B" prefix="clm64279"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PlanningLevel:D10B" prefix="clm6PlanningLevel"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PriceTypeCode:D10B" prefix="clm65375"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:PriorityDescriptionCode:D10B" prefix="clm64037PriorityDescriptionCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ProcessTypeCode:D10B" prefix="clm67187"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ProjectTypeCode:D10B" prefix="clm69665"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ReferenceTypeCode:D10B" prefix="clm61153ReferenceTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ReportingThresholdTriggerType:D10B" prefix="clm69667"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ResourceCostCategory:D10B" prefix="clm69669"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ResourcePlanMeasureType:D10B" prefix="clm69671"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ResponseTypeCode:D10B" prefix="clm64343ResponseTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ResponsibleAgencyCode:D10B" prefix="clm69415ResponsibleAgencyCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ResponsibleAgencyInvolvementCode:D10B" prefix="clm69411ResponsibleAgencyInvolvementCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ScheduleTaskRelationshipType:D10B" prefix="clm69673"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ScheduleTaskType:D10B" prefix="clm69675"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:ScheduleTypeCode:D10B" prefix="clm6ScheduleTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:SealConditionCode:D10B" prefix="clm64517"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:SealTypeCode:D10B" prefix="clm6SealTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:SealingPartyRoleCode:D10B" prefix="clm69303"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:SecurityClassificationType:D10B" prefix="clm69677"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:StatusCode:D10B" prefix="clm64405"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:StatusDescriptionCodeAccountingDebitCredit:D10B" prefix="clm64405AccountingDebitCredit"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:StatusDescriptionCodeWorkflow:D10B" prefix="clm64405StatusCodeWorkflow"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TemperatureTypeCode:D10B" prefix="clm66245"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportEquipmentCategoryCode:D10B" prefix="clm68053"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportEquipmentFullnessCode:D10B" prefix="clm68169"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportEquipmentHaulageArrangementsCode:D10B" prefix="clm68341"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportMeansDirectionCode:D10B" prefix="clm68101"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportMeansTypeCode:2007" prefix="clm6Recommendation28"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportModeCode:2" prefix="clm6Recommendation19"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportMovementStageCode:D10B" prefix="clm68051"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportMovementTypeCode:D10B" prefix="clm68323TransportMovementTypeCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportPaymentArrangementCode:D10B" prefix="clm64237TransportPaymentArrangementCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportServiceCategoryCode:D10B" prefix="clm65237TransportServiceCategoryCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportServiceConditionCode:D10B" prefix="clm64065TransportServiceConditionCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportServicePriorityCode:D10B" prefix="clm64219TransportServicePriorityCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportServiceRequirementCode:D10B" prefix="clm67273TransportServiceRequirementCode"/>
  <ns uri="urn:un:unece:uncefact:codelist:standard:UNECE:TransportStatusCode:4" prefix="clm6Recommendation24"/>
  <ns uri="urn:un:unece:uncefact:data:Standard:QualifiedDataType:10" prefix="qdt"/>
  <ns uri="urn:un:unece:uncefact:data:Standard:ReusableAggregateBusinessInformationEntity:10" prefix="ram"/>
  <ns uri="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:4" prefix="rsm"/>
  <ns uri="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:10" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:documentation:standard:CoreComponentsTechnicalSpecification:2" prefix="ccts"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:5:ISO316612A:SecondEdition2006VI-10" prefix="ids5ISO316612A"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:ISO:ISOAlpha2LanguageCode:20061027" prefix="ids5ISO63912A"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:UNECE:FreightCostCode:4" prefix="ids6Recommendation23"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:UNECE:PaymentTermsDescriptionIdentifier:D10B" prefix="ids64277"/>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext">
      <assert flag="warning" test="count(ram:BusinessProcessSpecifiedCIDocumentContextParameter)=1">
	Element 'ram:BusinessProcessSpecifiedCIDocumentContextParameter' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:GuidelineSpecifiedCIDocumentContextParameter)=1">
	Element 'ram:GuidelineSpecifiedCIDocumentContextParameter' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:ApplicationSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:ApplicationSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:BIMSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:BIMSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter/ram:SpecifiedCIDocumentVersion">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIDocumentVersion' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter/ram:Value">
      <report flag="warning" test=".">
	Element 'ram:Value' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter/ram:SpecifiedCIDocumentVersion">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIDocumentVersion' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter/ram:Value">
      <report flag="warning" test=".">
	Element 'ram:Value' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:MessageStandardSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:MessageStandardSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:ScenarioSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:ScenarioSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:SpecifiedTransactionID">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedTransactionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIExchangedDocumentContext/ram:SubsetSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:SubsetSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument">
      <assert flag="warning" test="count(ram:IncludedCINote)&lt;=1">
	Element 'ram:IncludedCINote' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:CategoryCode">
      <report flag="warning" test=".">
	Element 'ram:CategoryCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:ControlRequirementIndicator">
      <report flag="warning" test=".">
	Element 'ram:ControlRequirementIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:IncludedCINote">
      <assert flag="warning" test="count(ram:Content)=1">
	Element 'ram:Content' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:IncludedCINote/ram:Content">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:IncludedCINote/ram:ContentCode">
      <report flag="warning" test=".">
	Element 'ram:ContentCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:IncludedCINote/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:IncludedCINote/ram:Subject">
      <report flag="warning" test=".">
	Element 'ram:Subject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:IncludedCINote/ram:SubjectCode">
      <report flag="warning" test=".">
	Element 'ram:SubjectCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:LanguageID">
      <report flag="warning" test=".">
	Element 'ram:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:Purpose">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:PurposeCode">
      <report flag="warning" test=".">
	Element 'ram:PurposeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:RevisionDateTime">
      <report flag="warning" test=".">
	Element 'ram:RevisionDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHExchangedDocument/ram:VersionID">
      <report flag="warning" test=".">
	Element 'ram:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction">
      <assert flag="warning" test="count(ram:IncludedCIILSupplyChainTradeLineItem)&gt;=1">
	Element 'ram:IncludedCIILSupplyChainTradeLineItem' must occur at least 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement">
      <assert flag="warning" test="count(ram:SellerCITradeParty)=1">
	Element 'ram:SellerCITradeParty' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:BuyerCITradeParty)=1">
	Element 'ram:BuyerCITradeParty' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:Information)&lt;=1">
	Element 'ram:Information' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:AttachedSpecifiedBinaryFile)&lt;=1">
	Element 'ram:AttachedSpecifiedBinaryFile' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <assert flag="warning" test="count(ram:IncludedBinaryObject)=1">
	Element 'ram:IncludedBinaryObject' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:Access">
      <report flag="warning" test=".">
	Element 'ram:Access' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:AccessAvailabilitySpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:AccessAvailabilitySpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:AuthorName">
      <report flag="warning" test=".">
	Element 'ram:AuthorName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'ram:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:EncodingCode">
      <report flag="warning" test=".">
	Element 'ram:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:FileName">
      <report flag="warning" test=".">
	Element 'ram:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:IncludedBinaryObject">
      <report flag="warning" test="@uri">
	Attribute '@uri' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:MIMECode">
      <report flag="warning" test=".">
	Element 'ram:MIMECode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:SizeMeasure">
      <report flag="warning" test=".">
	Element 'ram:SizeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:Title">
      <report flag="warning" test=".">
	Element 'ram:Title' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:URIID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:VersionID">
      <report flag="warning" test=".">
	Element 'ram:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssuerAssignedID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ApplicableCITradeDeliveryTerms">
      <report flag="warning" test=".">
	Element 'ram:ApplicableCITradeDeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerAgentCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BuyerAgentCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerAssignedAccountantCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BuyerAssignedAccountantCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty">
      <assert flag="warning" test="count(ram:DefinedCITradeContact)&lt;=1">
	Element 'ram:DefinedCITradeContact' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:SpecifiedCITaxRegistration)&lt;=1">
	Element 'ram:SpecifiedCITaxRegistration' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:DirectTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:DirectTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication">
      <assert flag="warning" test="count(ram:URIID)=1">
	Element 'ram:URIID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:URIID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication">
      <assert flag="warning" test="count(ram:CompleteNumber)=1">
	Element 'ram:CompleteNumber' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:InstantMessagingCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:InstantMessagingCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:JobTitle">
      <report flag="warning" test=".">
	Element 'ram:JobTitle' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:MobileTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:MobileTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:PersonID">
      <report flag="warning" test=".">
	Element 'ram:PersonID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:PersonName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:Responsibility">
      <report flag="warning" test=".">
	Element 'ram:Responsibility' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCIContactPerson">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIContactPerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCINote">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication">
      <assert flag="warning" test="count(ram:CompleteNumber)=1">
	Element 'ram:CompleteNumber' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelexCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:TelexCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:VOIPCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:VOIPCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:EndPointURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:EndPointURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test=".">
	Element 'ram:CompleteNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:EndPointURICIUniversalCommunication/ram:URIID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:GlobalID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress">
      <assert flag="warning" test="count(ram:CountrySubDivisionName)&lt;=1">
	Element 'ram:CountrySubDivisionName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:LegalClassificationCode">
      <report flag="warning" test=".">
	Element 'ram:LegalClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress">
      <report flag="warning" test=".">
	Element 'ram:PostalCITradeAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax">
      <assert flag="warning" test="count(ram:TypeCode)=1">
	Element 'ram:TypeCode' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:ExemptionReason">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:URICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:URICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:URICIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test=".">
	Element 'ram:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssuerAssignedID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerReference">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerRequisitionerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BuyerRequisitionerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:BuyerTaxRepresentativeCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BuyerTaxRepresentativeCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:IssuerAssignedID)=1">
	Element 'ram:IssuerAssignedID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Information)&lt;=1">
	Element 'ram:Information' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:IssuerAssignedID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:DemandForecastReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:DemandForecastReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:OrderResponseReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:OrderResponseReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:PriceListReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PriceListReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:PromotionalDealReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PromotionalDealReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:QuotationReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:RequisitionerReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:RequisitionerReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SalesAgentCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:SalesAgentCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:DefinedCITradeContact">
      <report flag="warning" test=".">
	Element 'ram:DefinedCITradeContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:EndPointURICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:EndPointURICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:PostalCITradeAddress">
      <report flag="warning" test=".">
	Element 'ram:PostalCITradeAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration">
      <report flag="warning" test=".">
	Element 'ram:AuthorizedCILegalRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:SpecifiedCILegalOrganization/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:SpecifiedCILegalOrganization/ram:LegalClassificationCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:SpecifiedCILegalOrganization/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress">
      <report flag="warning" test=".">
	Element 'ram:PostalCITradeAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:SpecifiedCITaxRegistration">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITaxRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerAssignedAccountantCITradeParty/ram:URICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:URICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty">
      <assert flag="warning" test="count(ram:DefinedCITradeContact)&lt;=1">
	Element 'ram:DefinedCITradeContact' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:DirectTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:DirectTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication">
      <assert flag="warning" test="count(ram:URIID)=1">
	Element 'ram:URIID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:URIID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication">
      <assert flag="warning" test="count(ram:CompleteNumber)=1">
	Element 'ram:CompleteNumber' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:InstantMessagingCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:InstantMessagingCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:JobTitle">
      <report flag="warning" test=".">
	Element 'ram:JobTitle' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:MobileTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:MobileTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:PersonID">
      <report flag="warning" test=".">
	Element 'ram:PersonID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:PersonName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:Responsibility">
      <report flag="warning" test=".">
	Element 'ram:Responsibility' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCIContactPerson">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIContactPerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCINote">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication">
      <assert flag="warning" test="count(ram:CompleteNumber)=1">
	Element 'ram:CompleteNumber' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelexCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:TelexCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:VOIPCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:VOIPCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:EndPointURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:EndPointURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test=".">
	Element 'ram:CompleteNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:EndPointURICIUniversalCommunication/ram:URIID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:GlobalID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress">
      <assert flag="warning" test="count(ram:CountrySubDivisionName)&lt;=1">
	Element 'ram:CountrySubDivisionName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:LegalClassificationCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test=".">
	Element 'ram:LineOne' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test=".">
	Element 'ram:LineTwo' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test=".">
	Element 'ram:PostcodeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax">
      <assert flag="warning" test="count(ram:TypeCode)=1">
	Element 'ram:TypeCode' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Description)&lt;=1">
	Element 'ram:Description' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:ExemptionReason">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:URICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:URICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:URICIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:SellerOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SellerTaxRepresentativeCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:SellerTaxRepresentativeCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeAgreement/ram:SupplyInstructionReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:SupplyInstructionReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:DescriptionBinaryObject">
      <report flag="warning" test=".">
	Element 'ram:DescriptionBinaryObject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:EarliestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:EarliestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:LatestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:LatestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:ID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PhysicalCIGeographicalCoordinate">
      <report flag="warning" test=".">
	Element 'ram:PhysicalCIGeographicalCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress">
      <assert flag="warning" test="count(ram:CountrySubDivisionName)&lt;=1">
	Element 'ram:CountrySubDivisionName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:OccurrenceCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent/ram:UnitQuantity">
      <report flag="warning" test=".">
	Element 'ram:UnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualDespatchCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:ActualDespatchCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualPickUpCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:ActualPickUpCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:DescriptionBinaryObject">
      <report flag="warning" test=".">
	Element 'ram:DescriptionBinaryObject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:EarliestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:EarliestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:LatestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:LatestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PhysicalCIGeographicalCoordinate">
      <report flag="warning" test=".">
	Element 'ram:PhysicalCIGeographicalCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:ContinuousIndicator">
      <report flag="warning" test=".">
	Element 'ram:ContinuousIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:DurationMeasure">
      <report flag="warning" test=".">
	Element 'ram:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:EndDateTime">
      <report flag="warning" test=".">
	Element 'ram:EndDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:InclusiveIndicator">
      <report flag="warning" test=".">
	Element 'ram:InclusiveIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:SeasonCode">
      <report flag="warning" test=".">
	Element 'ram:SeasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:StartDateFlexibilityCode">
      <report flag="warning" test=".">
	Element 'ram:StartDateFlexibilityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:StartDateTime">
      <report flag="warning" test=".">
	Element 'ram:StartDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:OccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:OccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent/ram:UnitQuantity">
      <report flag="warning" test=".">
	Element 'ram:UnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:AdditionalReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:AdditionalReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ConsumptionReportReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ConsumptionReportReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:DeliveryNoteReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:DeliveryNoteReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:DespatchAdviceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:DespatchAdviceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:PreviousDeliveryCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:PreviousDeliveryCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ReceivingAdviceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ReceivingAdviceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:RelatedCISupplyChainConsignment">
      <report flag="warning" test=".">
	Element 'ram:RelatedCISupplyChainConsignment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ShipFromCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ShipFromCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:ShipToCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ShipToCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeDelivery/ram:UltimateShipToCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:UltimateShipToCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement">
      <assert flag="warning" test="count(ram:ApplicableCITradeTax)&lt;=1">
	Element 'ram:ApplicableCITradeTax' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:SpecifiedCITradePaymentTerms)&lt;=1">
	Element 'ram:SpecifiedCITradePaymentTerms' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:SpecifiedCIIHTradeSettlementMonetarySummation)=1">
	Element 'ram:SpecifiedCIIHTradeSettlementMonetarySummation' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax">
      <assert flag="warning" test="count(ram:TaxPointDate)=1">
	Element 'ram:TaxPointDate' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BasisAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CalculatedAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CalculationSequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:CalculationSequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CategoryCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CategoryName">
      <report flag="warning" test=".">
	Element 'ram:CategoryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:DueDateTypeCode">
      <report flag="warning" test=".">
	Element 'ram:DueDateTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ExemptionReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:PlaceApplicableCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:PlaceApplicableCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:RateApplicablePercent">
      <report flag="warning" test=".">
	Element 'ram:RateApplicablePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SellerPayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerPayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ServiceSupplyCITradeCountry">
      <report flag="warning" test=".">
	Element 'ram:ServiceSupplyCITradeCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TaxBasisAllowanceRate">
      <report flag="warning" test=".">
	Element 'ram:TaxBasisAllowanceRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:Type">
      <report flag="warning" test=".">
	Element 'ram:Type' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod">
      <assert flag="warning" test="count(ram:StartDateTime)=1">
	Element 'ram:StartDateTime' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:EndDateTime)=1">
	Element 'ram:EndDateTime' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:CompleteDateTime">
      <report flag="warning" test=".">
	Element 'ram:CompleteDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:ContinuousIndicator">
      <report flag="warning" test=".">
	Element 'ram:ContinuousIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:DurationMeasure">
      <report flag="warning" test=".">
	Element 'ram:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:InclusiveIndicator">
      <report flag="warning" test=".">
	Element 'ram:InclusiveIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:SeasonCode">
      <report flag="warning" test=".">
	Element 'ram:SeasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:StartDateFlexibilityCode">
      <report flag="warning" test=".">
	Element 'ram:StartDateFlexibilityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:CreditReason">
      <report flag="warning" test=".">
	Element 'ram:CreditReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:CreditReasonCode">
      <report flag="warning" test=".">
	Element 'ram:CreditReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:CreditorReferenceID">
      <report flag="warning" test=".">
	Element 'ram:CreditorReferenceID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:CreditorReferenceIssuerID">
      <report flag="warning" test=".">
	Element 'ram:CreditorReferenceIssuerID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:CreditorReferenceType">
      <report flag="warning" test=".">
	Element 'ram:CreditorReferenceType' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:CreditorReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:CreditorReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:DuePayableAmount">
      <report flag="warning" test=".">
	Element 'ram:DuePayableAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:FactoringAgreementReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:FactoringAgreementReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:FactoringListReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:FactoringListReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:InvoiceApplicableCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:InvoiceApplicableCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:InvoiceCurrencyCode">
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:InvoiceDateTime">
      <report flag="warning" test=".">
	Element 'ram:InvoiceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:InvoiceIssuerReference">
      <report flag="warning" test=".">
	Element 'ram:InvoiceIssuerReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:InvoiceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:InvoiceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:InvoiceeCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:InvoicerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:InvoicerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:LetterOfCreditReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:LetterOfCreditReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:NextInvoiceDateTime">
      <report flag="warning" test=".">
	Element 'ram:NextInvoiceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayableSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:PayableSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty">
      <assert flag="warning" test="count(ram:ID)&lt;=1">
	Element 'ram:ID' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:Name)=1">
	Element 'ram:Name' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:DefinedCITradeContact">
      <report flag="warning" test=".">
	Element 'ram:DefinedCITradeContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:EndPointURICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:EndPointURICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:ID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:PostalCITradeAddress">
      <report flag="warning" test=".">
	Element 'ram:PostalCITradeAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:SpecifiedCILegalOrganization">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration">
      <report flag="warning" test=".">
	Element 'ram:AuthorizedCILegalRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:SpecifiedCILegalOrganization/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:SpecifiedCILegalOrganization/ram:LegalClassificationCode">
      <report flag="warning" test=".">
	Element 'ram:LegalClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:SpecifiedCILegalOrganization/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress">
      <report flag="warning" test=".">
	Element 'ram:PostalCITradeAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:SpecifiedCITaxRegistration">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITaxRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayeeCITradeParty/ram:URICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:URICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PayerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:PayerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PaymentApplicableCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:PaymentApplicableCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PaymentCurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:PaymentCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PaymentReference">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ProFormaInvoiceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ProFormaInvoiceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:PurchaseSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:PurchaseSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:ReceivableSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:ReceivableSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SalesSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SalesSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedAdvancePayment">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedAdvancePayment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIFinancialAdjustment">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIFinancialAdjustment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation">
      <assert flag="warning" test="count(ram:LineTotalAmount)=1">
	Element 'ram:LineTotalAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:ChargeTotalAmount)&lt;=1">
	Element 'ram:ChargeTotalAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:AllowanceTotalAmount)&lt;=1">
	Element 'ram:AllowanceTotalAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:TaxTotalAmount)&lt;=2">
	Element 'ram:TaxTotalAmount' may occur at maximum 2 times.</assert>
      <assert flag="warning" test="count(ram:RoundingAmount)&lt;=1">
	Element 'ram:RoundingAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:GrandTotalAmount)=1">
	Element 'ram:GrandTotalAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:TotalPrepaidAmount)&lt;=1">
	Element 'ram:TotalPrepaidAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:DuePayableAmount)=1">
	Element 'ram:DuePayableAmount' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:AllowanceTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:ChargeTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:DuePayableAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:GrandTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:GrossLineTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:GrossLineTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:LineTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:NetIncludingTaxesLineTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:NetLineTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:NetLineTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:ProductValueExcludingTobaccoTaxInformationAmount">
      <report flag="warning" test=".">
	Element 'ram:ProductValueExcludingTobaccoTaxInformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:RetailValueExcludingTaxInformationAmount">
      <report flag="warning" test=".">
	Element 'ram:RetailValueExcludingTaxInformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:RoundingAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:TaxBasisTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:TotalAllowanceChargeAmount">
      <report flag="warning" test=".">
	Element 'ram:TotalAllowanceChargeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:TotalDepositFeeInformationAmount">
      <report flag="warning" test=".">
	Element 'ram:TotalDepositFeeInformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:TotalDiscountAmount">
      <report flag="warning" test=".">
	Element 'ram:TotalDiscountAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:TotalPrepaidAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCIIHTradeSettlementMonetarySummation/ram:TotalRetailValueInformationAmount">
      <report flag="warning" test=".">
	Element 'ram:TotalRetailValueInformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCILogisticsServiceCharge">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCILogisticsServiceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge">
      <assert flag="warning" test="count(ram:ActualAmount)=1">
	Element 'ram:ActualAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Reason)=1">
	Element 'ram:Reason' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:CategoryCITradeTax)&lt;=1">
	Element 'ram:CategoryCITradeTax' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ActualAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ActualCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:ActualCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:BasisAmount">
      <report flag="warning" test=".">
	Element 'ram:BasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CalculationPercent">
      <report flag="warning" test=".">
	Element 'ram:CalculationPercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax">
      <assert flag="warning" test="count(ram:TypeCode)=1">
	Element 'ram:TypeCode' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:CategoryCode)=1">
	Element 'ram:CategoryCode' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:BasisAmount">
      <report flag="warning" test=".">
	Element 'ram:BasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:CalculatedAmount">
      <report flag="warning" test=".">
	Element 'ram:CalculatedAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:CalculationSequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:CalculationSequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:CategoryCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:CategoryName">
      <report flag="warning" test=".">
	Element 'ram:CategoryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:DueDateTypeCode">
      <report flag="warning" test=".">
	Element 'ram:DueDateTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:ExemptionReason">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:PlaceApplicableCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:PlaceApplicableCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:RateApplicablePercent">
      <report flag="warning" test=".">
	Element 'ram:RateApplicablePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:SellerPayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerPayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:ServiceSupplyCITradeCountry">
      <report flag="warning" test=".">
	Element 'ram:ServiceSupplyCITradeCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:SpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:TaxBasisAllowanceRate">
      <report flag="warning" test=".">
	Element 'ram:TaxBasisAllowanceRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:TaxPointDate">
      <report flag="warning" test=".">
	Element 'ram:TaxPointDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:Type">
      <report flag="warning" test=".">
	Element 'ram:Type' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:TypeCode">
      <assert flag="warning" test="normalize-space(.)=&apos;VAT&apos;">
	'VAT' is the only allowed value of 'ram:TypeCode'.</assert>
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ChargeIndicator">
      <report flag="warning" test=".">
	Element 'ram:ChargeIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'ram:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:Reason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ReasonCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms">
      <assert flag="warning" test="count(ram:Description)&lt;=1">
	Element 'ram:Description' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:ApplicableCITradePaymentDiscountTerms">
      <report flag="warning" test=".">
	Element 'ram:ApplicableCITradePaymentDiscountTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:ApplicableCITradePaymentPenaltyTerms">
      <report flag="warning" test=".">
	Element 'ram:ApplicableCITradePaymentPenaltyTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:DirectDebitMandateID">
      <report flag="warning" test=".">
	Element 'ram:DirectDebitMandateID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:FromEventCode">
      <report flag="warning" test=".">
	Element 'ram:FromEventCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:InstructionTypeCode">
      <report flag="warning" test=".">
	Element 'ram:InstructionTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:PartialPaymentAmount">
      <report flag="warning" test=".">
	Element 'ram:PartialPaymentAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:PartialPaymentPercent">
      <report flag="warning" test=".">
	Element 'ram:PartialPaymentPercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:PayeeCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:PayeeCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:PaymentMeansID">
      <report flag="warning" test=".">
	Element 'ram:PaymentMeansID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:SettlementPeriodMeasure">
      <report flag="warning" test=".">
	Element 'ram:SettlementPeriodMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans">
      <assert flag="warning" test="count(ram:ID)&lt;=1">
	Element 'ram:ID' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:TypeCode)=1">
	Element 'ram:TypeCode' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:CardholderName">
      <report flag="warning" test=".">
	Element 'ram:CardholderName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:CreditAvailableAmount">
      <report flag="warning" test=".">
	Element 'ram:CreditAvailableAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:CreditLimitAmount">
      <report flag="warning" test=".">
	Element 'ram:CreditLimitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:ExpiryDate">
      <report flag="warning" test=".">
	Element 'ram:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:InterestRatePercent">
      <report flag="warning" test=".">
	Element 'ram:InterestRatePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:MicrochipIndicator">
      <report flag="warning" test=".">
	Element 'ram:MicrochipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:ValidFromDateTime">
      <report flag="warning" test=".">
	Element 'ram:ValidFromDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ApplicableTradeSettlementFinancialCard/ram:VerificationNumeric">
      <report flag="warning" test=".">
	Element 'ram:VerificationNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:GuaranteeMethodCode">
      <report flag="warning" test=".">
	Element 'ram:GuaranteeMethodCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayeePartyCICreditorFinancialAccount/ram:AccountName">
      <report flag="warning" test=".">
	Element 'ram:AccountName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayeePartyCICreditorFinancialAccount/ram:IBANID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayeePartyCICreditorFinancialAccount/ram:ProprietaryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayeeSpecifiedCICreditorFinancialInstitution">
      <report flag="warning" test=".">
	Element 'ram:PayeeSpecifiedCICreditorFinancialInstitution' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerPartyCIDebtorFinancialAccount/ram:AccountName">
      <report flag="warning" test=".">
	Element 'ram:AccountName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerPartyCIDebtorFinancialAccount/ram:IBANID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerPartyCIDebtorFinancialAccount/ram:ProprietaryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:AustralianBSBID">
      <report flag="warning" test=".">
	Element 'ram:AustralianBSBID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:AustrianBankleitzahlID">
      <report flag="warning" test=".">
	Element 'ram:AustrianBankleitzahlID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:BICID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:CHIPSParticipantID">
      <report flag="warning" test=".">
	Element 'ram:CHIPSParticipantID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:CHIPSUniversalID">
      <report flag="warning" test=".">
	Element 'ram:CHIPSUniversalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:CanadianPaymentsAssociationID">
      <report flag="warning" test=".">
	Element 'ram:CanadianPaymentsAssociationID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:ClearingSystemName">
      <report flag="warning" test=".">
	Element 'ram:ClearingSystemName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:FedwireRoutingNumberID">
      <report flag="warning" test=".">
	Element 'ram:FedwireRoutingNumberID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:GermanBankleitzahlID">
      <report flag="warning" test=".">
	Element 'ram:GermanBankleitzahlID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:HellenicBankID">
      <report flag="warning" test=".">
	Element 'ram:HellenicBankID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:HongKongBankID">
      <report flag="warning" test=".">
	Element 'ram:HongKongBankID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:IndianFinancialSystemID">
      <report flag="warning" test=".">
	Element 'ram:IndianFinancialSystemID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:IrishNSCID">
      <report flag="warning" test=".">
	Element 'ram:IrishNSCID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:ItalianDomesticID">
      <report flag="warning" test=".">
	Element 'ram:ItalianDomesticID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:LocationFinancialInstitutionAddress">
      <report flag="warning" test=".">
	Element 'ram:LocationFinancialInstitutionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:NewZealandNCCID">
      <report flag="warning" test=".">
	Element 'ram:NewZealandNCCID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:PolishNationalClearingID">
      <report flag="warning" test=".">
	Element 'ram:PolishNationalClearingID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:PortugueseNCCID">
      <report flag="warning" test=".">
	Element 'ram:PortugueseNCCID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:RussianCentralBankID">
      <report flag="warning" test=".">
	Element 'ram:RussianCentralBankID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:SICID">
      <report flag="warning" test=".">
	Element 'ram:SICID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:SouthAfricanNCCID">
      <report flag="warning" test=".">
	Element 'ram:SouthAfricanNCCID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:SpanishDomesticInterbankingID">
      <report flag="warning" test=".">
	Element 'ram:SpanishDomesticInterbankingID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:SubDivisionBranchFinancialInstitution/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:SubDivisionBranchFinancialInstitution/ram:LocationFinancialInstitutionAddress">
      <report flag="warning" test=".">
	Element 'ram:LocationFinancialInstitutionAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:SubDivisionBranchFinancialInstitution/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:SwissBCID">
      <report flag="warning" test=".">
	Element 'ram:SwissBCID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PayerSpecifiedCIDebtorFinancialInstitution/ram:UKSortCodeID">
      <report flag="warning" test=".">
	Element 'ram:UKSortCodeID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PaymentChannelCode">
      <report flag="warning" test=".">
	Element 'ram:PaymentChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:PaymentMethodCode">
      <report flag="warning" test=".">
	Element 'ram:PaymentMethodCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:CardholderName">
      <report flag="warning" test=".">
	Element 'ram:CardholderName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:CreditAvailableAmount">
      <report flag="warning" test=".">
	Element 'ram:CreditAvailableAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:CreditLimitAmount">
      <report flag="warning" test=".">
	Element 'ram:CreditLimitAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:ExpiryDate">
      <report flag="warning" test=".">
	Element 'ram:ExpiryDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:InterestRatePercent">
      <report flag="warning" test=".">
	Element 'ram:InterestRatePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:MicrochipIndicator">
      <report flag="warning" test=".">
	Element 'ram:MicrochipIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:ValidFromDateTime">
      <report flag="warning" test=".">
	Element 'ram:ValidFromDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard/ram:VerificationNumeric">
      <report flag="warning" test=".">
	Element 'ram:VerificationNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax">
      <assert flag="warning" test="count(ram:CalculatedAmount)=1">
	Element 'ram:CalculatedAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:TypeCode)=1">
	Element 'ram:TypeCode' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:BasisAmount)=1">
	Element 'ram:BasisAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:CategoryCode)=1">
	Element 'ram:CategoryCode' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BasisAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CalculatedAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CalculationSequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:CalculationSequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CategoryCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CategoryName">
      <report flag="warning" test=".">
	Element 'ram:CategoryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:DueDateTypeCode">
      <report flag="warning" test=".">
	Element 'ram:DueDateTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:ExemptionReason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:PlaceApplicableCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:PlaceApplicableCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:RateApplicablePercent">
      <report flag="warning" test=".">
	Element 'ram:RateApplicablePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:SellerPayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerPayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:ServiceSupplyCITradeCountry">
      <report flag="warning" test=".">
	Element 'ram:ServiceSupplyCITradeCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:SpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:TaxBasisAllowanceRate">
      <report flag="warning" test=".">
	Element 'ram:TaxBasisAllowanceRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:TaxPointDate">
      <report flag="warning" test=".">
	Element 'ram:TaxPointDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:Type">
      <report flag="warning" test=".">
	Element 'ram:Type' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:TypeCode">
      <assert flag="warning" test="normalize-space(.)=&apos;VAT&apos;">
	'VAT' is the only allowed value of 'ram:TypeCode'.</assert>
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:TaxApplicableCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:TaxApplicableCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:TaxCurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:TaxCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:ApplicableCIIHSupplyChainTradeSettlement/ram:UltimatePayeeCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:UltimatePayeeCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem">
      <assert flag="warning" test="count(ram:SpecifiedCITradeProduct)=1">
	Element 'ram:SpecifiedCITradeProduct' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument">
      <assert flag="warning" test="count(ram:LineID)=1">
	Element 'ram:LineID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:IncludedCINote)&lt;=1">
	Element 'ram:IncludedCINote' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:IncludedCINote">
      <assert flag="warning" test="count(ram:Content)=1">
	Element 'ram:Content' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:IncludedCINote/ram:Content">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:IncludedCINote/ram:ContentCode">
      <report flag="warning" test=".">
	Element 'ram:ContentCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:IncludedCINote/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:IncludedCINote/ram:Subject">
      <report flag="warning" test=".">
	Element 'ram:Subject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:IncludedCINote/ram:SubjectCode">
      <report flag="warning" test=".">
	Element 'ram:SubjectCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:LineID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:LineStatusCode">
      <report flag="warning" test=".">
	Element 'ram:LineStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:LineStatusReasonCode">
      <report flag="warning" test=".">
	Element 'ram:LineStatusReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:AssociatedCIILDocumentLineDocument/ram:ParentLineID">
      <report flag="warning" test=".">
	Element 'ram:ParentLineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test=".">
	Element 'ram:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssuerAssignedID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:ApplicableCITradeDeliveryTerms">
      <report flag="warning" test=".">
	Element 'ram:ApplicableCITradeDeliveryTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:LineID)=1">
	Element 'ram:LineID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssuerAssignedID">
      <report flag="warning" test=".">
	Element 'ram:IssuerAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerReference">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:BuyerRequisitionerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BuyerRequisitionerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ContractReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:DemandForecastReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:DemandForecastReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice">
      <report flag="warning" test=".">
	Element 'ram:GrossPriceProductCITradePrice' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice">
      <assert flag="warning" test="count(ram:ChargeAmount)=1">
	Element 'ram:ChargeAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:AppliedCITradeAllowanceCharge)&lt;=1">
	Element 'ram:AppliedCITradeAllowanceCharge' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge">
      <assert flag="warning" test="count(ram:ActualAmount)=1">
	Element 'ram:ActualAmount' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:ActualAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:ActualCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:ActualCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:BasisAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:CalculationPercent">
      <report flag="warning" test=".">
	Element 'ram:CalculationPercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:CategoryCITradeTax">
      <report flag="warning" test=".">
	Element 'ram:CategoryCITradeTax' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:ChargeIndicator">
      <report flag="warning" test=".">
	Element 'ram:ChargeIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'ram:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:Reason">
      <report flag="warning" test=".">
	Element 'ram:Reason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:ReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:BasisQuantity">
      <assert flag="warning" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:ChangeReason">
      <report flag="warning" test=".">
	Element 'ram:ChangeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:ChargeAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:DeliveryCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:DeliveryCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'ram:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'ram:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:OrderUnitConversionFactorNumeric">
      <report flag="warning" test=".">
	Element 'ram:OrderUnitConversionFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:ReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:TradeComparisonReferencePrice">
      <report flag="warning" test=".">
	Element 'ram:TradeComparisonReferencePrice' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:ValidityCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:ValidityCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:PromotionalDealReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PromotionalDealReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:QuotationReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:RequisitionerReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:RequisitionerReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeAgreement/ram:SellerOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:SellerOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery">
      <assert flag="warning" test="count(ram:BilledQuantity)=1">
	Element 'ram:BilledQuantity' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ActualDeliveryCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:ActualDeliveryCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ActualDespatchCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:ActualDespatchCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ActualPickUpCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:ActualPickUpCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ActualReceiptCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:ActualReceiptCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:AdditionalReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:AdditionalReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:BilledQuantity">
      <assert flag="warning" test="@unitCode">
	Attribute '@unitCode' is required in this context.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ChargeFreeQuantity">
      <report flag="warning" test=".">
	Element 'ram:ChargeFreeQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ConsumptionReportReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ConsumptionReportReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:DeliveryNoteReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:DeliveryNoteReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:DespatchAdviceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:DespatchAdviceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:GrossWeightMeasure">
      <report flag="warning" test="@unitCode">
	Attribute '@unitCode' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:IncludedCISupplyChainPackaging">
      <report flag="warning" test=".">
	Element 'ram:IncludedCISupplyChainPackaging' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:NetWeightMeasure">
      <report flag="warning" test="@unitCode">
	Attribute '@unitCode' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:PackageQuantity">
      <report flag="warning" test=".">
	Element 'ram:PackageQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:PerPackageUnitQuantity">
      <report flag="warning" test=".">
	Element 'ram:PerPackageUnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ProductUnitQuantity">
      <report flag="warning" test="@unitCode">
	Attribute '@unitCode' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ReceivingAdviceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ReceivingAdviceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:RelatedCISupplyChainConsignment">
      <report flag="warning" test=".">
	Element 'ram:RelatedCISupplyChainConsignment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:RequestedDeliveryCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ShipFromCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ShipFromCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:ShipToCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ShipToCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:SpecifiedCIDeliveryAdjustment">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIDeliveryAdjustment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:TheoreticalWeightMeasure">
      <report flag="warning" test="@unitCode">
	Attribute '@unitCode' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeDelivery/ram:UltimateShipToCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:UltimateShipToCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement">
      <assert flag="warning" test="count(ram:ApplicableCITradeTax)&lt;=1">
	Element 'ram:ApplicableCITradeTax' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:SpecifiedCITradeAllowanceCharge)&lt;=1">
	Element 'ram:SpecifiedCITradeAllowanceCharge' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:SpecifiedCIILTradeSettlementMonetarySummation)=1">
	Element 'ram:SpecifiedCIILTradeSettlementMonetarySummation' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:AdditionalReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:AdditionalReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax">
      <assert flag="warning" test="count(ram:CalculatedAmount)=1">
	Element 'ram:CalculatedAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:TypeCode)=1">
	Element 'ram:TypeCode' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:CalculatedRate)=1">
	Element 'ram:CalculatedRate' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:CategoryCode)=1">
	Element 'ram:CategoryCode' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BasisAmount">
      <report flag="warning" test=".">
	Element 'ram:BasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CalculatedAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CalculationSequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:CalculationSequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CategoryCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CategoryName">
      <report flag="warning" test=".">
	Element 'ram:CategoryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:DueDateTypeCode">
      <report flag="warning" test=".">
	Element 'ram:DueDateTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ExemptionReason">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:PlaceApplicableCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:PlaceApplicableCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:RateApplicablePercent">
      <report flag="warning" test=".">
	Element 'ram:RateApplicablePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SellerPayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerPayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ServiceSupplyCITradeCountry">
      <report flag="warning" test=".">
	Element 'ram:ServiceSupplyCITradeCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TaxBasisAllowanceRate">
      <report flag="warning" test=".">
	Element 'ram:TaxBasisAllowanceRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TaxPointDate">
      <report flag="warning" test=".">
	Element 'ram:TaxPointDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:Type">
      <report flag="warning" test=".">
	Element 'ram:Type' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TypeCode">
      <assert flag="warning" test="normalize-space(.)=&apos;VAT&apos;">
	'VAT' is the only allowed value of 'ram:TypeCode'.</assert>
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:CompleteDateTime">
      <report flag="warning" test=".">
	Element 'ram:CompleteDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:ContinuousIndicator">
      <report flag="warning" test=".">
	Element 'ram:ContinuousIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:DurationMeasure">
      <report flag="warning" test=".">
	Element 'ram:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:InclusiveIndicator">
      <report flag="warning" test=".">
	Element 'ram:InclusiveIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:SeasonCode">
      <report flag="warning" test=".">
	Element 'ram:SeasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:BillingCISpecifiedPeriod/ram:StartDateFlexibilityCode">
      <report flag="warning" test=".">
	Element 'ram:StartDateFlexibilityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:InvoiceIssuerReference">
      <report flag="warning" test=".">
	Element 'ram:InvoiceIssuerReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:InvoiceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:InvoiceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:PayableSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:PayableSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:PaymentReference">
      <report flag="warning" test=".">
	Element 'ram:PaymentReference' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:PurchaseSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:PurchaseSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:ReceivableSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:ReceivableSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SalesSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SalesSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIFinancialAdjustment">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIFinancialAdjustment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation">
      <assert flag="warning" test="count(ram:LineTotalAmount)=1">
	Element 'ram:LineTotalAmount' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:AllowanceTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:ChargeTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:ChargeTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:GrossLineTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:LineTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:NetIncludingTaxesLineTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:NetIncludingTaxesLineTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:NetLineTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:NetLineTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:ProductWeightLossInformationAmount">
      <report flag="warning" test=".">
	Element 'ram:ProductWeightLossInformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:TaxBasisTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:TaxBasisTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:TaxTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:TaxTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:TotalAllowanceChargeAmount">
      <report flag="warning" test=".">
	Element 'ram:TotalAllowanceChargeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCIILTradeSettlementMonetarySummation/ram:TotalRetailValueInformationAmount">
      <report flag="warning" test=".">
	Element 'ram:TotalRetailValueInformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCILogisticsServiceCharge">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCILogisticsServiceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge">
      <assert flag="warning" test="count(ram:ChargeIndicator)=1">
	Element 'ram:ChargeIndicator' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:ActualAmount)=1">
	Element 'ram:ActualAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Reason)=1">
	Element 'ram:Reason' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ActualAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ActualCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:ActualCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:BasisAmount">
      <report flag="warning" test=".">
	Element 'ram:BasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CalculationPercent">
      <report flag="warning" test=".">
	Element 'ram:CalculationPercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax">
      <report flag="warning" test=".">
	Element 'ram:CategoryCITradeTax' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:PrepaidIndicator">
      <report flag="warning" test=".">
	Element 'ram:PrepaidIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:Reason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradePaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SpecifiedTradeSettlementFinancialCard">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedTradeSettlementFinancialCard' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BasisAmount">
      <report flag="warning" test=".">
	Element 'ram:BasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CalculatedAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CalculationSequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:CalculationSequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CategoryCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CategoryName">
      <report flag="warning" test=".">
	Element 'ram:CategoryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:DueDateTypeCode">
      <report flag="warning" test=".">
	Element 'ram:DueDateTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:ExemptionReason">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:PlaceApplicableCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:PlaceApplicableCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:RateApplicablePercent">
      <report flag="warning" test=".">
	Element 'ram:RateApplicablePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:SellerPayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerPayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:ServiceSupplyCITradeCountry">
      <report flag="warning" test=".">
	Element 'ram:ServiceSupplyCITradeCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:SpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:TaxBasisAllowanceRate">
      <report flag="warning" test=".">
	Element 'ram:TaxBasisAllowanceRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:TaxPointDate">
      <report flag="warning" test=".">
	Element 'ram:TaxPointDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:Type">
      <report flag="warning" test=".">
	Element 'ram:Type' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCIILSupplyChainTradeSettlement/ram:SubtotalCalculatedCITradeTax/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct">
      <assert flag="warning" test="count(ram:Name)&lt;=1">
	Element 'ram:Name' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:AdditionalReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:AdditionalReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIMaterialGoodsCharacteristic">
      <report flag="warning" test=".">
	Element 'ram:ApplicableCIMaterialGoodsCharacteristic' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic">
      <assert flag="warning" test="count(ram:Description)&lt;=1">
	Element 'ram:Description' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ApplicableProductCharacteristicCondition">
      <report flag="warning" test=".">
	Element 'ram:ApplicableProductCharacteristicCondition' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ApplicableReferencedStandard">
      <report flag="warning" test=".">
	Element 'ram:ApplicableReferencedStandard' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ContentTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ContentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:MeasurementMethodCode">
      <report flag="warning" test=".">
	Element 'ram:MeasurementMethodCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueCode">
      <report flag="warning" test=".">
	Element 'ram:ValueCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueDateTime">
      <report flag="warning" test=".">
	Element 'ram:ValueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueIndicator">
      <report flag="warning" test=".">
	Element 'ram:ValueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueMeasure">
      <report flag="warning" test=".">
	Element 'ram:ValueMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:ValueSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:AreaDensityMeasure">
      <report flag="warning" test=".">
	Element 'ram:AreaDensityMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:BrandName">
      <report flag="warning" test=".">
	Element 'ram:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:BrandOwnerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BrandOwnerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:BuyerAssignedID">
      <report flag="warning" test=".">
	Element 'ram:BuyerAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:CertificationEvidenceReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:CertificationEvidenceReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ColourCode">
      <report flag="warning" test=".">
	Element 'ram:ColourCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ColourDescription">
      <report flag="warning" test=".">
	Element 'ram:ColourDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification">
      <assert flag="warning" test="count(ram:SystemID)=1">
	Element 'ram:SystemID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:ClassCode)=1">
	Element 'ram:ClassCode' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:ClassName)&lt;=1">
	Element 'ram:ClassName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ApplicableReferencedStandard">
      <report flag="warning" test=".">
	Element 'ram:ApplicableReferencedStandard' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ClassCIProductCharacteristic">
      <report flag="warning" test=".">
	Element 'ram:ClassCIProductCharacteristic' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ClassCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyName">
	Attribute '@listAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ClassName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:SubClassCode">
      <report flag="warning" test=".">
	Element 'ram:SubClassCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:SystemID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:SystemName">
      <report flag="warning" test=".">
	Element 'ram:SystemName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:Designation">
      <report flag="warning" test=".">
	Element 'ram:Designation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DrainedNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:DrainedNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:EndItemName">
      <report flag="warning" test=".">
	Element 'ram:EndItemName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:EndItemTypeCode">
      <report flag="warning" test=".">
	Element 'ram:EndItemTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:GlobalID">
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:IndividualCITradeProductInstance">
      <report flag="warning" test=".">
	Element 'ram:IndividualCITradeProductInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:InformationCINote">
      <report flag="warning" test=".">
	Element 'ram:InformationCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:InspectionReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:InspectionReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:LatestProductDataChangeDateTime">
      <report flag="warning" test=".">
	Element 'ram:LatestProductDataChangeDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:LegalRightsOwnerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:LegalRightsOwnerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:LinearCISpatialDimension">
      <report flag="warning" test=".">
	Element 'ram:LinearCISpatialDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:MSDSReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:MSDSReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ManufacturerAssignedID">
      <report flag="warning" test=".">
	Element 'ram:ManufacturerAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ManufacturerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ManufacturerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:MaximumLinearCISpatialDimension">
      <report flag="warning" test=".">
	Element 'ram:MaximumLinearCISpatialDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:MinimumLinearCISpatialDimension">
      <report flag="warning" test=".">
	Element 'ram:MinimumLinearCISpatialDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:OriginCITradeCountry">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:OriginCITradeCountry/ram:ID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:OriginCITradeCountry/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:OriginCITradeCountry/ram:SubordinateCITradeCountrySubDivision">
      <report flag="warning" test=".">
	Element 'ram:SubordinateCITradeCountrySubDivision' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:PresentationSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:PresentationSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ProductGroupID">
      <report flag="warning" test=".">
	Element 'ram:ProductGroupID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:SellerAssignedID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeName">
	Attribute '@schemeName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyName">
	Attribute '@schemeAgencyName' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeDataURI">
	Attribute '@schemeDataURI' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeURI">
	Attribute '@schemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:SubBrandName">
      <report flag="warning" test=".">
	Element 'ram:SubBrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:TradeName">
      <report flag="warning" test=".">
	Element 'ram:TradeName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:UseDescription">
      <report flag="warning" test=".">
	Element 'ram:UseDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:CIIHSupplyChainTradeTransaction/ram:IncludedCIILSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:VariableMeasureIndicator">
      <report flag="warning" test=".">
	Element 'ram:VariableMeasureIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryInvoice/rsm:ValuationBreakdownStatement">
      <report flag="warning" test=".">
	Element 'rsm:ValuationBreakdownStatement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
</schema>
