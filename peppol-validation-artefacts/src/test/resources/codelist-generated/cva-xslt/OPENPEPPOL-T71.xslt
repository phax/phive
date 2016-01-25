<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<stylesheet exclude-result-prefixes="ccs" version="2.0" xmlns="http://www.w3.org/1999/XSL/Transform">
  <output indent="yes" />
  <template match="/">
    <for-each select="document('')">
      <ns0:pattern id="OPENPEPPOL-T71" xmlns:ns0="http://purl.oclc.org/dsdl/schematron">
<!--This CVA to Schematron implementation supports genericode code lists.-->
<!--
    Start of synthesis of a stylesheet creating rules from code list context
    associations.  This is an XSLT 1.0 stylesheet that can be executed without
    any input file (any supplied input file is ignored; most processors
    require the specification of an input file; when necessary, any XML
    document will do, such as providing the stylesheet itself as the input).

    The end result of running this synthesized stylesheet with no or any input 
    is a Schematron schema expressing the constraints found in the CVA file
    that was input to the creation this stylesheet.  Any changes to those
    inputs will require this stylesheet to be recreated.
  -->
<text />
        <comment />

<ns0:rule context="cbc:EndpointID/@schemeID" flag="fatal" role="fatal">
  <!--{}[](PartyIdentifierScheme)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](PartyIdentifierScheme)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;FR:SIRENE&#127;SE:ORGNR&#127;FR:SIRET&#127;FI:OVT&#127;DUNS&#127;GLN&#127;DK:P&#127;IT:FTI&#127;NL:KVK&#127;IT:SIA&#127;IT:SECETI&#127;DK:CPR&#127;DK:CVR&#127;DK:SE&#127;DK:VANS&#127;IT:VAT&#127;IT:CF&#127;NO:ORGNR&#127;NO:VAT&#127;HU:VAT&#127;EU:REID&#127;AT:VAT&#127;AT:GOV&#127;IS:KT&#127;IBAN&#127;AT:KUR&#127;ES:VAT&#127;IT:IPA&#127;AD:VAT&#127;AL:VAT&#127;BA:VAT&#127;BE:VAT&#127;BG:VAT&#127;CH:VAT&#127;CY:VAT&#127;CZ:VAT&#127;DE:VAT&#127;EE:VAT&#127;GB:VAT&#127;GR:VAT&#127;HR:VAT&#127;IE:VAT&#127;LI:VAT&#127;LT:VAT&#127;LU:VAT&#127;LV:VAT&#127;MC:VAT&#127;ME:VAT&#127;MK:VAT&#127;MT:VAT&#127;NL:VAT&#127;PL:VAT&#127;PT:VAT&#127;RO:VAT&#127;RS:VAT&#127;SI:VAT&#127;SK:VAT&#127;SM:VAT&#127;TR:VAT&#127;VA:VAT&#127;NL:ION&#127;SE:VAT&#127;ZZZ&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T71-R001]-An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".          </ns0:assert>
</ns0:rule>

<ns0:rule context="cac:PartyIdentification/cbc:ID/@schemeID" flag="fatal" role="fatal">
  <!--{}[](PartyIdentifierScheme)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](PartyIdentifierScheme)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;FR:SIRENE&#127;SE:ORGNR&#127;FR:SIRET&#127;FI:OVT&#127;DUNS&#127;GLN&#127;DK:P&#127;IT:FTI&#127;NL:KVK&#127;IT:SIA&#127;IT:SECETI&#127;DK:CPR&#127;DK:CVR&#127;DK:SE&#127;DK:VANS&#127;IT:VAT&#127;IT:CF&#127;NO:ORGNR&#127;NO:VAT&#127;HU:VAT&#127;EU:REID&#127;AT:VAT&#127;AT:GOV&#127;IS:KT&#127;IBAN&#127;AT:KUR&#127;ES:VAT&#127;IT:IPA&#127;AD:VAT&#127;AL:VAT&#127;BA:VAT&#127;BE:VAT&#127;BG:VAT&#127;CH:VAT&#127;CY:VAT&#127;CZ:VAT&#127;DE:VAT&#127;EE:VAT&#127;GB:VAT&#127;GR:VAT&#127;HR:VAT&#127;IE:VAT&#127;LI:VAT&#127;LT:VAT&#127;LU:VAT&#127;LV:VAT&#127;MC:VAT&#127;ME:VAT&#127;MK:VAT&#127;MT:VAT&#127;NL:VAT&#127;PL:VAT&#127;PT:VAT&#127;RO:VAT&#127;RS:VAT&#127;SI:VAT&#127;SK:VAT&#127;SM:VAT&#127;TR:VAT&#127;VA:VAT&#127;NL:ION&#127;SE:VAT&#127;ZZZ&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T71-R002]-An Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".          </ns0:assert>
</ns0:rule>

<ns0:rule context="cac:Status/cbc:StatusReasonCode" flag="fatal" role="fatal">
  <!--{}[](StatusReasonCode)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](StatusReasonCode)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;SV&#127;BV&#127;BW&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-071-R003]-A message level response MUST specify the status reason code using the PEPPOL Status code list          </ns0:assert>
</ns0:rule>
<!--
    End of synthesis of rules from code list context associations.
-->
</ns0:pattern>
    </for-each>
  </template>

<key match="ccs:Identification" name="identification" use="@xml:id" />


<!--{}(PartyIdentifierScheme)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d248e3">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>PartyIdentifier</ns1:ShortName>
      <ns1:Version>2013</ns1:Version>
      <ns1:CanonicalUri>PEPPOL</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>PEPPOL-2013</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>

<!--{}(StatusReasonCode)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d248e4">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>StatusReasonCode</ns1:ShortName>
      <ns1:Version />
      <ns1:CanonicalUri>PEPPOL</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>PEPPOL</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>
<!--
    End of synthesis of tests from code list context associations.
-->
</stylesheet>
