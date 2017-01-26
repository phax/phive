<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    schemaVersion="iso">
  <title>BII2 CORE restrictions for Order Transaction (T01) CrossIndustryOrder_3p0-D11A</title>
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
  <ns uri="urn:un:unece:uncefact:data:standard:CrossIndustryOrder:3" prefix="rsm"/>
  <ns uri="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:10" prefix="udt"/>
  <ns uri="urn:un:unece:uncefact:documentation:standard:CoreComponentsTechnicalSpecification:2" prefix="ccts"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:5:ISO316612A:SecondEdition2006VI-10" prefix="ids5ISO316612A"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:ISO:ISOAlpha2LanguageCode:20061027" prefix="ids5ISO63912A"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:UNECE:FreightCostCode:4" prefix="ids6Recommendation23"/>
  <ns uri="urn:un:unece:uncefact:identifierlist:standard:UNECE:PaymentTermsDescriptionIdentifier:D10B" prefix="ids64277"/>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext">
      <assert flag="warning" test="count(ram:BusinessProcessSpecifiedCIDocumentContextParameter)=1">
	Element 'ram:BusinessProcessSpecifiedCIDocumentContextParameter' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:GuidelineSpecifiedCIDocumentContextParameter)=1">
	Element 'ram:GuidelineSpecifiedCIDocumentContextParameter' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:ApplicationSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:ApplicationSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:BIMSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:BIMSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter/ram:SpecifiedCIDocumentVersion">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIDocumentVersion' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:BusinessProcessSpecifiedCIDocumentContextParameter/ram:Value">
      <report flag="warning" test=".">
	Element 'ram:Value' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter/ram:SpecifiedCIDocumentVersion">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIDocumentVersion' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:GuidelineSpecifiedCIDocumentContextParameter/ram:Value">
      <report flag="warning" test=".">
	Element 'ram:Value' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:MessageStandardSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:MessageStandardSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:ScenarioSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:ScenarioSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:SpecifiedTransactionID">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedTransactionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIExchangedDocumentContext/ram:SubsetSpecifiedCIDocumentContextParameter">
      <report flag="warning" test=".">
	Element 'ram:SubsetSpecifiedCIDocumentContextParameter' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument">
      <assert flag="warning" test="count(ram:IncludedCINote)&lt;=1">
	Element 'ram:IncludedCINote' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:CategoryCode">
      <report flag="warning" test=".">
	Element 'ram:CategoryCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:CompleteDateTime">
      <report flag="warning" test=".">
	Element 'ram:CompleteDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:ContinuousIndicator">
      <report flag="warning" test=".">
	Element 'ram:ContinuousIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:DurationMeasure">
      <report flag="warning" test=".">
	Element 'ram:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:InclusiveIndicator">
      <report flag="warning" test=".">
	Element 'ram:InclusiveIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:SeasonCode">
      <report flag="warning" test=".">
	Element 'ram:SeasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:StartDateFlexibilityCode">
      <report flag="warning" test=".">
	Element 'ram:StartDateFlexibilityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:EffectiveCISpecifiedPeriod/ram:StartDateTime">
      <report flag="warning" test=".">
	Element 'ram:StartDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:IncludedCINote">
      <assert flag="warning" test="count(ram:Content)&lt;=1">
	Element 'ram:Content' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:IncludedCINote/ram:Content">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:IncludedCINote/ram:ContentCode">
      <report flag="warning" test=".">
	Element 'ram:ContentCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:IncludedCINote/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:IncludedCINote/ram:Subject">
      <report flag="warning" test=".">
	Element 'ram:Subject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:IncludedCINote/ram:SubjectCode">
      <report flag="warning" test=".">
	Element 'ram:SubjectCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:LanguageID">
      <report flag="warning" test=".">
	Element 'ram:LanguageID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:PurposeCode">
      <report flag="warning" test=".">
	Element 'ram:PurposeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:ResponseReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ResponseReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:RevisionDateTime">
      <report flag="warning" test=".">
	Element 'ram:RevisionDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:TypeCode">
      <report flag="warning" test="@listID">
	Attribute '@listID' marked as not used in the given context.</report>
      <report flag="warning" test="@listAgencyID">
	Attribute '@listAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@listVersionID">
	Attribute '@listVersionID' marked as not used in the given context.</report>
      <report flag="warning" test="@name">
	Attribute '@name' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHExchangedDocument/ram:VersionID">
      <report flag="warning" test=".">
	Element 'ram:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction">
      <assert flag="warning" test="count(ram:IncludedCIOLSupplyChainTradeLineItem)&gt;=1">
	Element 'ram:IncludedCIOLSupplyChainTradeLineItem' must occur at least 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement">
      <assert flag="warning" test="count(ram:SellerCITradeParty)=1">
	Element 'ram:SellerCITradeParty' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:BuyerCITradeParty)=1">
	Element 'ram:BuyerCITradeParty' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:ContractReferencedCIReferencedDocument)&lt;=1">
	Element 'ram:ContractReferencedCIReferencedDocument' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:IssuerAssignedID)=1">
	Element 'ram:IssuerAssignedID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Information)&lt;=1">
	Element 'ram:Information' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:Access">
      <report flag="warning" test=".">
	Element 'ram:Access' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:AccessAvailabilitySpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:AccessAvailabilitySpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:AuthorName">
      <report flag="warning" test=".">
	Element 'ram:AuthorName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:CharacterSetCode">
      <report flag="warning" test=".">
	Element 'ram:CharacterSetCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:EncodingCode">
      <report flag="warning" test=".">
	Element 'ram:EncodingCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:FileName">
      <report flag="warning" test=".">
	Element 'ram:FileName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:IncludedBinaryObject">
      <report flag="warning" test="@uri">
	Attribute '@uri' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:MIMECode">
      <report flag="warning" test=".">
	Element 'ram:MIMECode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:SizeMeasure">
      <report flag="warning" test=".">
	Element 'ram:SizeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:Title">
      <report flag="warning" test=".">
	Element 'ram:Title' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:URIID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile/ram:VersionID">
      <report flag="warning" test=".">
	Element 'ram:VersionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssuerAssignedID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BlanketOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:BlanketOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerAssignedAccountantCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BuyerAssignedAccountantCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty">
      <assert flag="warning" test="count(ram:ID)&lt;=1">
	Element 'ram:ID' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:DefinedCITradeContact)&lt;=1">
	Element 'ram:DefinedCITradeContact' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:SpecifiedCITaxRegistration)&lt;=1">
	Element 'ram:SpecifiedCITaxRegistration' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:DirectTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:DirectTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication">
      <assert flag="warning" test="count(ram:URIID)=1">
	Element 'ram:URIID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test=".">
	Element 'ram:CompleteNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:URIID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:InstantMessagingCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:InstantMessagingCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:JobTitle">
      <report flag="warning" test=".">
	Element 'ram:JobTitle' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:MobileTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:MobileTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:PersonID">
      <report flag="warning" test=".">
	Element 'ram:PersonID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:PersonName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:Responsibility">
      <report flag="warning" test=".">
	Element 'ram:Responsibility' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCIContactPerson">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIContactPerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCINote">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TelexCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:TelexCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:DefinedCITradeContact/ram:VOIPCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:VOIPCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:EndPointURICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:EndPointURICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress">
      <assert flag="warning" test="count(ram:CountrySubDivisionName)&lt;=1">
	Element 'ram:CountrySubDivisionName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:PostcodeCode">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration">
      <report flag="warning" test=".">
	Element 'ram:AuthorizedCILegalRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:LegalClassificationCode">
      <report flag="warning" test=".">
	Element 'ram:LegalClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test=".">
	Element 'ram:LineOne' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test=".">
	Element 'ram:LineTwo' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test=".">
	Element 'ram:PostcodeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax">
      <report flag="warning" test=".">
	Element 'ram:AssociatedCIRegisteredTax' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:SpecifiedCITaxRegistration/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerCITradeParty/ram:URICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:URICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:IssuerAssignedID)=1">
	Element 'ram:IssuerAssignedID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test=".">
	Element 'ram:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssuerAssignedID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:BuyerReference">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:IssuerAssignedID)=1">
	Element 'ram:IssuerAssignedID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Information)&lt;=1">
	Element 'ram:Information' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:IssuerAssignedID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:EngineeringChangeReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:EngineeringChangeReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ExportLicenceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ExportLicenceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:ImportLicenceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ImportLicenceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:LetterOfCreditReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:LetterOfCreditReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:MarketplaceOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:MarketplaceOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:OriginalOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:OriginalOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:PreviousOrderChangeReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PreviousOrderChangeReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:PreviousOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PreviousOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:PreviousOrderResponseReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PreviousOrderResponseReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:PriceListReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PriceListReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:IssuerAssignedID)=1">
	Element 'ram:IssuerAssignedID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test=".">
	Element 'ram:Information' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:IssuerAssignedID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequestForQuotationReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:RequestForQuotationReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument">
      <assert flag="warning" test="count(ram:IssuerAssignedID)=1">
	Element 'ram:IssuerAssignedID' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Information)&lt;=1">
	Element 'ram:Information' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:AttachedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:AttachedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:CopyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CopyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:EffectiveCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:EffectiveCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:Information">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:IssueDateTime">
      <report flag="warning" test=".">
	Element 'ram:IssueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:IssuerAssignedID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:IssuerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:IssuerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:LineID">
      <report flag="warning" test=".">
	Element 'ram:LineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:PreviousRevisionID">
      <report flag="warning" test=".">
	Element 'ram:PreviousRevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:ReferenceTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ReferenceTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:RevisionID">
      <report flag="warning" test=".">
	Element 'ram:RevisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:SectionName">
      <report flag="warning" test=".">
	Element 'ram:SectionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:StatusCode">
      <report flag="warning" test=".">
	Element 'ram:StatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SalesReportReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:SalesReportReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty">
      <assert flag="warning" test="count(ram:ID)&lt;=1">
	Element 'ram:ID' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:DefinedCITradeContact)&lt;=1">
	Element 'ram:DefinedCITradeContact' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:DirectTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:DirectTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication">
      <assert flag="warning" test="count(ram:URIID)=1">
	Element 'ram:URIID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test=".">
	Element 'ram:CompleteNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:URIID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication">
      <assert flag="warning" test="count(ram:CompleteNumber)=1">
	Element 'ram:CompleteNumber' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:InstantMessagingCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:InstantMessagingCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:JobTitle">
      <report flag="warning" test=".">
	Element 'ram:JobTitle' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:MobileTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:MobileTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:PersonID">
      <report flag="warning" test=".">
	Element 'ram:PersonID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:PersonName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:Responsibility">
      <report flag="warning" test=".">
	Element 'ram:Responsibility' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCIContactPerson">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIContactPerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCINote">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication">
      <assert flag="warning" test="count(ram:CompleteNumber)=1">
	Element 'ram:CompleteNumber' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TelexCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:TelexCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:DefinedCITradeContact/ram:VOIPCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:VOIPCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:EndPointURICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:EndPointURICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress">
      <assert flag="warning" test="count(ram:CountrySubDivisionName)&lt;=1">
	Element 'ram:CountrySubDivisionName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:PostcodeCode">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration">
      <report flag="warning" test=".">
	Element 'ram:AuthorizedCILegalRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:LegalClassificationCode">
      <report flag="warning" test=".">
	Element 'ram:LegalClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test=".">
	Element 'ram:LineOne' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test=".">
	Element 'ram:LineTwo' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test=".">
	Element 'ram:PostcodeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:SpecifiedCITaxRegistration">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITaxRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerCITradeParty/ram:URICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:URICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeAgreement/ram:SellerOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:SellerOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery">
      <assert flag="warning" test="count(ram:PlannedCISupplyChainConsignment)&lt;=1">
	Element 'ram:PlannedCISupplyChainConsignment' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:DeliveryCIDeliveryInstructions">
      <report flag="warning" test=".">
	Element 'ram:DeliveryCIDeliveryInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:AssociatedInvoiceAmount">
      <report flag="warning" test=".">
	Element 'ram:AssociatedInvoiceAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:CarrierCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:CarrierCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:ConsigneeCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ConsigneeCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:ConsignorCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ConsignorCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:CustomsExportAgentCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:CustomsExportAgentCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:CustomsImportAgentCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:CustomsImportAgentCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeclaredValueForCustomsAmount">
      <report flag="warning" test=".">
	Element 'ram:DeclaredValueForCustomsAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty">
      <assert flag="warning" test="count(ram:ID)&lt;=1">
	Element 'ram:ID' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:DefinedCITradeContact)&lt;=1">
	Element 'ram:DefinedCITradeContact' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:DirectTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:DirectTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test=".">
	Element 'ram:CompleteNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:URIID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:InstantMessagingCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:InstantMessagingCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:JobTitle">
      <report flag="warning" test=".">
	Element 'ram:JobTitle' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:MobileTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:MobileTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:PersonID">
      <report flag="warning" test=".">
	Element 'ram:PersonID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:PersonName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:Responsibility">
      <report flag="warning" test=".">
	Element 'ram:Responsibility' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCIContactPerson">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIContactPerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCINote">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:TelexCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:TelexCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:DefinedCITradeContact/ram:VOIPCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:VOIPCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:EndPointURICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:EndPointURICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress">
      <assert flag="warning" test="count(ram:CountrySubDivisionName)&lt;=1">
	Element 'ram:CountrySubDivisionName' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:PostcodeCode">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:SpecifiedCILegalOrganization">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCILegalOrganization' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:SpecifiedCITaxRegistration">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITaxRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:DeliveryCITradeParty/ram:URICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:URICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:FreightForwarderCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:FreightForwarderCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:GrossVolumeMeasure">
      <report flag="warning" test=".">
	Element 'ram:GrossVolumeMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:GroupingCentreCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:GroupingCentreCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:PackageQuantity">
      <report flag="warning" test=".">
	Element 'ram:PackageQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:SpecifiedCILogisticsTransportMovement">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCILogisticsTransportMovement' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:TotalChargeAmount">
      <report flag="warning" test=".">
	Element 'ram:TotalChargeAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:TransportContractCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:TransportContractCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment/ram:UtilizedCILogisticsTransportEquipment">
      <report flag="warning" test=".">
	Element 'ram:UtilizedCILogisticsTransportEquipment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:DescriptionBinaryObject">
      <report flag="warning" test=".">
	Element 'ram:DescriptionBinaryObject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:EarliestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:EarliestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:LatestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:LatestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PhysicalCIGeographicalCoordinate">
      <report flag="warning" test=".">
	Element 'ram:PhysicalCIGeographicalCoordinate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:PostcodeCode">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod">
      <assert flag="warning" test="count(ram:StartDateTime)=1">
	Element 'ram:StartDateTime' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:EndDateTime)=1">
	Element 'ram:EndDateTime' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:CompleteDateTime">
      <report flag="warning" test=".">
	Element 'ram:CompleteDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:ContinuousIndicator">
      <report flag="warning" test=".">
	Element 'ram:ContinuousIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:DurationMeasure">
      <report flag="warning" test=".">
	Element 'ram:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:InclusiveIndicator">
      <report flag="warning" test=".">
	Element 'ram:InclusiveIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:SeasonCode">
      <report flag="warning" test=".">
	Element 'ram:SeasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:StartDateFlexibilityCode">
      <report flag="warning" test=".">
	Element 'ram:StartDateFlexibilityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:OccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:OccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDeliveryCISupplyChainEvent/ram:UnitQuantity">
      <report flag="warning" test=".">
	Element 'ram:UnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedDespatchCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:PlannedDespatchCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:PlannedReleaseCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:PlannedReleaseCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipFromCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ShipFromCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:DirectTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:DirectTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test=".">
	Element 'ram:CompleteNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:EmailURICIUniversalCommunication/ram:URIID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:FaxCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:InstantMessagingCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:InstantMessagingCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:JobTitle">
      <report flag="warning" test=".">
	Element 'ram:JobTitle' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:MobileTelephoneCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:MobileTelephoneCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:PersonID">
      <report flag="warning" test=".">
	Element 'ram:PersonID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:PersonName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:Responsibility">
      <report flag="warning" test=".">
	Element 'ram:Responsibility' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCIContactPerson">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCIContactPerson' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:SpecifiedCINote">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:ChannelCode">
      <report flag="warning" test=".">
	Element 'ram:ChannelCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:CompleteNumber">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:TelephoneCIUniversalCommunication/ram:URIID">
      <report flag="warning" test=".">
	Element 'ram:URIID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:TelexCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:TelexCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:DefinedCITradeContact/ram:VOIPCIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:VOIPCIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:EndPointURICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:EndPointURICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:PostalCITradeAddress">
      <report flag="warning" test=".">
	Element 'ram:PostalCITradeAddress' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:SpecifiedCILegalOrganization">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCILegalOrganization' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:SpecifiedCITaxRegistration">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITaxRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeDelivery/ram:ShipToCITradeParty/ram:URICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:URICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:ApplicableCITradeTax">
      <report flag="warning" test=".">
	Element 'ram:ApplicableCITradeTax' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:DuePayableAmount">
      <report flag="warning" test=".">
	Element 'ram:DuePayableAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceApplicableCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:InvoiceApplicableCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceCurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:InvoiceCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty">
      <assert flag="warning" test="count(ram:ID)&lt;=1">
	Element 'ram:ID' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:SpecifiedCITaxRegistration)&lt;=1">
	Element 'ram:SpecifiedCITaxRegistration' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:DefinedCITradeContact">
      <report flag="warning" test=".">
	Element 'ram:DefinedCITradeContact' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:EndPointURICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:EndPointURICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:GlobalID">
      <report flag="warning" test=".">
	Element 'ram:GlobalID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:LogoAssociatedSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:LogoAssociatedSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:PostcodeCode">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:RoleCode">
      <report flag="warning" test=".">
	Element 'ram:RoleCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:AuthorizedCILegalRegistration">
      <report flag="warning" test=".">
	Element 'ram:AuthorizedCILegalRegistration' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:LegalClassificationCode">
      <report flag="warning" test=".">
	Element 'ram:LegalClassificationCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AdditionalStreetName">
      <report flag="warning" test=".">
	Element 'ram:AdditionalStreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:AttentionOf">
      <report flag="warning" test=".">
	Element 'ram:AttentionOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingName">
      <report flag="warning" test=".">
	Element 'ram:BuildingName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:BuildingNumber">
      <report flag="warning" test=".">
	Element 'ram:BuildingNumber' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CareOf">
      <report flag="warning" test=".">
	Element 'ram:CareOf' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CityName">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CitySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CitySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryID">
      <report flag="warning" test="@schemeID">
	Attribute '@schemeID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeAgencyID">
	Attribute '@schemeAgencyID' marked as not used in the given context.</report>
      <report flag="warning" test="@schemeVersionID">
	Attribute '@schemeVersionID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountryName">
      <report flag="warning" test=".">
	Element 'ram:CountryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionID">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:CountrySubDivisionName">
      <report flag="warning" test=".">
	Element 'ram:CountrySubDivisionName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:DepartmentName">
      <report flag="warning" test=".">
	Element 'ram:DepartmentName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFive">
      <report flag="warning" test=".">
	Element 'ram:LineFive' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineFour">
      <report flag="warning" test=".">
	Element 'ram:LineFour' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineOne">
      <report flag="warning" test=".">
	Element 'ram:LineOne' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineThree">
      <report flag="warning" test=".">
	Element 'ram:LineThree' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:LineTwo">
      <report flag="warning" test=".">
	Element 'ram:LineTwo' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostOfficeBox">
      <report flag="warning" test=".">
	Element 'ram:PostOfficeBox' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:PostcodeCode">
      <report flag="warning" test=".">
	Element 'ram:PostcodeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCILegalOrganization/ram:PostalCITradeAddress/ram:StreetName">
      <report flag="warning" test=".">
	Element 'ram:StreetName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCITaxRegistration">
      <assert flag="warning" test="count(ram:ID)=1">
	Element 'ram:ID' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCITaxRegistration/ram:AssociatedCIRegisteredTax">
      <report flag="warning" test=".">
	Element 'ram:AssociatedCIRegisteredTax' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:SpecifiedCITaxRegistration/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:InvoiceeCITradeParty/ram:URICIUniversalCommunication">
      <report flag="warning" test=".">
	Element 'ram:URICIUniversalCommunication' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:OrderApplicableCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:OrderApplicableCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:OrderCurrencyCode">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:PayableSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:PayableSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:PayerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:PayerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:PriceApplicableCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:PriceApplicableCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:PriceCurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:PriceCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:PurchaseSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:PurchaseSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation">
      <assert flag="warning" test="count(ram:LineTotalAmount)=1">
	Element 'ram:LineTotalAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:ChargeTotalAmount)&lt;=1">
	Element 'ram:ChargeTotalAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:AllowanceTotalAmount)&lt;=1">
	Element 'ram:AllowanceTotalAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:TaxTotalAmount)&lt;=1">
	Element 'ram:TaxTotalAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:RoundingAmount)&lt;=1">
	Element 'ram:RoundingAmount' may occur at maximum 1 times.</assert>
      <assert flag="warning" test="count(ram:GrandTotalAmount)=1">
	Element 'ram:GrandTotalAmount' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation/ram:AllowanceTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation/ram:ChargeTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation/ram:GrandTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation/ram:LineTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation/ram:RoundingAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation/ram:TaxBasisTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCIOHTradeSettlementMonetarySummation/ram:TaxTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge">
      <assert flag="warning" test="count(ram:ChargeIndicator)=1">
	Element 'ram:ChargeIndicator' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:ActualAmount)=1">
	Element 'ram:ActualAmount' must occur exactly 1 times.</assert>
      <assert flag="warning" test="count(ram:Reason)=1">
	Element 'ram:Reason' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ActualAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ActualCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:ActualCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:BasisAmount">
      <report flag="warning" test=".">
	Element 'ram:BasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CalculationPercent">
      <report flag="warning" test=".">
	Element 'ram:CalculationPercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:CategoryCITradeTax">
      <report flag="warning" test=".">
	Element 'ram:CategoryCITradeTax' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:Reason">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:ReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradePaymentTerms">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradePaymentTerms' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:SpecifiedCITradeSettlementPaymentMeans">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeSettlementPaymentMeans' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:TaxApplicableCITradeCurrencyExchange">
      <report flag="warning" test=".">
	Element 'ram:TaxApplicableCITradeCurrencyExchange' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:ApplicableCIOHSupplyChainTradeSettlement/ram:TaxCurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:TaxCurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem">
      <assert flag="warning" test="count(ram:SpecifiedCITradeProduct)=1">
	Element 'ram:SpecifiedCITradeProduct' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument">
      <assert flag="warning" test="count(ram:IncludedCINote)&lt;=1">
	Element 'ram:IncludedCINote' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:IncludedCINote">
      <assert flag="warning" test="count(ram:Content)=1">
	Element 'ram:Content' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:IncludedCINote/ram:Content">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:IncludedCINote/ram:ContentCode">
      <report flag="warning" test=".">
	Element 'ram:ContentCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:IncludedCINote/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:IncludedCINote/ram:Subject">
      <report flag="warning" test=".">
	Element 'ram:Subject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:IncludedCINote/ram:SubjectCode">
      <report flag="warning" test=".">
	Element 'ram:SubjectCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:LineID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:LineStatusCode">
      <report flag="warning" test=".">
	Element 'ram:LineStatusCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:LineStatusReasonCode">
      <report flag="warning" test=".">
	Element 'ram:LineStatusReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:AssociatedCIOLDocumentLineDocument/ram:UUIDLineID">
      <report flag="warning" test=".">
	Element 'ram:UUIDLineID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:AdditionalReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:AdditionalReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:BlanketOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:BlanketOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:BuyerOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:BuyerOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:BuyerReference">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:BuyerRequisitionerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BuyerRequisitionerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:CatalogueReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:CatalogueReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:ContractReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ContractReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:EngineeringChangeReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:EngineeringChangeReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:ExportLicenceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ExportLicenceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice">
      <assert flag="warning" test="count(ram:ChargeAmount)=1">
	Element 'ram:ChargeAmount' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge">
      <report flag="warning" test=".">
	Element 'ram:AppliedCITradeAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:ChangeReason">
      <report flag="warning" test=".">
	Element 'ram:ChangeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:ChargeAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:DeliveryCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:DeliveryCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'ram:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'ram:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:OrderUnitConversionFactorNumeric">
      <report flag="warning" test=".">
	Element 'ram:OrderUnitConversionFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:ReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:TradeComparisonReferencePrice">
      <report flag="warning" test=".">
	Element 'ram:TradeComparisonReferencePrice' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:GrossPriceProductCITradePrice/ram:ValidityCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:ValidityCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:ImportLicenceReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ImportLicenceReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:LetterOfCreditReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:LetterOfCreditReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:MarketplaceOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:MarketplaceOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice">
      <assert flag="warning" test="count(ram:ChargeAmount)=1">
	Element 'ram:ChargeAmount' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:AppliedCITradeAllowanceCharge">
      <report flag="warning" test=".">
	Element 'ram:AppliedCITradeAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:ChangeReason">
      <report flag="warning" test=".">
	Element 'ram:ChangeReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:DeliveryCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:DeliveryCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:MaximumQuantity">
      <report flag="warning" test=".">
	Element 'ram:MaximumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:MinimumQuantity">
      <report flag="warning" test=".">
	Element 'ram:MinimumQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:OrderUnitConversionFactorNumeric">
      <report flag="warning" test=".">
	Element 'ram:OrderUnitConversionFactorNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:ReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:ReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:TradeComparisonReferencePrice">
      <report flag="warning" test=".">
	Element 'ram:TradeComparisonReferencePrice' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:NetPriceProductCITradePrice/ram:ValidityCISpecifiedPeriod">
      <report flag="warning" test=".">
	Element 'ram:ValidityCISpecifiedPeriod' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:OriginalOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:OriginalOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:PreviousOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:PreviousOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:QuotationReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:QuotationReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:RequestForQuotationReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:RequestForQuotationReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:RequisitionReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:RequisitionReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:SalesReportReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:SalesReportReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:SellerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:SellerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeAgreement/ram:SellerOrderReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:SellerOrderReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery">
      <assert flag="warning" test="count(ram:RequestedQuantity)=1">
	Element 'ram:RequestedQuantity' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:AdditionalReferencedCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:AdditionalReferencedCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:AgreedQuantity">
      <report flag="warning" test=".">
	Element 'ram:AgreedQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:ConfirmedDeliveryCISupplyChainEvent">
      <report flag="warning" test=".">
	Element 'ram:ConfirmedDeliveryCISupplyChainEvent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:DeliveryCIDeliveryInstructions">
      <report flag="warning" test=".">
	Element 'ram:DeliveryCIDeliveryInstructions' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:PlannedCISupplyChainConsignment">
      <report flag="warning" test=".">
	Element 'ram:PlannedCISupplyChainConsignment' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:ProjectedCISupplyChainSupplyPlan">
      <report flag="warning" test=".">
	Element 'ram:ProjectedCISupplyChainSupplyPlan' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:DescriptionBinaryObject">
      <report flag="warning" test=".">
	Element 'ram:DescriptionBinaryObject' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:EarliestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:EarliestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:LatestOccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:LatestOccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCILogisticsLocation">
      <report flag="warning" test=".">
	Element 'ram:OccurrenceCILogisticsLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:CompleteDateTime">
      <report flag="warning" test=".">
	Element 'ram:CompleteDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:ContinuousIndicator">
      <report flag="warning" test=".">
	Element 'ram:ContinuousIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:Description">
      <report flag="warning" test=".">
	Element 'ram:Description' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:DurationMeasure">
      <report flag="warning" test=".">
	Element 'ram:DurationMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:InclusiveIndicator">
      <report flag="warning" test=".">
	Element 'ram:InclusiveIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:Name">
      <report flag="warning" test=".">
	Element 'ram:Name' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:SeasonCode">
      <report flag="warning" test=".">
	Element 'ram:SeasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:SequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:SequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceCISpecifiedPeriod/ram:StartDateFlexibilityCode">
      <report flag="warning" test=".">
	Element 'ram:StartDateFlexibilityCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:OccurrenceDateTime">
      <report flag="warning" test=".">
	Element 'ram:OccurrenceDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:RequestedDeliveryCISupplyChainEvent/ram:UnitQuantity">
      <report flag="warning" test=".">
	Element 'ram:UnitQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:ShipFromCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ShipFromCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeDelivery/ram:ShipToCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ShipToCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement">
      <assert flag="warning" test="count(ram:ApplicableCITradeTax)&lt;=1">
	Element 'ram:ApplicableCITradeTax' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax">
      <assert flag="warning" test="count(ram:CalculatedAmount)&lt;=1">
	Element 'ram:CalculatedAmount' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BasisAmount">
      <report flag="warning" test=".">
	Element 'ram:BasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BasisQuantity">
      <report flag="warning" test=".">
	Element 'ram:BasisQuantity' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerNonDeductibleTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:BuyerRepayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CalculatedAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CalculationSequenceNumeric">
      <report flag="warning" test=".">
	Element 'ram:CalculationSequenceNumeric' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CategoryCode">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CategoryName">
      <report flag="warning" test=".">
	Element 'ram:CategoryName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CurrencyCode">
      <report flag="warning" test=".">
	Element 'ram:CurrencyCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:CustomsDutyIndicator">
      <report flag="warning" test=".">
	Element 'ram:CustomsDutyIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:DueDateTypeCode">
      <report flag="warning" test=".">
	Element 'ram:DueDateTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ExemptionReason">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReason' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ExemptionReasonCode">
      <report flag="warning" test=".">
	Element 'ram:ExemptionReasonCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:InformationAmount">
      <report flag="warning" test=".">
	Element 'ram:InformationAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:Jurisdiction">
      <report flag="warning" test=".">
	Element 'ram:Jurisdiction' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:PlaceApplicableCITradeLocation">
      <report flag="warning" test=".">
	Element 'ram:PlaceApplicableCITradeLocation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:RateApplicablePercent">
      <report flag="warning" test=".">
	Element 'ram:RateApplicablePercent' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SellerPayableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerPayableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SellerRefundableTaxSpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:ServiceSupplyCITradeCountry">
      <report flag="warning" test=".">
	Element 'ram:ServiceSupplyCITradeCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:SpecifiedCITradeAccountingAccount">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeAccountingAccount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TaxBasisAllowanceRate">
      <report flag="warning" test=".">
	Element 'ram:TaxBasisAllowanceRate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TaxPointDate">
      <report flag="warning" test=".">
	Element 'ram:TaxPointDate' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:Type">
      <report flag="warning" test=".">
	Element 'ram:Type' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:ApplicableCITradeTax/ram:UnitBasisAmount">
      <report flag="warning" test=".">
	Element 'ram:UnitBasisAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:InvoiceeCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:InvoiceeCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:PayerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:PayerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:SpecifiedCIOLTradeSettlementMonetarySummation">
      <assert flag="warning" test="count(ram:LineTotalAmount)=1">
	Element 'ram:LineTotalAmount' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:SpecifiedCIOLTradeSettlementMonetarySummation/ram:AllowanceTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:AllowanceTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:SpecifiedCIOLTradeSettlementMonetarySummation/ram:ChargeTotalAmount">
      <report flag="warning" test=".">
	Element 'ram:ChargeTotalAmount' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:SpecifiedCIOLTradeSettlementMonetarySummation/ram:LineTotalAmount">
      <report flag="warning" test="@currencyID">
	Attribute '@currencyID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCIOLSupplyChainTradeSettlement/ram:SpecifiedCITradeAllowanceCharge">
      <report flag="warning" test=".">
	Element 'ram:SpecifiedCITradeAllowanceCharge' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct">
      <assert flag="warning" test="count(ram:Name)&lt;=1">
	Element 'ram:Name' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:AdditionalReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:AdditionalReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIMaterialGoodsCharacteristic">
      <report flag="warning" test=".">
	Element 'ram:ApplicableCIMaterialGoodsCharacteristic' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic">
      <assert flag="warning" test="count(ram:Description)&lt;=1">
	Element 'ram:Description' may occur at maximum 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ApplicableProductCharacteristicCondition">
      <report flag="warning" test=".">
	Element 'ram:ApplicableProductCharacteristicCondition' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ApplicableReferencedStandard">
      <report flag="warning" test=".">
	Element 'ram:ApplicableReferencedStandard' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ContentTypeCode">
      <report flag="warning" test=".">
	Element 'ram:ContentTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:MeasurementMethodCode">
      <report flag="warning" test=".">
	Element 'ram:MeasurementMethodCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueCode">
      <report flag="warning" test=".">
	Element 'ram:ValueCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueDateTime">
      <report flag="warning" test=".">
	Element 'ram:ValueDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueIndicator">
      <report flag="warning" test=".">
	Element 'ram:ValueIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueMeasure">
      <report flag="warning" test=".">
	Element 'ram:ValueMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ApplicableCIProductCharacteristic/ram:ValueSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:ValueSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:AreaDensityMeasure">
      <report flag="warning" test=".">
	Element 'ram:AreaDensityMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:BrandName">
      <report flag="warning" test=".">
	Element 'ram:BrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:BrandOwnerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:BrandOwnerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:BuyerAssignedID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:CertificationEvidenceReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:CertificationEvidenceReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ColourCode">
      <report flag="warning" test=".">
	Element 'ram:ColourCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ColourDescription">
      <report flag="warning" test=".">
	Element 'ram:ColourDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:Description">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification">
      <assert flag="warning" test="count(ram:ClassCode)=1">
	Element 'ram:ClassCode' must occur exactly 1 times.</assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ApplicableReferencedStandard">
      <report flag="warning" test=".">
	Element 'ram:ApplicableReferencedStandard' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ClassCIProductCharacteristic">
      <report flag="warning" test=".">
	Element 'ram:ClassCIProductCharacteristic' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ClassCode">
      <report flag="warning" test="@listName">
	Attribute '@listName' marked as not used in the given context.</report>
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
      <report flag="warning" test="@listURI">
	Attribute '@listURI' marked as not used in the given context.</report>
      <report flag="warning" test="@listSchemeURI">
	Attribute '@listSchemeURI' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:ClassName">
      <report flag="warning" test=".">
	Element 'ram:ClassName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:SubClassCode">
      <report flag="warning" test=".">
	Element 'ram:SubClassCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:SystemID">
      <report flag="warning" test=".">
	Element 'ram:SystemID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DesignatedCIProductClassification/ram:SystemName">
      <report flag="warning" test=".">
	Element 'ram:SystemName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:Designation">
      <report flag="warning" test=".">
	Element 'ram:Designation' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:DrainedNetWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:DrainedNetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:EndItemName">
      <report flag="warning" test=".">
	Element 'ram:EndItemName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:EndItemTypeCode">
      <report flag="warning" test=".">
	Element 'ram:EndItemTypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:GlobalID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:GrossWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:GrossWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ID">
      <report flag="warning" test=".">
	Element 'ram:ID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:IndividualCITradeProductInstance">
      <report flag="warning" test=".">
	Element 'ram:IndividualCITradeProductInstance' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:InformationCINote">
      <report flag="warning" test=".">
	Element 'ram:InformationCINote' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:InspectionReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:InspectionReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:LatestProductDataChangeDateTime">
      <report flag="warning" test=".">
	Element 'ram:LatestProductDataChangeDateTime' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:LegalRightsOwnerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:LegalRightsOwnerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:LinearCISpatialDimension">
      <report flag="warning" test=".">
	Element 'ram:LinearCISpatialDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:MSDSReferenceCIReferencedDocument">
      <report flag="warning" test=".">
	Element 'ram:MSDSReferenceCIReferencedDocument' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ManufacturerAssignedID">
      <report flag="warning" test=".">
	Element 'ram:ManufacturerAssignedID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ManufacturerCITradeParty">
      <report flag="warning" test=".">
	Element 'ram:ManufacturerCITradeParty' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:MaximumLinearCISpatialDimension">
      <report flag="warning" test=".">
	Element 'ram:MaximumLinearCISpatialDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:MinimumLinearCISpatialDimension">
      <report flag="warning" test=".">
	Element 'ram:MinimumLinearCISpatialDimension' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:Name">
      <report flag="warning" test="@languageID">
	Attribute '@languageID' marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:NetWeightMeasure">
      <report flag="warning" test=".">
	Element 'ram:NetWeightMeasure' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:OriginCITradeCountry">
      <report flag="warning" test=".">
	Element 'ram:OriginCITradeCountry' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:PresentationSpecifiedBinaryFile">
      <report flag="warning" test=".">
	Element 'ram:PresentationSpecifiedBinaryFile' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:ProductGroupID">
      <report flag="warning" test=".">
	Element 'ram:ProductGroupID' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:SellerAssignedID">
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
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:SubBrandName">
      <report flag="warning" test=".">
	Element 'ram:SubBrandName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:TradeName">
      <report flag="warning" test=".">
	Element 'ram:TradeName' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:TypeCode">
      <report flag="warning" test=".">
	Element 'ram:TypeCode' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:UseDescription">
      <report flag="warning" test=".">
	Element 'ram:UseDescription' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SpecifiedCITradeProduct/ram:VariableMeasureIndicator">
      <report flag="warning" test=".">
	Element 'ram:VariableMeasureIndicator' is marked as not used in the given context.</report>
    </rule>
  </pattern>
  <pattern>
    <rule context="/rsm:CrossIndustryOrder/rsm:CIOHSupplyChainTradeTransaction/ram:IncludedCIOLSupplyChainTradeLineItem/ram:SubstitutedCIReferencedProduct">
      <report flag="warning" test=".">
	Element 'ram:SubstitutedCIReferencedProduct' is marked as not used in the given context.</report>
    </rule>
  </pattern>
</schema>
