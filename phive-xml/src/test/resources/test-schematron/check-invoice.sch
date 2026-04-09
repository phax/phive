<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        queryBinding="xslt2">
  <ns prefix="inv" uri="urn:test:invoice" />
  <pattern>
    <rule context="/inv:Invoice">
      <assert test="inv:ID" id="INV-01">An Invoice MUST have an ID element.</assert>
      <assert test="inv:IssueDate" id="INV-02">An Invoice MUST have an IssueDate element.</assert>
    </rule>
    <rule context="/inv:Invoice/inv:ID">
      <assert test="string-length(normalize-space(.)) &gt; 0" id="INV-03">The Invoice ID MUST not be empty.</assert>
    </rule>
  </pattern>
</schema>
