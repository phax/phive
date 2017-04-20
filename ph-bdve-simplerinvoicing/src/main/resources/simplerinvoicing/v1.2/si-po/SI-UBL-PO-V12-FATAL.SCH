<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-V12-PO-FATAL">
  <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns001:ver2.0:extended:urn:www.peppol.eu:bis:peppol3a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns001:ver2.0:extended:urn:www.peppol.eu:bis:peppol3a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))]">
    <assert test="true()" />
  </rule>
    <!-- if we want to warn for new version, this would be a good place -->
    <!--
    <rule context="ubl:Invoice" flag="warning">
        <assert test="false()" flag="warning">[SI-UBL-INV-R000]-Simplerinvoicing v1.2 validation is used but will soon be obsolete, please move to Simplerinvoicing v1.2</assert>
    </rule>
    -->
    <!-- end of warning for new version -->
    <!-- End of version check -->
    <!-- End backwards compatibiltiy statement -->
    
    <rule context="ubl:Order" flag="fatal">
        <assert test="cbc:UBLVersionID='2.1'" flag="fatal">[SI-V12-PO-R001]-Each order MUST be specified as a UBL 2.1 document</assert>
    </rule>



</pattern>
