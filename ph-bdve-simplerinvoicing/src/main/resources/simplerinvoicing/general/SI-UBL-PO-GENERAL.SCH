<?xml version="1.0" encoding="UTF-8"?>

<!-- These are some general checks that make sure we can determine the
     version; without with the version-specific tests could not be run.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-UBL-VERSIONS">
    <rule context="ubl:Order" flag="fatal">
        <assert test="cbc:CustomizationID" flag="fatal">[BII2-T10-R001] An order MUST have a customization identifier</assert>
    </rule>
    <!-- must be si 1.0 to 1.2 -->
    <rule context="cbc:CustomizationID">
        <assert test="contains(normalize-space(.), 'urn:www.cenbii.eu:transaction:biitrns001:ver2.0:extended:urn:www.peppol.eu:bis:peppol3a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2')" flag="fatal">[SI-V11-PO-R200]-This XML instance is NOT tagged as an SI-UBL order; please check the CustomizationID value</assert>
    </rule>
    <rule context="/" flag="fatal">
        <assert test="ubl:Order" flag="fatal">[SI-PO-R000]-This is NOT a UBL 2.x Order, validation cannot continue</assert>
    </rule>
</pattern>
