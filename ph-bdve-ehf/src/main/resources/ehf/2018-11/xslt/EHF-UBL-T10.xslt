<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:saxon="http://saxon.sf.net/" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:u="utils" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
<xsl:function name="u:twodec">
      <xsl:param name="val" />
      <xsl:value-of select="round($val * 100) div 100" />
   </xsl:function>
  <xsl:function as="xs:boolean" name="u:slack">
      <xsl:param name="exp" />
      <xsl:param name="val" />
      <xsl:param name="slack" />
      <xsl:value-of select="$exp + xs:decimal($slack) >= $val and $exp - xs:decimal($slack) &lt;= $val" />
   </xsl:function>
  <xsl:function name="u:cat2str">
      <xsl:param name="cat" />
      <xsl:value-of select="concat(normalize-space($cat/cbc:ID), '-', round(xs:decimal($cat/cbc:Percent) * 1000000))" />
   </xsl:function>

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
    <svrl:schematron-output schemaVersion="iso" title="Norwegian rules for EHF Invoice">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" />
      <svrl:ns-prefix-in-attribute-values prefix="u" uri="utils" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M10" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M11" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M12" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>Norwegian rules for EHF Invoice</svrl:text>
  <xsl:param name="isZ01" select="/ubl:Invoice/cbc:InvoiceTypeCode = 'Z01'" />
  <xsl:param name="isZ02" select="/ubl:Invoice/cbc:InvoiceTypeCode = 'Z02'" />

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/ubl:Invoice" mode="M10" priority="1226">
    <svrl:fired-rule context="/ubl:Invoice" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:UBLVersionID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:UBLVersionID">
          <xsl:attribute name="id">EHF-T10-B00101</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B00102</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B00103</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B00104</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B00105</xsl:attribute>
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
      <xsl:when test="cbc:InvoiceTypeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:InvoiceTypeCode">
          <xsl:attribute name="id">EHF-T10-B00106</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:InvoiceTypeCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:DocumentCurrencyCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:DocumentCurrencyCode">
          <xsl:attribute name="id">EHF-T10-B00107</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:DocumentCurrencyCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:AccountingSupplierParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:AccountingSupplierParty">
          <xsl:attribute name="id">EHF-T10-B00108</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:AccountingSupplierParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:AccountingCustomerParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:AccountingCustomerParty">
          <xsl:attribute name="id">EHF-T10-B00109</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:AccountingCustomerParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxTotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxTotal">
          <xsl:attribute name="id">EHF-T10-B00110</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxTotal' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:LegalMonetaryTotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:LegalMonetaryTotal">
          <xsl:attribute name="id">EHF-T10-B00111</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:LegalMonetaryTotal' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:InvoiceLine" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:InvoiceLine">
          <xsl:attribute name="id">EHF-T10-B00112</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:InvoiceLine' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:UBLVersionID" mode="M10" priority="1225">
    <svrl:fired-rule context="/ubl:Invoice/cbc:UBLVersionID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = '2.1'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = '2.1'">
          <xsl:attribute name="id">EHF-T10-B00201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:UBLVersionID' MUST contain value '2.1'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:CustomizationID" mode="M10" priority="1224">
    <svrl:fired-rule context="/ubl:Invoice/cbc:CustomizationID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:ProfileID" mode="M10" priority="1223">
    <svrl:fired-rule context="/ubl:Invoice/cbc:ProfileID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:ID" mode="M10" priority="1222">
    <svrl:fired-rule context="/ubl:Invoice/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:IssueDate" mode="M10" priority="1221">
    <svrl:fired-rule context="/ubl:Invoice/cbc:IssueDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:InvoiceTypeCode" mode="M10" priority="1220">
    <svrl:fired-rule context="/ubl:Invoice/cbc:InvoiceTypeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B00701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:Note" mode="M10" priority="1219">
    <svrl:fired-rule context="/ubl:Invoice/cbc:Note" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:TaxPointDate" mode="M10" priority="1218">
    <svrl:fired-rule context="/ubl:Invoice/cbc:TaxPointDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:DocumentCurrencyCode" mode="M10" priority="1217">
    <svrl:fired-rule context="/ubl:Invoice/cbc:DocumentCurrencyCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B01101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:TaxCurrencyCode" mode="M10" priority="1216">
    <svrl:fired-rule context="/ubl:Invoice/cbc:TaxCurrencyCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B01301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cbc:AccountingCost" mode="M10" priority="1215">
    <svrl:fired-rule context="/ubl:Invoice/cbc:AccountingCost" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoicePeriod" mode="M10" priority="1214">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoicePeriod" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:StartDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:StartDate">
          <xsl:attribute name="id">EHF-T10-B01601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:StartDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:EndDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:EndDate">
          <xsl:attribute name="id">EHF-T10-B01602</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:EndDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoicePeriod/cbc:StartDate" mode="M10" priority="1213">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoicePeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoicePeriod/cbc:EndDate" mode="M10" priority="1212">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoicePeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:OrderReference" mode="M10" priority="1211">
    <svrl:fired-rule context="/ubl:Invoice/cac:OrderReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B01901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:OrderReference/cbc:ID" mode="M10" priority="1210">
    <svrl:fired-rule context="/ubl:Invoice/cac:OrderReference/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:ContractDocumentReference" mode="M10" priority="1209">
    <svrl:fired-rule context="/ubl:Invoice/cac:ContractDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B02101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:ContractDocumentReference/cbc:ID" mode="M10" priority="1208">
    <svrl:fired-rule context="/ubl:Invoice/cac:ContractDocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:ContractDocumentReference/cbc:DocumentTypeCode" mode="M10" priority="1207">
    <svrl:fired-rule context="/ubl:Invoice/cac:ContractDocumentReference/cbc:DocumentTypeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B02301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:ContractDocumentReference/cbc:DocumentType" mode="M10" priority="1206">
    <svrl:fired-rule context="/ubl:Invoice/cac:ContractDocumentReference/cbc:DocumentType" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AdditionalDocumentReference" mode="M10" priority="1205">
    <svrl:fired-rule context="/ubl:Invoice/cac:AdditionalDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B02601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AdditionalDocumentReference/cbc:ID" mode="M10" priority="1204">
    <svrl:fired-rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AdditionalDocumentReference/cbc:DocumentType" mode="M10" priority="1203">
    <svrl:fired-rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cbc:DocumentType" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment" mode="M10" priority="1202">
    <svrl:fired-rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" mode="M10" priority="1201">
    <svrl:fired-rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@mimeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@mimeCode">
          <xsl:attribute name="id">EHF-T10-B03001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'mimeCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference" mode="M10" priority="1200">
    <svrl:fired-rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" mode="M10" priority="1199">
    <svrl:fired-rule context="/ubl:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty" mode="M10" priority="1198">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Party" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Party">
          <xsl:attribute name="id">EHF-T10-B03401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Party' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party" mode="M10" priority="1197">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">EHF-T10-B03501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PostalAddress" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PostalAddress">
          <xsl:attribute name="id">EHF-T10-B03502</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PostalAddress' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID" mode="M10" priority="1196">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B03601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification" mode="M10" priority="1195">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B03801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M10" priority="1194">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B03901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyName" mode="M10" priority="1193">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T10-B04101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name" mode="M10" priority="1192">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress" mode="M10" priority="1191">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CityName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CityName">
          <xsl:attribute name="id">EHF-T10-B04301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CityName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PostalZone" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PostalZone">
          <xsl:attribute name="id">EHF-T10-B04302</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PostalZone' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Country" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Country">
          <xsl:attribute name="id">EHF-T10-B04303</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Country' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M10" priority="1190">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M10" priority="1189">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M10" priority="1188">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M10" priority="1187">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M10" priority="1186">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country" mode="M10" priority="1185">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T10-B04901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M10" priority="1184">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B05001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme" mode="M10" priority="1183">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CompanyID">
          <xsl:attribute name="id">EHF-T10-B05201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CompanyID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxScheme" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxScheme">
          <xsl:attribute name="id">EHF-T10-B05202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" mode="M10" priority="1182">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B05301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme" mode="M10" priority="1181">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B05501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" mode="M10" priority="1180">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity" mode="M10" priority="1179">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:RegistrationName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:RegistrationName">
          <xsl:attribute name="id">EHF-T10-B05701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:RegistrationName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CompanyID">
          <xsl:attribute name="id">EHF-T10-B05702</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CompanyID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M10" priority="1178">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" mode="M10" priority="1177">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B05901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress" mode="M10" priority="1176">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M10" priority="1175">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" mode="M10" priority="1174">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T10-B06401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M10" priority="1173">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B06501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact" mode="M10" priority="1172">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID" mode="M10" priority="1171">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name" mode="M10" priority="1170">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone" mode="M10" priority="1169">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax" mode="M10" priority="1168">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M10" priority="1167">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty" mode="M10" priority="1166">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Party" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Party">
          <xsl:attribute name="id">EHF-T10-B07301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Party' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party" mode="M10" priority="1165">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">EHF-T10-B07401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PostalAddress" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PostalAddress">
          <xsl:attribute name="id">EHF-T10-B07402</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PostalAddress' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Contact" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Contact">
          <xsl:attribute name="id">EHF-T10-B07403</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Contact' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID" mode="M10" priority="1164">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B07501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification" mode="M10" priority="1163">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B07701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M10" priority="1162">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B07801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyName" mode="M10" priority="1161">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T10-B08001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name" mode="M10" priority="1160">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress" mode="M10" priority="1159">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CityName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CityName">
          <xsl:attribute name="id">EHF-T10-B08201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CityName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PostalZone" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PostalZone">
          <xsl:attribute name="id">EHF-T10-B08202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PostalZone' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Country" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Country">
          <xsl:attribute name="id">EHF-T10-B08203</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Country' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M10" priority="1158">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M10" priority="1157">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M10" priority="1156">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M10" priority="1155">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M10" priority="1154">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country" mode="M10" priority="1153">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T10-B08801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M10" priority="1152">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B08901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme" mode="M10" priority="1151">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxScheme" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxScheme">
          <xsl:attribute name="id">EHF-T10-B09101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" mode="M10" priority="1150">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B09201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme" mode="M10" priority="1149">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B09401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" mode="M10" priority="1148">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity" mode="M10" priority="1147">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:RegistrationName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:RegistrationName">
          <xsl:attribute name="id">EHF-T10-B09601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:RegistrationName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CompanyID">
          <xsl:attribute name="id">EHF-T10-B09602</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CompanyID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M10" priority="1146">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" mode="M10" priority="1145">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B09801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress" mode="M10" priority="1144">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M10" priority="1143">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" mode="M10" priority="1142">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M10" priority="1141">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact" mode="M10" priority="1140">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B10501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID" mode="M10" priority="1139">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name" mode="M10" priority="1138">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone" mode="M10" priority="1137">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax" mode="M10" priority="1136">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M10" priority="1135">
    <svrl:fired-rule context="/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PayeeParty" mode="M10" priority="1134">
    <svrl:fired-rule context="/ubl:Invoice/cac:PayeeParty" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PayeeParty/cac:PartyIdentification" mode="M10" priority="1133">
    <svrl:fired-rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B11201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PayeeParty/cac:PartyIdentification/cbc:ID" mode="M10" priority="1132">
    <svrl:fired-rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B11301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PayeeParty/cac:PartyName" mode="M10" priority="1131">
    <svrl:fired-rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T10-B11501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PayeeParty/cac:PartyName/cbc:Name" mode="M10" priority="1130">
    <svrl:fired-rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PayeeParty/cac:PartyLegalEntity" mode="M10" priority="1129">
    <svrl:fired-rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyLegalEntity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID" mode="M10" priority="1128">
    <svrl:fired-rule context="/ubl:Invoice/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B11801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty" mode="M10" priority="1127">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">EHF-T10-B12001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyName" mode="M10" priority="1126">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T10-B12101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name" mode="M10" priority="1125">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress" mode="M10" priority="1124">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Country" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Country">
          <xsl:attribute name="id">EHF-T10-B12301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Country' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:StreetName" mode="M10" priority="1123">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AdditionalStreetName" mode="M10" priority="1122">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CityName" mode="M10" priority="1121">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:PostalZone" mode="M10" priority="1120">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CountrySubentity" mode="M10" priority="1119">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country" mode="M10" priority="1118">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M10" priority="1117">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme" mode="M10" priority="1116">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CompanyID">
          <xsl:attribute name="id">EHF-T10-B13101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CompanyID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxScheme" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxScheme">
          <xsl:attribute name="id">EHF-T10-B13102</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID" mode="M10" priority="1115">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B13201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme" mode="M10" priority="1114">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B13401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" mode="M10" priority="1113">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery" mode="M10" priority="1112">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ActualDeliveryDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ActualDeliveryDate">
          <xsl:attribute name="id">EHF-T10-B13601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ActualDeliveryDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cbc:ActualDeliveryDate" mode="M10" priority="1111">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cbc:ActualDeliveryDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation" mode="M10" priority="1110">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cbc:ID" mode="M10" priority="1109">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B13901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address" mode="M10" priority="1108">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName" mode="M10" priority="1107">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName" mode="M10" priority="1106">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName" mode="M10" priority="1105">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone" mode="M10" priority="1104">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity" mode="M10" priority="1103">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country" mode="M10" priority="1102">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode" mode="M10" priority="1101">
    <svrl:fired-rule context="/ubl:Invoice/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B14801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PaymentTerms" mode="M10" priority="1100">
    <svrl:fired-rule context="/ubl:Invoice/cac:PaymentTerms" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:PaymentTerms/cbc:Note" mode="M10" priority="1099">
    <svrl:fired-rule context="/ubl:Invoice/cac:PaymentTerms/cbc:Note" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge" mode="M10" priority="1098">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ChargeIndicator" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ChargeIndicator">
          <xsl:attribute name="id">EHF-T10-B15201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ChargeIndicator' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Amount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Amount">
          <xsl:attribute name="id">EHF-T10-B15202</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Amount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxCategory" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxCategory">
          <xsl:attribute name="id">EHF-T10-B15203</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxCategory' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator" mode="M10" priority="1097">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" mode="M10" priority="1096">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B15401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason" mode="M10" priority="1095">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cbc:Amount" mode="M10" priority="1094">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cbc:Amount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B15701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory" mode="M10" priority="1093">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B15901</xsl:attribute>
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
      <xsl:when test="cac:TaxScheme" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxScheme">
          <xsl:attribute name="id">EHF-T10-B15902</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cbc:ID" mode="M10" priority="1092">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B16001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent" mode="M10" priority="1091">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme" mode="M10" priority="1090">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B16301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID" mode="M10" priority="1089">
    <svrl:fired-rule context="/ubl:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxExchangeRate" mode="M10" priority="1088">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxExchangeRate" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:SourceCurrencyCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:SourceCurrencyCode">
          <xsl:attribute name="id">EHF-T10-B16501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:SourceCurrencyCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TargetCurrencyCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TargetCurrencyCode">
          <xsl:attribute name="id">EHF-T10-B16502</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TargetCurrencyCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CalculationRate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CalculationRate">
          <xsl:attribute name="id">EHF-T10-B16503</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CalculationRate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:MathematicOperatorCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:MathematicOperatorCode">
          <xsl:attribute name="id">EHF-T10-B16504</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:MathematicOperatorCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxExchangeRate/cbc:SourceCurrencyCode" mode="M10" priority="1087">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:SourceCurrencyCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B16601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxExchangeRate/cbc:TargetCurrencyCode" mode="M10" priority="1086">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:TargetCurrencyCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B16801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxExchangeRate/cbc:CalculationRate" mode="M10" priority="1085">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:CalculationRate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxExchangeRate/cbc:MathematicOperatorCode" mode="M10" priority="1084">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:MathematicOperatorCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = 'Multiply'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = 'Multiply'">
          <xsl:attribute name="id">EHF-T10-B17101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:MathematicOperatorCode' MUST contain value 'Multiply'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxExchangeRate/cbc:Date" mode="M10" priority="1083">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxExchangeRate/cbc:Date" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal" mode="M10" priority="1082">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxAmount">
          <xsl:attribute name="id">EHF-T10-B17301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TaxAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxSubtotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxSubtotal">
          <xsl:attribute name="id">EHF-T10-B17302</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxSubtotal' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount" mode="M10" priority="1081">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B17401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal" mode="M10" priority="1080">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxableAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxableAmount">
          <xsl:attribute name="id">EHF-T10-B17601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TaxableAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxAmount">
          <xsl:attribute name="id">EHF-T10-B17602</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TaxAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxCategory" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxCategory">
          <xsl:attribute name="id">EHF-T10-B17603</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxCategory' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" mode="M10" priority="1079">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B17701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount" mode="M10" priority="1078">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B17901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount" mode="M10" priority="1077">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B18101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory" mode="M10" priority="1076">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B18301</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B18302</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B18303</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID" mode="M10" priority="1075">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B18401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent" mode="M10" priority="1074">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason" mode="M10" priority="1073">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme" mode="M10" priority="1072">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B18801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID" mode="M10" priority="1071">
    <svrl:fired-rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal" mode="M10" priority="1070">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:LineExtensionAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:LineExtensionAmount">
          <xsl:attribute name="id">EHF-T10-B19001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:LineExtensionAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxExclusiveAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxExclusiveAmount">
          <xsl:attribute name="id">EHF-T10-B19002</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TaxExclusiveAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxInclusiveAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxInclusiveAmount">
          <xsl:attribute name="id">EHF-T10-B19003</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TaxInclusiveAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PayableAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PayableAmount">
          <xsl:attribute name="id">EHF-T10-B19004</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PayableAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" mode="M10" priority="1069">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B19101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount" mode="M10" priority="1068">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B19301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount" mode="M10" priority="1067">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B19501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" mode="M10" priority="1066">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B19701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" mode="M10" priority="1065">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B19901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PrepaidAmount" mode="M10" priority="1064">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PrepaidAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B20101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" mode="M10" priority="1063">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B20301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount" mode="M10" priority="1062">
    <svrl:fired-rule context="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B20501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine" mode="M10" priority="1061">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B20701</xsl:attribute>
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
      <xsl:when test="cbc:InvoicedQuantity" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:InvoicedQuantity">
          <xsl:attribute name="id">EHF-T10-B20702</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:InvoicedQuantity' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:LineExtensionAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:LineExtensionAmount">
          <xsl:attribute name="id">EHF-T10-B20703</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:LineExtensionAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Item" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Item">
          <xsl:attribute name="id">EHF-T10-B20704</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Item' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Price" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Price">
          <xsl:attribute name="id">EHF-T10-B20705</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Price' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cbc:ID" mode="M10" priority="1060">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cbc:Note" mode="M10" priority="1059">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cbc:Note" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cbc:InvoicedQuantity" mode="M10" priority="1058">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cbc:InvoicedQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">EHF-T10-B21001</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B21002</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCodeListID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cbc:LineExtensionAmount" mode="M10" priority="1057">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cbc:LineExtensionAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B21301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cbc:AccountingCost" mode="M10" priority="1056">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cbc:AccountingCost" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod" mode="M10" priority="1055">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod/cbc:StartDate" mode="M10" priority="1054">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod/cbc:EndDate" mode="M10" priority="1053">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:InvoicePeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:OrderLineReference" mode="M10" priority="1052">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:OrderLineReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:LineID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:LineID">
          <xsl:attribute name="id">EHF-T10-B21901</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:LineID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:OrderLineReference/cbc:LineID" mode="M10" priority="1051">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:OrderLineReference/cbc:LineID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery" mode="M10" priority="1050">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ActualDeliveryDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ActualDeliveryDate">
          <xsl:attribute name="id">EHF-T10-B22101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ActualDeliveryDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cbc:ActualDeliveryDate" mode="M10" priority="1049">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cbc:ActualDeliveryDate" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation" mode="M10" priority="1048">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cbc:ID" mode="M10" priority="1047">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address" mode="M10" priority="1046">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Country" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Country">
          <xsl:attribute name="id">EHF-T10-B22601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Country' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName" mode="M10" priority="1045">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:StreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName" mode="M10" priority="1044">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName" mode="M10" priority="1043">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone" mode="M10" priority="1042">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity" mode="M10" priority="1041">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country" mode="M10" priority="1040">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T10-B23201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode" mode="M10" priority="1039">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">EHF-T10-B23301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge" mode="M10" priority="1038">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ChargeIndicator" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ChargeIndicator">
          <xsl:attribute name="id">EHF-T10-B23501</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ChargeIndicator' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Amount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Amount">
          <xsl:attribute name="id">EHF-T10-B23502</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Amount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:ChargeIndicator" mode="M10" priority="1037">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:ChargeIndicator" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReason" mode="M10" priority="1036">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:AllowanceChargeReason" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:Amount" mode="M10" priority="1035">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:Amount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B23801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:TaxTotal" mode="M10" priority="1034">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:TaxTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxAmount">
          <xsl:attribute name="id">EHF-T10-B24001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TaxAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:TaxTotal/cbc:TaxAmount" mode="M10" priority="1033">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:TaxTotal/cbc:TaxAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B24101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item" mode="M10" priority="1032">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T10-B24301</xsl:attribute>
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
      <xsl:when test="cac:ClassifiedTaxCategory" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:ClassifiedTaxCategory">
          <xsl:attribute name="id">EHF-T10-B24302</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:ClassifiedTaxCategory' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cbc:Description" mode="M10" priority="1031">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cbc:Description" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cbc:Name" mode="M10" priority="1030">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:SellerItemIdentification" mode="M10" priority="1029">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:SellerItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B24601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:SellerItemIdentification/cbc:ID" mode="M10" priority="1028">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:SellerItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:StandardItemIdentification" mode="M10" priority="1027">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:StandardItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B24801</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID" mode="M10" priority="1026">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:OriginCountry" mode="M10" priority="1025">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:OriginCountry" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">EHF-T10-B25101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" mode="M10" priority="1024">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:CommodityClassification" mode="M10" priority="1023">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:CommodityClassification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ItemClassificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ItemClassificationCode">
          <xsl:attribute name="id">EHF-T10-B25401</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ItemClassificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" mode="M10" priority="1022">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory" mode="M10" priority="1021">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B25701</xsl:attribute>
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
      <xsl:when test="cac:TaxScheme" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxScheme">
          <xsl:attribute name="id">EHF-T10-B25702</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" mode="M10" priority="1020">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" mode="M10" priority="1019">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" mode="M10" priority="1018">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">EHF-T10-B26101</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" mode="M10" priority="1017">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty" mode="M10" priority="1016">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T10-B26301</xsl:attribute>
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
          <xsl:attribute name="id">EHF-T10-B26302</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Value' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:Name" mode="M10" priority="1015">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:Value" mode="M10" priority="1014">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:Value" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty" mode="M10" priority="1013">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyName" mode="M10" priority="1012">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">EHF-T10-B26701</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name" mode="M10" priority="1011">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity" mode="M10" priority="1010">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity/cbc:CompanyID" mode="M10" priority="1009">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ManufacturerParty/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EHF-T10-B27001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price" mode="M10" priority="1008">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PriceAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PriceAmount">
          <xsl:attribute name="id">EHF-T10-B27201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PriceAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cbc:PriceAmount" mode="M10" priority="1007">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cbc:PriceAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B27301</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cbc:BaseQuantity" mode="M10" priority="1006">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cbc:BaseQuantity" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge" mode="M10" priority="1005">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ChargeIndicator" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ChargeIndicator">
          <xsl:attribute name="id">EHF-T10-B27601</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ChargeIndicator' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Amount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Amount">
          <xsl:attribute name="id">EHF-T10-B27602</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Amount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:ChargeIndicator" mode="M10" priority="1004">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:ChargeIndicator" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason" mode="M10" priority="1003">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" mode="M10" priority="1002">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" />
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:Amount" mode="M10" priority="1001">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:Amount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B28001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount" mode="M10" priority="1000">
    <svrl:fired-rule context="/ubl:Invoice/cac:InvoiceLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">EHF-T10-B28201</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M10" priority="-1" />
  <xsl:template match="@*|node()" mode="M10" priority="-2">
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->
<xsl:variable name="isB2C" select="$isZ01 or //cac:AdditionalDocumentReference/cbc:DocumentType = 'elektroniskB2Cfaktura'" />
  <xsl:variable name="documentCurrencyCode" select="/ubl:Invoice/cbc:DocumentCurrencyCode" />

	<!--RULE -->
<xsl:template match="cbc:ProfileID" mode="M11" priority="1020">
    <svrl:fired-rule context="cbc:ProfileID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $p in tokenize('urn:www.cenbii.eu:profile:bii04:ver2.0 urn:www.cenbii.eu:profile:bii05:ver2.0 urn:www.cenbii.eu:profile:biixy:ver2.0', '\s') satisfies $p = normalize-space(.)" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $p in tokenize('urn:www.cenbii.eu:profile:bii04:ver2.0 urn:www.cenbii.eu:profile:bii05:ver2.0 urn:www.cenbii.eu:profile:biixy:ver2.0', '\s') satisfies $p = normalize-space(.)">
          <xsl:attribute name="id">EHFPROFILE-T10-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EHFPROFILE-T10-R001]-An invoice transaction T10 must only be used in Profiles 4, 5 or xy.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:InvoiceTypeCode" mode="M11" priority="1019">
    <svrl:fired-rule context="cbc:InvoiceTypeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $code in tokenize('380 393 384 Z01 Z02', '\s') satisfies $code = ." />
      <xsl:otherwise>
        <svrl:failed-assert test="some $code in tokenize('380 393 384 Z01 Z02', '\s') satisfies $code = .">
          <xsl:attribute name="id">NOGOV-T10-R042</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R042]-An Invoice MUST be coded with the InvoiceTypeCode code list UNCL D1001 BII2 subset</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AccountingSupplierParty/cac:Party" mode="M11" priority="1018">
    <svrl:fired-rule context="cac:AccountingSupplierParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or cac:Contact/cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or cac:Contact/cbc:ID">
          <xsl:attribute name="id">NOGOV-T10-R001</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R001]-A contact reference identifier SHOULD be provided for AccountingSupplierParty according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:PaymentMeans" mode="M11" priority="1017">
    <svrl:fired-rule context="cac:PaymentMeans" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PayeeFinancialAccount/cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PayeeFinancialAccount/cbc:ID">
          <xsl:attribute name="id">NOGOV-T10-R011</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R011]-PayeeFinancialAccount MUST be provided according EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PaymentID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PaymentID">
          <xsl:attribute name="id">NOGOV-T10-R012</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R012]-Payment Identifier (KID number) SHOULD be used according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'BBAN']" mode="M11" priority="1016">
    <svrl:fired-rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'BBAN']" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="matches(., '^[0-9]+$')" />
      <xsl:otherwise>
        <svrl:failed-assert test="matches(., '^[0-9]+$')">
          <xsl:attribute name="id">NOGOV-T10-R032</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R032]-Only numbers are allowed as bank account number if scheme is BBAN.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'IBAN']" mode="M11" priority="1015">
    <svrl:fired-rule context="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID[@schemeID = 'IBAN']" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="matches(., '^NO[0-9]+$')" />
      <xsl:otherwise>
        <svrl:failed-assert test="matches(., '^NO[0-9]+$')">
          <xsl:attribute name="id">NOGOV-T10-R033</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R033]-IBAN number is not for a Norwegain bank account</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:OrderReference" mode="M11" priority="1014">
    <svrl:fired-rule context="cac:OrderReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">NOGOV-T10-R013</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R013]-An association to Order Reference SHOULD be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:InvoiceLine" mode="M11" priority="1013">
    <svrl:fired-rule context="cac:InvoiceLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:AccountingCost" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:AccountingCost">
          <xsl:attribute name="id">NOGOV-T10-R003</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R003]-The buyer's accounting code applied to the Invoice Line SHOULD be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or cac:OrderLineReference/cbc:LineID" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or cac:OrderLineReference/cbc:LineID">
          <xsl:attribute name="id">NOGOV-T10-R004</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R004]-An association to Order Line Reference SHOULD be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:Item" mode="M11" priority="1012">
    <svrl:fired-rule context="cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or cac:SellersItemIdentification/cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or cac:SellersItemIdentification/cbc:ID">
          <xsl:attribute name="id">NOGOV-T10-R002</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R002]-The sellers ID for the item SHOULD be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:OriginCountry" mode="M11" priority="1011">
    <svrl:fired-rule context="cac:OriginCountry" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">NOGOV-T10-R022</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R022]-Identification code MUST be specified when describing origin country.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:ManufacturerParty" mode="M11" priority="1010">
    <svrl:fired-rule context="cac:ManufacturerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName/cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName/cbc:Name">
          <xsl:attribute name="id">NOGOV-T10-R024</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R024]-Name MUST be specified when describing a manufacturer party.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:CommodityClassification" mode="M11" priority="1009">
    <svrl:fired-rule context="cac:CommodityClassification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ItemClassificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ItemClassificationCode">
          <xsl:attribute name="id">NOGOV-T10-R023</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R023]-Item classification code MUST be specified when describing commodity classification.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="ubl:Invoice" mode="M11" priority="1008">
    <svrl:fired-rule context="ubl:Invoice" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount != 0) and (cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or (cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount = 0) or not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT'])))" />
      <xsl:otherwise>
        <svrl:failed-assert test="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount != 0) and (cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or (cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount = 0) or not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT'])))">
          <xsl:attribute name="id">NOGOV-T10-R014</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R014]-If the VAT total amount in an invoice exists it MUST contain the suppliers VAT number.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'true'])" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'true'])">
          <xsl:attribute name="id">NOGOV-T10-R034</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R034]-If charge is present on document level, total charge must be stated.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'false'])" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount or not(cac:AllowanceCharge[cbc:ChargeIndicator = 'false'])">
          <xsl:attribute name="id">NOGOV-T10-R035</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R035]-If allowance is present on document level, total allowance must be stated.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or cac:ContractDocumentReference/cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or cac:ContractDocumentReference/cbc:ID">
          <xsl:attribute name="id">NOGOV-T10-R005</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R005]-ContractDocumentReference SHOULD be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:InvoiceTypeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:InvoiceTypeCode">
          <xsl:attribute name="id">NOGOV-T10-R016</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R016]-An EHF invoice MUST have an invoice type code.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PaymentMeans" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PaymentMeans">
          <xsl:attribute name="id">NOGOV-T10-R019</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R019]-An invoice MUST have payment means information.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="ubl:Invoice/cac:PaymentTerms" mode="M11" priority="1007">
    <svrl:fired-rule context="ubl:Invoice/cac:PaymentTerms" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Note" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Note">
          <xsl:attribute name="id">NOGOV-T10-R020</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R020]-Note MUST be specified when describing Payment terms.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxRepresentativeParty" mode="M11" priority="1006">
    <svrl:fired-rule context="cac:TaxRepresentativeParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName/cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName/cbc:Name">
          <xsl:attribute name="id">NOGOV-T10-R017</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R017]-Name MUST be specified when describing a Tax Representative</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyTaxScheme/cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyTaxScheme/cbc:CompanyID">
          <xsl:attribute name="id">NOGOV-T10-R018</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R018]-Company identifier MUST be specified when describing a Tax Representative</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="ubl:Invoice/cac:TaxTotal" mode="M11" priority="1005">
    <svrl:fired-rule context="ubl:Invoice/cac:TaxTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxSubtotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxSubtotal">
          <xsl:attribute name="id">NOGOV-T10-R021</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R021]-An invoice MUST have Tax Subtotal specifications.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2" />
      <xsl:otherwise>
        <svrl:failed-assert test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2">
          <xsl:attribute name="id">NOGOV-T10-R038</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R038]-Total tax amount cannot have more than 2 decimals</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(distinct-values(cac:TaxSubtotal/cac:TaxCategory/cbc:ID/normalize-space(text()))) = count(cac:TaxSubtotal)" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(distinct-values(cac:TaxSubtotal/cac:TaxCategory/cbc:ID/normalize-space(text()))) = count(cac:TaxSubtotal)">
          <xsl:attribute name="id">NOGOV-T10-R041</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R041]-Multiple tax subtotals per tax category code is not allowed.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:Amount | cbc:TaxableAmount | cbc:TaxAmount | cbc:LineExtensionAmount | cbc:PriceAmount | cbc:BaseAmount | cac:LegalMonetaryTotal/cbc:*" mode="M11" priority="1004">
    <svrl:fired-rule context="cbc:Amount | cbc:TaxableAmount | cbc:TaxAmount | cbc:LineExtensionAmount | cbc:PriceAmount | cbc:BaseAmount | cac:LegalMonetaryTotal/cbc:*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or @currencyID = $documentCurrencyCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or @currencyID = $documentCurrencyCode">
          <xsl:attribute name="id">NOGOV-T10-R025</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R025]-The attribute currencyID must have the same value as DocumentCurrencyCode, except the attribute for TransactionCurrencyTaxAmount.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(parent::node()/local-name() = 'LegalMonetaryTotal') or string-length(substring-after(., '.')) &lt;= 2" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(parent::node()/local-name() = 'LegalMonetaryTotal') or string-length(substring-after(., '.')) &lt;= 2">
          <xsl:attribute name="id">NOGOV-T10-R037</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R037]-Document level amounts cannot have more than 2 decimals</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AccountingCustomerParty/cac:Party" mode="M11" priority="1003">
    <svrl:fired-rule context="cac:AccountingCustomerParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyIdentification/cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyIdentification/cbc:ID">
          <xsl:attribute name="id">NOGOV-T10-R006</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R006]-A customer number for AccountingCustomerParty SHOULD be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Contact/cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Contact/cbc:ID">
          <xsl:attribute name="id">NOGOV-T10-R007</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R007]-A contact reference identifier MUST be provided for AccountingCustomerParty according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isB2C or cac:PartyLegalEntity/cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isB2C or cac:PartyLegalEntity/cbc:CompanyID">
          <xsl:attribute name="id">NOGOV-T10-R009</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R009]-PartyLegalEntity for AccountingCustomerParty MUST be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isB2C or cac:PartyLegalEntity/cbc:RegistrationName" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isB2C or cac:PartyLegalEntity/cbc:RegistrationName">
          <xsl:attribute name="id">NOGOV-T10-R015</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R015]-Registration name for AccountingCustomerParty MUST be provided according to EHF.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxSubtotal" mode="M11" priority="1002">
    <svrl:fired-rule context="cac:TaxSubtotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="string-length(substring-after(cbc:TaxableAmount, '.')) &lt;= 2" />
      <xsl:otherwise>
        <svrl:failed-assert test="string-length(substring-after(cbc:TaxableAmount, '.')) &lt;= 2">
          <xsl:attribute name="id">NOGOV-T10-R039</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R039]-Tax subtotal amounts cannot have more than 2 decimals</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2" />
      <xsl:otherwise>
        <svrl:failed-assert test="string-length(substring-after(cbc:TaxAmount, '.')) &lt;= 2">
          <xsl:attribute name="id">NOGOV-T10-R039</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R039]-Tax subtotal amounts cannot have more than 2 decimals</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="ubl:Invoice/cac:AllowanceCharge" mode="M11" priority="1001">
    <svrl:fired-rule context="ubl:Invoice/cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="string-length(substring-after(cbc:Amount, '.')) &lt;= 2" />
      <xsl:otherwise>
        <svrl:failed-assert test="string-length(substring-after(cbc:Amount, '.')) &lt;= 2">
          <xsl:attribute name="id">NOGOV-T10-R040</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R040]-Allowance or charge amounts on document level cannot have more than 2 decimals</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:LegalMonetaryTotal" mode="M11" priority="1000">
    <svrl:fired-rule context="cac:LegalMonetaryTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:PayableRoundingAmount) or abs(xs:decimal(cbc:PayableRoundingAmount)) &lt;= max((xs:decimal(abs(cbc:PayableAmount) div 10), xs:decimal(1)))" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:PayableRoundingAmount) or abs(xs:decimal(cbc:PayableRoundingAmount)) &lt;= max((xs:decimal(abs(cbc:PayableAmount) div 10), xs:decimal(1)))">
          <xsl:attribute name="id">NOGOV-T10-R043</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NOGOV-T10-R043]-Payable rounding amount should be no more than 10% of payable amount.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M11" priority="-1" />
  <xsl:template match="@*|node()" mode="M11" priority="-2">
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->
<xsl:variable name="taxCategoryPercents" select="for $cat in /ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return u:cat2str($cat)" />
  <xsl:variable name="taxCategories" select="for $cat in /ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return normalize-space($cat/cbc:ID)" />

	<!--RULE -->
<xsl:template match="ubl:Invoice" mode="M12" priority="1015">
    <svrl:fired-rule context="ubl:Invoice" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:TaxTotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:TaxTotal">
          <xsl:attribute name="id">NONAT-T10-R012</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R012]-An invoice MUST contain tax information</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PaymentMeans/cbc:PaymentDueDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PaymentMeans/cbc:PaymentDueDate">
          <xsl:attribute name="id">NONAT-T10-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R002]-Payment due date MUST be provided in the invoice according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 5"</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cac:PayeeParty) or cac:PayeeParty/cac:PartyName/cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cac:PayeeParty) or cac:PayeeParty/cac:PartyName/cbc:Name">
          <xsl:attribute name="id">NONAT-T10-R013</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R013]-If payee information is provided then the payee name MUST be specified.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:IssueDate) or current-date() >= cbc:IssueDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:IssueDate) or current-date() >= cbc:IssueDate">
          <xsl:attribute name="id">NONAT-T10-R009</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R009]-Issue date of an invoice should be today or earlier.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or //cac:Delivery/cbc:ActualDeliveryDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or //cac:Delivery/cbc:ActualDeliveryDate">
          <xsl:attribute name="id">NONAT-T10-R003</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R003]-The actual delivery date SHOULD be provided in the invoice according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 4 and § 5-1-4", see also “NOU 2002:20, point 9.4.1.4”"</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or //cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName and //cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone and //cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or //cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CityName and //cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PostalZone and //cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode">
          <xsl:attribute name="id">NONAT-T10-R004</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R004]-A Delivery address in an invoice SHOULD contain at least, city, zip code and country code according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 4 and § 5-1-4", see also “NOU 2002:20, point 9.4.1.4”</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:UBLVersionID" mode="M12" priority="1014">
    <svrl:fired-rule context="cbc:UBLVersionID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(.) = '2.1'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(.) = '2.1'">
          <xsl:attribute name="id">NONAT-T10-R020</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R020]-UBL version  must be 2.1</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AccountingSupplierParty/cac:Party" mode="M12" priority="1013">
    <svrl:fired-rule context="cac:AccountingSupplierParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or cac:PartyLegalEntity/cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or cac:PartyLegalEntity/cbc:CompanyID">
          <xsl:attribute name="id">NONAT-T10-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R001]-The Norwegian legal registration ID for the supplier MUST be provided according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 2"</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$isZ02 or cac:PartyLegalEntity/cbc:RegistrationName" />
      <xsl:otherwise>
        <svrl:failed-assert test="$isZ02 or cac:PartyLegalEntity/cbc:RegistrationName">
          <xsl:attribute name="id">NONAT-T10-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R008]-The Norwegian legal registration name for the supplier MUST be provided according to "FOR 2004-12-01 nr 1558 - § 5-1-1. Point 2"</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode">
          <xsl:attribute name="id">NONAT-T10-R006</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R006]-A supplier postal address in an invoice MUST contain at least city name, zip code and country code.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AccountingCustomerParty/cac:Party" mode="M12" priority="1012">
    <svrl:fired-rule context="cac:AccountingCustomerParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PostalAddress/cbc:CityName and cac:PostalAddress/cbc:PostalZone and cac:PostalAddress/cac:Country/cbc:IdentificationCode">
          <xsl:attribute name="id">NONAT-T10-R007</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R007]-A customer postal address in an invoice MUST contain at least city name, zip code and country code.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeID]" mode="M12" priority="1011">
    <svrl:fired-rule context="cac:Delivery/cac:DeliveryLocation/cbc:ID[@schemeID]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $v in tokenize('GLN GSRN', '\s') satisfies $v = @schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $v in tokenize('GLN GSRN', '\s') satisfies $v = @schemeID">
          <xsl:attribute name="id">NONAT-T10-R010</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R010]-Location identifiers SHOULD be GLN or GSRN</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:PartyLegalEntity" mode="M12" priority="1010">
    <svrl:fired-rule context="cac:PartyLegalEntity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CompanyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CompanyID">
          <xsl:attribute name="id">NONAT-T10-R018</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R018]-Company identifier MUST be specified when describing a company legal entity.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:PayeeFinancialAccount/cbc:ID[@schemeID]" mode="M12" priority="1009">
    <svrl:fired-rule context="cac:PayeeFinancialAccount/cbc:ID[@schemeID]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $v in tokenize('IBAN BBAN LOCAL', '\s') satisfies $v = @schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $v in tokenize('IBAN BBAN LOCAL', '\s') satisfies $v = @schemeID">
          <xsl:attribute name="id">NONAT-T10-R024</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R024]-A payee account identifier scheme MUST be either IBAN, BBAN or LOCAL</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:LegalMonetaryTotal" mode="M12" priority="1008">
    <svrl:fired-rule context="cac:LegalMonetaryTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="number(cbc:TaxInclusiveAmount) >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="number(cbc:TaxInclusiveAmount) >= 0">
          <xsl:attribute name="id">NONAT-T10-R023</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R023]-Tax inclusive amount in an invoice SHOULD NOT be negative</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="number(cbc:PayableAmount) >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="number(cbc:PayableAmount) >= 0">
          <xsl:attribute name="id">NONAT-T10-R022</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R022]-Total payable amount in an invoice SHOULD NOT be negative</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AllowanceCharge" mode="M12" priority="1007">
    <svrl:fired-rule context="cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:AllowanceChargeReason" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:AllowanceChargeReason">
          <xsl:attribute name="id">NONAT-T10-R011</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R011]-AllowanceChargeReason text SHOULD be specified for all allowances and charges</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:InvoiceLine" mode="M12" priority="1006">
    <svrl:fired-rule context="cac:InvoiceLine" />
    <xsl:variable name="sumCharge" select="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='true']/cbc:Amount)" />
    <xsl:variable name="sumAllowance" select="sum(cac:AllowanceCharge[child::cbc:ChargeIndicator='false']/cbc:Amount)" />
    <xsl:variable name="baseQuantity" select="xs:decimal(if (cac:Price/cbc:BaseQuantity and xs:decimal(cac:Price/cbc:BaseQuantity) != 0) then cac:Price/cbc:BaseQuantity else 1)" />
    <xsl:variable name="pricePerUnit" select="xs:decimal(cac:Price/cbc:PriceAmount) div $baseQuantity" />
    <xsl:variable name="quantity" select="xs:decimal(cbc:InvoicedQuantity)" />
    <xsl:variable name="lineExtensionAmount" select="number(cbc:LineExtensionAmount)" />
    <xsl:variable name="quiet" select="not(cbc:InvoicedQuantity) or not(cac:Price/cbc:PriceAmount)" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Item/cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Item/cbc:Name">
          <xsl:attribute name="id">NONAT-T10-R016</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R016]-Each invoice line MUST contain the product/service name</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Price/cbc:PriceAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Price/cbc:PriceAmount">
          <xsl:attribute name="id">NONAT-T10-R015</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R015]-Invoice lines MUST contain the item price</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$quiet or u:slack($lineExtensionAmount, u:twodec(u:twodec($pricePerUnit * $quantity) + u:twodec($sumCharge) - u:twodec($sumAllowance)), 0.02)" />
      <xsl:otherwise>
        <svrl:failed-assert test="$quiet or u:slack($lineExtensionAmount, u:twodec(u:twodec($pricePerUnit * $quantity) + u:twodec($sumCharge) - u:twodec($sumAllowance)), 0.02)">
          <xsl:attribute name="id">NONAT-T10-R026</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R026]-Invoice line amount MUST be equal to the price amount multiplied by the quantity plus charges minus allowances at line level.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:Price/cbc:BaseQuantity" mode="M12" priority="1005">
    <svrl:fired-rule context="cac:Price/cbc:BaseQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="xs:decimal(.) > 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="xs:decimal(.) > 0">
          <xsl:attribute name="id">NONAT-T10-R033</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R033]-Base quantity must be a positive value higher than zero.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxSubtotal" mode="M12" priority="1004">
    <svrl:fired-rule context="cac:TaxSubtotal" />
    <xsl:variable name="category" select="normalize-space(cac:TaxCategory/cbc:ID)" />
    <xsl:variable name="sumLineExtensionAmount" select="xs:decimal(sum(/ubl:Invoice/cac:InvoiceLine[normalize-space(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) = $category]/cbc:LineExtensionAmount))" />
    <xsl:variable name="sumAllowance" select="xs:decimal(sum(/ubl:Invoice/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'false']/cbc:Amount))" />
    <xsl:variable name="sumCharge" select="xs:decimal(sum(/ubl:Invoice/cac:AllowanceCharge[normalize-space(cac:TaxCategory/cbc:ID) = $category][cbc:ChargeIndicator = 'true']/cbc:Amount))" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="xs:decimal(cbc:TaxableAmount) = u:twodec($sumLineExtensionAmount - $sumAllowance + $sumCharge)" />
      <xsl:otherwise>
        <svrl:failed-assert test="xs:decimal(cbc:TaxableAmount) = u:twodec($sumLineExtensionAmount - $sumAllowance + $sumCharge)">
          <xsl:attribute name="id">NONAT-T10-R029</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R029]-Taxable amount in a tax subtotal MUST be the sum of line extension amount of all invoice lines and allowances and charges on document level with the same tax category.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AllowanceCharge/cac:TaxCategory[cbc:Percent] | cac:Item/cac:ClassifiedTaxCategory[cbc:Percent]" mode="M12" priority="1003">
    <svrl:fired-rule context="cac:AllowanceCharge/cac:TaxCategory[cbc:Percent] | cac:Item/cac:ClassifiedTaxCategory[cbc:Percent]" />
    <xsl:variable name="category" select="u:cat2str(.)" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $cat in $taxCategoryPercents satisfies $cat = $category" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $cat in $taxCategoryPercents satisfies $cat = $category">
          <xsl:attribute name="id">NONAT-T10-R031</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R031]-Tax categories MUST match provided tax categories on document level.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AllowanceCharge/cac:TaxCategory | cac:Item/cac:ClassifiedTaxCategory" mode="M12" priority="1002">
    <svrl:fired-rule context="cac:AllowanceCharge/cac:TaxCategory | cac:Item/cac:ClassifiedTaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $cat in $taxCategories satisfies $cat = cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $cat in $taxCategories satisfies $cat = cbc:ID">
          <xsl:attribute name="id">NONAT-T10-R032</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R032]-Tax categories MUST match provided tax categories on document level.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxScheme" mode="M12" priority="1001">
    <svrl:fired-rule context="cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">NONAT-T10-R017</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R017]-Every tax scheme MUST be defined through an identifier.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxScheme/cbc:ID" mode="M12" priority="1000">
    <svrl:fired-rule context="cac:TaxScheme/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(.) = 'VAT'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(.) = 'VAT'">
          <xsl:attribute name="id">NONAT-T10-R014</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[NONAT-T10-R014]-Invoice tax schemes MUST be 'VAT'</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M12" priority="-1" />
  <xsl:template match="@*|node()" mode="M12" priority="-2">
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>
</xsl:stylesheet>
