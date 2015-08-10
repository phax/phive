<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<stylesheet exclude-result-prefixes="ccs" version="2.0" xmlns="http://www.w3.org/1999/XSL/Transform">
  <output indent="yes" />
  <template match="/">
    <for-each select="document('')">
      <ns0:pattern id="OPENPEPPOL-T17" xmlns:ns0="http://purl.oclc.org/dsdl/schematron">
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

<ns0:rule context="cac:TaxCategory/cbc:ID/" flag="fatal" role="fatal">
  <!--{}[](TaxCategoryID)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](TaxCategoryID)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;AE&#127;E&#127;S&#127;Z&#127;AA&#127;H&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[CL-T17-R005]-Reminder tax categories MUST be coded using UN/ECE 5305 code list          </ns0:assert>
</ns0:rule>
<!--
    End of synthesis of rules from code list context associations.
-->
</ns0:pattern>
    </for-each>
  </template>

<key match="ccs:Identification" name="identification" use="@xml:id" />


<!--{}(TaxCategoryID)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d148e3">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>TaxCategoryID</ns1:ShortName>
      <ns1:Version />
      <ns1:CanonicalUri>United Nations Economic Commission for Europe</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>United Nations Economic Commission for Europe</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>
<!--
    End of synthesis of tests from code list context associations.
-->
</stylesheet>
