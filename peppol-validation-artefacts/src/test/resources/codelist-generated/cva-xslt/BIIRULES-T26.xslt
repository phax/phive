<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<stylesheet exclude-result-prefixes="ccs" version="2.0" xmlns="http://www.w3.org/1999/XSL/Transform">
  <output indent="yes" />
  <template match="/">
    <for-each select="document('')">
      <ns0:pattern id="BIIRULES-T26" xmlns:ns0="http://purl.oclc.org/dsdl/schematron">
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

<ns0:rule context="cac:PaymentMeans/cbc:PaymentMeansCode" flag="fatal" role="fatal">
  <!--{}[](PaymentMeansCode)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](PaymentMeansCode)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;1&#127;2&#127;3&#127;4&#127;5&#127;6&#127;7&#127;8&#127;9&#127;10&#127;11&#127;12&#127;13&#127;14&#127;15&#127;16&#127;17&#127;18&#127;19&#127;20&#127;21&#127;22&#127;23&#127;24&#127;25&#127;26&#127;27&#127;28&#127;29&#127;30&#127;31&#127;32&#127;33&#127;34&#127;35&#127;36&#127;37&#127;38&#127;39&#127;40&#127;41&#127;42&#127;43&#127;44&#127;45&#127;46&#127;47&#127;48&#127;49&#127;50&#127;51&#127;52&#127;53&#127;60&#127;61&#127;62&#127;63&#127;64&#127;65&#127;66&#127;67&#127;70&#127;74&#127;75&#127;76&#127;77&#127;78&#127;91&#127;92&#127;93&#127;94&#127;95&#127;96&#127;97&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[CL-T26-R001]-Payment means in an statement MUST be coded using CEFACT code list 4461          </ns0:assert>
</ns0:rule>
<!--
    End of synthesis of rules from code list context associations.
-->
</ns0:pattern>
    </for-each>
  </template>

<key match="ccs:Identification" name="identification" use="@xml:id" />


<!--{}(PaymentMeansCode)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d78e3">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>PaymentMeansCode</ns1:ShortName>
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
