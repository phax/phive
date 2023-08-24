<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <pattern>
        <rule context="a">
            <assert test="contains (text(), 'Hallo')">Text ohne Hallo geht gar nicht</assert>
        </rule>
    </pattern>
</schema>
