<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Code list Schematron rules for T71-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Codes-T71">
  <rule context="cbc:EndpointID/@schemeID">
    <assert flag="fatal" id="OP-T71-R001" test="contains('�AD:VAT�AL:VAT�AT:GOV�AT:KUR�AT:VAT�BA:VAT�BE:VAT�BG:VAT�CH:VAT�CY:VAT�CZ:VAT�DE:VAT�DK:CPR�DK:CVR�DK:P�DK:SE�DK:VANS�DUNS�EE:VAT�ES:VAT�EU:REID�FI:OVT�FR:SIRENE�FR:SIRET�GB:VAT�GLN�GR:VAT�HR:VAT�HU:VAT�IBAN�IE:VAT�IS:KT�IT:CF�IT:FTI�IT:IPA�IT:SECETI�IT:SIA�IT:VAT�LI:VAT�LT:VAT�LU:VAT�LV:VAT�MC:VAT�ME:VAT�MK:VAT�MT:VAT�NL:ION�NL:KVK�NL:VAT�NO:ORGNR�NO:VAT�PL:VAT�PT:VAT�RO:VAT�RS:VAT�SE:ORGNR�SE:VAT�SI:VAT�SK:VAT�SM:VAT�TR:VAT�VA:VAT�ZZZ�',concat('�',normalize-space(.),'�'))">[OP-T71-R001]-An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
  </rule>
  <rule context="cac:PartyIdentification/cbc:ID/@schemeID">
    <assert flag="fatal" id="OP-T71-R002" test="contains('�AD:VAT�AL:VAT�AT:GOV�AT:KUR�AT:VAT�BA:VAT�BE:VAT�BG:VAT�CH:VAT�CY:VAT�CZ:VAT�DE:VAT�DK:CPR�DK:CVR�DK:P�DK:SE�DK:VANS�DUNS�EE:VAT�ES:VAT�EU:REID�FI:OVT�FR:SIRENE�FR:SIRET�GB:VAT�GLN�GR:VAT�HR:VAT�HU:VAT�IBAN�IE:VAT�IS:KT�IT:CF�IT:FTI�IT:IPA�IT:SECETI�IT:SIA�IT:VAT�LI:VAT�LT:VAT�LU:VAT�LV:VAT�MC:VAT�ME:VAT�MK:VAT�MT:VAT�NL:ION�NL:KVK�NL:VAT�NO:ORGNR�NO:VAT�PL:VAT�PT:VAT�RO:VAT�RS:VAT�SE:ORGNR�SE:VAT�SI:VAT�SK:VAT�SM:VAT�TR:VAT�VA:VAT�ZZZ�',concat('�',normalize-space(.),'�'))">[OP-T71-R002]-An Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
  </rule>
  <rule context="cac:Status/cbc:StatusReasonCode">
    <assert flag="fatal" id="OP-071-R003" test="contains('�BV�BW�SV�',concat('�',normalize-space(.),'�'))">[OP-071-R003]-A message level response MUST specify the status reason code using the PEPPOL Status code list</assert>
  </rule>
</pattern>
