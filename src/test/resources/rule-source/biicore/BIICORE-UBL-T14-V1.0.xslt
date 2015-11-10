<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ccts-cct="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:p1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:udt="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
        <xsl:variable name="p_1" select="1+    count(preceding-sibling::*[name()=name(current())])" />
        <xsl:if test="$p_1>1 or following-sibling::*[name()=name(current())]">[<xsl:value-of select="$p_1" />]</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>*[local-name()='</xsl:text>
        <xsl:value-of select="local-name()" />
        <xsl:text>']</xsl:text>
        <xsl:variable name="p_2" select="1+   count(preceding-sibling::*[local-name()=local-name(current())])" />
        <xsl:if test="$p_2>1 or following-sibling::*[local-name()=local-name(current())]">[<xsl:value-of select="$p_2" />]</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="@*" mode="schematron-get-full-path">
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
    <svrl:schematron-output schemaVersion="iso" title="BII2 CORE restrictions for Credit Note Transaction (T14) UBL-CreditNote-2.1">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="p1" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
      <svrl:ns-prefix-in-attribute-values prefix="qdt" uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" />
      <svrl:ns-prefix-in-attribute-values prefix="udt" uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ccts-cct" uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" />
      <svrl:ns-prefix-in-attribute-values prefix="ccts" uri="urn:un:unece:uncefact:documentation:2" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M9" select="/" />
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
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M13" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M14" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M15" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M16" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M17" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M18" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M19" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M20" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M21" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M22" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M23" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M24" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M25" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M26" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M27" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M28" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M29" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M30" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M31" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M32" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M33" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M34" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M35" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M36" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M37" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M38" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M39" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M40" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M41" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M42" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M43" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M44" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M45" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M46" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M47" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M48" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M49" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M50" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M51" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M52" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M53" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M54" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M55" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M56" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M57" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M58" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M59" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M60" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M61" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M62" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M63" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M64" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M65" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M66" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M67" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M68" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M69" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M70" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M71" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M72" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M73" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M74" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M75" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M76" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M77" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M78" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M79" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M80" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M81" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M82" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M83" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M84" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M85" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M86" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M87" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M88" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M89" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M90" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M91" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M92" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M93" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M94" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M95" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M96" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M97" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M98" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M99" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M100" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M101" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M102" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M103" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M104" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M105" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M106" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M107" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M108" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M109" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M110" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M111" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M112" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M113" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M114" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M115" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M116" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M117" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M118" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M119" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M120" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M121" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M122" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M123" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M124" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M125" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M126" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M127" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M128" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M129" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M130" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M131" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M132" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M133" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M134" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M135" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M136" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M137" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M138" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M139" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M140" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M141" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M142" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M143" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M144" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M145" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M146" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M147" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M148" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M149" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M150" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M151" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M152" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M153" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M154" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M155" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M156" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M157" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M158" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M159" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M160" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M161" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M162" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M163" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M164" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M165" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M166" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M167" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M168" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M169" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M170" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M171" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M172" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M173" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M174" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M175" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M176" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M177" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M178" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M179" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M180" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M181" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M182" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M183" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M184" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M185" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M186" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M187" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M188" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M189" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M190" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M191" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M192" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M193" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M194" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M195" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M196" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M197" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M198" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M199" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M200" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M201" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M202" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M203" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M204" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M205" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M206" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M207" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M208" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M209" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M210" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M211" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M212" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M213" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M214" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M215" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M216" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M217" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M218" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M219" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M220" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M221" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M222" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M223" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M224" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M225" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M226" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M227" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M228" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M229" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M230" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M231" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M232" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M233" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M234" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M235" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M236" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M237" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M238" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M239" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M240" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M241" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M242" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M243" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M244" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M245" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M246" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M247" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M248" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M249" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M250" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M251" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M252" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M253" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M254" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M255" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M256" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M257" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M258" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M259" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M260" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M261" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M262" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M263" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M264" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M265" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M266" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M267" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M268" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M269" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M270" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M271" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M272" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M273" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M274" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M275" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M276" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M277" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M278" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M279" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M280" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M281" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M282" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M283" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M284" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M285" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M286" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M287" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M288" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M289" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M290" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M291" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M292" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M293" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M294" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M295" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M296" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M297" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M298" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M299" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M300" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M301" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M302" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M303" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M304" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M305" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M306" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M307" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M308" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M309" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M310" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M311" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M312" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M313" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M314" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M315" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M316" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M317" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M318" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M319" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M320" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M321" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M322" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M323" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M324" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M325" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M326" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M327" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M328" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M329" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M330" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M331" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M332" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M333" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M334" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M335" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M336" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M337" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M338" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M339" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M340" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M341" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M342" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M343" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M344" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M345" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M346" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M347" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M348" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M349" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M350" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M351" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M352" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M353" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M354" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M355" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M356" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M357" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M358" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M359" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M360" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M361" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M362" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M363" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M364" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M365" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M366" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M367" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M368" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M369" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M370" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M371" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M372" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M373" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M374" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M375" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M376" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M377" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M378" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M379" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M380" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M381" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M382" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M383" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M384" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M385" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M386" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M387" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M388" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M389" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M390" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M391" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M392" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M393" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M394" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M395" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M396" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M397" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M398" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M399" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M400" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M401" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M402" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M403" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M404" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M405" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M406" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M407" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M408" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M409" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M410" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M411" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M412" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M413" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M414" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M415" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M416" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M417" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M418" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M419" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M420" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M421" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M422" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M423" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M424" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M425" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M426" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M427" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M428" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M429" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M430" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M431" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M432" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M433" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M434" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M435" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M436" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M437" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M438" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M439" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M440" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M441" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M442" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M443" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M444" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M445" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M446" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M447" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M448" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M449" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M450" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M451" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M452" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M453" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M454" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M455" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M456" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M457" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M458" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M459" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M460" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M461" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M462" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M463" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M464" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M465" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M466" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M467" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M468" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M469" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M470" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M471" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M472" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M473" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M474" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M475" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M476" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M477" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M478" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M479" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M480" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M481" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M482" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M483" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M484" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M485" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M486" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M487" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M488" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M489" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M490" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M491" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M492" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M493" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M494" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M495" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M496" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M497" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M498" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M499" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M500" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M501" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M502" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M503" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M504" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M505" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M506" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M507" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M508" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M509" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M510" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M511" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M512" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M513" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M514" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M515" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M516" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M517" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M518" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M519" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M520" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M521" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M522" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M523" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M524" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M525" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M526" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M527" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M528" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M529" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M530" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M531" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M532" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M533" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M534" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M535" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M536" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M537" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M538" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M539" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M540" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M541" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M542" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M543" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M544" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M545" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M546" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M547" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M548" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M549" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M550" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M551" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M552" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M553" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M554" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M555" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M556" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M557" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M558" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M559" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M560" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M561" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M562" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M563" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M564" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M565" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M566" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M567" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M568" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M569" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M570" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M571" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M572" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M573" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M574" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M575" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M576" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M577" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M578" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M579" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M580" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M581" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M582" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M583" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M584" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M585" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M586" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M587" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M588" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M589" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M590" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M591" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M592" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M593" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M594" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M595" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M596" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M597" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M598" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M599" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M600" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M601" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M602" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M603" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M604" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>BII2 CORE restrictions for Credit Note Transaction (T14) UBL-CreditNote-2.1</svrl:text>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingCustomerParty/cac:AccountingContact" mode="M9" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:AccountingContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AccountingContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M9" priority="-1" />
  <xsl:template match="@*|node()" mode="M9" priority="-2">
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingCustomerParty/cac:BuyerContact" mode="M10" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:BuyerContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:BuyerContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M10" priority="-1" />
  <xsl:template match="@*|node()" mode="M10" priority="-2">
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingCustomerParty/cac:DeliveryContact" mode="M11" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:DeliveryContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DeliveryContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M11" priority="-1" />
  <xsl:template match="@*|node()" mode="M11" priority="-2">
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party" mode="M12" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingCustomerParty/cac:Party" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Party' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M12" priority="-1" />
  <xsl:template match="@*|node()" mode="M12" priority="-2">
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingCustomerParty/cbc:AdditionalAccountID" mode="M13" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:AdditionalAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M13" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M13" priority="-1" />
  <xsl:template match="@*|node()" mode="M13" priority="-2">
    <xsl:apply-templates mode="M13" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" mode="M14" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M14" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M14" priority="-1" />
  <xsl:template match="@*|node()" mode="M14" priority="-2">
    <xsl:apply-templates mode="M14" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID" mode="M15" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M15" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M15" priority="-1" />
  <xsl:template match="@*|node()" mode="M15" priority="-2">
    <xsl:apply-templates mode="M15" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingSupplierParty/cac:AccountingContact" mode="M16" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:AccountingContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AccountingContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M16" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M16" priority="-1" />
  <xsl:template match="@*|node()" mode="M16" priority="-2">
    <xsl:apply-templates mode="M16" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingSupplierParty/cac:DespatchContact" mode="M17" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:DespatchContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DespatchContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M17" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M17" priority="-1" />
  <xsl:template match="@*|node()" mode="M17" priority="-2">
    <xsl:apply-templates mode="M17" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party" mode="M18" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:Party" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Party' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M18" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M18" priority="-1" />
  <xsl:template match="@*|node()" mode="M18" priority="-2">
    <xsl:apply-templates mode="M18" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingSupplierParty/cac:SellerContact" mode="M19" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingSupplierParty/cac:SellerContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SellerContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M19" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M19" priority="-1" />
  <xsl:template match="@*|node()" mode="M19" priority="-2">
    <xsl:apply-templates mode="M19" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingSupplierParty/cbc:AdditionalAccountID" mode="M20" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:AdditionalAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M20" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M20" priority="-1" />
  <xsl:template match="@*|node()" mode="M20" priority="-2">
    <xsl:apply-templates mode="M20" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID" mode="M21" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M21" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M21" priority="-1" />
  <xsl:template match="@*|node()" mode="M21" priority="-2">
    <xsl:apply-templates mode="M21" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AccountingSupplierParty/cbc:DataSendingCapability" mode="M22" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AccountingSupplierParty/cbc:DataSendingCapability" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M22" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M22" priority="-1" />
  <xsl:template match="@*|node()" mode="M22" priority="-2">
    <xsl:apply-templates mode="M22" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode" mode="M23" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CharacterSetCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M23" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M23" priority="-1" />
  <xsl:template match="@*|node()" mode="M23" priority="-2">
    <xsl:apply-templates mode="M23" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description" mode="M24" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Description' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M24" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M24" priority="-1" />
  <xsl:template match="@*|node()" mode="M24" priority="-2">
    <xsl:apply-templates mode="M24" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash" mode="M25" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentHash' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M25" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M25" priority="-1" />
  <xsl:template match="@*|node()" mode="M25" priority="-2">
    <xsl:apply-templates mode="M25" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode" mode="M26" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:EncodingCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M26" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M26" priority="-1" />
  <xsl:template match="@*|node()" mode="M26" priority="-2">
    <xsl:apply-templates mode="M26" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate" mode="M27" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExpiryDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M27" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M27" priority="-1" />
  <xsl:template match="@*|node()" mode="M27" priority="-2">
    <xsl:apply-templates mode="M27" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime" mode="M28" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExpiryTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M28" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M28" priority="-1" />
  <xsl:template match="@*|node()" mode="M28" priority="-2">
    <xsl:apply-templates mode="M28" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName" mode="M29" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:FileName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M29" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M29" priority="-1" />
  <xsl:template match="@*|node()" mode="M29" priority="-2">
    <xsl:apply-templates mode="M29" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode" mode="M30" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:FormatCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M30" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M30" priority="-1" />
  <xsl:template match="@*|node()" mode="M30" priority="-2">
    <xsl:apply-templates mode="M30" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod" mode="M31" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:HashAlgorithmMethod' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M31" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M31" priority="-1" />
  <xsl:template match="@*|node()" mode="M31" priority="-2">
    <xsl:apply-templates mode="M31" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode" mode="M32" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MimeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M32" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M32" priority="-1" />
  <xsl:template match="@*|node()" mode="M32" priority="-2">
    <xsl:apply-templates mode="M32" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" mode="M33" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M33" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M33" priority="-1" />
  <xsl:template match="@*|node()" mode="M33" priority="-2">
    <xsl:apply-templates mode="M33" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:IssuerParty" mode="M34" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:IssuerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M34" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M34" priority="-1" />
  <xsl:template match="@*|node()" mode="M34" priority="-2">
    <xsl:apply-templates mode="M34" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ResultOfVerification" mode="M35" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ResultOfVerification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M35" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M35" priority="-1" />
  <xsl:template match="@*|node()" mode="M35" priority="-2">
    <xsl:apply-templates mode="M35" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ValidityPeriod" mode="M36" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cac:ValidityPeriod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M36" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M36" priority="-1" />
  <xsl:template match="@*|node()" mode="M36" priority="-2">
    <xsl:apply-templates mode="M36" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:CopyIndicator" mode="M37" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:CopyIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M37" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M37" priority="-1" />
  <xsl:template match="@*|node()" mode="M37" priority="-2">
    <xsl:apply-templates mode="M37" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentDescription" mode="M38" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentDescription" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M38" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M38" priority="-1" />
  <xsl:template match="@*|node()" mode="M38" priority="-2">
    <xsl:apply-templates mode="M38" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentStatusCode" mode="M39" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M39" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M39" priority="-1" />
  <xsl:template match="@*|node()" mode="M39" priority="-2">
    <xsl:apply-templates mode="M39" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType" mode="M40" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentType" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentType' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M40" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M40" priority="-1" />
  <xsl:template match="@*|node()" mode="M40" priority="-2">
    <xsl:apply-templates mode="M40" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentTypeCode" mode="M41" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:DocumentTypeCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M41" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M41" priority="-1" />
  <xsl:template match="@*|node()" mode="M41" priority="-2">
    <xsl:apply-templates mode="M41" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID" mode="M42" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M42" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M42" priority="-1" />
  <xsl:template match="@*|node()" mode="M42" priority="-2">
    <xsl:apply-templates mode="M42" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:IssueTime" mode="M43" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:IssueTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M43" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M43" priority="-1" />
  <xsl:template match="@*|node()" mode="M43" priority="-2">
    <xsl:apply-templates mode="M43" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LanguageID" mode="M44" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LanguageID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LanguageID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M44" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M44" priority="-1" />
  <xsl:template match="@*|node()" mode="M44" priority="-2">
    <xsl:apply-templates mode="M44" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LocaleCode" mode="M45" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:LocaleCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LocaleCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M45" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M45" priority="-1" />
  <xsl:template match="@*|node()" mode="M45" priority="-2">
    <xsl:apply-templates mode="M45" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:UUID" mode="M46" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M46" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M46" priority="-1" />
  <xsl:template match="@*|node()" mode="M46" priority="-2">
    <xsl:apply-templates mode="M46" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:VersionID" mode="M47" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:VersionID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:VersionID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M47" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M47" priority="-1" />
  <xsl:template match="@*|node()" mode="M47" priority="-2">
    <xsl:apply-templates mode="M47" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:XPath" mode="M48" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AdditionalDocumentReference/cbc:XPath" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:XPath' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M48" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M48" priority="-1" />
  <xsl:template match="@*|node()" mode="M48" priority="-2">
    <xsl:apply-templates mode="M48" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:PaymentMeans" mode="M49" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:PaymentMeans" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentMeans' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M49" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M49" priority="-1" />
  <xsl:template match="@*|node()" mode="M49" priority="-2">
    <xsl:apply-templates mode="M49" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress" mode="M50" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M50" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M50" priority="-1" />
  <xsl:template match="@*|node()" mode="M50" priority="-2">
    <xsl:apply-templates mode="M50" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode" mode="M51" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M51" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M51" priority="-1" />
  <xsl:template match="@*|node()" mode="M51" priority="-2">
    <xsl:apply-templates mode="M51" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID" mode="M52" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M52" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M52" priority="-1" />
  <xsl:template match="@*|node()" mode="M52" priority="-2">
    <xsl:apply-templates mode="M52" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name" mode="M53" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M53" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M53" priority="-1" />
  <xsl:template match="@*|node()" mode="M53" priority="-2">
    <xsl:apply-templates mode="M53" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode" mode="M54" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M54" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M54" priority="-1" />
  <xsl:template match="@*|node()" mode="M54" priority="-2">
    <xsl:apply-templates mode="M54" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure" mode="M55" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M55" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M55" priority="-1" />
  <xsl:template match="@*|node()" mode="M55" priority="-2">
    <xsl:apply-templates mode="M55" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID" mode="M56" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M56" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M56" priority="-1" />
  <xsl:template match="@*|node()" mode="M56" priority="-2">
    <xsl:apply-templates mode="M56" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Name" mode="M57" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M57" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M57" priority="-1" />
  <xsl:template match="@*|node()" mode="M57" priority="-2">
    <xsl:apply-templates mode="M57" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount" mode="M58" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M58" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M58" priority="-1" />
  <xsl:template match="@*|node()" mode="M58" priority="-2">
    <xsl:apply-templates mode="M58" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent" mode="M59" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent" />

		<!--REPORT -->
<xsl:if test="@format">
      <svrl:successful-report test="@format">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@format' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M59" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M59" priority="-1" />
  <xsl:template match="@*|node()" mode="M59" priority="-2">
    <xsl:apply-templates mode="M59" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason" mode="M60" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M60" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M60" priority="-1" />
  <xsl:template match="@*|node()" mode="M60" priority="-2">
    <xsl:apply-templates mode="M60" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode" mode="M61" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M61" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M61" priority="-1" />
  <xsl:template match="@*|node()" mode="M61" priority="-2">
    <xsl:apply-templates mode="M61" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange" mode="M62" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRange' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M62" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M62" priority="-1" />
  <xsl:template match="@*|node()" mode="M62" priority="-2">
    <xsl:apply-templates mode="M62" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent" mode="M63" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M63" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M63" priority="-1" />
  <xsl:template match="@*|node()" mode="M63" priority="-2">
    <xsl:apply-templates mode="M63" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress" mode="M64" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M64" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M64" priority="-1" />
  <xsl:template match="@*|node()" mode="M64" priority="-2">
    <xsl:apply-templates mode="M64" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode" mode="M65" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M65" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M65" priority="-1" />
  <xsl:template match="@*|node()" mode="M65" priority="-2">
    <xsl:apply-templates mode="M65" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID" mode="M66" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M66" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M66" priority="-1" />
  <xsl:template match="@*|node()" mode="M66" priority="-2">
    <xsl:apply-templates mode="M66" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name" mode="M67" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M67" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M67" priority="-1" />
  <xsl:template match="@*|node()" mode="M67" priority="-2">
    <xsl:apply-templates mode="M67" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode" mode="M68" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M68" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M68" priority="-1" />
  <xsl:template match="@*|node()" mode="M68" priority="-2">
    <xsl:apply-templates mode="M68" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure" mode="M69" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M69" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M69" priority="-1" />
  <xsl:template match="@*|node()" mode="M69" priority="-2">
    <xsl:apply-templates mode="M69" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID" mode="M70" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M70" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M70" priority="-1" />
  <xsl:template match="@*|node()" mode="M70" priority="-2">
    <xsl:apply-templates mode="M70" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name" mode="M71" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M71" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M71" priority="-1" />
  <xsl:template match="@*|node()" mode="M71" priority="-2">
    <xsl:apply-templates mode="M71" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount" mode="M72" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M72" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M72" priority="-1" />
  <xsl:template match="@*|node()" mode="M72" priority="-2">
    <xsl:apply-templates mode="M72" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent" mode="M73" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent" />

		<!--REPORT -->
<xsl:if test="@format">
      <svrl:successful-report test="@format">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@format' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M73" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M73" priority="-1" />
  <xsl:template match="@*|node()" mode="M73" priority="-2">
    <xsl:apply-templates mode="M73" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason" mode="M74" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M74" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M74" priority="-1" />
  <xsl:template match="@*|node()" mode="M74" priority="-2">
    <xsl:apply-templates mode="M74" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode" mode="M75" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M75" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M75" priority="-1" />
  <xsl:template match="@*|node()" mode="M75" priority="-2">
    <xsl:apply-templates mode="M75" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange" mode="M76" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRange' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M76" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M76" priority="-1" />
  <xsl:template match="@*|node()" mode="M76" priority="-2">
    <xsl:apply-templates mode="M76" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent" mode="M77" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M77" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M77" priority="-1" />
  <xsl:template match="@*|node()" mode="M77" priority="-2">
    <xsl:apply-templates mode="M77" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure" mode="M78" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M78" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M78" priority="-1" />
  <xsl:template match="@*|node()" mode="M78" priority="-2">
    <xsl:apply-templates mode="M78" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric" mode="M79" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CalculationSequenceNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M79" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M79" priority="-1" />
  <xsl:template match="@*|node()" mode="M79" priority="-2">
    <xsl:apply-templates mode="M79" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount" mode="M80" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M80" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M80" priority="-1" />
  <xsl:template match="@*|node()" mode="M80" priority="-2">
    <xsl:apply-templates mode="M80" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:Percent" mode="M81" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:Percent" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Percent' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M81" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M81" priority="-1" />
  <xsl:template match="@*|node()" mode="M81" priority="-2">
    <xsl:apply-templates mode="M81" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange" mode="M82" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRange' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M82" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M82" priority="-1" />
  <xsl:template match="@*|node()" mode="M82" priority="-2">
    <xsl:apply-templates mode="M82" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent" mode="M83" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M83" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M83" priority="-1" />
  <xsl:template match="@*|node()" mode="M83" priority="-2">
    <xsl:apply-templates mode="M83" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount" mode="M84" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TransactionCurrencyTaxAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M84" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M84" priority="-1" />
  <xsl:template match="@*|node()" mode="M84" priority="-2">
    <xsl:apply-templates mode="M84" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount" mode="M85" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:RoundingAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M85" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M85" priority="-1" />
  <xsl:template match="@*|node()" mode="M85" priority="-2">
    <xsl:apply-templates mode="M85" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator" mode="M86" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxEvidenceIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M86" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M86" priority="-1" />
  <xsl:template match="@*|node()" mode="M86" priority="-2">
    <xsl:apply-templates mode="M86" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxIncludedIndicator" mode="M87" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cac:TaxTotal/cbc:TaxIncludedIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M87" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M87" priority="-1" />
  <xsl:template match="@*|node()" mode="M87" priority="-2">
    <xsl:apply-templates mode="M87" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCost" mode="M88" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCost" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCost' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M88" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M88" priority="-1" />
  <xsl:template match="@*|node()" mode="M88" priority="-2">
    <xsl:apply-templates mode="M88" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCostCode" mode="M89" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AccountingCostCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M89" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M89" priority="-1" />
  <xsl:template match="@*|node()" mode="M89" priority="-2">
    <xsl:apply-templates mode="M89" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason" mode="M90" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReason" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M90" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M90" priority="-1" />
  <xsl:template match="@*|node()" mode="M90" priority="-2">
    <xsl:apply-templates mode="M90" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" mode="M91" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M91" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M91" priority="-1" />
  <xsl:template match="@*|node()" mode="M91" priority="-2">
    <xsl:apply-templates mode="M91" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:BaseAmount" mode="M92" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:BaseAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BaseAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M92" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M92" priority="-1" />
  <xsl:template match="@*|node()" mode="M92" priority="-2">
    <xsl:apply-templates mode="M92" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:ID" mode="M93" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M93" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M93" priority="-1" />
  <xsl:template match="@*|node()" mode="M93" priority="-2">
    <xsl:apply-templates mode="M93" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" mode="M94" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M94" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M94" priority="-1" />
  <xsl:template match="@*|node()" mode="M94" priority="-2">
    <xsl:apply-templates mode="M94" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:PerUnitAmount" mode="M95" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PerUnitAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M95" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M95" priority="-1" />
  <xsl:template match="@*|node()" mode="M95" priority="-2">
    <xsl:apply-templates mode="M95" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:PrepaidIndicator" mode="M96" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:PrepaidIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M96" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M96" priority="-1" />
  <xsl:template match="@*|node()" mode="M96" priority="-2">
    <xsl:apply-templates mode="M96" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:AllowanceCharge/cbc:SequenceNumeric" mode="M97" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:AllowanceCharge/cbc:SequenceNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M97" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M97" priority="-1" />
  <xsl:template match="@*|node()" mode="M97" priority="-2">
    <xsl:apply-templates mode="M97" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:AdditionalDocumentReference" mode="M98" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:AdditionalDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M98" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M98" priority="-1" />
  <xsl:template match="@*|node()" mode="M98" priority="-2">
    <xsl:apply-templates mode="M98" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:BillingReferenceLine" mode="M99" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:BillingReferenceLine" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:BillingReferenceLine' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M99" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M99" priority="-1" />
  <xsl:template match="@*|node()" mode="M99" priority="-2">
    <xsl:apply-templates mode="M99" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference" mode="M100" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:CreditNoteDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CreditNoteDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M100" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M100" priority="-1" />
  <xsl:template match="@*|node()" mode="M100" priority="-2">
    <xsl:apply-templates mode="M100" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:DebitNoteDocumentReference" mode="M101" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:DebitNoteDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M101" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M101" priority="-1" />
  <xsl:template match="@*|node()" mode="M101" priority="-2">
    <xsl:apply-templates mode="M101" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment" mode="M102" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Attachment' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M102" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M102" priority="-1" />
  <xsl:template match="@*|node()" mode="M102" priority="-2">
    <xsl:apply-templates mode="M102" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty" mode="M103" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M103" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M103" priority="-1" />
  <xsl:template match="@*|node()" mode="M103" priority="-2">
    <xsl:apply-templates mode="M103" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification" mode="M104" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M104" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M104" priority="-1" />
  <xsl:template match="@*|node()" mode="M104" priority="-2">
    <xsl:apply-templates mode="M104" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod" mode="M105" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M105" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M105" priority="-1" />
  <xsl:template match="@*|node()" mode="M105" priority="-2">
    <xsl:apply-templates mode="M105" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator" mode="M106" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M106" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M106" priority="-1" />
  <xsl:template match="@*|node()" mode="M106" priority="-2">
    <xsl:apply-templates mode="M106" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription" mode="M107" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M107" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M107" priority="-1" />
  <xsl:template match="@*|node()" mode="M107" priority="-2">
    <xsl:apply-templates mode="M107" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode" mode="M108" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M108" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M108" priority="-1" />
  <xsl:template match="@*|node()" mode="M108" priority="-2">
    <xsl:apply-templates mode="M108" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType" mode="M109" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentType' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M109" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M109" priority="-1" />
  <xsl:template match="@*|node()" mode="M109" priority="-2">
    <xsl:apply-templates mode="M109" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode" mode="M110" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M110" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M110" priority="-1" />
  <xsl:template match="@*|node()" mode="M110" priority="-2">
    <xsl:apply-templates mode="M110" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID" mode="M111" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M111" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M111" priority="-1" />
  <xsl:template match="@*|node()" mode="M111" priority="-2">
    <xsl:apply-templates mode="M111" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate" mode="M112" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M112" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M112" priority="-1" />
  <xsl:template match="@*|node()" mode="M112" priority="-2">
    <xsl:apply-templates mode="M112" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime" mode="M113" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M113" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M113" priority="-1" />
  <xsl:template match="@*|node()" mode="M113" priority="-2">
    <xsl:apply-templates mode="M113" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID" mode="M114" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LanguageID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M114" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M114" priority="-1" />
  <xsl:template match="@*|node()" mode="M114" priority="-2">
    <xsl:apply-templates mode="M114" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode" mode="M115" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LocaleCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M115" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M115" priority="-1" />
  <xsl:template match="@*|node()" mode="M115" priority="-2">
    <xsl:apply-templates mode="M115" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID" mode="M116" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M116" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M116" priority="-1" />
  <xsl:template match="@*|node()" mode="M116" priority="-2">
    <xsl:apply-templates mode="M116" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID" mode="M117" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:VersionID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M117" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M117" priority="-1" />
  <xsl:template match="@*|node()" mode="M117" priority="-2">
    <xsl:apply-templates mode="M117" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath" mode="M118" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:XPath' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M118" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M118" priority="-1" />
  <xsl:template match="@*|node()" mode="M118" priority="-2">
    <xsl:apply-templates mode="M118" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:ReminderDocumentReference" mode="M119" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:ReminderDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M119" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M119" priority="-1" />
  <xsl:template match="@*|node()" mode="M119" priority="-2">
    <xsl:apply-templates mode="M119" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference" mode="M120" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M120" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M120" priority="-1" />
  <xsl:template match="@*|node()" mode="M120" priority="-2">
    <xsl:apply-templates mode="M120" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference" mode="M121" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M121" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M121" priority="-1" />
  <xsl:template match="@*|node()" mode="M121" priority="-2">
    <xsl:apply-templates mode="M121" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:AccountingContact" mode="M122" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:AccountingContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AccountingContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M122" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M122" priority="-1" />
  <xsl:template match="@*|node()" mode="M122" priority="-2">
    <xsl:apply-templates mode="M122" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:Channel" mode="M123" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:Channel" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Channel' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M123" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M123" priority="-1" />
  <xsl:template match="@*|node()" mode="M123" priority="-2">
    <xsl:apply-templates mode="M123" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:ChannelCode" mode="M124" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:ChannelCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ChannelCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M124" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M124" priority="-1" />
  <xsl:template match="@*|node()" mode="M124" priority="-2">
    <xsl:apply-templates mode="M124" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:Value" mode="M125" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cac:OtherCommunication/cbc:Value" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M125" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M125" priority="-1" />
  <xsl:template match="@*|node()" mode="M125" priority="-2">
    <xsl:apply-templates mode="M125" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ElectronicMail" mode="M126" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ElectronicMail" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ElectronicMail' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M126" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M126" priority="-1" />
  <xsl:template match="@*|node()" mode="M126" priority="-2">
    <xsl:apply-templates mode="M126" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ID" mode="M127" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M127" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M127" priority="-1" />
  <xsl:template match="@*|node()" mode="M127" priority="-2">
    <xsl:apply-templates mode="M127" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Name" mode="M128" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M128" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M128" priority="-1" />
  <xsl:template match="@*|node()" mode="M128" priority="-2">
    <xsl:apply-templates mode="M128" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Note" mode="M129" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Note" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Note' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M129" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M129" priority="-1" />
  <xsl:template match="@*|node()" mode="M129" priority="-2">
    <xsl:apply-templates mode="M129" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telefax" mode="M130" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telefax" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Telefax' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M130" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M130" priority="-1" />
  <xsl:template match="@*|node()" mode="M130" priority="-2">
    <xsl:apply-templates mode="M130" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telephone" mode="M131" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:BuyerContact/cbc:Telephone" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Telephone' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M131" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M131" priority="-1" />
  <xsl:template match="@*|node()" mode="M131" priority="-2">
    <xsl:apply-templates mode="M131" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:DeliveryContact" mode="M132" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:DeliveryContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DeliveryContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M132" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M132" priority="-1" />
  <xsl:template match="@*|node()" mode="M132" priority="-2">
    <xsl:apply-templates mode="M132" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:AgentParty" mode="M133" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:AgentParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AgentParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M133" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M133" priority="-1" />
  <xsl:template match="@*|node()" mode="M133" priority="-2">
    <xsl:apply-templates mode="M133" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication" mode="M134" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OtherCommunication' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M134" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M134" priority="-1" />
  <xsl:template match="@*|node()" mode="M134" priority="-2">
    <xsl:apply-templates mode="M134" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M135" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M135" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M135" priority="-1" />
  <xsl:template match="@*|node()" mode="M135" priority="-2">
    <xsl:apply-templates mode="M135" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID" mode="M136" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M136" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M136" priority="-1" />
  <xsl:template match="@*|node()" mode="M136" priority="-2">
    <xsl:apply-templates mode="M136" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name" mode="M137" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M137" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M137" priority="-1" />
  <xsl:template match="@*|node()" mode="M137" priority="-2">
    <xsl:apply-templates mode="M137" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note" mode="M138" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Note' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M138" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M138" priority="-1" />
  <xsl:template match="@*|node()" mode="M138" priority="-2">
    <xsl:apply-templates mode="M138" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax" mode="M139" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M139" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M139" priority="-1" />
  <xsl:template match="@*|node()" mode="M139" priority="-2">
    <xsl:apply-templates mode="M139" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone" mode="M140" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M140" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M140" priority="-1" />
  <xsl:template match="@*|node()" mode="M140" priority="-2">
    <xsl:apply-templates mode="M140" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount" mode="M141" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:FinancialAccount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M141" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M141" priority="-1" />
  <xsl:template match="@*|node()" mode="M141" priority="-2">
    <xsl:apply-templates mode="M141" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Language" mode="M142" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Language" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Language' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M142" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M142" priority="-1" />
  <xsl:template match="@*|node()" mode="M142" priority="-2">
    <xsl:apply-templates mode="M142" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M143" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M143" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M143" priority="-1" />
  <xsl:template match="@*|node()" mode="M143" priority="-2">
    <xsl:apply-templates mode="M143" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" mode="M144" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M144" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M144" priority="-1" />
  <xsl:template match="@*|node()" mode="M144" priority="-2">
    <xsl:apply-templates mode="M144" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" mode="M145" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:HeadParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M145" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M145" priority="-1" />
  <xsl:template match="@*|node()" mode="M145" priority="-2">
    <xsl:apply-templates mode="M145" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress" mode="M146" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M146" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M146" priority="-1" />
  <xsl:template match="@*|node()" mode="M146" priority="-2">
    <xsl:apply-templates mode="M146" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" mode="M147" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ShareholderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M147" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M147" priority="-1" />
  <xsl:template match="@*|node()" mode="M147" priority="-2">
    <xsl:apply-templates mode="M147" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" mode="M148" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M148" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M148" priority="-1" />
  <xsl:template match="@*|node()" mode="M148" priority="-2">
    <xsl:apply-templates mode="M148" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" mode="M149" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M149" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M149" priority="-1" />
  <xsl:template match="@*|node()" mode="M149" priority="-2">
    <xsl:apply-templates mode="M149" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" mode="M150" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M150" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M150" priority="-1" />
  <xsl:template match="@*|node()" mode="M150" priority="-2">
    <xsl:apply-templates mode="M150" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" mode="M151" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M151" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M151" priority="-1" />
  <xsl:template match="@*|node()" mode="M151" priority="-2">
    <xsl:apply-templates mode="M151" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" mode="M152" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M152" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M152" priority="-1" />
  <xsl:template match="@*|node()" mode="M152" priority="-2">
    <xsl:apply-templates mode="M152" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" mode="M153" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M153" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M153" priority="-1" />
  <xsl:template match="@*|node()" mode="M153" priority="-2">
    <xsl:apply-templates mode="M153" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" mode="M154" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M154" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M154" priority="-1" />
  <xsl:template match="@*|node()" mode="M154" priority="-2">
    <xsl:apply-templates mode="M154" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M155" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M155" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M155" priority="-1" />
  <xsl:template match="@*|node()" mode="M155" priority="-2">
    <xsl:apply-templates mode="M155" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" mode="M156" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M156" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M156" priority="-1" />
  <xsl:template match="@*|node()" mode="M156" priority="-2">
    <xsl:apply-templates mode="M156" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyName" mode="M157" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PartyName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M157" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M157" priority="-1" />
  <xsl:template match="@*|node()" mode="M157" priority="-2">
    <xsl:apply-templates mode="M157" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress" mode="M158" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M158" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M158" priority="-1" />
  <xsl:template match="@*|node()" mode="M158" priority="-2">
    <xsl:apply-templates mode="M158" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress" mode="M159" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M159" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M159" priority="-1" />
  <xsl:template match="@*|node()" mode="M159" priority="-2">
    <xsl:apply-templates mode="M159" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode" mode="M160" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M160" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M160" priority="-1" />
  <xsl:template match="@*|node()" mode="M160" priority="-2">
    <xsl:apply-templates mode="M160" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" mode="M161" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M161" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M161" priority="-1" />
  <xsl:template match="@*|node()" mode="M161" priority="-2">
    <xsl:apply-templates mode="M161" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" mode="M162" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M162" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M162" priority="-1" />
  <xsl:template match="@*|node()" mode="M162" priority="-2">
    <xsl:apply-templates mode="M162" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode" mode="M163" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M163" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M163" priority="-1" />
  <xsl:template match="@*|node()" mode="M163" priority="-2">
    <xsl:apply-templates mode="M163" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" mode="M164" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M164" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M164" priority="-1" />
  <xsl:template match="@*|node()" mode="M164" priority="-2">
    <xsl:apply-templates mode="M164" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason" mode="M165" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M165" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M165" priority="-1" />
  <xsl:template match="@*|node()" mode="M165" priority="-2">
    <xsl:apply-templates mode="M165" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode" mode="M166" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M166" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M166" priority="-1" />
  <xsl:template match="@*|node()" mode="M166" priority="-2">
    <xsl:apply-templates mode="M166" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName" mode="M167" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M167" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M167" priority="-1" />
  <xsl:template match="@*|node()" mode="M167" priority="-2">
    <xsl:apply-templates mode="M167" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode" mode="M168" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M168" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M168" priority="-1" />
  <xsl:template match="@*|node()" mode="M168" priority="-2">
    <xsl:apply-templates mode="M168" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Person" mode="M169" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:Person" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Person' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M169" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M169" priority="-1" />
  <xsl:template match="@*|node()" mode="M169" priority="-2">
    <xsl:apply-templates mode="M169" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation" mode="M170" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M170" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M170" priority="-1" />
  <xsl:template match="@*|node()" mode="M170" priority="-2">
    <xsl:apply-templates mode="M170" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine" mode="M171" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AddressLine' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M171" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M171" priority="-1" />
  <xsl:template match="@*|node()" mode="M171" priority="-2">
    <xsl:apply-templates mode="M171" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M172" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M172" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M172" priority="-1" />
  <xsl:template match="@*|node()" mode="M172" priority="-2">
    <xsl:apply-templates mode="M172" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name" mode="M173" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M173" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M173" priority="-1" />
  <xsl:template match="@*|node()" mode="M173" priority="-2">
    <xsl:apply-templates mode="M173" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate" mode="M174" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M174" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M174" priority="-1" />
  <xsl:template match="@*|node()" mode="M174" priority="-2">
    <xsl:apply-templates mode="M174" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M175" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M175" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M175" priority="-1" />
  <xsl:template match="@*|node()" mode="M175" priority="-2">
    <xsl:apply-templates mode="M175" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode" mode="M176" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M176" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M176" priority="-1" />
  <xsl:template match="@*|node()" mode="M176" priority="-2">
    <xsl:apply-templates mode="M176" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode" mode="M177" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M177" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M177" priority="-1" />
  <xsl:template match="@*|node()" mode="M177" priority="-2">
    <xsl:apply-templates mode="M177" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName" mode="M178" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BlockName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M178" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M178" priority="-1" />
  <xsl:template match="@*|node()" mode="M178" priority="-2">
    <xsl:apply-templates mode="M178" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName" mode="M179" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BuildingName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M179" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M179" priority="-1" />
  <xsl:template match="@*|node()" mode="M179" priority="-2">
    <xsl:apply-templates mode="M179" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber" mode="M180" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M180" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M180" priority="-1" />
  <xsl:template match="@*|node()" mode="M180" priority="-2">
    <xsl:apply-templates mode="M180" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M181" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M181" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M181" priority="-1" />
  <xsl:template match="@*|node()" mode="M181" priority="-2">
    <xsl:apply-templates mode="M181" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" mode="M182" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M182" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M182" priority="-1" />
  <xsl:template match="@*|node()" mode="M182" priority="-2">
    <xsl:apply-templates mode="M182" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M183" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M183" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M183" priority="-1" />
  <xsl:template match="@*|node()" mode="M183" priority="-2">
    <xsl:apply-templates mode="M183" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode" mode="M184" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M184" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M184" priority="-1" />
  <xsl:template match="@*|node()" mode="M184" priority="-2">
    <xsl:apply-templates mode="M184" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Department" mode="M185" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Department" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Department' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M185" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M185" priority="-1" />
  <xsl:template match="@*|node()" mode="M185" priority="-2">
    <xsl:apply-templates mode="M185" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District" mode="M186" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:District' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M186" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M186" priority="-1" />
  <xsl:template match="@*|node()" mode="M186" priority="-2">
    <xsl:apply-templates mode="M186" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor" mode="M187" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Floor' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M187" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M187" priority="-1" />
  <xsl:template match="@*|node()" mode="M187" priority="-2">
    <xsl:apply-templates mode="M187" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:ID" mode="M188" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M188" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M188" priority="-1" />
  <xsl:template match="@*|node()" mode="M188" priority="-2">
    <xsl:apply-templates mode="M188" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail" mode="M189" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:InhouseMail' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M189" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M189" priority="-1" />
  <xsl:template match="@*|node()" mode="M189" priority="-2">
    <xsl:apply-templates mode="M189" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention" mode="M190" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkAttention' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M190" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M190" priority="-1" />
  <xsl:template match="@*|node()" mode="M190" priority="-2">
    <xsl:apply-templates mode="M190" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare" mode="M191" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkCare' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M191" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M191" priority="-1" />
  <xsl:template match="@*|node()" mode="M191" priority="-2">
    <xsl:apply-templates mode="M191" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification" mode="M192" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M192" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M192" priority="-1" />
  <xsl:template match="@*|node()" mode="M192" priority="-2">
    <xsl:apply-templates mode="M192" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M193" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M193" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M193" priority="-1" />
  <xsl:template match="@*|node()" mode="M193" priority="-2">
    <xsl:apply-templates mode="M193" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox" mode="M194" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Postbox' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M194" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M194" priority="-1" />
  <xsl:template match="@*|node()" mode="M194" priority="-2">
    <xsl:apply-templates mode="M194" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region" mode="M195" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Region' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M195" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M195" priority="-1" />
  <xsl:template match="@*|node()" mode="M195" priority="-2">
    <xsl:apply-templates mode="M195" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room" mode="M196" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Room' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M196" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M196" priority="-1" />
  <xsl:template match="@*|node()" mode="M196" priority="-2">
    <xsl:apply-templates mode="M196" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M197" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M197" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M197" priority="-1" />
  <xsl:template match="@*|node()" mode="M197" priority="-2">
    <xsl:apply-templates mode="M197" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset" mode="M198" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M198" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M198" priority="-1" />
  <xsl:template match="@*|node()" mode="M198" priority="-2">
    <xsl:apply-templates mode="M198" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney" mode="M199" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M199" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M199" priority="-1" />
  <xsl:template match="@*|node()" mode="M199" priority="-2">
    <xsl:apply-templates mode="M199" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty" mode="M200" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M200" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M200" priority="-1" />
  <xsl:template match="@*|node()" mode="M200" priority="-2">
    <xsl:apply-templates mode="M200" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID" mode="M201" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:EndpointID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M201" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M201" priority="-1" />
  <xsl:template match="@*|node()" mode="M201" priority="-2">
    <xsl:apply-templates mode="M201" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode" mode="M202" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M202" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M202" priority="-1" />
  <xsl:template match="@*|node()" mode="M202" priority="-2">
    <xsl:apply-templates mode="M202" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID" mode="M203" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M203" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M203" priority="-1" />
  <xsl:template match="@*|node()" mode="M203" priority="-2">
    <xsl:apply-templates mode="M203" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator" mode="M204" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M204" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M204" priority="-1" />
  <xsl:template match="@*|node()" mode="M204" priority="-2">
    <xsl:apply-templates mode="M204" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator" mode="M205" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M205" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M205" priority="-1" />
  <xsl:template match="@*|node()" mode="M205" priority="-2">
    <xsl:apply-templates mode="M205" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI" mode="M206" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M206" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M206" priority="-1" />
  <xsl:template match="@*|node()" mode="M206" priority="-2">
    <xsl:apply-templates mode="M206" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cbc:AdditionalAccountID" mode="M207" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cbc:AdditionalAccountID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M207" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M207" priority="-1" />
  <xsl:template match="@*|node()" mode="M207" priority="-2">
    <xsl:apply-templates mode="M207" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID" mode="M208" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M208" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M208" priority="-1" />
  <xsl:template match="@*|node()" mode="M208" priority="-2">
    <xsl:apply-templates mode="M208" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID" mode="M209" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M209" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M209" priority="-1" />
  <xsl:template match="@*|node()" mode="M209" priority="-2">
    <xsl:apply-templates mode="M209" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cac:Attachment" mode="M210" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:Attachment" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Attachment' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M210" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M210" priority="-1" />
  <xsl:template match="@*|node()" mode="M210" priority="-2">
    <xsl:apply-templates mode="M210" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cac:IssuerParty" mode="M211" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:IssuerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M211" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M211" priority="-1" />
  <xsl:template match="@*|node()" mode="M211" priority="-2">
    <xsl:apply-templates mode="M211" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cac:ResultOfVerification" mode="M212" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ResultOfVerification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M212" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M212" priority="-1" />
  <xsl:template match="@*|node()" mode="M212" priority="-2">
    <xsl:apply-templates mode="M212" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cac:ValidityPeriod" mode="M213" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cac:ValidityPeriod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M213" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M213" priority="-1" />
  <xsl:template match="@*|node()" mode="M213" priority="-2">
    <xsl:apply-templates mode="M213" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:CopyIndicator" mode="M214" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:CopyIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M214" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M214" priority="-1" />
  <xsl:template match="@*|node()" mode="M214" priority="-2">
    <xsl:apply-templates mode="M214" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentDescription" mode="M215" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentDescription" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M215" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M215" priority="-1" />
  <xsl:template match="@*|node()" mode="M215" priority="-2">
    <xsl:apply-templates mode="M215" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentStatusCode" mode="M216" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M216" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M216" priority="-1" />
  <xsl:template match="@*|node()" mode="M216" priority="-2">
    <xsl:apply-templates mode="M216" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentType" mode="M217" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentType" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M217" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M217" priority="-1" />
  <xsl:template match="@*|node()" mode="M217" priority="-2">
    <xsl:apply-templates mode="M217" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode" mode="M218" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:DocumentTypeCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M218" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M218" priority="-1" />
  <xsl:template match="@*|node()" mode="M218" priority="-2">
    <xsl:apply-templates mode="M218" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID" mode="M219" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M219" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M219" priority="-1" />
  <xsl:template match="@*|node()" mode="M219" priority="-2">
    <xsl:apply-templates mode="M219" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueDate" mode="M220" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M220" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M220" priority="-1" />
  <xsl:template match="@*|node()" mode="M220" priority="-2">
    <xsl:apply-templates mode="M220" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueTime" mode="M221" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:IssueTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M221" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M221" priority="-1" />
  <xsl:template match="@*|node()" mode="M221" priority="-2">
    <xsl:apply-templates mode="M221" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:LanguageID" mode="M222" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LanguageID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LanguageID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M222" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M222" priority="-1" />
  <xsl:template match="@*|node()" mode="M222" priority="-2">
    <xsl:apply-templates mode="M222" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:LocaleCode" mode="M223" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:LocaleCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LocaleCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M223" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M223" priority="-1" />
  <xsl:template match="@*|node()" mode="M223" priority="-2">
    <xsl:apply-templates mode="M223" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:UUID" mode="M224" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M224" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M224" priority="-1" />
  <xsl:template match="@*|node()" mode="M224" priority="-2">
    <xsl:apply-templates mode="M224" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:VersionID" mode="M225" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:VersionID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:VersionID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M225" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M225" priority="-1" />
  <xsl:template match="@*|node()" mode="M225" priority="-2">
    <xsl:apply-templates mode="M225" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ContractDocumentReference/cbc:XPath" mode="M226" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ContractDocumentReference/cbc:XPath" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:XPath' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M226" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M226" priority="-1" />
  <xsl:template match="@*|node()" mode="M226" priority="-2">
    <xsl:apply-templates mode="M226" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:PaymentMeans" mode="M227" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:PaymentMeans" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentMeans' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M227" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M227" priority="-1" />
  <xsl:template match="@*|node()" mode="M227" priority="-2">
    <xsl:apply-templates mode="M227" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxCategory" mode="M228" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxCategory" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TaxCategory' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M228" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M228" priority="-1" />
  <xsl:template match="@*|node()" mode="M228" priority="-2">
    <xsl:apply-templates mode="M228" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxTotal" mode="M229" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cac:TaxTotal" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TaxTotal' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M229" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M229" priority="-1" />
  <xsl:template match="@*|node()" mode="M229" priority="-2">
    <xsl:apply-templates mode="M229" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCost" mode="M230" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCost" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCost' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M230" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M230" priority="-1" />
  <xsl:template match="@*|node()" mode="M230" priority="-2">
    <xsl:apply-templates mode="M230" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCostCode" mode="M231" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AccountingCostCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M231" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M231" priority="-1" />
  <xsl:template match="@*|node()" mode="M231" priority="-2">
    <xsl:apply-templates mode="M231" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason" mode="M232" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReason" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M232" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M232" priority="-1" />
  <xsl:template match="@*|node()" mode="M232" priority="-2">
    <xsl:apply-templates mode="M232" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" mode="M233" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M233" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M233" priority="-1" />
  <xsl:template match="@*|node()" mode="M233" priority="-2">
    <xsl:apply-templates mode="M233" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:BaseAmount" mode="M234" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:BaseAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BaseAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M234" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M234" priority="-1" />
  <xsl:template match="@*|node()" mode="M234" priority="-2">
    <xsl:apply-templates mode="M234" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:ID" mode="M235" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M235" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M235" priority="-1" />
  <xsl:template match="@*|node()" mode="M235" priority="-2">
    <xsl:apply-templates mode="M235" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" mode="M236" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M236" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M236" priority="-1" />
  <xsl:template match="@*|node()" mode="M236" priority="-2">
    <xsl:apply-templates mode="M236" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PerUnitAmount" mode="M237" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PerUnitAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M237" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M237" priority="-1" />
  <xsl:template match="@*|node()" mode="M237" priority="-2">
    <xsl:apply-templates mode="M237" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PrepaidIndicator" mode="M238" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:PrepaidIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M238" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M238" priority="-1" />
  <xsl:template match="@*|node()" mode="M238" priority="-2">
    <xsl:apply-templates mode="M238" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:SequenceNumeric" mode="M239" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:AllowanceCharge/cbc:SequenceNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M239" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M239" priority="-1" />
  <xsl:template match="@*|node()" mode="M239" priority="-2">
    <xsl:apply-templates mode="M239" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:AdditionalDocumentReference" mode="M240" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:AdditionalDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M240" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M240" priority="-1" />
  <xsl:template match="@*|node()" mode="M240" priority="-2">
    <xsl:apply-templates mode="M240" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cac:AllowanceCharge" mode="M241" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cac:AllowanceCharge" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M241" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M241" priority="-1" />
  <xsl:template match="@*|node()" mode="M241" priority="-2">
    <xsl:apply-templates mode="M241" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:Amount" mode="M242" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:Amount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Amount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M242" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M242" priority="-1" />
  <xsl:template match="@*|node()" mode="M242" priority="-2">
    <xsl:apply-templates mode="M242" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID" mode="M243" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:BillingReferenceLine/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M243" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M243" priority="-1" />
  <xsl:template match="@*|node()" mode="M243" priority="-2">
    <xsl:apply-templates mode="M243" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference" mode="M244" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:CreditNoteDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CreditNoteDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M244" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M244" priority="-1" />
  <xsl:template match="@*|node()" mode="M244" priority="-2">
    <xsl:apply-templates mode="M244" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:DebitNoteDocumentReference" mode="M245" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:DebitNoteDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DebitNoteDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M245" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M245" priority="-1" />
  <xsl:template match="@*|node()" mode="M245" priority="-2">
    <xsl:apply-templates mode="M245" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment" mode="M246" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Attachment' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M246" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M246" priority="-1" />
  <xsl:template match="@*|node()" mode="M246" priority="-2">
    <xsl:apply-templates mode="M246" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty" mode="M247" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M247" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M247" priority="-1" />
  <xsl:template match="@*|node()" mode="M247" priority="-2">
    <xsl:apply-templates mode="M247" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification" mode="M248" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M248" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M248" priority="-1" />
  <xsl:template match="@*|node()" mode="M248" priority="-2">
    <xsl:apply-templates mode="M248" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod" mode="M249" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M249" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M249" priority="-1" />
  <xsl:template match="@*|node()" mode="M249" priority="-2">
    <xsl:apply-templates mode="M249" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator" mode="M250" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M250" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M250" priority="-1" />
  <xsl:template match="@*|node()" mode="M250" priority="-2">
    <xsl:apply-templates mode="M250" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription" mode="M251" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M251" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M251" priority="-1" />
  <xsl:template match="@*|node()" mode="M251" priority="-2">
    <xsl:apply-templates mode="M251" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode" mode="M252" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M252" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M252" priority="-1" />
  <xsl:template match="@*|node()" mode="M252" priority="-2">
    <xsl:apply-templates mode="M252" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType" mode="M253" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentType' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M253" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M253" priority="-1" />
  <xsl:template match="@*|node()" mode="M253" priority="-2">
    <xsl:apply-templates mode="M253" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode" mode="M254" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M254" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M254" priority="-1" />
  <xsl:template match="@*|node()" mode="M254" priority="-2">
    <xsl:apply-templates mode="M254" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID" mode="M255" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M255" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M255" priority="-1" />
  <xsl:template match="@*|node()" mode="M255" priority="-2">
    <xsl:apply-templates mode="M255" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate" mode="M256" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M256" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M256" priority="-1" />
  <xsl:template match="@*|node()" mode="M256" priority="-2">
    <xsl:apply-templates mode="M256" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime" mode="M257" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M257" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M257" priority="-1" />
  <xsl:template match="@*|node()" mode="M257" priority="-2">
    <xsl:apply-templates mode="M257" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID" mode="M258" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LanguageID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M258" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M258" priority="-1" />
  <xsl:template match="@*|node()" mode="M258" priority="-2">
    <xsl:apply-templates mode="M258" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode" mode="M259" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LocaleCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M259" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M259" priority="-1" />
  <xsl:template match="@*|node()" mode="M259" priority="-2">
    <xsl:apply-templates mode="M259" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID" mode="M260" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M260" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M260" priority="-1" />
  <xsl:template match="@*|node()" mode="M260" priority="-2">
    <xsl:apply-templates mode="M260" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID" mode="M261" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:VersionID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M261" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M261" priority="-1" />
  <xsl:template match="@*|node()" mode="M261" priority="-2">
    <xsl:apply-templates mode="M261" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath" mode="M262" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:InvoiceDocumentReference/cbc:XPath" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:XPath' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M262" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M262" priority="-1" />
  <xsl:template match="@*|node()" mode="M262" priority="-2">
    <xsl:apply-templates mode="M262" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:ReminderDocumentReference" mode="M263" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:ReminderDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ReminderDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M263" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M263" priority="-1" />
  <xsl:template match="@*|node()" mode="M263" priority="-2">
    <xsl:apply-templates mode="M263" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference" mode="M264" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SelfBilledCreditNoteDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M264" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M264" priority="-1" />
  <xsl:template match="@*|node()" mode="M264" priority="-2">
    <xsl:apply-templates mode="M264" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference" mode="M265" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:BillingReference/cac:SelfBilledInvoiceDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SelfBilledInvoiceDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M265" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M265" priority="-1" />
  <xsl:template match="@*|node()" mode="M265" priority="-2">
    <xsl:apply-templates mode="M265" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery" mode="M266" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Delivery" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Delivery' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M266" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M266" priority="-1" />
  <xsl:template match="@*|node()" mode="M266" priority="-2">
    <xsl:apply-templates mode="M266" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DeliveryTerms" mode="M267" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DeliveryTerms" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M267" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M267" priority="-1" />
  <xsl:template match="@*|node()" mode="M267" priority="-2">
    <xsl:apply-templates mode="M267" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DespatchLineReference" mode="M268" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DespatchLineReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DespatchLineReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M268" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M268" priority="-1" />
  <xsl:template match="@*|node()" mode="M268" priority="-2">
    <xsl:apply-templates mode="M268" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DiscrepancyResponse" mode="M269" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DiscrepancyResponse" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M269" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M269" priority="-1" />
  <xsl:template match="@*|node()" mode="M269" priority="-2">
    <xsl:apply-templates mode="M269" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:Attachment" mode="M270" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:Attachment" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Attachment' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M270" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M270" priority="-1" />
  <xsl:template match="@*|node()" mode="M270" priority="-2">
    <xsl:apply-templates mode="M270" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:IssuerParty" mode="M271" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:IssuerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M271" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M271" priority="-1" />
  <xsl:template match="@*|node()" mode="M271" priority="-2">
    <xsl:apply-templates mode="M271" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:ResultOfVerification" mode="M272" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:ResultOfVerification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ResultOfVerification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M272" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M272" priority="-1" />
  <xsl:template match="@*|node()" mode="M272" priority="-2">
    <xsl:apply-templates mode="M272" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:ValidityPeriod" mode="M273" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cac:ValidityPeriod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M273" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M273" priority="-1" />
  <xsl:template match="@*|node()" mode="M273" priority="-2">
    <xsl:apply-templates mode="M273" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:CopyIndicator" mode="M274" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:CopyIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M274" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M274" priority="-1" />
  <xsl:template match="@*|node()" mode="M274" priority="-2">
    <xsl:apply-templates mode="M274" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentDescription" mode="M275" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentDescription" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentDescription' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M275" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M275" priority="-1" />
  <xsl:template match="@*|node()" mode="M275" priority="-2">
    <xsl:apply-templates mode="M275" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentStatusCode" mode="M276" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M276" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M276" priority="-1" />
  <xsl:template match="@*|node()" mode="M276" priority="-2">
    <xsl:apply-templates mode="M276" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentType" mode="M277" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentType" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentType' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M277" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M277" priority="-1" />
  <xsl:template match="@*|node()" mode="M277" priority="-2">
    <xsl:apply-templates mode="M277" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentTypeCode" mode="M278" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:DocumentTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DocumentTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M278" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M278" priority="-1" />
  <xsl:template match="@*|node()" mode="M278" priority="-2">
    <xsl:apply-templates mode="M278" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:ID" mode="M279" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M279" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M279" priority="-1" />
  <xsl:template match="@*|node()" mode="M279" priority="-2">
    <xsl:apply-templates mode="M279" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:IssueDate" mode="M280" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:IssueDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M280" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M280" priority="-1" />
  <xsl:template match="@*|node()" mode="M280" priority="-2">
    <xsl:apply-templates mode="M280" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:IssueTime" mode="M281" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:IssueTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M281" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M281" priority="-1" />
  <xsl:template match="@*|node()" mode="M281" priority="-2">
    <xsl:apply-templates mode="M281" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:LanguageID" mode="M282" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:LanguageID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LanguageID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M282" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M282" priority="-1" />
  <xsl:template match="@*|node()" mode="M282" priority="-2">
    <xsl:apply-templates mode="M282" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:LocaleCode" mode="M283" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:LocaleCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LocaleCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M283" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M283" priority="-1" />
  <xsl:template match="@*|node()" mode="M283" priority="-2">
    <xsl:apply-templates mode="M283" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:UUID" mode="M284" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M284" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M284" priority="-1" />
  <xsl:template match="@*|node()" mode="M284" priority="-2">
    <xsl:apply-templates mode="M284" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:VersionID" mode="M285" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:VersionID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:VersionID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M285" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M285" priority="-1" />
  <xsl:template match="@*|node()" mode="M285" priority="-2">
    <xsl:apply-templates mode="M285" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:XPath" mode="M286" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:DocumentReference/cbc:XPath" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:XPath' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M286" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M286" priority="-1" />
  <xsl:template match="@*|node()" mode="M286" priority="-2">
    <xsl:apply-templates mode="M286" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:Description" mode="M287" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:Description" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Description' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M287" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M287" priority="-1" />
  <xsl:template match="@*|node()" mode="M287" priority="-2">
    <xsl:apply-templates mode="M287" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DescriptionCode" mode="M288" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DescriptionCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M288" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M288" priority="-1" />
  <xsl:template match="@*|node()" mode="M288" priority="-2">
    <xsl:apply-templates mode="M288" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DurationMeasure" mode="M289" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:DurationMeasure" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M289" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M289" priority="-1" />
  <xsl:template match="@*|node()" mode="M289" priority="-2">
    <xsl:apply-templates mode="M289" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:EndTime" mode="M290" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:EndTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:EndTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M290" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M290" priority="-1" />
  <xsl:template match="@*|node()" mode="M290" priority="-2">
    <xsl:apply-templates mode="M290" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:StartTime" mode="M291" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:InvoicePeriod/cbc:StartTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:StartTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M291" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M291" priority="-1" />
  <xsl:template match="@*|node()" mode="M291" priority="-2">
    <xsl:apply-templates mode="M291" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemIdentification" mode="M292" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M292" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M292" priority="-1" />
  <xsl:template match="@*|node()" mode="M292" priority="-2">
    <xsl:apply-templates mode="M292" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty" mode="M293" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:AdditionalItemProperty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M293" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M293" priority="-1" />
  <xsl:template match="@*|node()" mode="M293" priority="-2">
    <xsl:apply-templates mode="M293" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:BuyersItemIdentification" mode="M294" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:BuyersItemIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M294" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M294" priority="-1" />
  <xsl:template match="@*|node()" mode="M294" priority="-2">
    <xsl:apply-templates mode="M294" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueDocumentReference" mode="M295" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M295" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M295" priority="-1" />
  <xsl:template match="@*|node()" mode="M295" priority="-2">
    <xsl:apply-templates mode="M295" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueItemIdentification" mode="M296" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CatalogueItemIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M296" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M296" priority="-1" />
  <xsl:template match="@*|node()" mode="M296" priority="-2">
    <xsl:apply-templates mode="M296" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Certificate" mode="M297" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Certificate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Certificate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M297" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M297" priority="-1" />
  <xsl:template match="@*|node()" mode="M297" priority="-2">
    <xsl:apply-templates mode="M297" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress" mode="M298" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M298" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M298" priority="-1" />
  <xsl:template match="@*|node()" mode="M298" priority="-2">
    <xsl:apply-templates mode="M298" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode" mode="M299" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M299" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M299" priority="-1" />
  <xsl:template match="@*|node()" mode="M299" priority="-2">
    <xsl:apply-templates mode="M299" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" mode="M300" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M300" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M300" priority="-1" />
  <xsl:template match="@*|node()" mode="M300" priority="-2">
    <xsl:apply-templates mode="M300" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name" mode="M301" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M301" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M301" priority="-1" />
  <xsl:template match="@*|node()" mode="M301" priority="-2">
    <xsl:apply-templates mode="M301" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode" mode="M302" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M302" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M302" priority="-1" />
  <xsl:template match="@*|node()" mode="M302" priority="-2">
    <xsl:apply-templates mode="M302" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure" mode="M303" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M303" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M303" priority="-1" />
  <xsl:template match="@*|node()" mode="M303" priority="-2">
    <xsl:apply-templates mode="M303" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" mode="M304" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M304" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M304" priority="-1" />
  <xsl:template match="@*|node()" mode="M304" priority="-2">
    <xsl:apply-templates mode="M304" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Name" mode="M305" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M305" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M305" priority="-1" />
  <xsl:template match="@*|node()" mode="M305" priority="-2">
    <xsl:apply-templates mode="M305" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount" mode="M306" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M306" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M306" priority="-1" />
  <xsl:template match="@*|node()" mode="M306" priority="-2">
    <xsl:apply-templates mode="M306" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" mode="M307" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" />

		<!--REPORT -->
<xsl:if test="@format">
      <svrl:successful-report test="@format">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@format' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M307" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M307" priority="-1" />
  <xsl:template match="@*|node()" mode="M307" priority="-2">
    <xsl:apply-templates mode="M307" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason" mode="M308" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M308" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M308" priority="-1" />
  <xsl:template match="@*|node()" mode="M308" priority="-2">
    <xsl:apply-templates mode="M308" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode" mode="M309" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M309" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M309" priority="-1" />
  <xsl:template match="@*|node()" mode="M309" priority="-2">
    <xsl:apply-templates mode="M309" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange" mode="M310" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRange' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M310" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M310" priority="-1" />
  <xsl:template match="@*|node()" mode="M310" priority="-2">
    <xsl:apply-templates mode="M310" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent" mode="M311" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M311" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M311" priority="-1" />
  <xsl:template match="@*|node()" mode="M311" priority="-2">
    <xsl:apply-templates mode="M311" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode" mode="M312" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M312" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M312" priority="-1" />
  <xsl:template match="@*|node()" mode="M312" priority="-2">
    <xsl:apply-templates mode="M312" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode" mode="M313" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:CommodityCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M313" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M313" priority="-1" />
  <xsl:template match="@*|node()" mode="M313" priority="-2">
    <xsl:apply-templates mode="M313" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" mode="M314" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M314" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M314" priority="-1" />
  <xsl:template match="@*|node()" mode="M314" priority="-2">
    <xsl:apply-templates mode="M314" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:NatureCode" mode="M315" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:NatureCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:NatureCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M315" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M315" priority="-1" />
  <xsl:template match="@*|node()" mode="M315" priority="-2">
    <xsl:apply-templates mode="M315" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Dimension" mode="M316" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:Dimension" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Dimension' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M316" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M316" priority="-1" />
  <xsl:template match="@*|node()" mode="M316" priority="-2">
    <xsl:apply-templates mode="M316" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:HazardousItem" mode="M317" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:HazardousItem" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:HazardousItem' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M317" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M317" priority="-1" />
  <xsl:template match="@*|node()" mode="M317" priority="-2">
    <xsl:apply-templates mode="M317" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:InformationContentProviderParty" mode="M318" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:InformationContentProviderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M318" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M318" priority="-1" />
  <xsl:template match="@*|node()" mode="M318" priority="-2">
    <xsl:apply-templates mode="M318" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemInstance" mode="M319" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemInstance" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ItemInstance' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M319" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M319" priority="-1" />
  <xsl:template match="@*|node()" mode="M319" priority="-2">
    <xsl:apply-templates mode="M319" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemSpecificationDocumentReference" mode="M320" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ItemSpecificationDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M320" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M320" priority="-1" />
  <xsl:template match="@*|node()" mode="M320" priority="-2">
    <xsl:apply-templates mode="M320" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty" mode="M321" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M321" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M321" priority="-1" />
  <xsl:template match="@*|node()" mode="M321" priority="-2">
    <xsl:apply-templates mode="M321" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturersItemIdentification" mode="M322" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:ManufacturersItemIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M322" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M322" priority="-1" />
  <xsl:template match="@*|node()" mode="M322" priority="-2">
    <xsl:apply-templates mode="M322" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginAddress" mode="M323" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OriginAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M323" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M323" priority="-1" />
  <xsl:template match="@*|node()" mode="M323" priority="-2">
    <xsl:apply-templates mode="M323" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" mode="M324" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:IdentificationCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M324" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M324" priority="-1" />
  <xsl:template match="@*|node()" mode="M324" priority="-2">
    <xsl:apply-templates mode="M324" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:Name" mode="M325" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:OriginCountry/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M325" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M325" priority="-1" />
  <xsl:template match="@*|node()" mode="M325" priority="-2">
    <xsl:apply-templates mode="M325" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty" mode="M326" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:IssuerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M326" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M326" priority="-1" />
  <xsl:template match="@*|node()" mode="M326" priority="-2">
    <xsl:apply-templates mode="M326" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension" mode="M327" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M327" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M327" priority="-1" />
  <xsl:template match="@*|node()" mode="M327" priority="-2">
    <xsl:apply-templates mode="M327" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute" mode="M328" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M328" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M328" priority="-1" />
  <xsl:template match="@*|node()" mode="M328" priority="-2">
    <xsl:apply-templates mode="M328" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID" mode="M329" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M329" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M329" priority="-1" />
  <xsl:template match="@*|node()" mode="M329" priority="-2">
    <xsl:apply-templates mode="M329" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID" mode="M330" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExtendedID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M330" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M330" priority="-1" />
  <xsl:template match="@*|node()" mode="M330" priority="-2">
    <xsl:apply-templates mode="M330" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID" mode="M331" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:SellersItemIdentification/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M331" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M331" priority="-1" />
  <xsl:template match="@*|node()" mode="M331" priority="-2">
    <xsl:apply-templates mode="M331" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty" mode="M332" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:IssuerParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M332" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M332" priority="-1" />
  <xsl:template match="@*|node()" mode="M332" priority="-2">
    <xsl:apply-templates mode="M332" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension" mode="M333" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M333" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M333" priority="-1" />
  <xsl:template match="@*|node()" mode="M333" priority="-2">
    <xsl:apply-templates mode="M333" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute" mode="M334" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M334" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M334" priority="-1" />
  <xsl:template match="@*|node()" mode="M334" priority="-2">
    <xsl:apply-templates mode="M334" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID" mode="M335" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M335" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M335" priority="-1" />
  <xsl:template match="@*|node()" mode="M335" priority="-2">
    <xsl:apply-templates mode="M335" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID" mode="M336" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExtendedID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M336" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M336" priority="-1" />
  <xsl:template match="@*|node()" mode="M336" priority="-2">
    <xsl:apply-templates mode="M336" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID" mode="M337" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M337" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M337" priority="-1" />
  <xsl:template match="@*|node()" mode="M337" priority="-2">
    <xsl:apply-templates mode="M337" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:TransactionConditions" mode="M338" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cac:TransactionConditions" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TransactionConditions' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M338" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M338" priority="-1" />
  <xsl:template match="@*|node()" mode="M338" priority="-2">
    <xsl:apply-templates mode="M338" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:AdditionalInformation" mode="M339" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:AdditionalInformation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M339" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M339" priority="-1" />
  <xsl:template match="@*|node()" mode="M339" priority="-2">
    <xsl:apply-templates mode="M339" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:BrandName" mode="M340" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:BrandName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BrandName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M340" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M340" priority="-1" />
  <xsl:template match="@*|node()" mode="M340" priority="-2">
    <xsl:apply-templates mode="M340" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:CatalogueIndicator" mode="M341" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:CatalogueIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M341" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M341" priority="-1" />
  <xsl:template match="@*|node()" mode="M341" priority="-2">
    <xsl:apply-templates mode="M341" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description" mode="M342" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Description" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M342" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M342" priority="-1" />
  <xsl:template match="@*|node()" mode="M342" priority="-2">
    <xsl:apply-templates mode="M342" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:HazardousRiskIndicator" mode="M343" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:HazardousRiskIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M343" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M343" priority="-1" />
  <xsl:template match="@*|node()" mode="M343" priority="-2">
    <xsl:apply-templates mode="M343" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Keyword" mode="M344" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Keyword" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Keyword' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M344" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M344" priority="-1" />
  <xsl:template match="@*|node()" mode="M344" priority="-2">
    <xsl:apply-templates mode="M344" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:ModelName" mode="M345" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:ModelName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ModelName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M345" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M345" priority="-1" />
  <xsl:template match="@*|node()" mode="M345" priority="-2">
    <xsl:apply-templates mode="M345" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name" mode="M346" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:Name" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M346" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M346" priority="-1" />
  <xsl:template match="@*|node()" mode="M346" priority="-2">
    <xsl:apply-templates mode="M346" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackQuantity" mode="M347" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackQuantity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PackQuantity' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M347" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M347" priority="-1" />
  <xsl:template match="@*|node()" mode="M347" priority="-2">
    <xsl:apply-templates mode="M347" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackSizeNumeric" mode="M348" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Item/cbc:PackSizeNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M348" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M348" priority="-1" />
  <xsl:template match="@*|node()" mode="M348" priority="-2">
    <xsl:apply-templates mode="M348" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cac:OrderReference" mode="M349" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cac:OrderReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OrderReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M349" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M349" priority="-1" />
  <xsl:template match="@*|node()" mode="M349" priority="-2">
    <xsl:apply-templates mode="M349" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID" mode="M350" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M350" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M350" priority="-1" />
  <xsl:template match="@*|node()" mode="M350" priority="-2">
    <xsl:apply-templates mode="M350" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineStatusCode" mode="M351" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:LineStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M351" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M351" priority="-1" />
  <xsl:template match="@*|node()" mode="M351" priority="-2">
    <xsl:apply-templates mode="M351" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:SalesOrderLineID" mode="M352" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:SalesOrderLineID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M352" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M352" priority="-1" />
  <xsl:template match="@*|node()" mode="M352" priority="-2">
    <xsl:apply-templates mode="M352" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:UUID" mode="M353" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OrderLineReference/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M353" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M353" priority="-1" />
  <xsl:template match="@*|node()" mode="M353" priority="-2">
    <xsl:apply-templates mode="M353" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:OriginatorParty" mode="M354" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:OriginatorParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OriginatorParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M354" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M354" priority="-1" />
  <xsl:template match="@*|node()" mode="M354" priority="-2">
    <xsl:apply-templates mode="M354" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:PaymentTerms" mode="M355" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PaymentTerms" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentTerms' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M355" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M355" priority="-1" />
  <xsl:template match="@*|node()" mode="M355" priority="-2">
    <xsl:apply-templates mode="M355" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:PaymentMeans" mode="M356" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:PaymentMeans" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentMeans' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M356" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M356" priority="-1" />
  <xsl:template match="@*|node()" mode="M356" priority="-2">
    <xsl:apply-templates mode="M356" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory" mode="M357" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxCategory" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TaxCategory' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M357" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M357" priority="-1" />
  <xsl:template match="@*|node()" mode="M357" priority="-2">
    <xsl:apply-templates mode="M357" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal" mode="M358" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cac:TaxTotal" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TaxTotal' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M358" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M358" priority="-1" />
  <xsl:template match="@*|node()" mode="M358" priority="-2">
    <xsl:apply-templates mode="M358" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCost" mode="M359" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCost" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCost' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M359" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M359" priority="-1" />
  <xsl:template match="@*|node()" mode="M359" priority="-2">
    <xsl:apply-templates mode="M359" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode" mode="M360" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M360" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M360" priority="-1" />
  <xsl:template match="@*|node()" mode="M360" priority="-2">
    <xsl:apply-templates mode="M360" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason" mode="M361" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AllowanceChargeReason' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M361" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M361" priority="-1" />
  <xsl:template match="@*|node()" mode="M361" priority="-2">
    <xsl:apply-templates mode="M361" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" mode="M362" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AllowanceChargeReasonCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M362" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M362" priority="-1" />
  <xsl:template match="@*|node()" mode="M362" priority="-2">
    <xsl:apply-templates mode="M362" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:ID" mode="M363" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M363" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M363" priority="-1" />
  <xsl:template match="@*|node()" mode="M363" priority="-2">
    <xsl:apply-templates mode="M363" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" mode="M364" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MultiplierFactorNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M364" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M364" priority="-1" />
  <xsl:template match="@*|node()" mode="M364" priority="-2">
    <xsl:apply-templates mode="M364" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount" mode="M365" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M365" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M365" priority="-1" />
  <xsl:template match="@*|node()" mode="M365" priority="-2">
    <xsl:apply-templates mode="M365" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator" mode="M366" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PrepaidIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M366" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M366" priority="-1" />
  <xsl:template match="@*|node()" mode="M366" priority="-2">
    <xsl:apply-templates mode="M366" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric" mode="M367" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SequenceNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M367" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M367" priority="-1" />
  <xsl:template match="@*|node()" mode="M367" priority="-2">
    <xsl:apply-templates mode="M367" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PriceList" mode="M368" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PriceList" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PriceList' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M368" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M368" priority="-1" />
  <xsl:template match="@*|node()" mode="M368" priority="-2">
    <xsl:apply-templates mode="M368" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PricingExchangeRate" mode="M369" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:PricingExchangeRate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M369" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M369" priority="-1" />
  <xsl:template match="@*|node()" mode="M369" priority="-2">
    <xsl:apply-templates mode="M369" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:ValidityPeriod" mode="M370" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cac:ValidityPeriod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M370" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M370" priority="-1" />
  <xsl:template match="@*|node()" mode="M370" priority="-2">
    <xsl:apply-templates mode="M370" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity" mode="M371" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:BaseQuantity" />

		<!--REPORT -->
<xsl:if test="@unitCode">
      <svrl:successful-report test="@unitCode">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@unitCode' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@unitCodeListID">
      <svrl:successful-report test="@unitCodeListID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@unitCodeListID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@unitCodeListAgencyID">
      <svrl:successful-report test="@unitCodeListAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@unitCodeListAgencyName">
      <svrl:successful-report test="@unitCodeListAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M371" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M371" priority="-1" />
  <xsl:template match="@*|node()" mode="M371" priority="-2">
    <xsl:apply-templates mode="M371" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:OrderableUnitFactorRate" mode="M372" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:OrderableUnitFactorRate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M372" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M372" priority="-1" />
  <xsl:template match="@*|node()" mode="M372" priority="-2">
    <xsl:apply-templates mode="M372" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceChangeReason" mode="M373" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceChangeReason" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M373" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M373" priority="-1" />
  <xsl:template match="@*|node()" mode="M373" priority="-2">
    <xsl:apply-templates mode="M373" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceType" mode="M374" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceType" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PriceType' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M374" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M374" priority="-1" />
  <xsl:template match="@*|node()" mode="M374" priority="-2">
    <xsl:apply-templates mode="M374" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceTypeCode" mode="M375" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:Price/cbc:PriceTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M375" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M375" priority="-1" />
  <xsl:template match="@*|node()" mode="M375" priority="-2">
    <xsl:apply-templates mode="M375" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:PricingReference" mode="M376" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:PricingReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PricingReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M376" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M376" priority="-1" />
  <xsl:template match="@*|node()" mode="M376" priority="-2">
    <xsl:apply-templates mode="M376" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:ReceiptLineReference" mode="M377" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:ReceiptLineReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ReceiptLineReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M377" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M377" priority="-1" />
  <xsl:template match="@*|node()" mode="M377" priority="-2">
    <xsl:apply-templates mode="M377" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:SubCreditNoteLine" mode="M378" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:SubCreditNoteLine" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SubCreditNoteLine' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M378" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M378" priority="-1" />
  <xsl:template match="@*|node()" mode="M378" priority="-2">
    <xsl:apply-templates mode="M378" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal" mode="M379" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M379" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M379" priority="-1" />
  <xsl:template match="@*|node()" mode="M379" priority="-2">
    <xsl:apply-templates mode="M379" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:RoundingAmount" mode="M380" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:RoundingAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RoundingAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M380" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M380" priority="-1" />
  <xsl:template match="@*|node()" mode="M380" priority="-2">
    <xsl:apply-templates mode="M380" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxEvidenceIndicator" mode="M381" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxEvidenceIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M381" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M381" priority="-1" />
  <xsl:template match="@*|node()" mode="M381" priority="-2">
    <xsl:apply-templates mode="M381" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxIncludedIndicator" mode="M382" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cac:TaxTotal/cbc:TaxIncludedIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M382" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M382" priority="-1" />
  <xsl:template match="@*|node()" mode="M382" priority="-2">
    <xsl:apply-templates mode="M382" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCost" mode="M383" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCost" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M383" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M383" priority="-1" />
  <xsl:template match="@*|node()" mode="M383" priority="-2">
    <xsl:apply-templates mode="M383" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCostCode" mode="M384" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:AccountingCostCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M384" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M384" priority="-1" />
  <xsl:template match="@*|node()" mode="M384" priority="-2">
    <xsl:apply-templates mode="M384" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity" mode="M385" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:CreditedQuantity" />

		<!--REPORT -->
<xsl:if test="@unitCodeListID">
      <svrl:successful-report test="@unitCodeListID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@unitCodeListID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@unitCodeListAgencyID">
      <svrl:successful-report test="@unitCodeListAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@unitCodeListAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@unitCodeListAgencyName">
      <svrl:successful-report test="@unitCodeListAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@unitCodeListAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M385" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M385" priority="-1" />
  <xsl:template match="@*|node()" mode="M385" priority="-2">
    <xsl:apply-templates mode="M385" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:FreeOfChargeIndicator" mode="M386" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:FreeOfChargeIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:FreeOfChargeIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M386" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M386" priority="-1" />
  <xsl:template match="@*|node()" mode="M386" priority="-2">
    <xsl:apply-templates mode="M386" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:ID" mode="M387" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M387" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M387" priority="-1" />
  <xsl:template match="@*|node()" mode="M387" priority="-2">
    <xsl:apply-templates mode="M387" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:Note" mode="M388" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:Note" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M388" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M388" priority="-1" />
  <xsl:template match="@*|node()" mode="M388" priority="-2">
    <xsl:apply-templates mode="M388" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:PaymentPurposeCode" mode="M389" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:PaymentPurposeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PaymentPurposeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M389" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M389" priority="-1" />
  <xsl:template match="@*|node()" mode="M389" priority="-2">
    <xsl:apply-templates mode="M389" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:TaxPointDate" mode="M390" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:TaxPointDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxPointDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M390" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M390" priority="-1" />
  <xsl:template match="@*|node()" mode="M390" priority="-2">
    <xsl:apply-templates mode="M390" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:CreditNoteLine/cbc:UUID" mode="M391" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:CreditNoteLine/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M391" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M391" priority="-1" />
  <xsl:template match="@*|node()" mode="M391" priority="-2">
    <xsl:apply-templates mode="M391" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:Delivery" mode="M392" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:Delivery" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Delivery' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M392" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M392" priority="-1" />
  <xsl:template match="@*|node()" mode="M392" priority="-2">
    <xsl:apply-templates mode="M392" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:DeliveryTerms" mode="M393" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:DeliveryTerms" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M393" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M393" priority="-1" />
  <xsl:template match="@*|node()" mode="M393" priority="-2">
    <xsl:apply-templates mode="M393" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:DespatchDocumentReference" mode="M394" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:DespatchDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DespatchDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M394" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M394" priority="-1" />
  <xsl:template match="@*|node()" mode="M394" priority="-2">
    <xsl:apply-templates mode="M394" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:DiscrepancyResponse" mode="M395" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:DiscrepancyResponse" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DiscrepancyResponse' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M395" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M395" priority="-1" />
  <xsl:template match="@*|node()" mode="M395" priority="-2">
    <xsl:apply-templates mode="M395" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:InvoicePeriod/cbc:Description" mode="M396" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:Description" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Description' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M396" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M396" priority="-1" />
  <xsl:template match="@*|node()" mode="M396" priority="-2">
    <xsl:apply-templates mode="M396" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:InvoicePeriod/cbc:DescriptionCode" mode="M397" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DescriptionCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M397" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M397" priority="-1" />
  <xsl:template match="@*|node()" mode="M397" priority="-2">
    <xsl:apply-templates mode="M397" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:InvoicePeriod/cbc:DurationMeasure" mode="M398" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:DurationMeasure" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M398" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M398" priority="-1" />
  <xsl:template match="@*|node()" mode="M398" priority="-2">
    <xsl:apply-templates mode="M398" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:InvoicePeriod/cbc:EndTime" mode="M399" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:EndTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:EndTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M399" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M399" priority="-1" />
  <xsl:template match="@*|node()" mode="M399" priority="-2">
    <xsl:apply-templates mode="M399" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:InvoicePeriod/cbc:StartTime" mode="M400" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:InvoicePeriod/cbc:StartTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:StartTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M400" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M400" priority="-1" />
  <xsl:template match="@*|node()" mode="M400" priority="-2">
    <xsl:apply-templates mode="M400" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount" mode="M401" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PayableAlternativeAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M401" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M401" priority="-1" />
  <xsl:template match="@*|node()" mode="M401" priority="-2">
    <xsl:apply-templates mode="M401" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" mode="M402" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PayableRoundingAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M402" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M402" priority="-1" />
  <xsl:template match="@*|node()" mode="M402" priority="-2">
    <xsl:apply-templates mode="M402" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:OrderReference" mode="M403" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:OrderReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OrderReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M403" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M403" priority="-1" />
  <xsl:template match="@*|node()" mode="M403" priority="-2">
    <xsl:apply-templates mode="M403" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:OriginatorDocumentReference" mode="M404" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:OriginatorDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OriginatorDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M404" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M404" priority="-1" />
  <xsl:template match="@*|node()" mode="M404" priority="-2">
    <xsl:apply-templates mode="M404" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:AgentParty" mode="M405" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:AgentParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AgentParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M405" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M405" priority="-1" />
  <xsl:template match="@*|node()" mode="M405" priority="-2">
    <xsl:apply-templates mode="M405" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:Contact" mode="M406" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:Contact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Contact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M406" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M406" priority="-1" />
  <xsl:template match="@*|node()" mode="M406" priority="-2">
    <xsl:apply-templates mode="M406" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:FinancialAccount" mode="M407" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:FinancialAccount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:FinancialAccount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M407" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M407" priority="-1" />
  <xsl:template match="@*|node()" mode="M407" priority="-2">
    <xsl:apply-templates mode="M407" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:Language" mode="M408" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:Language" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Language' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M408" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M408" priority="-1" />
  <xsl:template match="@*|node()" mode="M408" priority="-2">
    <xsl:apply-templates mode="M408" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID" mode="M409" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M409" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M409" priority="-1" />
  <xsl:template match="@*|node()" mode="M409" priority="-2">
    <xsl:apply-templates mode="M409" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" mode="M410" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M410" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M410" priority="-1" />
  <xsl:template match="@*|node()" mode="M410" priority="-2">
    <xsl:apply-templates mode="M410" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:HeadParty" mode="M411" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:HeadParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:HeadParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M411" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M411" priority="-1" />
  <xsl:template match="@*|node()" mode="M411" priority="-2">
    <xsl:apply-templates mode="M411" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress" mode="M412" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M412" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M412" priority="-1" />
  <xsl:template match="@*|node()" mode="M412" priority="-2">
    <xsl:apply-templates mode="M412" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty" mode="M413" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ShareholderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M413" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M413" priority="-1" />
  <xsl:template match="@*|node()" mode="M413" priority="-2">
    <xsl:apply-templates mode="M413" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID" mode="M414" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M414" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M414" priority="-1" />
  <xsl:template match="@*|node()" mode="M414" priority="-2">
    <xsl:apply-templates mode="M414" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" mode="M415" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M415" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M415" priority="-1" />
  <xsl:template match="@*|node()" mode="M415" priority="-2">
    <xsl:apply-templates mode="M415" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" mode="M416" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M416" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M416" priority="-1" />
  <xsl:template match="@*|node()" mode="M416" priority="-2">
    <xsl:apply-templates mode="M416" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporateStockAmount" mode="M417" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporateStockAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M417" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M417" priority="-1" />
  <xsl:template match="@*|node()" mode="M417" priority="-2">
    <xsl:apply-templates mode="M417" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" mode="M418" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M418" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M418" priority="-1" />
  <xsl:template match="@*|node()" mode="M418" priority="-2">
    <xsl:apply-templates mode="M418" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate" mode="M419" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M419" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M419" priority="-1" />
  <xsl:template match="@*|node()" mode="M419" priority="-2">
    <xsl:apply-templates mode="M419" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" mode="M420" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M420" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M420" priority="-1" />
  <xsl:template match="@*|node()" mode="M420" priority="-2">
    <xsl:apply-templates mode="M420" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName" mode="M421" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M421" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M421" priority="-1" />
  <xsl:template match="@*|node()" mode="M421" priority="-2">
    <xsl:apply-templates mode="M421" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" mode="M422" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M422" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M422" priority="-1" />
  <xsl:template match="@*|node()" mode="M422" priority="-2">
    <xsl:apply-templates mode="M422" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name" mode="M423" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyName/cbc:Name" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M423" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M423" priority="-1" />
  <xsl:template match="@*|node()" mode="M423" priority="-2">
    <xsl:apply-templates mode="M423" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PartyTaxScheme" mode="M424" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PartyTaxScheme" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M424" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M424" priority="-1" />
  <xsl:template match="@*|node()" mode="M424" priority="-2">
    <xsl:apply-templates mode="M424" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:Person" mode="M425" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:Person" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Person' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M425" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M425" priority="-1" />
  <xsl:template match="@*|node()" mode="M425" priority="-2">
    <xsl:apply-templates mode="M425" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PhysicalLocation" mode="M426" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PhysicalLocation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M426" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M426" priority="-1" />
  <xsl:template match="@*|node()" mode="M426" priority="-2">
    <xsl:apply-templates mode="M426" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PostalAddress" mode="M427" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PostalAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PostalAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M427" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M427" priority="-1" />
  <xsl:template match="@*|node()" mode="M427" priority="-2">
    <xsl:apply-templates mode="M427" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:PowerOfAttorney" mode="M428" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:PowerOfAttorney" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M428" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M428" priority="-1" />
  <xsl:template match="@*|node()" mode="M428" priority="-2">
    <xsl:apply-templates mode="M428" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cac:ServiceProviderParty" mode="M429" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cac:ServiceProviderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M429" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M429" priority="-1" />
  <xsl:template match="@*|node()" mode="M429" priority="-2">
    <xsl:apply-templates mode="M429" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cbc:EndpointID" mode="M430" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cbc:EndpointID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:EndpointID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M430" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M430" priority="-1" />
  <xsl:template match="@*|node()" mode="M430" priority="-2">
    <xsl:apply-templates mode="M430" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cbc:IndustryClassificationCode" mode="M431" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cbc:IndustryClassificationCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M431" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M431" priority="-1" />
  <xsl:template match="@*|node()" mode="M431" priority="-2">
    <xsl:apply-templates mode="M431" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cbc:LogoReferenceID" mode="M432" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cbc:LogoReferenceID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M432" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M432" priority="-1" />
  <xsl:template match="@*|node()" mode="M432" priority="-2">
    <xsl:apply-templates mode="M432" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cbc:MarkAttentionIndicator" mode="M433" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkAttentionIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M433" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M433" priority="-1" />
  <xsl:template match="@*|node()" mode="M433" priority="-2">
    <xsl:apply-templates mode="M433" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cbc:MarkCareIndicator" mode="M434" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cbc:MarkCareIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M434" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M434" priority="-1" />
  <xsl:template match="@*|node()" mode="M434" priority="-2">
    <xsl:apply-templates mode="M434" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PayeeParty/cbc:WebsiteURI" mode="M435" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PayeeParty/cbc:WebsiteURI" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M435" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M435" priority="-1" />
  <xsl:template match="@*|node()" mode="M435" priority="-2">
    <xsl:apply-templates mode="M435" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PaymentAlternativeExchangeRate" mode="M436" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PaymentAlternativeExchangeRate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentAlternativeExchangeRate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M436" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M436" priority="-1" />
  <xsl:template match="@*|node()" mode="M436" priority="-2">
    <xsl:apply-templates mode="M436" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PaymentExchangeRate" mode="M437" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PaymentExchangeRate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentExchangeRate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M437" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M437" priority="-1" />
  <xsl:template match="@*|node()" mode="M437" priority="-2">
    <xsl:apply-templates mode="M437" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PaymentMeans" mode="M438" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PaymentMeans" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentMeans' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M438" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M438" priority="-1" />
  <xsl:template match="@*|node()" mode="M438" priority="-2">
    <xsl:apply-templates mode="M438" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PaymentTerms" mode="M439" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PaymentTerms" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PaymentTerms' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M439" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M439" priority="-1" />
  <xsl:template match="@*|node()" mode="M439" priority="-2">
    <xsl:apply-templates mode="M439" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:PricingExchangeRate" mode="M440" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:PricingExchangeRate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M440" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M440" priority="-1" />
  <xsl:template match="@*|node()" mode="M440" priority="-2">
    <xsl:apply-templates mode="M440" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:ReceiptDocumentReference" mode="M441" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:ReceiptDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ReceiptDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M441" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M441" priority="-1" />
  <xsl:template match="@*|node()" mode="M441" priority="-2">
    <xsl:apply-templates mode="M441" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:AccountingContact" mode="M442" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:AccountingContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AccountingContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M442" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M442" priority="-1" />
  <xsl:template match="@*|node()" mode="M442" priority="-2">
    <xsl:apply-templates mode="M442" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:DespatchContact" mode="M443" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:DespatchContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DespatchContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M443" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M443" priority="-1" />
  <xsl:template match="@*|node()" mode="M443" priority="-2">
    <xsl:apply-templates mode="M443" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:AgentParty" mode="M444" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:AgentParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AgentParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M444" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M444" priority="-1" />
  <xsl:template match="@*|node()" mode="M444" priority="-2">
    <xsl:apply-templates mode="M444" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:Channel" mode="M445" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:Channel" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Channel' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M445" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M445" priority="-1" />
  <xsl:template match="@*|node()" mode="M445" priority="-2">
    <xsl:apply-templates mode="M445" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:ChannelCode" mode="M446" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:ChannelCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ChannelCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M446" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M446" priority="-1" />
  <xsl:template match="@*|node()" mode="M446" priority="-2">
    <xsl:apply-templates mode="M446" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:Value" mode="M447" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication/cbc:Value" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M447" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M447" priority="-1" />
  <xsl:template match="@*|node()" mode="M447" priority="-2">
    <xsl:apply-templates mode="M447" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M448" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M448" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M448" priority="-1" />
  <xsl:template match="@*|node()" mode="M448" priority="-2">
    <xsl:apply-templates mode="M448" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID" mode="M449" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M449" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M449" priority="-1" />
  <xsl:template match="@*|node()" mode="M449" priority="-2">
    <xsl:apply-templates mode="M449" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name" mode="M450" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M450" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M450" priority="-1" />
  <xsl:template match="@*|node()" mode="M450" priority="-2">
    <xsl:apply-templates mode="M450" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note" mode="M451" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Note' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M451" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M451" priority="-1" />
  <xsl:template match="@*|node()" mode="M451" priority="-2">
    <xsl:apply-templates mode="M451" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax" mode="M452" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M452" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M452" priority="-1" />
  <xsl:template match="@*|node()" mode="M452" priority="-2">
    <xsl:apply-templates mode="M452" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone" mode="M453" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M453" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M453" priority="-1" />
  <xsl:template match="@*|node()" mode="M453" priority="-2">
    <xsl:apply-templates mode="M453" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount" mode="M454" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:FinancialAccount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M454" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M454" priority="-1" />
  <xsl:template match="@*|node()" mode="M454" priority="-2">
    <xsl:apply-templates mode="M454" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Language" mode="M455" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Language" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Language' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M455" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M455" priority="-1" />
  <xsl:template match="@*|node()" mode="M455" priority="-2">
    <xsl:apply-templates mode="M455" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M456" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M456" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M456" priority="-1" />
  <xsl:template match="@*|node()" mode="M456" priority="-2">
    <xsl:apply-templates mode="M456" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" mode="M457" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CorporateRegistrationScheme' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M457" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M457" priority="-1" />
  <xsl:template match="@*|node()" mode="M457" priority="-2">
    <xsl:apply-templates mode="M457" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" mode="M458" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:HeadParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M458" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M458" priority="-1" />
  <xsl:template match="@*|node()" mode="M458" priority="-2">
    <xsl:apply-templates mode="M458" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" mode="M459" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AddressLine' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M459" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M459" priority="-1" />
  <xsl:template match="@*|node()" mode="M459" priority="-2">
    <xsl:apply-templates mode="M459" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M460" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IdentificationCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M460" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M460" priority="-1" />
  <xsl:template match="@*|node()" mode="M460" priority="-2">
    <xsl:apply-templates mode="M460" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" mode="M461" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M461" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M461" priority="-1" />
  <xsl:template match="@*|node()" mode="M461" priority="-2">
    <xsl:apply-templates mode="M461" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" mode="M462" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M462" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M462" priority="-1" />
  <xsl:template match="@*|node()" mode="M462" priority="-2">
    <xsl:apply-templates mode="M462" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" mode="M463" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AdditionalStreetName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M463" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M463" priority="-1" />
  <xsl:template match="@*|node()" mode="M463" priority="-2">
    <xsl:apply-templates mode="M463" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" mode="M464" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M464" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M464" priority="-1" />
  <xsl:template match="@*|node()" mode="M464" priority="-2">
    <xsl:apply-templates mode="M464" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" mode="M465" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M465" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M465" priority="-1" />
  <xsl:template match="@*|node()" mode="M465" priority="-2">
    <xsl:apply-templates mode="M465" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" mode="M466" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BlockName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M466" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M466" priority="-1" />
  <xsl:template match="@*|node()" mode="M466" priority="-2">
    <xsl:apply-templates mode="M466" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" mode="M467" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BuildingName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M467" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M467" priority="-1" />
  <xsl:template match="@*|node()" mode="M467" priority="-2">
    <xsl:apply-templates mode="M467" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" mode="M468" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M468" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M468" priority="-1" />
  <xsl:template match="@*|node()" mode="M468" priority="-2">
    <xsl:apply-templates mode="M468" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M469" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M469" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M469" priority="-1" />
  <xsl:template match="@*|node()" mode="M469" priority="-2">
    <xsl:apply-templates mode="M469" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" mode="M470" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M470" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M470" priority="-1" />
  <xsl:template match="@*|node()" mode="M470" priority="-2">
    <xsl:apply-templates mode="M470" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" mode="M471" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CountrySubentity' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M471" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M471" priority="-1" />
  <xsl:template match="@*|node()" mode="M471" priority="-2">
    <xsl:apply-templates mode="M471" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" mode="M472" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M472" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M472" priority="-1" />
  <xsl:template match="@*|node()" mode="M472" priority="-2">
    <xsl:apply-templates mode="M472" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" mode="M473" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Department' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M473" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M473" priority="-1" />
  <xsl:template match="@*|node()" mode="M473" priority="-2">
    <xsl:apply-templates mode="M473" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" mode="M474" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:District' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M474" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M474" priority="-1" />
  <xsl:template match="@*|node()" mode="M474" priority="-2">
    <xsl:apply-templates mode="M474" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" mode="M475" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Floor' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M475" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M475" priority="-1" />
  <xsl:template match="@*|node()" mode="M475" priority="-2">
    <xsl:apply-templates mode="M475" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" mode="M476" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M476" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M476" priority="-1" />
  <xsl:template match="@*|node()" mode="M476" priority="-2">
    <xsl:apply-templates mode="M476" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" mode="M477" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:InhouseMail' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M477" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M477" priority="-1" />
  <xsl:template match="@*|node()" mode="M477" priority="-2">
    <xsl:apply-templates mode="M477" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" mode="M478" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkAttention' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M478" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M478" priority="-1" />
  <xsl:template match="@*|node()" mode="M478" priority="-2">
    <xsl:apply-templates mode="M478" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" mode="M479" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkCare' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M479" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M479" priority="-1" />
  <xsl:template match="@*|node()" mode="M479" priority="-2">
    <xsl:apply-templates mode="M479" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" mode="M480" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M480" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M480" priority="-1" />
  <xsl:template match="@*|node()" mode="M480" priority="-2">
    <xsl:apply-templates mode="M480" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" mode="M481" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PostalZone' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M481" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M481" priority="-1" />
  <xsl:template match="@*|node()" mode="M481" priority="-2">
    <xsl:apply-templates mode="M481" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" mode="M482" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Postbox' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M482" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M482" priority="-1" />
  <xsl:template match="@*|node()" mode="M482" priority="-2">
    <xsl:apply-templates mode="M482" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" mode="M483" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Region' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M483" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M483" priority="-1" />
  <xsl:template match="@*|node()" mode="M483" priority="-2">
    <xsl:apply-templates mode="M483" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" mode="M484" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Room' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M484" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M484" priority="-1" />
  <xsl:template match="@*|node()" mode="M484" priority="-2">
    <xsl:apply-templates mode="M484" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" mode="M485" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:StreetName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M485" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M485" priority="-1" />
  <xsl:template match="@*|node()" mode="M485" priority="-2">
    <xsl:apply-templates mode="M485" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" mode="M486" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M486" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M486" priority="-1" />
  <xsl:template match="@*|node()" mode="M486" priority="-2">
    <xsl:apply-templates mode="M486" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" mode="M487" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ShareholderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M487" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M487" priority="-1" />
  <xsl:template match="@*|node()" mode="M487" priority="-2">
    <xsl:apply-templates mode="M487" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" mode="M488" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M488" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M488" priority="-1" />
  <xsl:template match="@*|node()" mode="M488" priority="-2">
    <xsl:apply-templates mode="M488" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" mode="M489" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyLegalFormCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M489" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M489" priority="-1" />
  <xsl:template match="@*|node()" mode="M489" priority="-2">
    <xsl:apply-templates mode="M489" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" mode="M490" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyLiquidationStatusCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M490" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M490" priority="-1" />
  <xsl:template match="@*|node()" mode="M490" priority="-2">
    <xsl:apply-templates mode="M490" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" mode="M491" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CorporateStockAmount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M491" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M491" priority="-1" />
  <xsl:template match="@*|node()" mode="M491" priority="-2">
    <xsl:apply-templates mode="M491" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" mode="M492" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:FullyPaidSharesIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M492" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M492" priority="-1" />
  <xsl:template match="@*|node()" mode="M492" priority="-2">
    <xsl:apply-templates mode="M492" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" mode="M493" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M493" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M493" priority="-1" />
  <xsl:template match="@*|node()" mode="M493" priority="-2">
    <xsl:apply-templates mode="M493" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" mode="M494" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationExpirationDate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M494" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M494" priority="-1" />
  <xsl:template match="@*|node()" mode="M494" priority="-2">
    <xsl:apply-templates mode="M494" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M495" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M495" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M495" priority="-1" />
  <xsl:template match="@*|node()" mode="M495" priority="-2">
    <xsl:apply-templates mode="M495" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" mode="M496" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SoleProprietorshipIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M496" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M496" priority="-1" />
  <xsl:template match="@*|node()" mode="M496" priority="-2">
    <xsl:apply-templates mode="M496" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name" mode="M497" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M497" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M497" priority="-1" />
  <xsl:template match="@*|node()" mode="M497" priority="-2">
    <xsl:apply-templates mode="M497" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress" mode="M498" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M498" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M498" priority="-1" />
  <xsl:template match="@*|node()" mode="M498" priority="-2">
    <xsl:apply-templates mode="M498" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress" mode="M499" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M499" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M499" priority="-1" />
  <xsl:template match="@*|node()" mode="M499" priority="-2">
    <xsl:apply-templates mode="M499" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode" mode="M500" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M500" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M500" priority="-1" />
  <xsl:template match="@*|node()" mode="M500" priority="-2">
    <xsl:apply-templates mode="M500" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" mode="M501" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M501" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M501" priority="-1" />
  <xsl:template match="@*|node()" mode="M501" priority="-2">
    <xsl:apply-templates mode="M501" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" mode="M502" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M502" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M502" priority="-1" />
  <xsl:template match="@*|node()" mode="M502" priority="-2">
    <xsl:apply-templates mode="M502" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode" mode="M503" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M503" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M503" priority="-1" />
  <xsl:template match="@*|node()" mode="M503" priority="-2">
    <xsl:apply-templates mode="M503" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" mode="M504" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M504" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M504" priority="-1" />
  <xsl:template match="@*|node()" mode="M504" priority="-2">
    <xsl:apply-templates mode="M504" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason" mode="M505" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M505" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M505" priority="-1" />
  <xsl:template match="@*|node()" mode="M505" priority="-2">
    <xsl:apply-templates mode="M505" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode" mode="M506" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M506" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M506" priority="-1" />
  <xsl:template match="@*|node()" mode="M506" priority="-2">
    <xsl:apply-templates mode="M506" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName" mode="M507" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M507" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M507" priority="-1" />
  <xsl:template match="@*|node()" mode="M507" priority="-2">
    <xsl:apply-templates mode="M507" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode" mode="M508" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M508" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M508" priority="-1" />
  <xsl:template match="@*|node()" mode="M508" priority="-2">
    <xsl:apply-templates mode="M508" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Person" mode="M509" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:Person" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Person' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M509" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M509" priority="-1" />
  <xsl:template match="@*|node()" mode="M509" priority="-2">
    <xsl:apply-templates mode="M509" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation" mode="M510" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M510" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M510" priority="-1" />
  <xsl:template match="@*|node()" mode="M510" priority="-2">
    <xsl:apply-templates mode="M510" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine" mode="M511" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AddressLine' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M511" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M511" priority="-1" />
  <xsl:template match="@*|node()" mode="M511" priority="-2">
    <xsl:apply-templates mode="M511" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M512" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M512" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M512" priority="-1" />
  <xsl:template match="@*|node()" mode="M512" priority="-2">
    <xsl:apply-templates mode="M512" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name" mode="M513" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M513" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M513" priority="-1" />
  <xsl:template match="@*|node()" mode="M513" priority="-2">
    <xsl:apply-templates mode="M513" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate" mode="M514" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:LocationCoordinate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M514" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M514" priority="-1" />
  <xsl:template match="@*|node()" mode="M514" priority="-2">
    <xsl:apply-templates mode="M514" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M515" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M515" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M515" priority="-1" />
  <xsl:template match="@*|node()" mode="M515" priority="-2">
    <xsl:apply-templates mode="M515" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode" mode="M516" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AddressFormatCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M516" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M516" priority="-1" />
  <xsl:template match="@*|node()" mode="M516" priority="-2">
    <xsl:apply-templates mode="M516" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode" mode="M517" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AddressTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M517" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M517" priority="-1" />
  <xsl:template match="@*|node()" mode="M517" priority="-2">
    <xsl:apply-templates mode="M517" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName" mode="M518" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BlockName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M518" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M518" priority="-1" />
  <xsl:template match="@*|node()" mode="M518" priority="-2">
    <xsl:apply-templates mode="M518" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName" mode="M519" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BuildingName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M519" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M519" priority="-1" />
  <xsl:template match="@*|node()" mode="M519" priority="-2">
    <xsl:apply-templates mode="M519" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber" mode="M520" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BuildingNumber' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M520" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M520" priority="-1" />
  <xsl:template match="@*|node()" mode="M520" priority="-2">
    <xsl:apply-templates mode="M520" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M521" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M521" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M521" priority="-1" />
  <xsl:template match="@*|node()" mode="M521" priority="-2">
    <xsl:apply-templates mode="M521" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" mode="M522" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CitySubdivisionName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M522" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M522" priority="-1" />
  <xsl:template match="@*|node()" mode="M522" priority="-2">
    <xsl:apply-templates mode="M522" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M523" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M523" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M523" priority="-1" />
  <xsl:template match="@*|node()" mode="M523" priority="-2">
    <xsl:apply-templates mode="M523" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode" mode="M524" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CountrySubentityCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M524" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M524" priority="-1" />
  <xsl:template match="@*|node()" mode="M524" priority="-2">
    <xsl:apply-templates mode="M524" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Department" mode="M525" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Department" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Department' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M525" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M525" priority="-1" />
  <xsl:template match="@*|node()" mode="M525" priority="-2">
    <xsl:apply-templates mode="M525" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District" mode="M526" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:District' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M526" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M526" priority="-1" />
  <xsl:template match="@*|node()" mode="M526" priority="-2">
    <xsl:apply-templates mode="M526" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor" mode="M527" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Floor' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M527" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M527" priority="-1" />
  <xsl:template match="@*|node()" mode="M527" priority="-2">
    <xsl:apply-templates mode="M527" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:ID" mode="M528" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M528" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M528" priority="-1" />
  <xsl:template match="@*|node()" mode="M528" priority="-2">
    <xsl:apply-templates mode="M528" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail" mode="M529" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:InhouseMail' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M529" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M529" priority="-1" />
  <xsl:template match="@*|node()" mode="M529" priority="-2">
    <xsl:apply-templates mode="M529" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention" mode="M530" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkAttention' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M530" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M530" priority="-1" />
  <xsl:template match="@*|node()" mode="M530" priority="-2">
    <xsl:apply-templates mode="M530" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare" mode="M531" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkCare' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M531" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M531" priority="-1" />
  <xsl:template match="@*|node()" mode="M531" priority="-2">
    <xsl:apply-templates mode="M531" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification" mode="M532" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PlotIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M532" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M532" priority="-1" />
  <xsl:template match="@*|node()" mode="M532" priority="-2">
    <xsl:apply-templates mode="M532" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M533" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M533" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M533" priority="-1" />
  <xsl:template match="@*|node()" mode="M533" priority="-2">
    <xsl:apply-templates mode="M533" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox" mode="M534" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Postbox' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M534" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M534" priority="-1" />
  <xsl:template match="@*|node()" mode="M534" priority="-2">
    <xsl:apply-templates mode="M534" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region" mode="M535" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Region' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M535" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M535" priority="-1" />
  <xsl:template match="@*|node()" mode="M535" priority="-2">
    <xsl:apply-templates mode="M535" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room" mode="M536" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Room' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M536" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M536" priority="-1" />
  <xsl:template match="@*|node()" mode="M536" priority="-2">
    <xsl:apply-templates mode="M536" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M537" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M537" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M537" priority="-1" />
  <xsl:template match="@*|node()" mode="M537" priority="-2">
    <xsl:apply-templates mode="M537" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset" mode="M538" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TimezoneOffset' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M538" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M538" priority="-1" />
  <xsl:template match="@*|node()" mode="M538" priority="-2">
    <xsl:apply-templates mode="M538" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney" mode="M539" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M539" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M539" priority="-1" />
  <xsl:template match="@*|node()" mode="M539" priority="-2">
    <xsl:apply-templates mode="M539" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty" mode="M540" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M540" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M540" priority="-1" />
  <xsl:template match="@*|node()" mode="M540" priority="-2">
    <xsl:apply-templates mode="M540" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID" mode="M541" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:EndpointID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M541" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M541" priority="-1" />
  <xsl:template match="@*|node()" mode="M541" priority="-2">
    <xsl:apply-templates mode="M541" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode" mode="M542" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M542" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M542" priority="-1" />
  <xsl:template match="@*|node()" mode="M542" priority="-2">
    <xsl:apply-templates mode="M542" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID" mode="M543" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M543" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M543" priority="-1" />
  <xsl:template match="@*|node()" mode="M543" priority="-2">
    <xsl:apply-templates mode="M543" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator" mode="M544" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M544" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M544" priority="-1" />
  <xsl:template match="@*|node()" mode="M544" priority="-2">
    <xsl:apply-templates mode="M544" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator" mode="M545" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M545" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M545" priority="-1" />
  <xsl:template match="@*|node()" mode="M545" priority="-2">
    <xsl:apply-templates mode="M545" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI" mode="M546" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M546" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M546" priority="-1" />
  <xsl:template match="@*|node()" mode="M546" priority="-2">
    <xsl:apply-templates mode="M546" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cac:SellerContact" mode="M547" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cac:SellerContact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SellerContact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M547" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M547" priority="-1" />
  <xsl:template match="@*|node()" mode="M547" priority="-2">
    <xsl:apply-templates mode="M547" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cbc:AdditionalAccountID" mode="M548" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cbc:AdditionalAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M548" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M548" priority="-1" />
  <xsl:template match="@*|node()" mode="M548" priority="-2">
    <xsl:apply-templates mode="M548" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID" mode="M549" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M549" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M549" priority="-1" />
  <xsl:template match="@*|node()" mode="M549" priority="-2">
    <xsl:apply-templates mode="M549" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:SellerSupplierParty/cbc:DataSendingCapability" mode="M550" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:SellerSupplierParty/cbc:DataSendingCapability" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M550" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M550" priority="-1" />
  <xsl:template match="@*|node()" mode="M550" priority="-2">
    <xsl:apply-templates mode="M550" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:Signature" mode="M551" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:Signature" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Signature' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M551" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M551" priority="-1" />
  <xsl:template match="@*|node()" mode="M551" priority="-2">
    <xsl:apply-templates mode="M551" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:StatementDocumentReference" mode="M552" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:StatementDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:StatementDocumentReference' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M552" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M552" priority="-1" />
  <xsl:template match="@*|node()" mode="M552" priority="-2">
    <xsl:apply-templates mode="M552" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxExchangeRate" mode="M553" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxExchangeRate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TaxExchangeRate' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M553" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M553" priority="-1" />
  <xsl:template match="@*|node()" mode="M553" priority="-2">
    <xsl:apply-templates mode="M553" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:AgentParty" mode="M554" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:AgentParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:AgentParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M554" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M554" priority="-1" />
  <xsl:template match="@*|node()" mode="M554" priority="-2">
    <xsl:apply-templates mode="M554" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Contact" mode="M555" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Contact" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Contact' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M555" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M555" priority="-1" />
  <xsl:template match="@*|node()" mode="M555" priority="-2">
    <xsl:apply-templates mode="M555" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:FinancialAccount" mode="M556" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:FinancialAccount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:FinancialAccount' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M556" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M556" priority="-1" />
  <xsl:template match="@*|node()" mode="M556" priority="-2">
    <xsl:apply-templates mode="M556" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Language" mode="M557" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Language" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Language' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M557" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M557" priority="-1" />
  <xsl:template match="@*|node()" mode="M557" priority="-2">
    <xsl:apply-templates mode="M557" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyIdentification" mode="M558" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PartyIdentification' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M558" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M558" priority="-1" />
  <xsl:template match="@*|node()" mode="M558" priority="-2">
    <xsl:apply-templates mode="M558" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyLegalEntity" mode="M559" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyLegalEntity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M559" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M559" priority="-1" />
  <xsl:template match="@*|node()" mode="M559" priority="-2">
    <xsl:apply-templates mode="M559" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name" mode="M560" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyName/cbc:Name" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M560" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M560" priority="-1" />
  <xsl:template match="@*|node()" mode="M560" priority="-2">
    <xsl:apply-templates mode="M560" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress" mode="M561" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:RegistrationAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M561" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M561" priority="-1" />
  <xsl:template match="@*|node()" mode="M561" priority="-2">
    <xsl:apply-templates mode="M561" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress" mode="M562" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M562" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M562" priority="-1" />
  <xsl:template match="@*|node()" mode="M562" priority="-2">
    <xsl:apply-templates mode="M562" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode" mode="M563" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M563" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M563" priority="-1" />
  <xsl:template match="@*|node()" mode="M563" priority="-2">
    <xsl:apply-templates mode="M563" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" mode="M564" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:ID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M564" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M564" priority="-1" />
  <xsl:template match="@*|node()" mode="M564" priority="-2">
    <xsl:apply-templates mode="M564" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" mode="M565" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M565" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M565" priority="-1" />
  <xsl:template match="@*|node()" mode="M565" priority="-2">
    <xsl:apply-templates mode="M565" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode" mode="M566" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M566" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M566" priority="-1" />
  <xsl:template match="@*|node()" mode="M566" priority="-2">
    <xsl:apply-templates mode="M566" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID" mode="M567" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M567" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M567" priority="-1" />
  <xsl:template match="@*|node()" mode="M567" priority="-2">
    <xsl:apply-templates mode="M567" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason" mode="M568" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExemptionReason' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M568" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M568" priority="-1" />
  <xsl:template match="@*|node()" mode="M568" priority="-2">
    <xsl:apply-templates mode="M568" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode" mode="M569" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ExemptionReasonCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M569" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M569" priority="-1" />
  <xsl:template match="@*|node()" mode="M569" priority="-2">
    <xsl:apply-templates mode="M569" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName" mode="M570" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:RegistrationName' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M570" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M570" priority="-1" />
  <xsl:template match="@*|node()" mode="M570" priority="-2">
    <xsl:apply-templates mode="M570" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode" mode="M571" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxLevelCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M571" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M571" priority="-1" />
  <xsl:template match="@*|node()" mode="M571" priority="-2">
    <xsl:apply-templates mode="M571" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Person" mode="M572" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:Person" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Person' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M572" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M572" priority="-1" />
  <xsl:template match="@*|node()" mode="M572" priority="-2">
    <xsl:apply-templates mode="M572" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PhysicalLocation" mode="M573" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PhysicalLocation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M573" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M573" priority="-1" />
  <xsl:template match="@*|node()" mode="M573" priority="-2">
    <xsl:apply-templates mode="M573" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PostalAddress" mode="M574" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PostalAddress" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PostalAddress' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M574" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M574" priority="-1" />
  <xsl:template match="@*|node()" mode="M574" priority="-2">
    <xsl:apply-templates mode="M574" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PowerOfAttorney" mode="M575" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:PowerOfAttorney" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M575" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M575" priority="-1" />
  <xsl:template match="@*|node()" mode="M575" priority="-2">
    <xsl:apply-templates mode="M575" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cac:ServiceProviderParty" mode="M576" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cac:ServiceProviderParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M576" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M576" priority="-1" />
  <xsl:template match="@*|node()" mode="M576" priority="-2">
    <xsl:apply-templates mode="M576" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:EndpointID" mode="M577" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:EndpointID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:EndpointID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M577" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M577" priority="-1" />
  <xsl:template match="@*|node()" mode="M577" priority="-2">
    <xsl:apply-templates mode="M577" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:IndustryClassificationCode" mode="M578" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:IndustryClassificationCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M578" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M578" priority="-1" />
  <xsl:template match="@*|node()" mode="M578" priority="-2">
    <xsl:apply-templates mode="M578" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:LogoReferenceID" mode="M579" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:LogoReferenceID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M579" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M579" priority="-1" />
  <xsl:template match="@*|node()" mode="M579" priority="-2">
    <xsl:apply-templates mode="M579" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator" mode="M580" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M580" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M580" priority="-1" />
  <xsl:template match="@*|node()" mode="M580" priority="-2">
    <xsl:apply-templates mode="M580" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkCareIndicator" mode="M581" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:MarkCareIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M581" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M581" priority="-1" />
  <xsl:template match="@*|node()" mode="M581" priority="-2">
    <xsl:apply-templates mode="M581" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:WebsiteURI" mode="M582" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxRepresentativeParty/cbc:WebsiteURI" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M582" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M582" priority="-1" />
  <xsl:template match="@*|node()" mode="M582" priority="-2">
    <xsl:apply-templates mode="M582" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal" mode="M583" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxTotal/cac:TaxSubtotal" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:TaxSubtotal' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M583" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M583" priority="-1" />
  <xsl:template match="@*|node()" mode="M583" priority="-2">
    <xsl:apply-templates mode="M583" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxTotal/cbc:TaxEvidenceIndicator" mode="M584" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxEvidenceIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxEvidenceIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M584" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M584" priority="-1" />
  <xsl:template match="@*|node()" mode="M584" priority="-2">
    <xsl:apply-templates mode="M584" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cac:TaxTotal/cbc:TaxIncludedIndicator" mode="M585" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cac:TaxTotal/cbc:TaxIncludedIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxIncludedIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M585" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M585" priority="-1" />
  <xsl:template match="@*|node()" mode="M585" priority="-2">
    <xsl:apply-templates mode="M585" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:AccountingCost" mode="M586" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:AccountingCost" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M586" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M586" priority="-1" />
  <xsl:template match="@*|node()" mode="M586" priority="-2">
    <xsl:apply-templates mode="M586" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:AccountingCostCode" mode="M587" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:AccountingCostCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M587" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M587" priority="-1" />
  <xsl:template match="@*|node()" mode="M587" priority="-2">
    <xsl:apply-templates mode="M587" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:CopyIndicator" mode="M588" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:CopyIndicator" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M588" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M588" priority="-1" />
  <xsl:template match="@*|node()" mode="M588" priority="-2">
    <xsl:apply-templates mode="M588" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:CreditNoteTypeCode" mode="M589" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:CreditNoteTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CreditNoteTypeCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M589" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M589" priority="-1" />
  <xsl:template match="@*|node()" mode="M589" priority="-2">
    <xsl:apply-templates mode="M589" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:CustomizationID" mode="M590" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:CustomizationID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M590" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M590" priority="-1" />
  <xsl:template match="@*|node()" mode="M590" priority="-2">
    <xsl:apply-templates mode="M590" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:DocumentCurrencyCode" mode="M591" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:DocumentCurrencyCode" />

		<!--REPORT -->
<xsl:if test="@listID">
      <svrl:successful-report test="@listID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyID">
      <svrl:successful-report test="@listAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listAgencyName">
      <svrl:successful-report test="@listAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listName">
      <svrl:successful-report test="@listName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listVersionID">
      <svrl:successful-report test="@listVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@name">
      <svrl:successful-report test="@name">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@name' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listURI">
      <svrl:successful-report test="@listURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@listSchemeURI">
      <svrl:successful-report test="@listSchemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@listSchemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M591" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M591" priority="-1" />
  <xsl:template match="@*|node()" mode="M591" priority="-2">
    <xsl:apply-templates mode="M591" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:ID" mode="M592" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:ID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M592" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M592" priority="-1" />
  <xsl:template match="@*|node()" mode="M592" priority="-2">
    <xsl:apply-templates mode="M592" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:IssueTime" mode="M593" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:IssueTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:IssueTime' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M593" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M593" priority="-1" />
  <xsl:template match="@*|node()" mode="M593" priority="-2">
    <xsl:apply-templates mode="M593" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:LineCountNumeric" mode="M594" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:LineCountNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M594" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M594" priority="-1" />
  <xsl:template match="@*|node()" mode="M594" priority="-2">
    <xsl:apply-templates mode="M594" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:Note" mode="M595" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:Note" />

		<!--REPORT -->
<xsl:if test="@languageID">
      <svrl:successful-report test="@languageID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@languageLocaleID">
      <svrl:successful-report test="@languageLocaleID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@languageLocaleID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M595" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M595" priority="-1" />
  <xsl:template match="@*|node()" mode="M595" priority="-2">
    <xsl:apply-templates mode="M595" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:PaymentAlternativeCurrencyCode" mode="M596" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:PaymentAlternativeCurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PaymentAlternativeCurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M596" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M596" priority="-1" />
  <xsl:template match="@*|node()" mode="M596" priority="-2">
    <xsl:apply-templates mode="M596" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:PaymentCurrencyCode" mode="M597" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:PaymentCurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PaymentCurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M597" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M597" priority="-1" />
  <xsl:template match="@*|node()" mode="M597" priority="-2">
    <xsl:apply-templates mode="M597" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:PricingCurrencyCode" mode="M598" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:PricingCurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PricingCurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M598" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M598" priority="-1" />
  <xsl:template match="@*|node()" mode="M598" priority="-2">
    <xsl:apply-templates mode="M598" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:ProfileExecutionID" mode="M599" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:ProfileExecutionID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M599" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M599" priority="-1" />
  <xsl:template match="@*|node()" mode="M599" priority="-2">
    <xsl:apply-templates mode="M599" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:ProfileID" mode="M600" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:ProfileID" />

		<!--REPORT -->
<xsl:if test="@schemeID">
      <svrl:successful-report test="@schemeID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeName">
      <svrl:successful-report test="@schemeName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyID">
      <svrl:successful-report test="@schemeAgencyID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeAgencyName">
      <svrl:successful-report test="@schemeAgencyName">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeAgencyName' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeVersionID">
      <svrl:successful-report test="@schemeVersionID">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeVersionID' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeDataURI">
      <svrl:successful-report test="@schemeDataURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeDataURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>

		<!--REPORT -->
<xsl:if test="@schemeURI">
      <svrl:successful-report test="@schemeURI">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Attribute '@schemeURI' marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M600" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M600" priority="-1" />
  <xsl:template match="@*|node()" mode="M600" priority="-2">
    <xsl:apply-templates mode="M600" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:TaxCurrencyCode" mode="M601" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:TaxCurrencyCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxCurrencyCode' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M601" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M601" priority="-1" />
  <xsl:template match="@*|node()" mode="M601" priority="-2">
    <xsl:apply-templates mode="M601" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:UBLVersionID" mode="M602" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:UBLVersionID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UBLVersionID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M602" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M602" priority="-1" />
  <xsl:template match="@*|node()" mode="M602" priority="-2">
    <xsl:apply-templates mode="M602" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/cbc:UUID" mode="M603" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/cbc:UUID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M603" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M603" priority="-1" />
  <xsl:template match="@*|node()" mode="M603" priority="-2">
    <xsl:apply-templates mode="M603" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:CreditNote/ext:UBLExtensions" mode="M604" priority="1000">
    <svrl:fired-rule context="/p1:CreditNote/ext:UBLExtensions" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'ext:UBLExtensions' is marked as not used in the given context.</svrl:text>
      </svrl:successful-report>
    </xsl:if>
    <xsl:apply-templates mode="M604" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M604" priority="-1" />
  <xsl:template match="@*|node()" mode="M604" priority="-2">
    <xsl:apply-templates mode="M604" select="*|comment()|processing-instruction()" />
  </xsl:template>
</xsl:stylesheet>
