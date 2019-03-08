<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:saxon="http://saxon.sf.net/" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->

<xsl:param name="archiveDirParameter" />
  <xsl:param name="archiveNameParameter" />
  <xsl:param name="fileNameParameter" />
  <xsl:param name="fileDirParameter" />
  <xsl:variable name="document-uri">
    <xsl:value-of select="document-uri(/)" />
  </xsl:variable>

<!--PHASES-->


<!--PROLOG-->
<xsl:output indent="yes" method="xml" omit-xml-declaration="no" standalone="yes" />

<!--XSD TYPES FOR XSLT2-->


<!--KEYS AND FUNCTIONS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-select-full-path">
    <xsl:apply-templates mode="schematron-get-full-path" select="." />
  </xsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-get-full-path">
    <xsl:apply-templates mode="schematron-get-full-path" select="parent::*" />
    <xsl:text>/</xsl:text>
    <xsl:choose>
      <xsl:when test="namespace-uri()=''">
        <xsl:value-of select="name()" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>*:</xsl:text>
        <xsl:value-of select="local-name()" />
        <xsl:text>[namespace-uri()='</xsl:text>
        <xsl:value-of select="namespace-uri()" />
        <xsl:text>']</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:variable name="preceding" select="count(preceding-sibling::*[local-name()=local-name(current())                                   and namespace-uri() = namespace-uri(current())])" />
    <xsl:text>[</xsl:text>
    <xsl:value-of select="1+ $preceding" />
    <xsl:text>]</xsl:text>
  </xsl:template>
  <xsl:template match="@*" mode="schematron-get-full-path">
    <xsl:apply-templates mode="schematron-get-full-path" select="parent::*" />
    <xsl:text>/</xsl:text>
    <xsl:choose>
      <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()" />
</xsl:when>
      <xsl:otherwise>
        <xsl:text>@*[local-name()='</xsl:text>
        <xsl:value-of select="local-name()" />
        <xsl:text>' and namespace-uri()='</xsl:text>
        <xsl:value-of select="namespace-uri()" />
        <xsl:text>']</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-2">
    <xsl:for-each select="ancestor-or-self::*">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="name(.)" />
      <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1" />
        <xsl:text>]</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="not(self::*)">
      <xsl:text />/@<xsl:value-of select="name(.)" />
    </xsl:if>
  </xsl:template>
<!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->

<xsl:template match="node() | @*" mode="schematron-get-full-path-3">
    <xsl:for-each select="ancestor-or-self::*">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="name(.)" />
      <xsl:if test="parent::*">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1" />
        <xsl:text>]</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="not(self::*)">
      <xsl:text />/@<xsl:value-of select="name(.)" />
    </xsl:if>
  </xsl:template>

<!--MODE: GENERATE-ID-FROM-PATH -->
<xsl:template match="/" mode="generate-id-from-path" />
  <xsl:template match="text()" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')" />
  </xsl:template>
  <xsl:template match="comment()" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')" />
  </xsl:template>
  <xsl:template match="processing-instruction()" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')" />
  </xsl:template>
  <xsl:template match="@*" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.@', name())" />
  </xsl:template>
  <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:text>.</xsl:text>
    <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')" />
  </xsl:template>

<!--MODE: GENERATE-ID-2 -->
<xsl:template match="/" mode="generate-id-2">U</xsl:template>
  <xsl:template match="*" mode="generate-id-2" priority="2">
    <xsl:text>U</xsl:text>
    <xsl:number count="*" level="multiple" />
  </xsl:template>
  <xsl:template match="node()" mode="generate-id-2">
    <xsl:text>U.</xsl:text>
    <xsl:number count="*" level="multiple" />
    <xsl:text>n</xsl:text>
    <xsl:number count="node()" />
  </xsl:template>
  <xsl:template match="@*" mode="generate-id-2">
    <xsl:text>U.</xsl:text>
    <xsl:number count="*" level="multiple" />
    <xsl:text>_</xsl:text>
    <xsl:value-of select="string-length(local-name(.))" />
    <xsl:text>_</xsl:text>
    <xsl:value-of select="translate(name(),':','.')" />
  </xsl:template>
<!--Strip characters-->  <xsl:template match="text()" priority="-1" />

<!--SCHEMA SETUP-->
<xsl:template match="/">
    <svrl:schematron-output schemaVersion="iso" title="Norwegian rules for EHF Punch Out">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M4" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M5" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>Norwegian rules for EHF Punch Out</svrl:text>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/ubl:Catalogue" mode="M4" priority="1071">
    <svrl:fired-rule context="/ubl:Catalogue" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:UBLVersionID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:UBLVersionID">
          <xsl:attribute name="id">EHF-T77-B00101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:UBLVersionID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CustomizationID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CustomizationID">
          <xsl:attribute name="id">EHF-T77-B00102</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CustomizationID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ProfileID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ProfileID">
          <xsl:attribute name="id">EHF-T77-B00103</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ProfileID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B00104</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ActionCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ActionCode">
          <xsl:attribute name="id">EHF-T77-B00105</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ActionCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IssueDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IssueDate">
          <xsl:attribute name="id">EHF-T77-B00106</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IssueDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:ProviderParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ProviderParty">
          <xsl:attribute name="id">EHF-T77-B00107</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:ProviderParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:CatalogueLine" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:CatalogueLine">
          <xsl:attribute name="id">EHF-T77-B00108</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:CatalogueLine' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:UBLVersionID" mode="M4" priority="1070">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:UBLVersionID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = '2.1'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = '2.1'">
          <xsl:attribute name="id">EHF-T77-B00201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:UBLVersionID' MUST contain value '2.1'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:CustomizationID" mode="M4" priority="1069">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:CustomizationID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:ProfileID" mode="M4" priority="1068">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:ProfileID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:ID" mode="M4" priority="1067">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:ActionCode" mode="M4" priority="1066">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:ActionCode" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:IssueDate" mode="M4" priority="1065">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:IssueDate" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:IssueTime" mode="M4" priority="1064">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:IssueTime" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ValidityPeriod" mode="M4" priority="1063">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ValidityPeriod" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:EndDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:EndDate">
          <xsl:attribute name="id">EHF-T77-B00901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:EndDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate" mode="M4" priority="1062">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndTime" mode="M4" priority="1061">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndTime" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReferencedContract" mode="M4" priority="1060">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReferencedContract" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReferencedContract/cbc:ID" mode="M4" priority="1059">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty" mode="M4" priority="1058">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:EndpointID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:EndpointID">
          <xsl:attribute name="id">EHF-T77-B01401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:EndpointID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">EHF-T77-B01402</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cbc:EndpointID" mode="M4" priority="1057">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cbc:EndpointID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification" mode="M4" priority="1056">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B01701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID" mode="M4" priority="1055">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyName" mode="M4" priority="1054">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T77-B02001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name" mode="M4" priority="1053">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:Contact" mode="M4" priority="1052">
    <svrl:fired-rule context="/ubl:Catalogue/cac:Contact" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:Contact/cbc:ID" mode="M4" priority="1051">
    <svrl:fired-rule context="/ubl:Catalogue/cac:Contact/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine" mode="M4" priority="1050">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B02401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:RequiredItemLocationQuantity" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:RequiredItemLocationQuantity">
          <xsl:attribute name="id">EHF-T77-B02402</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:RequiredItemLocationQuantity' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Item" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Item">
          <xsl:attribute name="id">EHF-T77-B02403</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Item' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:ID" mode="M4" priority="1049">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision" mode="M4" priority="1048">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod" mode="M4" priority="1047">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartDate" mode="M4" priority="1046">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity" mode="M4" priority="1045">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:LeadTimeMeasure" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:LeadTimeMeasure">
          <xsl:attribute name="id">EHF-T77-B02901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:LeadTimeMeasure' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Price" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Price">
          <xsl:attribute name="id">EHF-T77-B02902</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Price' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:DeliveryUnit" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:DeliveryUnit">
          <xsl:attribute name="id">EHF-T77-B02903</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:DeliveryUnit' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure" mode="M4" priority="1044">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T77-B03001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price" mode="M4" priority="1043">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PriceAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PriceAmount">
          <xsl:attribute name="id">EHF-T77-B03201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PriceAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount" mode="M4" priority="1042">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T77-B03301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity" mode="M4" priority="1041">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T77-B03501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit" mode="M4" priority="1040">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:BatchQuantity" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:BatchQuantity">
          <xsl:attribute name="id">EHF-T77-B03701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:BatchQuantity' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit/cbc:BatchQuantity" mode="M4" priority="1039">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit/cbc:BatchQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T77-B03801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item" mode="M4" priority="1038">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T77-B04001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:CommodityClassification" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:CommodityClassification">
          <xsl:attribute name="id">EHF-T77-B04002</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:CommodityClassification' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:ClassifiedTaxCategory" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ClassifiedTaxCategory">
          <xsl:attribute name="id">EHF-T77-B04003</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:ClassifiedTaxCategory' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description" mode="M4" priority="1037">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name" mode="M4" priority="1036">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification" mode="M4" priority="1035">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B04301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID" mode="M4" priority="1034">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellersItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification" mode="M4" priority="1033">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B04601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID" mode="M4" priority="1032">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification" mode="M4" priority="1031">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B04901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID" mode="M4" priority="1030">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference" mode="M4" priority="1029">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B05201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:DocumentTypeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:DocumentTypeCode">
          <xsl:attribute name="id">EHF-T77-B05202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:DocumentTypeCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:DocumentDescription" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:DocumentDescription">
          <xsl:attribute name="id">EHF-T77-B05203</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:DocumentDescription' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID" mode="M4" priority="1028">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode" mode="M4" priority="1027">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription" mode="M4" priority="1026">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment" mode="M4" priority="1025">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" mode="M4" priority="1024">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@mimeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@mimeCode">
          <xsl:attribute name="id">EHF-T77-B05901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'mimeCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry" mode="M4" priority="1023">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" mode="M4" priority="1022">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification" mode="M4" priority="1021">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ItemClassificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ItemClassificationCode">
          <xsl:attribute name="id">EHF-T77-B06401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ItemClassificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" mode="M4" priority="1020">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory" mode="M4" priority="1019">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B06701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Percent" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Percent">
          <xsl:attribute name="id">EHF-T77-B06702</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Percent' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxScheme" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxScheme">
          <xsl:attribute name="id">EHF-T77-B06703</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" mode="M4" priority="1018">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" mode="M4" priority="1017">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" mode="M4" priority="1016">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" mode="M4" priority="1015">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty" mode="M4" priority="1014">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T77-B07301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Value" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Value">
          <xsl:attribute name="id">EHF-T77-B07302</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Value' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name" mode="M4" priority="1013">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode" mode="M4" priority="1012">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value" mode="M4" priority="1011">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity" mode="M4" priority="1010">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty" mode="M4" priority="1009">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">EHF-T77-B07901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName" mode="M4" priority="1008">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T77-B08001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name" mode="M4" priority="1007">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate" mode="M4" priority="1006">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T77-B08201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CertificateTypeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CertificateTypeCode">
          <xsl:attribute name="id">EHF-T77-B08202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CertificateTypeCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CertificateType" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CertificateType">
          <xsl:attribute name="id">EHF-T77-B08203</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CertificateType' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:IssuerParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:IssuerParty">
          <xsl:attribute name="id">EHF-T77-B08204</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:IssuerParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID" mode="M4" priority="1005">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode" mode="M4" priority="1004">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType" mode="M4" priority="1003">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty" mode="M4" priority="1002">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName" mode="M4" priority="1001">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T77-B08701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name" mode="M4" priority="1000">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M4" priority="-1" />
  <xsl:template match="@*|node()" mode="M4" priority="-2">
    <xsl:apply-templates mode="M4" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="ubl:Catalogue" mode="M5" priority="1002">
    <svrl:fired-rule context="ubl:Catalogue" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ProfileID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ProfileID">
          <xsl:attribute name="id">EHF-T77-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Punch out MUST have a profile identification.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:Item" mode="M5" priority="1001">
    <svrl:fired-rule context="cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:ClassifiedTaxCategory" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ClassifiedTaxCategory">
          <xsl:attribute name="id">EHF-T77-R220</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Tax category on line level MUST exists.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AdditionalItemProperty" mode="M5" priority="1000">
    <svrl:fired-rule context="cac:AdditionalItemProperty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Value" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Value">
          <xsl:attribute name="id">EHF-T77-R210</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Additional item property MUST have a value.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M5" priority="-1" />
  <xsl:template match="@*|node()" mode="M5" priority="-2">
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>
</xsl:stylesheet>
