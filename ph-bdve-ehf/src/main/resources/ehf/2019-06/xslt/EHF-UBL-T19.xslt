<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
    <svrl:schematron-output schemaVersion="iso" title="Norwegian rules for EHF Catalogue">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" />
      <svrl:ns-prefix-in-attribute-values prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M5" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M6" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>Norwegian rules for EHF Catalogue</svrl:text>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/ubl:Catalogue" mode="M5" priority="1208">
    <svrl:fired-rule context="/ubl:Catalogue" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:UBLVersionID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:UBLVersionID">
          <xsl:attribute name="id">EHF-T19-B00101</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T19-B00102</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T19-B00103</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T19-B00104</xsl:attribute>
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
      <xsl:when test="cbc:IssueDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IssueDate">
          <xsl:attribute name="id">EHF-T19-B00105</xsl:attribute>
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
      <xsl:when test="cac:ValidityPeriod" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ValidityPeriod">
          <xsl:attribute name="id">EHF-T19-B00106</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:ValidityPeriod' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:ProviderParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ProviderParty">
          <xsl:attribute name="id">EHF-T19-B00107</xsl:attribute>
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
      <xsl:when test="cac:ReceiverParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ReceiverParty">
          <xsl:attribute name="id">EHF-T19-B00108</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:ReceiverParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:CatalogueLine" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:CatalogueLine">
          <xsl:attribute name="id">EHF-T19-B00109</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:CatalogueLine' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:UBLVersionID" mode="M5" priority="1207">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:UBLVersionID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = '2.1'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = '2.1'">
          <xsl:attribute name="id">EHF-T19-B00201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:UBLVersionID' MUST contain value '2.1'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:CustomizationID" mode="M5" priority="1206">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:CustomizationID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:ProfileID" mode="M5" priority="1205">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:ProfileID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:ID" mode="M5" priority="1204">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:ActionCode" mode="M5" priority="1203">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:ActionCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B00601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:Name" mode="M5" priority="1202">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:IssueDate" mode="M5" priority="1201">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:IssueDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:VersionID" mode="M5" priority="1200">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:VersionID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ValidityPeriod" mode="M5" priority="1199">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ValidityPeriod" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ValidityPeriod/cbc:StartDate" mode="M5" priority="1198">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate" mode="M5" priority="1197">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReferencedContract" mode="M5" priority="1196">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReferencedContract" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B01501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReferencedContract/cbc:ID" mode="M5" priority="1195">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReferencedContract/cbc:IssueDate" mode="M5" priority="1194">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:IssueDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReferencedContract/cbc:ContractType" mode="M5" priority="1193">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReferencedContract/cbc:ContractType" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SourceCatalogueReference" mode="M5" priority="1192">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SourceCatalogueReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B01901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SourceCatalogueReference/cbc:ID" mode="M5" priority="1191">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SourceCatalogueReference/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty" mode="M5" priority="1190">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cbc:EndpointID" mode="M5" priority="1189">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B02301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification" mode="M5" priority="1188">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B02501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID" mode="M5" priority="1187">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B02601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyName" mode="M5" priority="1186">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T19-B02801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name" mode="M5" priority="1185">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress" mode="M5" priority="1184">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:StreetName" mode="M5" priority="1183">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName" mode="M5" priority="1182">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CityName" mode="M5" priority="1181">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PostalZone" mode="M5" priority="1180">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity" mode="M5" priority="1179">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country" mode="M5" priority="1178">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T19-B03601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M5" priority="1177">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B03701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity" mode="M5" priority="1176">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName" mode="M5" priority="1175">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID" mode="M5" priority="1174">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B04101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress" mode="M5" priority="1173">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M5" priority="1172">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" mode="M5" priority="1171">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T19-B04501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M5" priority="1170">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B04601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty" mode="M5" priority="1169">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cbc:EndpointID" mode="M5" priority="1168">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B04901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyIdentification" mode="M5" priority="1167">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B05101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID" mode="M5" priority="1166">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B05201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyName" mode="M5" priority="1165">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T19-B05401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyName/cbc:Name" mode="M5" priority="1164">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress" mode="M5" priority="1163">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName" mode="M5" priority="1162">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName" mode="M5" priority="1161">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CityName" mode="M5" priority="1160">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone" mode="M5" priority="1159">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity" mode="M5" priority="1158">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country" mode="M5" priority="1157">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T19-B06201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M5" priority="1156">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B06301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity" mode="M5" priority="1155">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName" mode="M5" priority="1154">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID" mode="M5" priority="1153">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B06701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress" mode="M5" priority="1152">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M5" priority="1151">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" mode="M5" priority="1150">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T19-B07101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M5" priority="1149">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B07201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty" mode="M5" priority="1148">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party" mode="M5" priority="1147">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID" mode="M5" priority="1146">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B07601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification" mode="M5" priority="1145">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B07801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M5" priority="1144">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B07901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName" mode="M5" priority="1143">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T19-B08101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name" mode="M5" priority="1142">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress" mode="M5" priority="1141">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M5" priority="1140">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M5" priority="1139">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M5" priority="1138">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M5" priority="1137">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M5" priority="1136">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country" mode="M5" priority="1135">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T19-B08901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M5" priority="1134">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B09001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact" mode="M5" priority="1133">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name" mode="M5" priority="1132">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone" mode="M5" priority="1131">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax" mode="M5" priority="1130">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M5" priority="1129">
    <svrl:fired-rule context="/ubl:Catalogue/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty" mode="M5" priority="1128">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party" mode="M5" priority="1127">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID" mode="M5" priority="1126">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B09901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification" mode="M5" priority="1125">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B10101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M5" priority="1124">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B10201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName" mode="M5" priority="1123">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T19-B10401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName/cbc:Name" mode="M5" priority="1122">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact" mode="M5" priority="1121">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID" mode="M5" priority="1120">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Name" mode="M5" priority="1119">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telephone" mode="M5" priority="1118">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telephone" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telefax" mode="M5" priority="1117">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:Telefax" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M5" priority="1116">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ContractorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:TradingTermsType" mode="M5" priority="1115">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:TradingTermsType" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cbc:TradingTermsType/cbc:Information" mode="M5" priority="1114">
    <svrl:fired-rule context="/ubl:Catalogue/cbc:TradingTermsType/cbc:Information" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine" mode="M5" priority="1113">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B11501</xsl:attribute>
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
      <xsl:when test="cac:Item" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Item">
          <xsl:attribute name="id">EHF-T19-B11502</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Item' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:ID" mode="M5" priority="1112">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:ActionCode" mode="M5" priority="1111">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ActionCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B11701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision" mode="M5" priority="1110">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ContractSubdivision" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderableIndicator" mode="M5" priority="1109">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderableIndicator" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderableUnit" mode="M5" priority="1108">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderableUnit" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity" mode="M5" priority="1107">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:ContentUnitQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B12201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B12202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderQuantityIncrementNumeric" mode="M5" priority="1106">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:OrderQuantityIncrementNumeric" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity" mode="M5" priority="1105">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:MinimumOrderQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B12601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B12602</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity" mode="M5" priority="1104">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:MaximumOrderQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B12901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B12902</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:WarrantyInformation" mode="M5" priority="1103">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:WarrantyInformation" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cbc:PackLevelCode" mode="M5" priority="1102">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cbc:PackLevelCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B13401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod" mode="M5" priority="1101">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartDate" mode="M5" priority="1100">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:EndDate" mode="M5" priority="1099">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:LineValidityPeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison" mode="M5" priority="1098">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:PriceAmount" mode="M5" priority="1097">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:PriceAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T19-B14001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity" mode="M5" priority="1096">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ItemComparison/cbc:Quantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B14201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B14202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem" mode="M5" priority="1095">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID" mode="M5" priority="1094">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity" mode="M5" priority="1093">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B14701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B14702</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem" mode="M5" priority="1092">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID" mode="M5" priority="1091">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity" mode="M5" priority="1090">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B15201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B15202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem" mode="M5" priority="1089">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID" mode="M5" priority="1088">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity" mode="M5" priority="1087">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B15701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B15702</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem" mode="M5" priority="1086">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID" mode="M5" priority="1085">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity" mode="M5" priority="1084">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B16201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B16202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity" mode="M5" priority="1083">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure" mode="M5" priority="1082">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B16601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity" mode="M5" priority="1081">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B16801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B16802</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity" mode="M5" priority="1080">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B17101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B17102</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress" mode="M5" priority="1079">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:StreetName" mode="M5" priority="1078">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AdditionalStreetName" mode="M5" priority="1077">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CityName" mode="M5" priority="1076">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CityName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PostalZone" mode="M5" priority="1075">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentity" mode="M5" priority="1074">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country" mode="M5" priority="1073">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T19-B18001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode" mode="M5" priority="1072">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:ApplicableTerritoryAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B18101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price" mode="M5" priority="1071">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PriceAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PriceAmount">
          <xsl:attribute name="id">EHF-T19-B18301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PriceAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount" mode="M5" priority="1070">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T19-B18401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity" mode="M5" priority="1069">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B18601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B18602</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType" mode="M5" priority="1068">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:PriceType" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:OrderableUnitFactorRate" mode="M5" priority="1067">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:OrderableUnitFactorRate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod" mode="M5" priority="1066">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:StartDate" mode="M5" priority="1065">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:EndDate" mode="M5" priority="1064">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item" mode="M5" priority="1063">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description" mode="M5" priority="1062">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Description" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity" mode="M5" priority="1061">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B19701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B19702</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackSizeNumeric" mode="M5" priority="1060">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:PackSizeNumeric" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name" mode="M5" priority="1059">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Keyword" mode="M5" priority="1058">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:Keyword" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:BrandName" mode="M5" priority="1057">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cbc:BrandName" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellerItemIdentification" mode="M5" priority="1056">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellerItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B20601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellerItemIdentification/cbc:ID" mode="M5" priority="1055">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:SellerItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification" mode="M5" priority="1054">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B20801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID" mode="M5" priority="1053">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturersItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification" mode="M5" priority="1052">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B21001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID" mode="M5" priority="1051">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:StandardItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference" mode="M5" priority="1050">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B21301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID" mode="M5" priority="1049">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode" mode="M5" priority="1048">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription" mode="M5" priority="1047">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentDescription" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment" mode="M5" priority="1046">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" mode="M5" priority="1045">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@mimeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@mimeCode">
          <xsl:attribute name="id">EHF-T19-B22001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'mimeCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference" mode="M5" priority="1044">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" mode="M5" priority="1043">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry" mode="M5" priority="1042">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T19-B22401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" mode="M5" priority="1041">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B22501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification" mode="M5" priority="1040">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ItemClassificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ItemClassificationCode">
          <xsl:attribute name="id">EHF-T19-B22701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ItemClassificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" mode="M5" priority="1039">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B22801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions" mode="M5" priority="1038">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID" mode="M5" priority="1037">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode" mode="M5" priority="1036">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:TransactionConditions/cbc:ActionCode" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem" mode="M5" priority="1035">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode" mode="M5" priority="1034">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:UNDGCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T19-B23601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID" mode="M5" priority="1033">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:HazardousItem/cbc:HazardClassID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory" mode="M5" priority="1032">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxScheme" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxScheme">
          <xsl:attribute name="id">EHF-T19-B23901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" mode="M5" priority="1031">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B24001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" mode="M5" priority="1030">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" mode="M5" priority="1029">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B24301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" mode="M5" priority="1028">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty" mode="M5" priority="1027">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T19-B24501</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T19-B24502</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Value' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name" mode="M5" priority="1026">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value" mode="M5" priority="1025">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:Value" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity" mode="M5" priority="1024">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B25001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCodeListID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCodeListID">
          <xsl:attribute name="id">EHF-T19-B25002</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier" mode="M5" priority="1023">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty" mode="M5" priority="1022">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">EHF-T19-B25401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName" mode="M5" priority="1021">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T19-B25501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name" mode="M5" priority="1020">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance" mode="M5" priority="1019">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:BestBeforeDate" mode="M5" priority="1018">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cbc:BestBeforeDate" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification" mode="M5" priority="1017">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:LotNumberID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:LotNumberID">
          <xsl:attribute name="id">EHF-T19-B25901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:LotNumberID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID" mode="M5" priority="1016">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:ItemInstance/cac:LotIdentification/cbc:LotNumberID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate" mode="M5" priority="1015">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B26101</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T19-B26102</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T19-B26103</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T19-B26104</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:IssuerParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID" mode="M5" priority="1014">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode" mode="M5" priority="1013">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateTypeCode" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType" mode="M5" priority="1012">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:CertificateType" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:Remarks" mode="M5" priority="1011">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cbc:Remarks" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty" mode="M5" priority="1010">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">EHF-T19-B26801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName" mode="M5" priority="1009">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T19-B26901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name" mode="M5" priority="1008">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference" mode="M5" priority="1007">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T19-B27101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID" mode="M5" priority="1006">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension" mode="M5" priority="1005">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:AttributeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:AttributeID">
          <xsl:attribute name="id">EHF-T19-B27301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:AttributeID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID" mode="M5" priority="1004">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:AttributeID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T19-B27401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Measure" mode="M5" priority="1003">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Measure" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B27601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Description" mode="M5" priority="1002">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Description" />
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MinimumMeasure" mode="M5" priority="1001">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MinimumMeasure" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B28001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MaximumMeasure" mode="M5" priority="1000">
    <svrl:fired-rule context="/ubl:Catalogue/cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MaximumMeasure" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T19-B28201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M5" priority="-1" />
  <xsl:template match="@*|node()" mode="M5" priority="-2">
    <xsl:apply-templates mode="M5" select="*" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/ubl:Catalogue" mode="M6" priority="1011">
    <svrl:fired-rule context="/ubl:Catalogue" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ActionCode or count(cac:CatalogueLine/cbc:ActionCode) = count(cac:CatalogueLine)" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ActionCode or count(cac:CatalogueLine/cbc:ActionCode) = count(cac:CatalogueLine)">
          <xsl:attribute name="id">NOGOV-T19-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R001]-A Catalogue must contain ActionCode on either Header or Line level</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cac:ValidityPeriod/cbc:EndDate) or current-date() &lt;= xs:date(cac:ValidityPeriod/cbc:EndDate)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cac:ValidityPeriod/cbc:EndDate) or current-date() &lt;= xs:date(cac:ValidityPeriod/cbc:EndDate)">
          <xsl:attribute name="id">NOGOV-T19-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R002]-A Catalogue must have a validity period enddate grater or equal to the current date</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:ValidityPeriod" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ValidityPeriod">
          <xsl:attribute name="id">NOGOV-T19-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R008]-A cataloge MUST have a validity period.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:VersionID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:VersionID">
          <xsl:attribute name="id">NOGOV-T19-R012</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R012]-A catalogue should have a catalogue version.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Catalogue/cac:ValidityPeriod" mode="M6" priority="1010">
    <svrl:fired-rule context="/ubl:Catalogue/cac:ValidityPeriod" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:StartDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:StartDate">
          <xsl:attribute name="id">NOGOV-T19-R009</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R009]-A catalogue MUST have a validity start date.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:ReceiverParty" mode="M6" priority="1009">
    <svrl:fired-rule context="cac:ReceiverParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:EndpointID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:EndpointID">
          <xsl:attribute name="id">NOGOV-T19-R010</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R010]-A catalogue MUST have an endpoint ID for receiver.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:SellerSupplierParty/cac:Party" mode="M6" priority="1008">
    <svrl:fired-rule context="cac:SellerSupplierParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:EndpointID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:EndpointID">
          <xsl:attribute name="id">NOGOV-T19-R013</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R013]-A catalogue should have an endpoint ID for seller.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxScheme" mode="M6" priority="1007">
    <svrl:fired-rule context="cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">NOGOV-T19-R011</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R011]-Every tax scheme MUST be defined through an identifier.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]" mode="M6" priority="1006">
    <svrl:fired-rule context="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID = 'NO:ORGNR'" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID = 'NO:ORGNR'">
          <xsl:attribute name="id">NOGOV-T19-R024</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R024]-CompanyID for legal entity qualifier must have value 'NO:ORGNR' when provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:CatalogueLine" mode="M6" priority="1005">
    <svrl:fired-rule context="cac:CatalogueLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:OrderableIndicator" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:OrderableIndicator">
          <xsl:attribute name="id">NOGOV-T19-R003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R003]-A Catalogue line MUST have an orderable indicator</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Item" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Item">
          <xsl:attribute name="id">NOGOV-T19-R004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R004]-A Catalogue line MUST have item/article information</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:CatalogueLine/cac:Item" mode="M6" priority="1004">
    <svrl:fired-rule context="cac:CatalogueLine/cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">NOGOV-T19-R005</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R005]-A Catalogue item MUST have a name</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:ProfileID" mode="M6" priority="1003">
    <svrl:fired-rule context="cbc:ProfileID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test=". = 'urn:www.cenbii.eu:profile:bii01:ver2.0'" />
      <xsl:otherwise>
        <svrl:failed-assert test=". = 'urn:www.cenbii.eu:profile:bii01:ver2.0'">
          <xsl:attribute name="id">EHFPROFILE-T19-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EHFPROFILE-T19-R001]-A catalogue must only be used in profile 1</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:DocumentTypeCode[@listID='urn:gs1:gdd:cl:ReferencedFileTypeCode']" mode="M6" priority="1002">
    <svrl:fired-rule context="cbc:DocumentTypeCode[@listID='urn:gs1:gdd:cl:ReferencedFileTypeCode']" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $code in tokenize('360_DEGREE_IMAGE ASSEMBLY_INSTRUCTIONS AUDIO CERTIFICATION CHEMICAL_ASSESSMENT_SUMMARY CHEMICAL_SAFETY_REPORT CHILD_NUTRITION_LABEL CONSUMER_HANDLING_AND_STORAGE CROSSSECTION_VIEW DIET_CERTIFICATE DOCUMENT DOP_SHEET DRUG_FACT_LABEL ENERGY_LABEL GROUP_CHARACTERISTIC_SHEET HAZARDOUS_SUBSTANCES_DATA IFU INTERNAL_VIEW LOGO MARKETING_INFORMATION MATERIAL_SAMPLES MOBILE_DEVICE_IMAGE NUTRITION_FACT_LABEL ORGANIC_CERTIFICATE OTHER_EXTERNAL_INFORMATION OUT_OF_PACKAGE_IMAGE PACKAGING_ARTWORK PLANOGRAM PRODUCT_FORMULATION_STATEMENT PRODUCT_IMAGE PRODUCT_LABEL_IMAGE PRODUCT_WEBSITE QR_CODE QUALITY_CONTROL_PLAN RECIPE_WEBSITE REGULATORY_INSPECTION_AUDIT RISK_ANALYSIS_DOCUMENT SAFETY_DATA_SHEET SAFETY_SUMMARY_SHEET SAMPLE_SHIPPING_ORDER SUMMARY_OF_PRODUCT_CHARACTERISTICS TESTING_METHODOLOGY_RESULTS TRADE_ITEM_DESCRIPTION TRADE_ITEM_IMAGE_WITH_DIMENSIONS VIDEO WARRANTY_INFORMATION WEBSITE ZOOM_VIEW', '\s') satisfies $code = normalize-space(.)" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $code in tokenize('360_DEGREE_IMAGE ASSEMBLY_INSTRUCTIONS AUDIO CERTIFICATION CHEMICAL_ASSESSMENT_SUMMARY CHEMICAL_SAFETY_REPORT CHILD_NUTRITION_LABEL CONSUMER_HANDLING_AND_STORAGE CROSSSECTION_VIEW DIET_CERTIFICATE DOCUMENT DOP_SHEET DRUG_FACT_LABEL ENERGY_LABEL GROUP_CHARACTERISTIC_SHEET HAZARDOUS_SUBSTANCES_DATA IFU INTERNAL_VIEW LOGO MARKETING_INFORMATION MATERIAL_SAMPLES MOBILE_DEVICE_IMAGE NUTRITION_FACT_LABEL ORGANIC_CERTIFICATE OTHER_EXTERNAL_INFORMATION OUT_OF_PACKAGE_IMAGE PACKAGING_ARTWORK PLANOGRAM PRODUCT_FORMULATION_STATEMENT PRODUCT_IMAGE PRODUCT_LABEL_IMAGE PRODUCT_WEBSITE QR_CODE QUALITY_CONTROL_PLAN RECIPE_WEBSITE REGULATORY_INSPECTION_AUDIT RISK_ANALYSIS_DOCUMENT SAFETY_DATA_SHEET SAFETY_SUMMARY_SHEET SAMPLE_SHIPPING_ORDER SUMMARY_OF_PRODUCT_CHARACTERISTICS TESTING_METHODOLOGY_RESULTS TRADE_ITEM_DESCRIPTION TRADE_ITEM_IMAGE_WITH_DIMENSIONS VIDEO WARRANTY_INFORMATION WEBSITE ZOOM_VIEW', '\s') satisfies $code = normalize-space(.)">
          <xsl:attribute name="id">NOGOV-T19-R020</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R020]-Use of ReferencedFileTypeCode version 5 code list requires to use the codes defined in the code list.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AdditionalItemProperty[normalize-space(cbc:Name) = 'STERILE']" mode="M6" priority="1001">
    <svrl:fired-rule context="cac:AdditionalItemProperty[normalize-space(cbc:Name) = 'STERILE']" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(cbc:Value) = 'NO' or cbc:ValueQualifier" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(cbc:Value) = 'NO' or cbc:ValueQualifier">
          <xsl:attribute name="id">NOGOV-T19-R021</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R021]-Use of ValueQualifier is recommended for values except 'NO'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $code in tokenize('gs1:SterilisationTypeCode', '\s') satisfies $code = normalize-space(cbc:ValueQualifier)" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $code in tokenize('gs1:SterilisationTypeCode', '\s') satisfies $code = normalize-space(cbc:ValueQualifier)">
          <xsl:attribute name="id">NOGOV-T19-R022</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R022]-Non-recommended code list is specified as qualifier.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AdditionalItemProperty[normalize-space(cbc:ValueQualifier) = 'gs1:SterilisationTypeCode']/cbc:Value" mode="M6" priority="1000">
    <svrl:fired-rule context="cac:AdditionalItemProperty[normalize-space(cbc:ValueQualifier) = 'gs1:SterilisationTypeCode']/cbc:Value" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $code in tokenize('AUTOCLAVE BETA_RADIATION CHLORINE_DIOXIDE DRY_HEAT ELECTRON_BEAM_IRRADIATION ETHANOL ETO_ETHYLENE_OXIDE FORMALDEHYDE GAMMA_RADIATION GLUTARALDEHYDE HIGH_INTENSITY_OR_PULSE_LIGHT HIGH_LEVEL_DISINFECTANT HYDROGEN_PEROXIDE LIQUID_CHEMICAL MICROWAVE_RADIATION NITROGEN_DIOXIDE OZONE PERACETIC_ACID PLASMA SOUND_WAVES SUPERCRITICAL_CARBON_DIOXIDE UNSPECIFIED UV_LIGHT', '\s') satisfies $code = normalize-space(.)" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $code in tokenize('AUTOCLAVE BETA_RADIATION CHLORINE_DIOXIDE DRY_HEAT ELECTRON_BEAM_IRRADIATION ETHANOL ETO_ETHYLENE_OXIDE FORMALDEHYDE GAMMA_RADIATION GLUTARALDEHYDE HIGH_INTENSITY_OR_PULSE_LIGHT HIGH_LEVEL_DISINFECTANT HYDROGEN_PEROXIDE LIQUID_CHEMICAL MICROWAVE_RADIATION NITROGEN_DIOXIDE OZONE PERACETIC_ACID PLASMA SOUND_WAVES SUPERCRITICAL_CARBON_DIOXIDE UNSPECIFIED UV_LIGHT', '\s') satisfies $code = normalize-space(.)">
          <xsl:attribute name="id">NOGOV-T19-R023</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T19-R023]-Use of SterilisationTypeCode version 2 code list requires to use the codes defined in the code list.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M6" priority="-1" />
  <xsl:template match="@*|node()" mode="M6" priority="-2">
    <xsl:apply-templates mode="M6" select="*" />
  </xsl:template>
</xsl:stylesheet>
