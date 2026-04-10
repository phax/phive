<?xml version="1.0" encoding="UTF-8"?>
<!--

    Copyright (C) 2014-2026 Philip Helger (www.helger.com)
    philip[at]helger[dot]com

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

            http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

-->
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
