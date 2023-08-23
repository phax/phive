<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <pattern>
        <rule context="a">
            <assert test="count(//a) &gt; 0">Ich kaufe ein 'a'</assert>
        </rule>
    </pattern>
</schema>