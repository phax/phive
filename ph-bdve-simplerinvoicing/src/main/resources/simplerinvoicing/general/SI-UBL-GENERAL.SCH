<?xml version="1.0" encoding="UTF-8"?>

<!-- These are some general checks that make sure we can determine the
     version; without with the version-specific tests could not be run.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-UBL-VERSIONS">
    <rule context="ubl:Invoice" flag="fatal">
        <assert test="cbc:CustomizationID" flag="fatal">[BII2-T10-R001] An invoice MUST have a customization identifier</assert>
    </rule>
</pattern>
